<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InpIniNurAssRV05.aspx.cs" Inherits="EMR.InpIniNurAssRV05" ValidateRequest="false" %>

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
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="icon" TagName="PopupShowDelay" %>
<%@ Register Src="~/UserControls/UserControlPatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <style>
        canvas {
            border: 2px solid #000;
        }
    </style>
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <style>
        @page {
            margin-top: 10px;
        }
        #print_content {
		    line-height: initial !important;
	    }
        .fs-8 {
            font-size: 8pt;
        }
        .font-9 {
            font-size: 9pt;
        }
        .font-10 {
            font-size: 10pt;
        }
        .lh-1 {
            line-height: 1;
        }
        .fs-12 {
            font-size: 12pt;
        }
        .fs-11 {
            font-size: 11pt;
        }
        .font-weight-bold {
            font-weight: bold;
        }
        .subtitle {
            color: #0070c0 !important;
            font-style: italic;
        }

        .font-12 {
            font-size: 12pt !important;
        }

        .font-11 {
            font-size: 11pt !important;
        }

        .font-10 {
            font-size: 10pt  !important;
        }
        #print_content {
            margin-left: 1.5cm !important;
        }
        #print_header {
            width: 210mm;
            height: 2cm !important;
        }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel ID="UpPrintForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="print_page" runat="server" style="font-family: 'Times New Roman' !important; width: 210mm; overflow: hidden">
                <table class="report-container">
                    <thead class="report-header">
                        <tr>
                            <th class="report-header-cell">
                                <div runat="server" id="print_header">
                                    <div style="display: flex; align-items: center; padding: 0 18px">
                                        <img style="width: 180px" src="../images/AIH_PI_FULL.png" />
                                        <div style="text-align: center; align-self: center; flex-grow: 1">
                                            <div><span style="font-size: 12pt; font-weight: bold">PHIẾU ĐÁNH GIÁ BAN ĐẦU NGƯỜI BỆNH NỘI TRÚ CỦA ĐIỀU DƯỠNG</span></div>
                                            <div class="en"><i style="font-size: 11pt; font-weight: bold">INPATIENT INITIAL NURSING ASSESSMENT</i></div>
                                        </div>
                                        <div></div>
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
                                <div class="main" runat="server" id="print_content" style="font-size: 12pt; line-height: 1; border: 1px solid #000">
                                    
                                    <div class="d-grid mb-1 font-10" style="grid-template-columns: 260px 1fr; margin-left: -10px">
                                        <div class="p-2" style="border: 1px dashed #000; line-height: 2; margin-right: 20px">
                                            <div>Họ tên: <asp:Label runat="server" ID="prt_fullname"/></div>
                                            <div>Ngày sinh: <asp:Label runat="server" ID="prt_dob"/></div>
                                            <div>Giới tính: <asp:Label runat="server" ID="prt_gender"/></div>
                                            <div>PID: <asp:Label runat="server" ID="prt_pid"/></div>
                                        </div>
                                        <div>
                                            <div class="font-11" style="display: grid; grid-template-columns: 200px 1fr">
                                                <div>
                                                    <div><span class="font-weight-bold">Ngày vào khoa:</span><asp:Label runat="server" ID="prt_date_of_admission"/></div>
                                                    <div class="font-weight-bold subtitle font-10">Date of arrival</div>
                                                </div>
                                                <div>
                                                    <div><span class="font-weight-bold">Giờ vào khoa: </span><asp:Label runat="server" ID="prt_time_of_admission"/></div>
                                                    <div class="font-weight-bold subtitle font-10">Time of arrival</div>
                                                </div>
                                            </div>
                                            <div class="font-11" style="display: grid; grid-template-columns: auto 120px 1fr">
                                                <div>
                                                    <div><span class="font-weight-bold">Thời gian bắt đầu đánh giá:&nbsp;</span></div>
                                                    <div class="font-weight-bold subtitle font-10">Time of assessment</div>
                                                </div>
                                                <div>
                                                    <div><span class="font-weight-bold">Ngày</span><asp:Label runat="server" ID="prt_assess_date"/></div>
                                                    <div class="font-weight-bold subtitle font-10">Date</div>
                                                </div>
                                                <div>
                                                    <div class="font-weight-bold">Giờ <asp:Label runat="server" ID="prt_assess_time"/></div>
                                                    <div class="font-weight-bold subtitle font-10">Time</div>
                                                </div>
                                            </div>
                                            <div class="font-10">Phiếu đánh giá phải được hoàn tất trong vòng 24 giờ sau khi người bệnh nhập viện, đánh dấu √ vào những ô thích hợp.</div>
                                            <div class="subtitle font-9">This form has to be completed within 24 hours of admission, tick √ on the appropriate boxes.</div>
                                        </div>
                                    </div>
                                     
                                    <div class="font-weight-bold font-12" style="display: grid; grid-template-columns: 20px 1fr">
                                        <div>I.</div>
                                        <div>THÔNG TIN TỔNG QUÁT VỀ NGƯỜI BỆNH/ <span class="subtitle font-11">GENERAL PATIENT INFORMATION</span></div>
                                    </div>
                                     
                                    <div class="d-grid" style="grid-template-columns: 1fr 1fr; display: none">
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                <div>Ngày nhập viện </div>
                                                <div class="en">Date of Admission&nbsp;</div>
                                            </div>
                                                <%--<asp:Label runat="server" ID="prt_date_of_admission"/>--%>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                Giờ vào viện <br />    
                                                <span class="en">Time of Admission&nbsp;</span>
                                            </div>
                                            <%--<asp:Label runat="server" ID="prt_time_of_admission"/>--%>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 130px 100px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Quốc gia cư trú:</div>
                                            <div class="subtitle font-10">Country of residence</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_residence_code_vnm" Text="❏"/></div>
                                            <div>
                                                <div>Việt Nam</div>
                                                <div class="subtitle font-10">Vietnam</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_residence_code_oth" Text="❏"/></div>
                                            <div>
                                                <div>Khác:&nbsp;</div>
                                                <div class="subtitle font-10">Other</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_residence_other" />
                                        </div>
                                    </div>
                                    <%-- Language --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 130px 100px 100px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Ngôn ngữ:</div>
                                            <div class="subtitle font-10">Language</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_language_code_vi" Text="❏"/></div>
                                            <div>
                                                <div>Tiếng Việt</div>
                                                <div class="subtitle font-10">Vietnamese</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_language_code_en" Text="❏"/></div>
                                            <div>
                                                <div>Tiếng Anh</div>
                                                <div class="subtitle font-10">English</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_language_code_oth" Text="❏"/></div>
                                            <div>
                                                <div>Tiếng khác, ghi rõ: <asp:Label runat="server" ID="prt_language_other" /></div>
                                                <div class="subtitle font-10">Other language, specify</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 130px 100px 100px">
                                        <div>-</div>
                                        <div>
                                            <div>Cần phiên dịch:</div>
                                            <div class="subtitle font-10">Requires interpreter</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_req_interpreter_true" Text="❏"/></div>
                                            <div>
                                                <div>Có</div>
                                                <div class="subtitle font-10">Yes</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_req_interpreter_false" Text="❏"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 65px 75px 110px 1fr 135px 50px 60px">
                                        <div>-</div>
                                        <div>
                                            <div>Tôn giáo:</div>
                                            <div class="subtitle font-10">Religion</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_religion_code_bh" Text="❏"/></div>
                                            <div>
                                                <div>Phật giáo</div>
                                                <div class="subtitle font-10">Buddhism</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_religion_code_ch" Text="❏"/></div>
                                            <div>
                                                <div>Thiên chúa giáo</div>
                                                <div class="subtitle font-10">Christian</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr;">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_religion_code_oth" Text="❏"/></div>
                                            <div>
                                                <div>Khác:&nbsp;</div>
                                                <div class="subtitle font-10">Other</div>
                                            </div>
                                            <div><asp:Label runat="server" ID="prt_religion_other" /></div>
                                        </div>
                                        <div>
                                            <div>- Nhu cầu tín ngưỡng:</div>
                                            <div class="subtitle font-10">Spiritual counselling</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_spiritual_couns_true" Text="❏"/></div>
                                            <div>
                                                <div>Có</div>
                                                <div class="subtitle font-10">Yes</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_spiritual_couns_false" Text="❏"/></div>
                                            <div>
                                                <div>Không</div>
                                                <span class="subtitle font-10">No</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px auto 150px 110px 90px 90px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Nghề nghiệp:</div>
                                            <div class="subtitle font-10">Occupation</div>
                                        </div>
                                        <div><asp:Label runat="server" ID="prt_occupation" /></div>
                                        <div>
                                            <div>Hoàn cảnh sống:</div> 
                                            <div class="subtitle font-10">Living situation</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <asp:Label runat="server" ID="prt_living_status_code_aln" Text="❏"/>
                                            <div>
                                                <div>Một mình</div>
                                                <span class="subtitle font-10">Alone</span>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <asp:Label runat="server" ID="prt_living_status_code_wth" Text="❏"/>
                                            <div>
                                                <div>Gia đình</div>
                                                <span class="subtitle font-10">Family</span>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <asp:Label runat="server" ID="prt_living_status_code_oth" Text="❏"/>
                                            <div>
                                                <div>Khác:&nbsp;</div>
                                                <span class="subtitle font-10">Other</span>
                                            </div>
                                            <asp:Label runat="server" ID="prt_living_status_note" />
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 200px 70px 170px 80px 80px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Mối quan tâm khi nằm viện:</div>
                                            <div class="subtitle font-10">Concerns related to hospitalization</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <asp:Label runat="server" ID="prt_hospital_concern_code_non" Text="❏"/>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">None</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <asp:Label runat="server" ID="prt_hospital_concern_code_rel" Text="❏"/>
                                            <div>
                                                <div>Gia đình/các mối quan hệ</div>
                                                <div class="subtitle font-10">Family/ relationship issues</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <asp:Label runat="server" ID="prt_hospital_concern_code_fin" Text="❏"/>
                                            <div>
                                                <div>Tài chính</div>
                                                <div class="subtitle font-10">Fanancial</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <asp:Label runat="server" ID="prt_hospital_concern_code_wor" Text="❏"/>
                                            <div>
                                                <div>Lo âu</div>
                                                <div class="subtitle font-10">Worriedness</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <asp:Label runat="server" ID="prt_hospital_concern_code_oth" Text="❏"/>
                                            <div>
                                                <div>Khác:&nbsp;</div>
                                                <div class="subtitle font-10">Other</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_hospital_concern_other" />
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 300px 1fr">
                                        <div>-</div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                <div>Tên người liên lạc:</div>
                                                <div class="subtitle font-10">Contact person's Name</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_contact_name" />
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                <div>Quan hệ:</div>
                                                <div class="subtitle font-10">Relationship</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_relationship_type_rcd" />
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 300px 1fr">
                                        <div>-</div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                <div>Người đi cùng:</div>
                                                <div class="subtitle font-10">Accompanied by:</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_accompanied" />
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                <div>Quan hệ:</div>
                                                <div class="subtitle font-10">Relationship</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_relationship" />
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid font-12 font-weight-bold" style="grid-template-columns: 20px 1fr">
                                        <div>II.</div>
                                        <div>BỆNH SỬ/ <span class="subtitle font-11">MEDICAL HISTORY</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 140px 140px 120px 130px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Bệnh nhập viện từ</div>
                                            <div class="subtitle font-10">Patient admitted from</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_admit_from_code_opd"/></div>
                                            <div>
                                                <div>Khoa khám bệnh</div>
                                                <div class="subtitle font-10">OPD</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_admit_from_code_er"/></div>
                                            <div>
                                                <div>Khoa cấp cứu</div>
                                                <div class="subtitle font-10">Emergency</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_admit_from_code_vd"/></div>
                                            <div>
                                                <div>Bác sĩ hợp tác</div>
                                                <div class="subtitle font-10">Visiting doctor</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_admit_from_code_oth"/></div>
                                            <div>
                                                <div>Khác</div>
                                                <div class="subtitle font-10">Referral&nbsp;</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_admit_from_other"/>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 140px 140px 120px 120px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Tình trạng khi đến:</div>
                                            <div class="subtitle font-10">Arrived by</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏"  ID="prt_arrived_w"/></div>
                                            <div>
                                                <div>Tự đi được</div>
                                                <div class="subtitle font-10">Walking</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_arrived_s"/></div>
                                            <div>
                                                <div>Bằng băng ca</div>
                                                <div class="subtitle font-10">Stretcher</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_arrived_wc"/></div>
                                            <div>
                                                <div>Bằng xe lăn</div>
                                                <div class="subtitle font-10">Wheelchair</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label80"/></div>
                                            <div>
                                                <div>Khác</div>
                                                <div class="subtitle font-10">Other&nbsp;</div>
                                            </div>
                                            <asp:Label runat="server" ID="Label81"/>
                                        </div>
                                    </div>
                                        
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 1fr">
                                        <div>-</div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                <div>Lý do nhập viện:</div>
                                                <div class="subtitle font-10">Reason for admission</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_admission_reason"/>
                                        </div>
                                    </div>
                                    <%-- Previous admission at AIH --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 310px 80px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Lần nhập viện trước tại bệnh viện Quốc tế Mỹ:</div>
                                            <div class="subtitle font-10">Previous admission at AIH</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_previous_admission_false"/></div>                                             
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_previous_admission_true"/></div>
                                            <div>
                                                <div>Có, ghi rõ</div>
                                                <span class="subtitle font-10">Yes, specify</span>
                                            </div>
                                            <asp:Label runat="server" ID="prt_previous_admission"/>
                                        </div>
                                    </div>
                                    <%-- Past medical history --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 150px 80px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Tiền sử bệnh:</div>
                                            <div class="subtitle font-10">Past medical history</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 1fr 145px">
                                            <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_past_med_history_false"/></div>
                                                <div>
                                                    <div>Không</div>
                                                    <div class="subtitle font-10">No</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_past_med_history_true"/></div>
                                            <div>
                                                <div>Có, ghi rõ</div>
                                                <div class="subtitle font-10">Yes, specific</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_past_med_history_note"/>
                                        </div>
                                    </div>
                                    <%-- Past surgical history --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 150px 80px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Tiền sử phẫu thuật:</div>
                                            <div class="subtitle font-10">Past surgical history</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_past_sur_history_false"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_past_sur_history_true"/></div>
                                            <div>
                                                <div>Có, ghi rõ</div>
                                                <div class="subtitle font-10">Yes, specific</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_past_sur_history_note"/>
                                        </div>
                                    </div>
                                    <%-- Stimulant abuse --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 180px 100px 100px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Lạm dụng chất kích thích:</div>
                                            <div class="subtitle font-10">Stimulant abuse</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_substance_abuse_s"/></div>
                                            <div>
                                                <div>Hút thuốc</div>
                                                <div class="subtitle font-10">Smoking</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_substance_abuse_a"/></div>
                                            <div>
                                                <div>Rượu bia</div>
                                                <div class="subtitle font-10">Alcohol</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_substance_abuse_oth"/></div>
                                            <div>
                                                <div>Khác, ghi rõ:</div>
                                                <div class="subtitle font-10">Other, specify</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_substance_abuse_other"/>
                                        </div>
                                    </div>
                                    <%-- Accompanied medical documents --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 200px 80px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Hồ sơ bệnh án kèm theo:</div>
                                            <div class="subtitle font-10">Accompanied medical documents</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_previous_document_false"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_previous_document_true"/></div>
                                            <div>
                                                <div>Có, ghi rõ:</div>
                                                <div class="subtitle font-10">Yes, specify</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_previous_document_note"/>
                                        </div>
                                    </div>
                                    <%-- Current home medication --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 200px 80px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Thuốc hiện đang dùng tại nhà:</div>
                                            <div class="subtitle font-10">Current home medication</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_cur_home_medication_false"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_cur_home_medication_true"/></div>
                                            <div>
                                                Có (Tham khảo đơn thuốc đính kèm)<br />
                                                <span class="subtitle font-10">Yes, if yes please refer to the prescription attached</span>
                                            </div>
                                        </div>

                                    </div>
                                    <%-- Allergy/ Reaction --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 200px 80px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Dị ứng/ Phản ứng:</div>
                                            <div class="subtitle font-10">Allergy/ Reaction</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_allergy_false"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_allergy_true"/></div>
                                            <div>
                                                <div>Có, ghi rõ</div>
                                                <span class="subtitle font-10">Yes, specify</span>
                                            </div>
                                            <asp:Label runat="server" ID="prt_allergy_note"/>
                                        </div>
                                    </div>
                                    <%-- Special patient group --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 205px 100px 1fr; margin-left: -10px">
                                        <div class="font-weight-bold">
                                            <div>Nhóm người bệnh đặc biệt</div>
                                            <div class="subtitle font-10">Special patient group</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label8"/></div>
                                            <div class="font-weight-bold">
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label21"/></div>
                                            <div class="font-weight-bold">
                                                <div>Có, cụ thể</div>
                                                <div class="subtitle font-10">Yes, specify</div>
                                            </div>
                                            <asp:Label runat="server" ID="Label22"/>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 235px 215px 1fr; margin-left: -10px">
                                        <div class="d-grid d-none" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_high_risk_patient_ch"/></div>
                                            <div>
                                                <div>Trẻ em (< hoặc 8 tuổi)</div>
                                                <div class="subtitle font-10">Children (< 8 years old)</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label23"/></div>
                                            <div>
                                                <div>Người bệnh đang điều trị hóa trị liệu</div>
                                                <div class="subtitle font-10">Patients are receiving chemotherapy</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_high_risk_patient_sdp"/></div>
                                            <div>
                                                <div>Những người bệnh tàn tật nặng</div>
                                                <div class="subtitle font-10">Severely disabled patients</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_high_risk_patient_res"/></div>
                                            <div>
                                                <div>Người bệnh bị kìm giữ</div>
                                                <div class="subtitle font-10">Restrained patients</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_high_risk_patient_eld"/></div>
                                            <div>
                                                <div>Người cao tuổi (≥ 80 tuổi)</div>
                                                <div class="subtitle font-10">Elderlies (≥ 80 years)</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_high_risk_patient_ccp"/></div>
                                            <div>
                                                <div>Những người bệnh lú lẫn/hôn mê</div>
                                                <div class="subtitle font-10">Confused or comatose patients</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label24"/></div>
                                            <div>
                                                <div>Người bệnh có tiền sử té ngã</div>
                                                <div class="subtitle font-10">Patient has a history of falls</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label25"/></div>
                                            <div>
                                                <div>Sản phụ đang chuyển dạ</div>
                                                <div class="subtitle font-10">Women in labor</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr; grid-column: 2/4">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label26"/></div>
                                            <div>
                                                <div>Sản phụ có thai lưu/ sảy thai/ chấm dứt thai kỳ</div>
                                                <div class="subtitle font-10">Patient with stillbirth pregnancy/ abortion/ experiencing terminations in pregnancy</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr; grid-column: 1/3">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label27"/></div>
                                            <div>
                                                <div>Người bệnh có nguy cơ tự tử hoặc tự làm hại bản thân</div>
                                                <div><span class="subtitle font-10">Patients are at risk of suicide or seft-harm</span></div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label28"/></div>
                                            <div>
                                                <div>Người bệnh suy giảm miễn dịch</div>
                                                <div style="margin-left: -40px"><span class="subtitle font-10">Patients whose immune systems are compromised</span></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 240px 1fr; margin-left: -10px">
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label43"/></div>
                                            <div>
                                                <div>Người bệnh nghi ngờ bị nghiện</div>
                                                <div><span class="subtitle font-10">Patients suspected of drug and/or alcohol dependency</span></div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label79"/></div>
                                            <div>
                                                <div>Người bệnh có nguy cơ bị lạm dụng/ ngược đãi</div>
                                                <div><span class="subtitle font-10">Victims of abuse or neglect</span></div>
                                            </div>
                                        </div>

                                        <div class="d-grid d-none" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_high_risk_patient_hrf"/></div>
                                            <div>
                                                <div>Người bệnh có tiền sử té ngã</div>
                                                <div><span class="subtitle font-10">Patient has a history of falls</span></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr; margin-left: -10px">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_high_risk_patient_hrt"/></div>
                                            <div>
                                                <div>Người bệnh đang điều trị có nguy cơ cao (như chạy thận nhân tạo, hóa trị liệu...)</div>
                                                <div class="subtitle font-10">Patients that receiving high-risk treatments (such as dialysis, chemotherapy...)</div>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- NURSING ASSESSMENT --%>
                                    <div class="d-grid font-12 font-weight-bold" style="grid-template-columns: 20px 1fr">
                                        <div>III.</div>
                                        <div>ĐÁNH GIÁ CỦA ĐIỀU DƯỠNG/ <span class="subtitle font-11">NURSING ASSESSMENT</span></div>
                                    </div>
                                    <%-- Vital signs and standard measurements --%>
                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr">
                                        <div>1.</div>
                                        <div>Dấu hiệu sinh tồn và các chỉ số đo lường/ <span class="subtitle font-10">Vital signs and standard measurements</span></div>
                                    </div>
                                    <%--  --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 1fr 1fr 1fr 1fr">
                                        <div>-</div>
                                        <div class="d-grid" style="grid-template-columns: auto 30px 1fr">
                                            <div>
                                                <div>Nhiệt độ:</div>
                                                <div class="subtitle font-10">Temperature</div>
                                            </div>
                                            <div class="text-right"><asp:Label runat="server" ID="prt_vs_temperature"/>&nbsp;</div>
                                            <div>°C</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 30px 1fr">
                                            <div>
                                                <div>- Mạch:</div>
                                                <div class="subtitle font-10">Pulse</div>
                                            </div>
                                            <div class="text-right"><asp:Label runat="server" ID="prt_vs_heart_rate"/>&nbsp;</div>
                                            <div>
                                                <div>nhịp/phút</div>
                                                <div class="subtitle font-10">bpm</div>
                                            </div> 
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr 45px">
                                            <div>
                                                <div>- HA:</div>
                                                <div class="subtitle font-10">Blood pressure</div>
                                            </div>
                                            <div class="text-right"><asp:Label runat="server" ID="prt_vs_blood_pressure"/>&nbsp;</div>
                                            <div>mmHg</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 30px 1fr">
                                            <div>
                                                <div>- Nhịp thở:</div>
                                                <div class="subtitle font-10">Respiration rate</div>
                                            </div>
                                            <div class="text-right"><asp:Label runat="server" ID="prt_vs_respiratory_rate"/>&nbsp;</div>
                                            <div>
                                                <div>lần/phút </div>
                                                <div class="subtitle font-10">bpm</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: 20px 1fr 1fr 1fr 1fr">
                                        <div>-</div>
                                        <div class="d-grid" style="grid-template-columns: auto 30px 1fr">
                                            <div>
                                                <div>Cân nặng:</div>
                                                <div class="subtitle font-10">Weight</div>
                                            </div>
                                            <div class="text-right"><asp:Label runat="server" ID="prt_vs_weight"/>&nbsp;</div>
                                            <div>kg</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 40px 1fr">
                                            <div>
                                                <div>- Chiều cao:</div>
                                                <div class="subtitle font-10">Height</div>
                                            </div>
                                            <div class="text-right"><asp:Label runat="server" ID="prt_vs_height"/>&nbsp;</div>
                                            <div>cm</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 40px 1fr">
                                            <div>
                                                <div>- Chỉ số BMI:</div>
                                                <div class="subtitle font-10">BMI</div>
                                            </div>
                                            <div class="text-right"><asp:Label runat="server" ID="prt_vs_BMI"/>&nbsp;</div>
                                            <div>kg/m<sup>2</sup></div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 40px 1fr">
                                            <div>- SpO2:</div>
                                            <div><asp:Label runat="server" ID="Label12"/>&nbsp;</div>
                                            <div>%</div>
                                        </div>
                                    </div>
                                    <%-- 2. Respiratory system --%>
                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr">
                                        <div>2.</div>
                                        <div>Hệ hô hấp/ <span class="subtitle font-10">Respiratory system</span></div>
                                    </div>
                                    
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 1fr 1fr 1fr 1fr 1fr">
                                        <div></div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_respiratory_system_n"/></div>
                                            <div>
                                                <div>Không có vấn đề</div>
                                                <div class="subtitle font-10">Normal</div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_respiratory_system_d"/></div>
                                            <div>
                                                <div>Khó thở</div>
                                                <div class="subtitle font-10">Dyspnea</div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_respiratory_system_o"/></div>
                                            <div>
                                                <div>Khó thở nằm</div>
                                                <div class="subtitle font-10">Orthopnea</div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_respiratory_system_w"/></div>
                                            <div>
                                                <div>Khó thở khò khè</div>
                                                <div class="subtitle font-10">Wheeze</div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_respiratory_system_c"/></div>
                                            <div>
                                                <div>Da xanh tái</div>
                                                <div class="subtitle font-10">Cyanosis</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 60px 70px 60px 140px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Ho</div>
                                            <div class="subtitle font-10">Cough:</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_cough_false"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_cough_true"/></div>
                                            <div>
                                                <div>Có</div>
                                                <div class="subtitle font-10">Yes</div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_pro_cough_false"/></div>
                                            <div>
                                                <div>Không có đờm</div>
                                                <div class="subtitle font-10">Without phlegm</div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_pro_cough_true"/></div>
                                            <div>
                                                <div>Có đờm (ghi rõ màu/ tính chất/ số lượng):</div>
                                                <div class="subtitle font-10">With phlegm (specify the colour/ nature/amount)</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_pro_cough_note"/>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr">
                                        <div>3.</div>
                                        <div>Hệ tim mạch/ <span class="subtitle font-10">Cardiovascular system</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 60px 60px 90px 90px 80px 80px 90px 1fr">
                                        <div>-</div>
                                        <div>
                                            <div>Mạch</div>
                                            <div class="subtitle font-10">Pulse</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_pulse_code_r"/></div>
                                            <div>
                                                <div>Đều</div>
                                                <div class="subtitle font-10">Regular</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_pulse_code_i"/></div>
                                            <div>
                                                <div>Không đều</div>
                                                <div class="subtitle font-10">Irregular</div>
                                            </div>
                                        </div>
                                        <div>
                                            <div>- Tình trạng:</div>
                                            <div class="subtitle font-10">Condition</div>
                                        </div>
                                        <div class="d-grid font-10" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_presence_cp"/></div>
                                            <div>
                                                <div>Đau ngực</div>
                                                <div class="subtitle font-9">Chest pain</div>
                                            </div>
                                        </div>
                                        <div class="d-grid font-10" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_presence_di"/></div>
                                            <div>
                                                <div>Chóng mặt</div>
                                                <div class="subtitle font-9">Dizziness</div>
                                            </div>
                                        </div>
                                        <div class="d-grid font-10" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_presence_ca"/></div>
                                            <div>
                                                <div>Đau bắp chân</div>
                                                <div class="subtitle font-9">Calf pain</div>
                                            </div>
                                        </div>
                                        <div class="d-grid font-10" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_presence_pe"/></div>
                                            <div>
                                                <div>Phù ngoại biên</div>
                                                <div class="subtitle font-9">Peripheral edema</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 120px 60px 60px 80px 80px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Tứ chi:</div>
                                            <div class="subtitle font-10">Extremities</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_extremities_wa"/></div>
                                            <div>
                                                <div>Ấm</div>
                                                <div class="subtitle font-10">Warm</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_extremities_co"/></div>
                                            <div>
                                                <div>Lạnh</div>
                                                <div class="subtitle font-10">Cold</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_extremities_cl"/></div>
                                            <div>
                                                <div>Ẩm ướt</div>
                                                <div class="subtitle font-10">Clammy</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_extremities_cy"/></div>
                                            <div>
                                                <div>Xanh tái</div>
                                                <div class="subtitle font-10">Cyanosed</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label6"/></div>
                                            <div>
                                                <div>Khác, ghi rõ:</div>
                                                <div class="subtitle font-10">Other, specify</div>
                                            </div>
                                            <asp:Label runat="server" ID="Label7"/>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>4.</div>
                                        <div>Hệ thần kinh cảm giác/ <span class="subtitle font-10">Neurosensory system</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 120px 60px 60px 80px 80px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Định hướng:</div>
                                            <div class="subtitle font-10">Oriented</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_oriented_pla"/></div>
                                            <div>
                                                <div>Nơi</div>
                                                <div class="subtitle font-10">Place</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_oriented_day"/></div>
                                            <div>
                                                <div>Ngày</div>
                                                <div class="subtitle font-10">Day</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_oriented_time"/></div>
                                            <div>
                                                <div>Thời gian</div>
                                                <div class="subtitle font-10">Time</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_oriented_per"/></div>
                                            <div>
                                                <div>Người</div>
                                                <div class="subtitle font-10">Person</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_oriented_na"/></div>
                                            <div>
                                                <div>Không định hướng được</div>
                                                <div class="subtitle font-10">Disoriented</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 120px 75px 80px 90px 70px 85px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Tinh thần:</div>
                                            <div class="subtitle font-10">Mental status</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mental_status_al"/></div>
                                            <div>
                                                <div>Tỉnh táo</div>
                                                <div class="subtitle font-10">Alert</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mental_status_cf"/></div>
                                            <div>
                                                <div>Nhầm lẫn</div>
                                                <div class="subtitle font-10">Confused</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mental_status_ag"/></div>
                                            <div>
                                                <div>Kích động</div>
                                                <div class="subtitle font-10">Agitated</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mental_status_"/></div>
                                            <div>
                                                <div>Lo âu</div>
                                                <div class="subtitle font-10">Anxious</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mental_status_de"/></div>
                                            <div>
                                                <div>Trầm cảm</div>
                                                <div class="en">Depressed</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mental_status_oth"/></div>
                                            <div>
                                                <div>Khác</div>
                                                <div class="en">Other</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_mental_status_other"/>
                                        </div>
                                        <div style="display: none;">
                                            <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mental_status_fr"/></div>
                                                <div>
                                                    <div>Quấy</div>
                                                    <div class="subtitle font-10">Fretful</div>
                                                </div>
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mental_status_le"/></div>
                                                <div>
                                                    <div>Lơ mơ</div>
                                                    <div class="en">Lethargic</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 120px 120px 120px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Thính giác:</div>
                                            <div class="subtitle font-10">Hearing</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_hearing_code_n"/></div>
                                            <div>
                                                <div>Bình thường</div>
                                                <div class="subtitle font-10">Khiếm thính</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_hearing_code_hi"/></div>
                                            <div>
                                                <div>Khiếm thính</div>
                                                <div class="subtitle font-10">Hearing impaired</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_hearing_code_ha"/></div>
                                            <div>
                                                <div>Dùng máy trợ thính (Trái/Phải)</div>
                                                <div class="subtitle font-10">Uses hearing aid (Left/Right)</div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 120px 120px 100px 120px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Thị giác:</div>
                                            <div class="subtitle font-10">Vision</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_vision_code_nm"/></div>
                                            <div>
                                                <div>Bình thường</div>
                                                <div class="subtitle font-10">Normal</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_vision_code_gl"/></div>
                                            <div>
                                                <div>Đeo kính</div>
                                                <div class="subtitle font-10">Glasses</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_vision_code_cl"/></div>
                                            <div>
                                                <div>Kính sát tròng</div>
                                                <div class="subtitle font-10">Contact lenses</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_vision_code_oth"/></div>
                                            <div>
                                                <div>Khác, ghi rõ</div>
                                                <div class="subtitle font-10">Other, specify</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_vision_other"/>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 140px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Khả năng ngôn ngữ:</div>
                                            <div class="subtitle font-10">Speech</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 120px 120px 1fr;">
                                            <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_speech_code_nm"/></div>
                                                <div>
                                                    <div>Bình thường</div>
                                                    <div class="subtitle font-10">Normal</div>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_speech_code_sl"/></div>
                                                <div>
                                                    <div>Nói lắp</div>
                                                    <div class="subtitle font-10">Slurred</div>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_speech_code_ap"/></div>
                                                <div>
                                                    <div>Chứng mất ngôn ngữ</div>
                                                    <span class="subtitle font-10">Aphasic</span>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_speech_code_si"/></div>
                                                <div>
                                                    <div>Khiếm ngôn</div>
                                                    <div class="subtitle font-10">Speech impaired</div>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_speech_code_nv"/></div>
                                                <div>
                                                    <div>Chưa biết nói</div>
                                                    <div class="subtitle font-10">Speechless</div>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_speech_code_nc"/></div>
                                                <div>
                                                    <div>Không giao tiếp (Bất tỉnh or mê)</div>
                                                    <div class="subtitle font-10">Non-communicative (Unconscious)</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- 5. --%>
                                    <div class="d-grid font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>5.</div>
                                        <div>Hệ tiêu hóa/ <span class="en">Gastrointestinal system</span></div>
                                    </div>
                                    
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 160px 100px 100px 140px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Chế độ ăn uống:</div>
                                            <div class="subtitle font-10">Diet</div>
                                        </div>
                                         <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_diet_code_nm"/></div>
                                            <div>
                                                <div>Bình thường</div>
                                                <div class="subtitle font-10">Normal</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_diet_code_bf"/></div>
                                            <div>
                                                <div>Bú bình</div>
                                                <div class="subtitle font-10">bottle feeding</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_diet_code_tbf"/></div>
                                            <div>
                                                <div>Đang cho con bú</div>
                                                <div class="subtitle font-10">Breast-feeding</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_diet_code_oth"/></div>
                                            <div>
                                                <div>Khác, ghi rõ</div>
                                                <div class="subtitle font-10">Other, specify</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_diet_other"/>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 160px 100px 100px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Tình trạng hiện có:</div>
                                            <div class="subtitle font-10">Current condition</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_diet_pre_code_v"/></div>
                                            <div>
                                                <div>Nôn</div>
                                                <div class="subtitle font-10">Vomiting</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_diet_pre_code_n"/></div>
                                            <div>
                                                <div>Buồn nôn</div>
                                                <div class="subtitle font-10">Nausea</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_diet_pre_code_s"/></div>
                                            <div>
                                                <div>Nuốt khó</div>
                                                <div class="subtitle font-10">Dysphagia</div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 160px 100px auto auto 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Ống thông dạ dày:</div>
                                            <div class="subtitle font-10">Nasogastric tube</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_ng_tube_false"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_gastrostomy_true"/></div>
                                            <div>
                                                <div>Mở dạ dày</div>
                                                <div class="subtitle font-10">Gastrostomy</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_size_true"/></div>
                                            <div>
                                                <div>Kích cỡ:</div>
                                                <div class="subtitle font-10">Size</div>
                                            </div>
                                            <div class="align-top">
                                                <asp:Label runat="server" ID="prt_size_note"/> Fr
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <asp:Label runat="server" ID="Label11"/>
                                            <div>
                                                <div>Ngày thay ống gần nhất: </div>
                                                <div class="subtitle font-10">Date last changed</div>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" ID="prt_last_date_changed"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px auto 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Thức ăn không ưa thích:</div>
                                            <div class="subtitle font-10">Food dislikes</div>
                                        </div>
                                        <div>
                                            <asp:Label runat="server" ID="prt_food_dislike"/>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 160px 100px 100px 100px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Bài tiết:</div>
                                            <div class="subtitle font-10">Bowel Elimination</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_bowel_elimination_code_two"/></div>
                                            <div>
                                                <div>2 lần/ngày</div>
                                                <div class="subtitle font-10">2 times/day</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_bowel_elimination_code_one"/></div>
                                            <div>
                                                <div>1 lần/ngày</div>
                                                <div class="subtitle font-10">1 time/day</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_bowel_elimination_code_eod"/></div>
                                            <div>
                                                <div>Cách ngày</div>
                                                <div class="subtitle font-10">Every 2 days</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_bowel_elimination_code_oth"/></div>
                                            <div>
                                                <div>Khác, ghi rõ:</div>
                                                <div class="subtitle font-10">Other</div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 160px 100px 120px 80px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Tính chất phân:</div>
                                            <div class="subtitle font-10">Consistency of stool</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_stool_consistency_code_h"/></div>
                                            <div>
                                                <div>Cứng</div>
                                                <div class="subtitle font-10">Hard</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_stool_consistency_code_f"/></div>
                                            <div>
                                                <div>Có hình dạng</div>
                                                <div class="subtitle font-10">Shape</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_stool_consistency_code_l"/></div>
                                            <div>
                                                <div>Lỏng</div>
                                                <div class="subtitle font-10">Loose</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_stool_consistency_code_w"/></div>
                                            <div>
                                                <div>Phân nước</div>
                                                <div class="subtitle font-10">Watery</div>
                                            </div>
                                        </div>
                                    </div>
                                   
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 160px 100px 140px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Tình trạng hiện có:</div>
                                            <div class="subtitle font-10">Current condition</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_gas_presence_code_n"/></div>
                                            <div>
                                                <div>Bình thường</div>
                                                <div class="subtitle font-10">Normal</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_gas_presence_code_i"/></div>
                                            <div>
                                                <div>Không kiểm soát</div>
                                                <div class="subtitle font-10">Incontinence</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_gas_presence_code_s"/></div>
                                            <div>
                                                <div>Hậu môn nhân tạo:</div>
                                                <div class="subtitle font-10">Artificial anus</div>
                                            </div>
                                            <asp:Label runat="server" ID="Label13"/>
                                        </div>
                                    </div>

                                    <%-- 6. --%>
                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>6.</div>
                                        <div>Hệ tiết niệu sinh dục/ <span class="subtitle font-10">Genitourinary system</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 80px 140px 140px 140px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Tiểu</div>
                                            <div class="subtitle font-10">Urination</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_urination_nm"/></div>
                                            <div>
                                                <div>Bình thường</div>
                                                <div class="subtitle font-10">Normal</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_urination_no"/></div>
                                            <div>
                                                <div>Tiểu đêm</div>
                                                <div class="subtitle font-10">Nocturia</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_urination_dy"/></div>
                                            <div>
                                                <div>Khó tiểu</div>
                                                <div class="subtitle font-10">Dysuria</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_urination_in"/></div>
                                            <div>
                                                <div>Không kiểm soát</div>
                                                <div class="subtitle font-10">Incontinece</div>
                                            </div>
                                        </div>
                                        <%--<div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_urination_fr"/>
                                            <div>
                                                Thường xuyên<br />
                                                <span class="en">Frequency</span>
                                            </div>
                                        </div>--%>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 250px auto auto 20px auto 1fr;">
                                        <div></div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 10px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_inter_catheter_true"/></div>
                                            <div>
                                                <div>Thông tiểu ngắt quãng</div>
                                                <div class="subtitle font-10">Intermittent catheterization</div>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" ID="prt_inter_catheter_note"/> 
                                            </div>
                                            <div>
                                                <div>lần/ngày</div>
                                                <span class="subtitle font-10">time/day</span>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_ind_catheter_true"/></div>
                                            <div>
                                                <div>Ống thông tiểu lưu, </div>
                                                <div class="subtitle font-10">Indwelling catheter,</div>
                                            </div>
                                        </div>
                                        <div>
                                            <div>kích cỡ: </div>
                                            <div class="subtitle font-10">Size</div>
                                        </div>
                                        <div><asp:Label runat="server" ID="prt_ind_catheter_size"/></div>
                                        <div>Fr,</div>
                                        <div>
                                            <div>Ngày đặt gần nhất: <asp:Label runat="server" ID="prt_ind_catheter_date"/></div>
                                            <span class="subtitle font-10">Date of last catheter insert</span>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px auto auto 20px auto 1fr;">
                                        <div></div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label15"/></div>
                                            <div>
                                                <div>Ống thông bàng quang qua da, </div>
                                                <div class="subtitle font-10">Suprapubic catheter</div>
                                            </div>
                                        </div>
                                        <div>
                                            <div> kích cỡ: </div>
                                            <div class="subtitle font-10">Size</div>
                                        </div>
                                        <div><asp:Label runat="server" ID="prt_sup_catheter_size"/></div>
                                        <div>Fr,</div>
                                        <div>
                                            <div>Ngày đặt gần nhất: <asp:Label runat="server" ID="prt_last_sup_catheter_date"/></div>
                                            <span class="subtitle font-10">Date of last catheter insert</span>
                                        </div>
                                    </div>

                                    <div style="display: none">
                                    <div><b>6. Đánh giá dinh dưỡng ban đầu/ </b><span class="en">Initial Nutrition Assessment</span></div>

                                    <div class="text-center"><b>Bảng 1: Khảo sát dinh dưỡng ban đầu/ </b><span class="en">Table 1: Initial screening</span></div>

                                    <table class="table-bordered" style="width: calc(210mm - 2.8cm)">
                                        <tr>
                                            <td style="width: 65px" class="text-center"><b>STT/</b><span class="en">No.</span></td>
                                            <td style="width: 462.874px" class="text-center"><b>Câu hỏi/</b><span class="en">Questions</span></td>
                                            <td style="width: 80px" class="text-center"><b>Có/</b><span class="en">Yes</span></td>
                                            <td style="width: 80px" class="text-center"><b>Không/</b><span class="en">No</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>1</b></td>
                                            <td>Chỉ số BMI < 20.5/ <span class="en">Is BMI < 20.5?</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_bmi_out_range_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_bmi_out_range_false"/></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>2</b></td>
                                            <td>Người bệnh có sụt cân trong vòng 3 tháng gần đây không <br /> <span class="en">Has the patient lost weight within the last 3 months?</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_loss_weight_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_loss_weight_false"/></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>3</b></td>
                                            <td>Người bệnh có chán ăn trong 1 tuần qua không? <br /> <span class="en">Has the patient had a reduced dietary intake in the last week?</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_reduce_dietary_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_reduce_dietary_false"/></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>4</b></td>
                                            <td>Người bệnh có bị bệnh gì nghiêm trọng không? <br /> <span class="en">Is the patient severely ill?</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_severely_ill_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_severely_ill_false"/></td>
                                        </tr>
                                    </table>

                                    <div>
                                        Ghi chú: Thức ăn bao gồm ăn qua miệng và các đường khác (qua ống thông dạ dày hoặc dinh dưỡng qua đường tĩnh mạnh) <br /> 
                                        <span class="en">Note: Food intake includes food taken by mouth, and other route (tube feeding or parenteral nutrition)</span>
                                        <div style="margin-left: 20px">
                                            - Nếu trả lời "<b>Có</b>" cho bất kỳ câu hỏi nào ở bảng 1 thì vui lòng đánh giá tiếp ở <b>bảng 2</b> <br />
                                            <span class="en" style="margin-left: 10px;">The answer is <b>Yes</b> to any question: go to the final screening in <b>Table 2</b></span> <br />
                                            - Nếu trả lời "<b>Không</b>" cho bất kỳ câu hỏi nào ở bảng 1 thì vui lòng đánh giá lại mỗi tuần. <br />
                                            <span class="en" style="margin-left: 10px;">The answer is <b>No</b> to all questions: the patient is re-screened weekly</span>
                                        </div>
                                    </div>

                                    <div class="text-center"><b>Bảng 2: Khảo sát dinh dưỡng tiếp theo/ </b><span class="en">Table 2: Final screening</span></div>
                                    
                                    <table class="table-bordered" style="width: calc(210mm - 2.8cm)">
                                        <tr>
                                            <td style="width: 90px" class="text-center"></td>
                                            <td style="width: 250px" class="text-center"><b> Tình trạng dinh dưỡng </b><br /><span class="en">Questions</span></td>
                                            <td style="width: 227.874px" class="text-center"><b>Bệnh nặng</b> <br /><span class="en">Severity of disease</span></td>
                                            <td style="width: 120px" class="text-center"><b>Tuổi</b> <br /><span class="en">Age</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>Điểm = 0</b> <br /><span class="en">Score = 0</span></td>
                                            <td>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_nutrition_normal_true"/></div>
                                                    <div>
                                                        Tình trạng dinh dưỡng bình thường <br />
                                                        <span class="en">Normal nutritional status</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_normal_nutrition_req_true"/></div>
                                                    <div>
                                                        Yêu cầu dinh dưỡng đặc biệt <br />
                                                        <span class="en">Normal nutritional requirements</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-top">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_younger_70_true"/></div>
                                                    <div>
                                                        &lt; 70 tuổi <br />
                                                        <span class="en">&lt; 70 years old</span>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>Điểm = 1</b> <br /><span class="en">Score = 1 <br />
                                            (cross 1 or <br />
                                            more)</span></td>
                                            <td>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_nutrition_score1_1"/></div>
                                                    <div>
                                                        Sụt cân &gt; 5% trong 3 tháng <br />
                                                        <span class="en">Weight loss &gt; 5 in <b>3 months</b></span>
                                                    </div>
                                                </div>

                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_nutrition_score1_2"/></div>
                                                    <div>
                                                        Ăn ít 50%-75% so với nhu cầu ăn bình thường <br />
                                                    trong tuần qua<br />
                                                    <span class="en">Food intake below <b>50 - 75%</b> of normal requirement in preceding week</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-top">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score1_1"/></div>
                                                    <div>
                                                        Gãy khớp háng /<span class="en">Hip fracture</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score1_2"/></div>
                                                    <div>
                                                        Bệnh mãn tính có kèm theo biến chứng <br />
                                                        <span class="en">Chronic disease with complications</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score1_3"/></div>
                                                    <div>
                                                        Viên phổi tắc nghẽn mãn tính/ <span class="en">COPD</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score1_4"/></div>
                                                    <div>
                                                        NB yếu nhưng có thể di chuyển được <br />
                                                        <span class="en">The patient is weak but can move out of bed</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-top">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_older_70_true"/></div>
                                                    <div>
                                                        ≥ 70 tuổi <br />
                                                        <span class="en">≥ 70 years old</span>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="text-center"><b>Điểm = 2</b> <br /><span class="en">Score = 2 <br />
                                            (cross 1 or <br />
                                            more)</span></td>
                                            <td>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_nutrition_score2_1"/></div>
                                                    <div>
                                                        Sụt cân &gt; 5% trong 2 tháng <br />
                                                        <span class="en">Weight loss &gt; 5 in <b>2 months</b></span>
                                                    </div>
                                                </div>

                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_nutrition_score2_2"/></div>
                                                    <div>
                                                        BMI 18.5-20.5 và tổng trạng suy yếu<br />
                                                        <span class="en">BMI 18.5-20.5 and impaired general condition</span>
                                                    </div>
                                                </div>

                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_nutrition_score2_3"/></div>
                                                    <div>
                                                        Ăn ít 25%-50% so với nhu cầu ăn bình thường trong tuần qua<br />
                                                        <span class="en">Food intake 20-50% of normal requirement in preceding week</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-top">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score2_1"/></div>
                                                    <div>
                                                        Có phẫu thuật ở bụng <br />
                                                        <span class="en">Major abdominal surgery</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score2_2"/></div>
                                                    <div>
                                                        Đột quị/ <span class="en">Stroke</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score2_3"/></div>
                                                    <div>
                                                        Viêm phổi nặng/ <span class="en">Severe pneumonia</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score2_4"/></div>
                                                    <div>
                                                        Bệnh ác tính huyết học <br />
                                                        <span class="en">Hematologic malignancy</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score2_5"/></div>
                                                    <div>
                                                        Người bệnh nằm liệt giường <br />
                                                        <span class="en">The patient is bedridden</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                    
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="text-center"><b>Điểm = 3</b> <br /><span class="en">Score = 3 <br />
                                            (cross 1 or <br />
                                            more)</span></td>
                                            <td>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_nutrition_score3_1"/></div>
                                                    <div>
                                                        Sụt cân &gt; 5% trong 1 tháng <br />
                                                        <span class="en">Weight loss &gt; 5 in <b>1 month</b></span>
                                                    </div>
                                                </div>

                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_nutrition_score3_2"/></div>
                                                    <div>
                                                        BMI &lt; 18.5 và tổng trạng suy yếu<br />
                                                        <span class="en">BMI &lt; 18.5 and impaired general condition</span>
                                                    </div>
                                                </div>

                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_nutrition_score3_3"/></div>
                                                    <div>
                                                        Ăn ít 0-25% so với nhu cầu ăn bình thường <br /> trong tuần qua<br />
                                                        <span class="en">Food intake <b>0-25%</b> of normal requirement in <br /> preceding week</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-top">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score3_1"/></div>
                                                    <div>
                                                        Chấn thương đầu <br />
                                                        <span class="en">Head injury</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score3_2"/></div>
                                                    <div>
                                                        Ghép tủy xương <br /> <span class="en">Bone marrow transplantation</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_severity_score3_3"/></div>
                                                    <div>
                                                        Bệnh nhân chăm sóc chuyên sâu (APACHE &gt; 10)<span class="en">Intensive care patients (APACHE &gt; 10)</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>

                                        <tr>
                                            <td class="text-center"><b>Điểm/</b><span class="en">Score</td>
                                            <td class="text-center"><asp:Label runat="server"  ID="prt_nutrition_score"/></td>
                                            <td class="text-center"><asp:Label runat="server"  ID="prt_severity_score"/></td>
                                            <td class="text-center"><asp:Label runat="server"  ID="prt_age_score"/></td>
                                        </tr>

                                        <tr>
                                            <td class="text-center"><b>Tổng điểm</b><br />
                                                <span class="en">Total score</td>
                                            <td colspan="3" class="text-center"><asp:Label runat="server"  ID="prt_total_nutri_score"/></td>
                                        </tr>
                                            
                                    </table>

                                    <div>
                                        *<b>Ghi chú: </b> Khi đánh giá điểm cho mỗi tiêu chí thì luôn luôn chọn điểm cao nhất. Sau đó cộng tất cả các điểm số ở cuối để có điểm số cuối cùng <br />
                                        <span class="en">Notes: When assessing the score for each criterion, always choose the highest score. Then add all scores at the end to get the final score</span><br />
                                        <div style="margin-left: 20px">
                                            Nếu điểm < 3: đánh giá lại NB mỗi tuần/ <span class="en">If score < 3: weekly re-screening of the patient</span> <br />
                                            Nếu điểm ≥ 3: giới thiệu NB đến khám chuyên gia dinh dưỡng/ <span class="en">If score ≥ 3: refer patients to the nutritionists</span> <br />
                                        </div>
                                    </div>
                                    
                                    </div>
                                    
                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div></div>
                                        <div>Đối với người bệnh nữ/<span class="subtitle font-10">For female patients only:</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 100px 100px 100px auto 10px auto 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Kinh nguyệt:</div>
                                            <div class="subtitle font-10">Menstruation</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_menstruation_code_am"/></div>
                                            <div>
                                                <div>Vô kinh</div>
                                                <div class="subtitle font-10">Amenorrhea</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_menstruation_code_me"/></div>
                                            <div>
                                                <div>Mãn kinh</div>
                                                <div class="subtitle font-10">Menopause</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_menstruation_code_cy"/></div>
                                            <div>
                                                <div>Chù kỳ</div>
                                                <div class="subtitle font-10">Cycle</div>
                                            </div>
                                        </div>
                                        <div><asp:Label runat="server" ID="prt_cycle_day"/></div>
                                        <div>
                                            <div>ngày,</div>
                                            <div class="subtitle font-10">day</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                <div>Ngày đầu của kỳ kinh cuối</div>
                                                <div class="subtitle font-10">Last menstrual period started on</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_last_mens_period"/>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 100px 100px auto 40px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Có thai</div>
                                            <div class="subtitle font-10">Pregnancy</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_not_pregnancy_true"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_pre_pregnancy_true"/></div>
                                            <div>
                                                <div>Đã từng mang thai trước đây, PARA: </div>
                                                <div class="subtitle font-10">Previous pregnancy</div>
                                            </div>
                                        </div>
                                        <div><asp:Label runat="server" ID="prt_para"/></div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 10px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_cur_pregnancy_true"/></div>
                                            <div>
                                                <div>Hiện đang mang thai</div>
                                                <div class="subtitle font-10">Current pregnancy</div>
                                            </div>
                                            <div><asp:Label runat="server" ID="prt_pregnancy_week"/></div>
                                            <div>
                                                <div>tuần</div>
                                                <div class="subtitle font-10">weeks</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 90px 80px 130px 250px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Ngừa thai:</div>
                                            <div class="subtitle font-10">Contraception</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_contraception_code_no"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_contraception_code_pill"/></div>
                                            <div>
                                                <div>Thuốc ngừa thai</div>
                                                <div class="subtitle font-10">Contraceptive pill</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_contraception_code_dev"/></div>
                                            <div>
                                                <div>Dụng cụ ngừa thai đặt trong tử cung</div>
                                                <div class="subtitle font-10">Intrauterine Device</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_contraception_code_oth"/></div>
                                            <div>
                                                <div>Khác:</div>
                                                <div class="subtitle font-10">Other</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_contraception_other"/>
                                        </div>
                                    </div>
                                    <%-- 7. --%>
                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>7.</div>
                                        <div>Hệ cơ - xương khớp/ <span class="subtitle font-10">Musculoskeletal system</span></div>
                                    </div>
                                    
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 100px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Tiền sử:</div>
                                            <div class="subtitle font-10">History</div>
                                        </div>
                                        <div>
                                            <div class="d-grid" style="grid-template-columns: 100px 100px 100px 1fr;">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mus_history_nm"/></div>
                                                    <div>
                                                        <div>Bình thường</div>
                                                        <div class="subtitle font-10">Normal</div>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mus_history_jp"/></div>
                                                    <div>
                                                        <div>Đau khớp</div>
                                                        <div class="subtitle font-10">Joint pain</div>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mus_history_js"/></div>
                                                    <div>
                                                        <div>Sưng khớp</div>
                                                        <span class="subtitle font-10">Joint swelling</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_mus_history_ms"/></div>
                                                    <div>
                                                        <div>Sự co rút cơ</div>
                                                        <div class="subtitle font-10">Muscle spasms</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 300px 1fr;">
                                                <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_paralysis_true"/></div>
                                                    <div>
                                                        <div>Liệt/ (1/2 người/2 chi/4 chi):</div>
                                                        <div class="subtitle font-10">Paralysis (Hemi/Para/Tetra)</div>
                                                    </div>
                                                    <asp:Label runat="server" ID="prt_paralysis_note"/>
                                                </div>

                                                <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_amputation_true"/></div>
                                                    <div>
                                                        <div>Đoạn chi:</div>
                                                        <div class="subtitle font-10">Amputation</div>
                                                    </div>
                                                    <asp:Label runat="server" ID="prt_amputation_note"/>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_contracture_true"/></div>
                                                    <div>
                                                        <div>Cơ bắp co rút:</div>
                                                        <div class="subtitle font-10">Muscle spasms</div>
                                                    </div>
                                                    <asp:Label runat="server" ID="prt_contracture_note"/>
                                                </div>

                                                <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_prosthesis_true"/></div>
                                                    <div>
                                                        <div>Lắp bộ phận giả:</div>
                                                        <div class="subtitle font-10">Prosthesis</div>
                                                    </div>
                                                    <asp:Label runat="server" ID="prosthesis_note"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-weight-bold font-11" style="grid-template-columns: 20px 1fr;">
                                        <div>8.</div>
                                        <div>Đánh giá đau/ <span class="subtitle font-10">Pain assessment:</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 180px 80px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Hiện đang đau</div>
                                            <div class="subtitle font-10">Currently in pain</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_cur_in_pain_false"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_cur_in_pain_true"/></div>
                                            <div>
                                                <div>Có, báo bác sĩ</div>
                                                <div class="subtitle font-10">Yes, inform doctor</div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid" style="grid-template-columns: 1fr 265px; margin-left: -20px;">
                                        <div>
                                            <table class="table-bordered font-10" style="table-layout: fixed;">
                                                <tr>
                                                    <td class="text-center font-weight-bold">
                                                        <div>Mô tả đánh giá đau</div>
                                                        <div class="subtitle font-9">Pain Assessment Description</div>
                                                    </td>
                                                    <td style="width: 70px" class="text-center">
                                                        <div class="font-9 font-weight-bold">Vị trí 1</div>
                                                        <div class="subtitle font-9">Location 1</div>
                                                    </td>
                                                    <td style="width: 70px" class="text-center">
                                                        <div class="font-9 font-weight-bold">Vị trí 2</div>
                                                        <div class="subtitle font-9">Location 2</div>
                                                    </td>
                                                    <td style="width: 70px" class="text-center">
                                                        <div class="font-9 font-weight-bold">Vị trí 3</div>
                                                        <div class="subtitle font-9">Location 3</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">
                                                        <div class="font-weight-bold">P Nguyên nhân đau/ <span class="subtitle font-9">Provoking factors</span></div>
                                                        <div class="font-9">Các yếu tố gây ra cơn đau?</div>
                                                        <div class="subtitle fs-8">What factors precipitated the discomfort?</div>
                                                    </td>
                                                    <td><asp:Label runat="server" ID="prt_p_location_1"/></td>
                                                    <td><asp:Label runat="server" ID="prt_p_location_2"/></td>
                                                    <td><asp:Label runat="server" ID="prt_p_location_3"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">
                                                        <div class="font-weight-bold">Q Đau như thế nào?/ <span class="subtitle font-9">Quality</span></div>
                                                        <div class="font-9">Mô tả đau, sự khó chịu/ <span class="subtitle fs-8">Describe the pain, discomfort, & characteristics of pain</span></div>
                                                    </td>
                                                    <td><asp:Label runat="server" ID="prt_q_location_1"/></td>
                                                    <td><asp:Label runat="server" ID="prt_q_location_2"/></td>
                                                    <td><asp:Label runat="server" ID="prt_q_location_3"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">
                                                        <div class="font-weight-bold">R Nơi đau/ <span class="subtitle font-9">Region/ Radiation</span></div>
                                                        <div class="font-9">Đau ở đâu? Đau có lan truyền qua vị trí khác?/ <span class="subtitle fs-8">Where is the pain? Does it radiate?</span></div>
                                                    </td>
                                                    <td><asp:Label runat="server" ID="prt_r_location_1"/></td>
                                                    <td><asp:Label runat="server" ID="prt_r_location_2"/></td>
                                                    <td><asp:Label runat="server" ID="prt_r_location_3"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">
                                                        <div class="font-weight-bold">S Mức độ đau/ <span class="subtitle font-9">Severity</span></div>
                                                        <div class="subtitle fs-8">Rate pain score</div>
                                                    </td>
                                                    <td><asp:Label runat="server" ID="prt_s_location_1"/></td>
                                                    <td><asp:Label runat="server" ID="prt_s_location_2"/></td>
                                                    <td><asp:Label runat="server" ID="prt_s_location_3"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">
                                                        <div style="min-height: 100px;">
                                                            <div class="font-weight-bold">T Thời gian/ <span class="subtitle font-9">Time</span></div>
                                                            <div class="font-9">Người bệnh đã bị đau trong bao lâu?</div> 
                                                            <div class="subtitle fs-8">How long the patient had the pain?</div>
                                                        </div>
                                                    </td>
                                                    <td><asp:Label runat="server" ID="prt_t_location_1"/></td>
                                                    <td><asp:Label runat="server" ID="prt_t_location_2"/></td>
                                                    <td><asp:Label runat="server" ID="prt_t_location_3"/></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div>
                                            <div class="text-center"><img src="#" runat="server" width="240" id="imageTemp" alt="Alternate Text" /></div>
                                            
                                            <div class="text-center font-weight-bold font-10">Đánh dấu (X) vùng đau trên sơ đồ</div>
                                            <div class="text-center font-weight-bold subtitle font-10">Mark a cross (X) to indicate the pain location on the body diagram</div>
                                            <img src="/images/iina_pain_assessment.png" runat="server" width="280" id="Img1" alt="Alternate Text" />
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 200px 80px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Sử dụng thuốc giảm đau</div>
                                            <div class="subtitle font-10">Using painkiller</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_using_pain_killer_false"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_using_pain_killer_true"/></div>
                                            <div>
                                                <div>Có, (nếu có, báo cho BS điều trị đau)</div>
                                                <div class="subtitle font-10">Yes (if yes, Inform the pain specialist)</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 280px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <div>
                                                    <div>Tên thuốc:</div>
                                                    <div class="subtitle font-10">Name of painkiller</div>
                                                </div>
                                                <asp:Label runat="server" ID="prt_pain_killer_name"/>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <div>
                                                    <div>Nhận xét:</div>
                                                    <div class="subtitle font-10">Comments</div>
                                                </div>
                                                <asp:Label runat="server" ID="prt_pa_comment"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>9.</div>
                                        <div>Da & Nguy cơ loét tỳ đè/ <span class="subtitle font-10">Skin & Pressure Sore Risk</span></div>
                                    </div>
                                    
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 80px 100px 50px 50px 80px 50px 60px 110px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Tình trạng:</div>
                                            <div class="subtitle font-10">Condition</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_condition_nm"/></div>
                                            <div>
                                                <div>Bình thường</div>
                                                <div class="subtitle font-10">Normal</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_condition_pa"/></div>
                                            <div>
                                                <div>Tái</div>
                                                <div class="subtitle font-10">Pale</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_condition_fl"/></div>
                                            <div>
                                                <div>Đỏ</div>
                                                <div class="subtitle font-10">Flush</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_condition_ja"/></div>
                                            <div>
                                                <div>Vàng da</div>
                                                <div class="subtitle font-10">Jaundiced</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_condition_dr"/></div>
                                            <div>
                                                <div>Khô</div>
                                                <div class="subtitle font-10">Dry</div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_condition_oi"/></div>
                                            <div>
                                                <div>Nhờn</div>
                                                <div class="subtitle font-10">Oily</div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_condition_sw"/></div>
                                            <div>
                                                <div>Nhiều mồ hôi</div>
                                                <div class="subtitle font-10">Sweaty</div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_condition_ra"/></div>
                                            <div>
                                                <div>Phát ban</div>
                                                <div class="subtitle font-10">Rash</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 85px 90px 120px 80px 70px 85px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Vết thương:</div>
                                            <div class="subtitle font-10">Wounds</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_wounds_1"/></div>
                                            <div>
                                                <div>Máu tụ (1)</div>
                                                <div class="subtitle font-10">Haematoma</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_wounds_2"/></div>
                                            <div>
                                                <div>Sự thâm tím (2)</div>
                                                <div class="subtitle font-10">Bruises</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_wounds_3"/></div>
                                            <div>
                                                <div>Rách (3)</div>
                                                <div class="subtitle font-10">Laceration</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_wounds_4"/></div>
                                            <div>
                                                <div>Sẹo (4)</div>
                                                <div class="subtitle font-10">Scar</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_wounds_5"/></div>
                                            <div>
                                                <div>Phỏng (5)</div>
                                                <div class="subtitle font-10">Burn</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_wounds_6"/></div>
                                            <div>
                                                <div>Loét do tì đè (6)</div>
                                                <div class="subtitle font-10">Pressure sore</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Biểu thị vùng da với chỉ số tương ứng trên sơ đồ cơ thể và mô tả vết thương dưới đây:</div>
                                            <div class="subtitle font-10">Indicate the location with the corresponding number in the body diagram and describe the wound below</div>
                                        </div>
                                    </div>

                                    <table style="width: calc(210mm - 2.8cm)" class="table-bordered font-11" runat="server" id="prt_skin_anno">
                                        <tr>
                                            <td class="text-center font-weight-bold">
                                                <div>Vùng</div>
                                                <div class="subtitle font-10">Location</div>
                                            </td>
                                            <td style="width: 250px" class="text-center">
                                                <div style="width: 250px">
                                                    <div>Loại vết thương và mô tả vết thương</div>
                                                    <div>(vd: kích cỡ, độ sâu, màu...)</div>
                                                    <div class="subtitle font-10">Type and description of wound</div>
                                                    <div class="subtitle font-10">(i.e. size, depth, colour,...)</div>
                                                </div>
                                            </td>
                                            <td style="width: 250px" class="text-center">
                                                <div style="width: 250px">
                                                    <div>Chỉ rõ vùng của vết thương bằng chỉ số tương ứng (1-6) dưới đây</div>
                                                    <div class="subtitle font-10">Specify the location of wound with corresponding numbers (1-6) as below</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    
                                    <div class="d-grid font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div></div>
                                        <div>
                                            <div>Đánh giá nguy cơ loét tỳ đè được cải tiến thang Braden</div>
                                            <div class="subtitle font-10">Pressure ulcer risk assessment modified with Braden scale</div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid" style="grid-template-columns: 20px 1fr;">
                                        <div></div>
                                        <div><span class="font-weight-bold">Hướng dẫn:</span> So sánh tình trạng của người bệnh với mô tả phù hợp nhất của từng loại. Ghi điểm (bằng số) ở cột bên phải. Cộng lại ở bên dưới để tính</div>
                                    </div>

                                    <div class="d-grid subtitle font-10" style="grid-template-columns: 20px 1fr;">
                                        <div></div>
                                        <div><span class="font-weight-bold">Guidance:</span> Compare patient condition with the most appropriate description. Note the score (written as a number) at the right column. Plus together at the bottom to receive the total score.</div>
                                    </div>
                                    
                                    <%-- RISK | SCORE/DESCRIPTION | SCORE --%>
                                    <table class="table-bordered" style="width: calc(210mm - 2.8cm)">
                                        <tr>
                                            <td class="text-center font-weight-bold" rowspan="2">
                                                <div class="font-10">Nguy cơ</div>
                                                <div class="subtitle font-10">Risk</div>
                                            </td>
                                            <td class="text-center font-weight-bold" colspan="4">
                                                <div class="font-10">Điểm/ Mô tả</div>
                                                <div class="subtitle font-10">Score/ Description</div>
                                            </td>
                                            <td style="width: 70px" class="text-center font-weight-bold" rowspan="2">
                                                <div class="font-10">Điểm số</div>
                                                <div class="subtitle font-10">Score</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center font-weight-bold" style="width: 110px">1</td>
                                            <td class="text-center font-weight-bold" style="width: 110px">2</td>
                                            <td class="text-center font-weight-bold" style="width: 110px">3</td>
                                            <td class="text-center font-weight-bold" style="width: 110px">4</td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <div class="font-10 font-weight-bold">Nhận thức giác quan</div>
                                                <div class="subtitle font-10">Sensory perception</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Giới hạn hoàn toàn</div>
                                                <div class="subtitle font-9">Completely limited</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Giới hạn nhiều</div>
                                                <div class="subtitle font-9">Significantly limited</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Giới hạn ít</div>
                                                <div class="subtitle font-9">Slightly limited</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Không giới hạn</div>
                                                <div class="subtitle font-9">Unlimited</div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_sensory_code"/></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <div class="font-10 font-weight-bold">Độ ẩm</div>
                                                <div class="subtitle font-10">Moisture</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Liên tục ẩm</div>
                                                <div class="subtitle font-9">Constantly moist</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Thường ẩm</div>
                                                <div class="subtitle font-9">Often moist</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Thỉnh thoảng ẩm</div>
                                                <div class="subtitle font-9">Occasionally moist</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Hiếm khi ẩm</div>
                                                <div class="subtitle font-9">Rarely moist</div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_moisture_code"/></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <div class="font-10 font-weight-bold">Vận động</div>
                                                <div class="subtitle font-10">Activity</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Nằm liệt giường</div>
                                                <div class="subtitle font-10">Bedridden</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Cố định trên ghế</div>
                                                <div class="subtitle font-10">Chairfast</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Thỉnh thoảng đi lại</div>
                                                <div class="subtitle font-10">Occasional walk</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Đi lại thường xuyên</div>
                                                <div class="subtitle font-10">Frequent walk</div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_activity_code"/></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <div class="font-10 font-weight-bold">Di chuyển</div>
                                                <div class="subtitle font-10">Mobility</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Hoàn toàn bất động</div>
                                                <div class="subtitle font-10">Completely immobile</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Rất hạn chế</div>
                                                <div class="subtitle font-10">Very limited</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Ít hạn chế</div>
                                                <div class="subtitle font-10">Slightly limited</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Không giới hạn</div>
                                                <div class="subtitle font-10">Unlimited</div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_mobility_code"/></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <div class="font-10 font-weight-bold">Dinh dưỡng</div>
                                                <div class="subtitle font-10">Nutrition</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Rất kém</div>
                                                <div class="subtitle font-10">Very poor</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Có thể không đầy đủ/ <div class="subtitle font-9">Probably inadequate</div></div>
                                            </td>
                                            <td>
                                                <div class="font-10">Đầy đủ</div>
                                                <div class="subtitle font-10">Adequate</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Hoàn hảo</div>
                                                <div class="subtitle font-10">Excellent</div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_nutrition_code"/></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <div class="font-10 font-weight-bold">Sự ma sát và trượt da</div>
                                                <div class="subtitle font-10">Friction and shear</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Có vấn đề</div>
                                                <div class="subtitle font-10">Problem</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Vấn đề tiềm ẩn</div>
                                                <div class="subtitle font-10">Potential problem</div>
                                            </td>
                                            <td>
                                                <div class="font-10">Không có vấn đề</div>
                                                <div class="subtitle font-10">No problem</div>
                                            </td>
                                            <td></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_friction_code"/></td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" class="text-center font-weight-bold">
                                                <div class="font-10">Tổng điểm</div>
                                                <div class="subtitle font-10">Total score</div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_total_score"/></td>
                                        </tr>
                                    </table>

                                    <div class="d-grid font-10" style="grid-template-columns: 20px 200px 1fr 1fr 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Nguy cơ loét tỳ đè:</div>
                                            <div class="subtitle font-10">Pressure sore risk:</div>
                                        </div>
                                        <div class="d-grid font-weight-bold" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_pres_sore_risk_code_v"/></div>
                                            <div>
                                                <div>Rất cao (≤10)</div>
                                                <span class="subtitle font-10">Very high (≤10)</span>
                                            </div>
                                        </div>
                                        <div class="d-grid font-weight-bold" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_pres_sore_risk_code_h"/></div>
                                            <div>
                                                <div>Cao (11 -17)</div>
                                                <span class="subtitle font-10">High (11 -17)</span>
                                            </div>
                                        </div>
                                        <div class="d-grid font-weight-bold" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_pres_sore_risk_code_l"/></div>
                                            <div>
                                                <div>Thấp (≥18)</div>
                                                <span class="subtitle font-10">Low (≥18)</span>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid font-10" style="grid-template-columns: 20px 400px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Cách phòng ngừa tương ứng với những nguy cơ xác định</div>
                                            <div class="subtitle">Take preventive actions according to the identified risk</div>
                                        </div>
                                        <div><asp:Label runat="server" ID="prt_preven_action"/></div>
                                    </div>

                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>10.</div>
                                        <div>Khả năng thực hiện những sinh hoạt hàng ngày/ <span class="subtitle font-10">Ability to perform activities of daily living</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 100px 100px 150px 150px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Tắm:</div>
                                            <div class="subtitle font-10">Bathing</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_bathing_code_in"/></div>
                                            <div>
                                                <div>Tự tắm</div>
                                                <div class="subtitle font-10">Independent</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_bathing_code_as"/></div>
                                            <div>
                                                <div>Cần sự hỗ trợ khi tắm</div>
                                                <div class="subtitle font-10">Assisted bathing</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_bathing_code_ab"/></div>
                                            <div>
                                                <div>Hỗ trợ tắm tại giường</div>
                                                <div class="subtitle font-10">Assisted bedside bathing</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_bathing_code_db"/></div>
                                            <div>
                                                <div>Tự tắm tại giường</div>
                                                <div class="subtitle font-10">Bedside self-bathing</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 138px 100px 165px 150px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Chăm sóc răng miệng:</div>
                                            <div class="subtitle font-10">Oral care</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_oral_care_code_oc"/></div>
                                            <div>
                                                <div>Tự làm</div>
                                                <div class="subtitle font-10">Independent</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_oral_care_code_pu"/></div>
                                            <div>
                                                <div>Chỉ chuẩn bị đồ dùng</div>
                                                <div class="subtitle font-10">Oral care kit prepared only</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_oral_care_code_ab"/></div>
                                            <div>
                                                <div>Hỗ trợ đánh răng</div>
                                                <div class="subtitle font-10">Assisted toothbrushing</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 15px 1fr">
                                            <div><asp:Label CssClass="align-top text-right" runat="server" Text="❏" ID="prt_oral_care_code_oth"/></div>
                                            <asp:Label runat="server" ID="prt_oral_care_note"/>
                                            <div>
                                                <div>lần/ngày</div>
                                                <div class="subtitle font-10">times/day</div>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- Dentures --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 80px 100px 100px 100px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Răng giả:</div>
                                            <div class="subtitle font-10">Dentures</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_dentures_code_n"/></div>
                                            <div>
                                                <div>Không có</div>
                                                <div class="subtitle font-10">None</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_dentures_code_u"/></div>
                                            <div>
                                                <div>Hàm trên</div>
                                                <div class="subtitle font-10">Maxilla</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_dentures_code_l"/></div>
                                            <div>
                                                <div>Hàm dưới</div>
                                                <div class="subtitle font-10">Mandible</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_dentures_code_p"/></div>
                                            <div>
                                                <div>Từng phần</div>
                                                <div class="subtitle font-10">Partial</div>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- Toilet use --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 80px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Đi vệ sinh:</div>
                                            <div class="subtitle font-10">Toilet use</div>
                                        </div>
                                        <div>
                                            <div class="d-grid" style="grid-template-columns: 85px 175px 1fr;">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_toilet_use_code_in"/></div>
                                                    <div>
                                                        <div>Tự vệ sinh</div>
                                                        <div class="subtitle font-10">Independent</div>
                                                    </div>
                                                </div>

                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_toilet_use_code_at"/></div>
                                                    <div>
                                                        <div>Cần hỗ trợ khi đi vệ sinh</div>
                                                        <div class="subtitle font-10">Assisted for the toilet use</div>
                                                    </div>
                                                </div>

                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_toilet_use_code_ac"/></div>
                                                    <div>
                                                        <div>Cần hỗ trợ trên ghế dùng để tiểu tiện trong phòng</div>
                                                        <div class="subtitle font-10">Assisted on the commode</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 70px 145px 120px 1fr;">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_toilet_use_code_di"/></div>
                                                    <div>
                                                        <div>Tã</div>
                                                        <div class="subtitle font-10">Diaper</div>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_toilet_use_code_bu"/></div>
                                                    <div>
                                                        <div>Bô dùng tại giường</div>
                                                        <div class="subtitle font-10">Bedpan/urine bottle</div>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_toilet_use_code_ca"/></div>
                                                    <div>
                                                        <div>Ống thông tiểu</div>
                                                        <div class="subtitle font-10">Urinary catheter</div>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_toilet_use_code_uc"/></div>
                                                    <div>
                                                        <div>Ống thông tiểu đặt ngoài bàng quang</div>
                                                        <div class="subtitle font-10">Urethral catheter</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- Trang phục --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 85px 100px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Trang phục:</div>
                                            <div class="subtitle font-10">Dressing</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_dressing_code_in"/></div>
                                            <div>
                                                <div>Tự làm</div>
                                                <span class="subtitle font-10">Independent</span>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_dressing_code_wa"/></div>
                                            <div>
                                                <div>Cần hỗ trợ</div>
                                                <span class="subtitle font-10">With assistance</span>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- Eating/Feeding --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 90px 100px 150px 170px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Ăn/cho ăn:</div>
                                            <div class="subtitle font-10">Eating/Feeding</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_eating_code_in"/></div>
                                            <div>
                                                <div>Tự ăn</div>
                                                <div class="subtitle font-10">Independent</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_eating_code_dp"/></div>
                                            <div>
                                                <div>Phụ thuộc về tư thế</div>
                                                <div class="subtitle font-10">Depend on position</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_eating_code_da"/></div>
                                            <div>
                                                <div>Phụ thuộc về ăn uống</div>
                                                <div class="subtitle font-10">Dependent to eat</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_eating_code_tu"/></div>
                                            <div>
                                                <div>Cho ăn qua ống</div>
                                                <div class="subtitle font-10">NG tube/Gastrostomy</div>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- Patient repositioning --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 180px 100px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Xoay trở tư thế trên giường:</div>
                                            <div class="subtitle font-10">Patient repositioning</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_turning_bed_code_in"/></div>
                                            <div>
                                                <div>Tự xoay trở</div>
                                                <div class="en">Independent</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_turning_bed_code_dn"/></div>
                                            <div>
                                                <div>Không tự xoay trở</div>
                                                <div class="en">Unable to reposition</div>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- Ambulation --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 100px 100px 100px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Đi lại:</div>
                                            <div class="subtitle font-10">Ambulation</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_ambulation_code_in"/></div>
                                            <div>
                                                <div>Tự đi</div>
                                                <div class="subtitle font-10">Independent</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_ambulation_code_bf"/></div>
                                            <div>
                                                <div>Liệt giường</div>
                                                <div class="subtitle font-10">Bedridden</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_ambulation_code_na"/></div>
                                            <div>
                                                <div>Cần hỗ trợ (ghi rõ):</div>
                                                <div class="subtitle font-10">Need assistance (specify)</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_ambulation_note"/>
                                        </div>
                                    </div>
                                    <%-- Sleep --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 80px 110px 110px 130px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Ngủ:</div>
                                            <div class="subtitle font-10">Sleep</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_sleep_code_nm"/></div>
                                            <div>
                                                <div>Bình thường</div>
                                                <span class="subtitle font-10">Normal</span>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_sleep_code_ae"/></div>
                                            <div>
                                                <div>Thức sớm</div>
                                                <span class="subtitle font-10">Wake up early</span>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_sleep_code_pfa"/></div>
                                            <div>
                                                <div>Khó ngủ</div>
                                                <span class="subtitle font-10">Sleep disturbances</span>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_sleep_code_pst"/></div>
                                            <div>
                                                <div>Khó ngủ say</div>
                                                <span class="subtitle font-10">Insomnia</span>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- Medication used --%>
                                    <div class="d-grid font-11" style="grid-template-columns: 20px 80px 1fr;">
                                        <div></div>
                                        <div></div>
                                        <div class="d-grid" style="grid-template-columns: 15px auto 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_medication_used_true"/></div>
                                            <div>
                                                <div>Thuốc đã sử dụng:&nbsp;</div>
                                                <span class="subtitle font-10">Medication used</span>
                                            </div>
                                            <asp:Label runat="server" ID="prt_medication_used"/>
                                        </div>
                                    </div>
                                    
                                    <%--<div class="text-center">12. Đánh giá nguy cơ té ngã sử dụng Bảng Morse Scale/ <span class="subtitle font-10">High risk of fall assessment using Morse Scale</span></div>--%>

                                    <table class="table-bordered font-11" style="width: calc(210mm - 2.8cm)">
                                        <tr>
                                            <td colspan="4">
                                                <div class="font-weight-bold">11. Đánh giá nguy cơ té ngã sử dụng Bảng Morse Scale/<span class="subtitle font-10">Fall risk assessment with Morse Scale</span></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <%--style="width: 587.874px"--%>
                                            <td colspan="3" class="text-center font-weight-bold">
                                                <div>Tình trạng</div>
                                                <div class="subtitle font-10">Condition</div>
                                            </td>
                                            <td style="width: 60px" class="text-center font-weight-bold">
                                                <div>Điểm</div>
                                                <div class="subtitle font-10">Score</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>1. Tiền sử té ngã (bao gồm lần nhập viện hiện tại và trong 12 tháng gần đây/ <span class="subtitle font-10">History of fall (include currentadmission and last 12 months)</span></div>
                                            </td>
                                            <td colspan="2">
                                                <div style="width: 185px">
                                                    <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                        <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_fall_history_code_25"/></div>
                                                        <div>Có/ <span class="subtitle">Yes</span> = 25</div>
                                                    </div>
                                                    <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                        <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_fall_history_code_0"/></div>
                                                        <div>Không/ <span class="subtitle font-10">No</span> = 0</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_fall_history_code"/></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>2. Có từ 2 bệnh lý trở lên, ví dụ: bệnh tiểu đường kết hợp với bệnh cao huyết  áp,v.v... và/  hoặc đang dùng một  trong  các loại  thuốc thuộc nhóm: thuốc ngủ, thuốc lợi tiểu, thuốc hạ huyết áp, thuốc chống trầm cảm, chống động  kinh, thuốc nhuận tràng,  thuốc gây  nghiện,  thuốc kháng đông *</div>
                                                <div class="subtitle font-10">Has a secondary Diagnostic e.g. with co morbidities-diabetic, hypertension, etc...and/ or has any administrated medication of Hypnotics, Barbiturates; antihypertension, Phenothiazines Antidepressants; Anti-convulsants, Laxatives,Diuretics, Narcotics, Anticoagulant *</div>
                                            </td>
                                            <td colspan="2">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_secon_diagnosis_code_15"/></div>
                                                    <div>Có/ <span class="subtitle font-10">Yes</span> = 15</div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_secon_diagnosis_code_0"/></div>
                                                    <div>Không/ <span class="subtitle font-10">No</span> = 0</div>
                                                </div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_secon_diagnosis_code"/></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div>3.</div>
                                                    <div>
                                                        <div>Khả năng di chuyển</div>
                                                        <div class="subtitle font-10">Ambulatory ability</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td colspan="2">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_ambula_aids_code_0"/></div>
                                                    <div>
                                                        Không cần trợ giúp để đi lại hoặc nằm tại giường/ <span class="subtitle font-10">No ambulatory aid or bedrest</span> = 0
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_ambula_aids_code_15"/></div>
                                                    <div>
                                                        Nạng chống/ nạng bốn chân/ khung tập đi/ hỗ trợ điều dưỡng/ hỗ trợ đi lại/ <span class="subtitle font-10">Crutch/Quad Cane/Walking  Frame/Nurse  Assist/Walking aid</span> = 15
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_ambula_aids_code_30"/></div>
                                                    <div>
                                                        Vịnh vào vật dụng để đi lại/ <span class="subtitle font-10">Holds on to Furniture</span> = 30
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ambula_aids_code"/></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div>4.</div>
                                                    <div>
                                                        <div>Liệu pháp tiêm tĩnh mạch/ có khóa heparin</div>
                                                        <div class="subtitle font-10">Intravenous therapy/Heparin lock</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td colspan="2">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_intra_therapy_code_20"/></div>
                                                    <div>
                                                        Có/<span class="subtitle font-10">Yes</span> = 20
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_intra_therapy_code_0"/></div>
                                                    <div>
                                                        Không/<span class="subtitle font-10">No</span> = 0
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_intra_therapy_code"/></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div>5.</div>
                                                    <div>
                                                        <div>Dáng đi/ di chuyển</div>
                                                        <div class="subtitle font-10">Gait/ transferring</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td colspan="2">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_gait_trans_code_20"/></div>
                                                    <div>
                                                        Suy yếu/<span class="subtitle font-10">Impaired</span> = 20
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_gait_trans_code_10"/></div>
                                                    <div>
                                                        Yếu/<span class="subtitle font-10">Weak</span> = 10
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_gait_trans_code_0"/></div>
                                                    <div>
                                                        Bình thường, nằm tại giường/<span class="subtitle font-10">Normal, bedrest</span> = 0
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_gait_trans_code"/></td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div>6.</div>
                                                    <div>
                                                        <div>Trạng thái tâm thần</div>
                                                        <div class="subtitle font-10">Mental status</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td colspan="2">
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_fr_mental_status_code_0"/></div>
                                                    <div>
                                                        Hiểu được giới hạn bản thân = 0/ <span class="subtitle font-10">Understanding of personal limits</span>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="prt_fr_mental_status_code_15"/></div>
                                                    <div>
                                                        Không hiểu được giới hạn bản thân/ <span class="subtitle font-10">Do not understand personal limits</span> = 15
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_fr_mental_status_code"/></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="d-grid" style="grid-template-columns: auto auto auto auto">
                                                    <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                        <div>-</div>
                                                        <div class="font-weight-bold">
                                                            <div>Nguy cơ</div>
                                                            <div class="subtitle font-10">Risk</div>
                                                        </div>
                                                    </div>
                                                    <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                        <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label9"/></div>
                                                        <div class="font-weight-bold">
                                                            <div>Thấp (0-24)</div>
                                                            <div class="subtitle font-10">Low</div>
                                                        </div>
                                                    </div>
                                                    <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                        <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label10"/></div>
                                                        <div class="font-weight-bold">
                                                            <div>Trung bình (25-44)</div>
                                                            <div class="subtitle font-10">Medium</div>
                                                        </div>
                                                    </div>
                                                    <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                                        <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label14"/></div>
                                                        <div class="font-weight-bold">
                                                            <div>Cao (≥45)</div>
                                                            <div class="subtitle font-10">High</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="font-weight-bold text-center" style="width: 90px">
                                                <div>Tổng điểm</div>
                                                <div class="subtitle font-10">Total score</div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_fr_total_score"/></td>
                                        </tr>
                                    </table>
                                    
                                    <%--<div class="d-grid" style="grid-template-columns: 1fr auto 1fr;">
                                        <div class="text-center">0-24: <b>Nguy cơ thấp</b>/<span class="en">Low risk</span></div>
                                        <div class="text-center">25-44: <b>Nguy cơ trung bình</b>/<span class="en">Medium risk</span></div>
                                        <div class="text-center">45+: <b>Nguy cơ cao</b>/<span class="en">High risk</span></div>
                                    </div>--%>

                                    <div class="font-weight-bold">IV. KẾ HOẠCH XUẤT VIỆN/ <span class="subtitle">DISCHARGE PLANING</span></div>

                                    <%--<div class="d-grid" style="grid-template-columns: auto 1fr">
                                        <b>D.&nbsp;</b>
                                        <div>
                                            <b>KẾ HOẠCH XUẤT VIỆN (HOÀN TẤT TRONG VÒNG 24 GIỜ SAU KHI NHẬP VIỆN) <br /><span class="en">DISCHARGE PLAN (TO BE COMPLETED WITHIN 24 HOURS OF ADMISSION)</span></b>
                                        </div>
                                    </div>

                                    <div><b>Đánh giá lại và mời hội chẩn nếu tìnhtrạng sức khỏe của người bệnh thay đổi. Nếu cần, chuyển bệnh đến khoa thích hợp. Nếu có nghi vấn, thảo luận với bác sĩ phụ trách. </b><br /><span class="en">Reassess and inform if patient's condition charges. If there is "Yes" refer to the respective unit. In doubt, disscuss with doctor in charge</span></div>--%>

                                    <table class="table-bordered font-11" style="width: calc(210mm - 2.8cm)">
                                        <tr>
                                            <td style="width: 577.874px">
                                                <div>Đánh giá lại và mời hội chẩn nếu tình trạng sức khỏe của người bệnh thay đổi. Nếu cần, chuyển bệnh đến khoa thích hợp. Nếu có nghi vấn, thảo luận với bác sĩ phụ trách.</div>
                                                <div class="subtitle font-10">Reassessment and consultation if patient’s health condition is changed. If need, refer the patient to the relevant department. If in doubt, discuss with a doctor in charge</div>
                                            </td>
                                            <td class="text-center" style="width: 50px">
                                                <div>Có</div>
                                                <div class="subtitle font-10">Yes</div>
                                            </td>
                                            <td class="text-center" style="width: 60px">
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Nhiều chuyên khoa cùng tham gia điều trị/ <span class="subtitle font-10">Multidisciplinary team involvement</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_involvement_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_involvement_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Yêu cầu thiết bị y tế, máy tạo oxy và dịch vụ giúp đỡ chăm sóc tại nhà</div>
                                                <div class="subtitle font-10">Requires medical equipment, oxygen concentrator and home care help services</div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_req_med_equipment_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_req_med_equipment_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>Yêu cầu theo dõi điều trị/ <span class="subtitle font-10">Require to follow-up</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_req_foll_care_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_req_foll_care_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>Các trường hợp tự tử (cần hội chẩn khẩn cấp)/ <span class="subtitle font-10">Suicidal cases (Urgent referral)</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_suicidal_referral_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_suicidal_referral_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>Sống một mình với tình trạng suy giảm chức năng và không được chăm sóc điều trị hay hỗ trợ từ gia đình/ <span class="subtitle font-10">Lives alone with reduced functional status and no other care giver or family support</span>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_alone_reduce_functional_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_alone_reduce_functional_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>Mời bác sĩ vật lý trị liệu hội chẩn/ <span class="subtitle font-10">Referral to Physiotherapist</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ref_physiotherapist_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ref_physiotherapist_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>Mời chuyên gia ngôn ngữ trị liệu hội chẩn/ <span class="subtitle font-10">Referral to speech therapist</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ref_speech_therapist_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ref_speech_therapist_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>Giới thiệu đến chuyên gia dinh dưỡng/ <span class="subtitle font-10">Referral to Dietician</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ref_dietician_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ref_dietician_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>Giới thiệu đến chuyên gia tâm lý/ <span class="subtitle font-10">Referral to Psychologist</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ref_psychologist_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ref_psychologist_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>Yêu cầu chuyển đến bệnh viện khác/ <span class="subtitle font-10">Referral to other hospital</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ref_other_hospital_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_ref_other_hospital_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>Người nhà hỗ trợ tại nhà/ <span class="subtitle font-10">Family support athome</span>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_support_at_home_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_support_at_home_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>Người bệnh yêu cầu phương tiện vận chuyển về nhà</div>
                                                <div class="subtitle font-10">Patient requires transportation service to go home</div>
                                            </td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_req_transportation_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_req_transportation_false"/></td>
                                        </tr>
                                        <tr>
                                            <td>Cầu thang bộ tại nhà/ <span class="subtitle font-10">Stairts at home</span></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_stairs_climb_home_true"/></td>
                                            <td class="text-center"><asp:Label runat="server" ID="prt_stairs_climb_home_false"/></td>
                                        </tr>
                                    </table>

                                    <table class="table-bordered" style="width: calc(210mm - 2.8cm); margin-top: -1px">
                                        <tr>
                                            <td class="font-11 font-weight-bold text-center" style="width: 200px">
                                                <div>Kế hoạch xuất viện</div>
                                                <div class="subtitle font-10">Discharge planing</div>
                                            </td>
                                            <td>
                                                <asp:Label runat="server" ID="prt_dis_planning"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="font-11 font-weight-bold text-center">
                                                <div>Đánh giá lại</div>
                                                <div class="subtitle font-10">Reassessment</div>
                                            </td>
                                            <td>
                                                <asp:Label runat="server" ID="Label16"/>
                                            </td>
                                        </tr>
                                    </table>

                                    <div>&nbsp;</div>

                                    <div class="d-grid" style="grid-template-columns: 1fr 1fr;">
                                        <div class="text-center">
                                            <div>Ngày/<span class="subtitle font-10">Date</span> <asp:Label runat="server" ID="Label17"/> Giờ/<span class="subtitle font-10">Time</span> <asp:Label runat="server" ID="Label18"/></div>
                                            <div class="font-weight-bold">Điều dưỡng đánh giá ban đầu</div>
                                            <div class="subtitle font-10 font-weight-bold">Initial assessment nurse</div>
                                            <div>(Họ tên, chữ ký, MSNV/ <span class="subtitle font-10">Name, signature & ID</span>)</div>
                                            <div style="height: 100px"></div>
                                        </div>
                                        <div class="text-center">
                                            <div>Ngày/<span class="subtitle font-10">Date</span> <asp:Label runat="server" ID="Label19"/> Giờ/<span class="subtitle font-10">Time</span> <asp:Label runat="server" ID="Label20"/></div>
                                            <div class="font-weight-bold">Điều dưỡng đánh giá lại</div>
                                            <div class="subtitle font-10 font-weight-bold">Re-assessment nurse</div>
                                            <div>(Họ tên, chữ ký, MSNV/ <span class="subtitle font-10">Name, signature & ID</span>)</div>
                                            <div style="height: 100px"></div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-12 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>V.</div>
                                        <div>
                                            <div>HƯỚNG DẪN NGƯỜI BỆNH VỀ NHỮNG TIỆN NGHI TRONG PHÒNG VÀ CÁC DỊCH VỤ</div>
                                            <div class="subtitle font-11">PATIENT GUIDES TO ROOM FACILITIES AND SERVICES</div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 140px 100px 100px 1fr 120px;">
                                        <div>-</div>
                                        <div>
                                            <div class="font-weight-bold">Hướng dẫn</div>
                                            <div class="subtitle font-10">Instructions provided to</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label29"/></div>
                                            <div>
                                                <div>Người bệnh</div>
                                                <div class="subtitle font-10">Patient</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label30"/></div>
                                            <div>
                                                <div>Thân nhân</div>
                                                <div class="subtitle font-10">Relative</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label31"/></div>
                                            <div>
                                                <div>Khác</div>
                                                <div class="subtitle font-10">Others</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label32"/></div>
                                            <div>
                                                <div>Không áp dụng</div>
                                                <div class="subtitle font-10">Not applicable</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>1.</div>
                                        <div>Nhân viên/ <span class="subtitle font-10">Personnel</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 1fr 1fr">
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label33"/></div>
                                            <div>
                                                <div>Giới thiệu với ĐD phụ trách và nhân viên khác</div>
                                                <div class="subtitle font-10">Introduction to a nurse in charge and other staff</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label34"/></div>
                                            <div>
                                                <div>Giới thiệu với NB khác</div>
                                                <div class="subtitle font-10">Introduction to other patients</div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>2.</div>
                                        <div>Tiện nghi vật chất/ <span class="en">Physical facilities</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 200px 1fr 1fr 1fr">
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label35"/></div>
                                            <div>
                                                <div>Vị trí giường</div>
                                                <div class="subtitle font-10">Bed location</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label36"/></div>
                                            <div>
                                                <div>Phòng tắm/nhà vệ sinh</div>
                                                <div class="subtitle font-10">Bathroom/toilet</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label37"/></div>
                                            <div>
                                                <div>Sử dụng tivi</div>
                                                <div class="subtitle font-10">Use of television</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label38"/></div>
                                            <div>
                                                <div>Sử dụng điện thoại</div>
                                                <div class="subtitle font-10">Use of telephone</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 200px 1fr">
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label39"/></div>
                                            <div>
                                                <div>Hệ thống gọi điều dưỡng</div>
                                                <div class="subtitle font-10">Nurse call system</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label40"/></div>
                                            <div>
                                                <div>Trạm điều dưỡng và quầy chính</div>
                                                <div class="subtitle font-10">Nurse station and main counter</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>3.</div>
                                        <div>Chính sách và quy trình/ <span class="subtitle font-10">Policies and procedure</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 200px 140px 1fr 1fr">
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label41"/></div>
                                            <div>
                                                <div>Khách thăm bệnh, giờ thăm</div>
                                                <div class="subtitle font-10">Visitors and visiting hours</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label42"/></div>
                                            <div>
                                                <div>Thẻ chăm bệnh</div>
                                                <div class="subtitle font-10">Patient care card</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label44"/></div>
                                            <div>
                                                <div>Đồng phục người bệnh</div>
                                                <div class="subtitle font-10">Patient uniform</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label45"/></div>
                                            <div>
                                                <div>Dịch vụ ăn uống</div>
                                                <div class="subtitle font-10">Meal service</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 340px 1fr">
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label46"/></div>
                                            <div>
                                                <div>Quy trình trước và sau phẫu thuật nếu có</div>
                                                <div class="subtitle font-10">Pre and postoperative procedures (if available)</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label47"/></div>
                                            <div>
                                                <div>Số liên lạc với khoa/phòng</div>
                                                <div class="subtitle font-10">Ward contact number</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>4.</div>
                                        <div>Biện pháp an toàn/ <span class="subtitle font-10">Safety precautions</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 1fr 1fr">
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label48"/></div>
                                            <div>
                                                <div>Vị trí cửa thoát hiểm</div>
                                                <div class="subtitle font-10">Location of fire exits</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label49"/></div>
                                            <div>
                                                <div>Biện pháp phòng ngừa té ngã</div>
                                                <div class="subtitle font-10">Fall precaution</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label50"/></div>
                                            <div>
                                                <div>Sử dụng vòng đeo tay nhận diện</div>
                                                <div class="subtitle font-10">Use of identification wrist band</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label51"/></div>
                                            <div>
                                                <div>Nguy cơ cháy-Không hút thuốc trong phạm vi bệnh viện</div>
                                                <div class="subtitle font-10">Fire risk – No smoking hospital</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11 font-weight-bold" style="grid-template-columns: 20px 1fr;">
                                        <div>5.</div>
                                        <div>Tư trang/ vật dụng cá nhân/ <span class="subtitle font-10">Valuables/Belongings</span></div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 70px 65px 45px 90px 115px 55px 75px 80px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Răng giả:</div>
                                            <div class="subtitle font-10">Dentures</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label52"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label53"/></div>
                                            <div>
                                                <div>Có</div>
                                                <div class="subtitle font-10">Yes</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label54"/></div>
                                            <div>
                                                <div>NB giữ</div>
                                                <div class="subtitle font-10">With patient</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label55"/></div>
                                            <div>
                                                <div>Thân nhân giữ</div>
                                                <div class="subtitle font-10">With relative</div>
                                            </div>
                                        </div>
                                        <div>
                                            <div>Ghi rõ:</div>
                                            <div class="subtitle font-10">Specify</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label56"/></div>
                                            <div>
                                                <div>Hàm trên</div>
                                                <div class="subtitle font-10">Upper</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label57"/></div>
                                            <div>
                                                <div>Hàm dưới</div>
                                                <div class="subtitle font-10">Lower</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label58"/></div>
                                            <div>
                                                <div>Từng phần</div>
                                                <div class="subtitle font-10">Partial</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 90px 65px 45px 90px 115px 55px 75px 80px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Máy trợ thính:</div>
                                            <div class="subtitle font-10">Hearing aid</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label60"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label61"/></div>
                                            <div>
                                                <div>Có</div>
                                                <span class="subtitle font-10">Yes</span>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label62"/></div>
                                            <div>
                                                <div>NB giữ</div>
                                                <div class="subtitle font-10">With patient</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label63"/></div>
                                            <div>
                                                <div>Thân nhân giữ</div>
                                                <div class="subtitle font-10">With relative</div>
                                            </div>
                                        </div>
                                        <div>
                                            <div>Ghi rõ:</div>
                                            <div class="subtitle font-10">Specify</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label65"/></div>
                                            <div>
                                                <div>Trái</div>
                                                <div class="subtitle font-10">Left</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label66"/></div>
                                            <div>
                                                <div>Phải</div>
                                                <div class="subtitle font-10">Right</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 100px 65px 45px 90px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Mắt kính:</div>
                                            <div class="subtitle font-10">Eye glasses</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label59"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label64"/></div>
                                            <div>
                                                <div>Có</div>
                                                <div class="subtitle font-10">Yes</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label67"/></div>
                                            <div>
                                                <div>NB giữ</div>
                                                <div class="subtitle font-10">With patient</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label68"/></div>
                                            <div>
                                                <div>Thân nhân giữ</div>
                                                <div class="subtitle font-10">With relative</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 120px 65px 45px 90px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Kính sát tròng:</div>
                                            <div class="subtitle font-10">Contact lenses</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label69"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label70"/></div>
                                            <div>
                                                <div>Có</div>
                                                <div class="subtitle font-10">Yes</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label71"/></div>
                                            <div>
                                                <div>NB giữ</div>
                                                <div class="subtitle font-10">With patient</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label72"/></div>
                                            <div>
                                                <div>Thân nhân giữ</div>
                                                <div class="subtitle font-10">With relative</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 120px 65px 45px 90px 120px 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Tiền mặt/ nữ trang:</div>
                                            <div class="subtitle font-10">Cash/ Jewelry</div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label73"/></div>
                                            <div>
                                                <div>Không</div>
                                                <div class="subtitle font-10">No</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label74"/></div>
                                            <div>
                                                <div>Có</div>
                                                <div class="subtitle font-10">Yes</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label75"/></div>
                                            <div>
                                                <div>NB giữ</div>
                                                <div class="subtitle font-10">With patient</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label76"/></div>
                                            <div>
                                                <div>Thân nhân giữ</div>
                                                <div class="subtitle font-10">With relative</div>
                                            </div>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 15px 1fr">
                                            <div><asp:Label CssClass="align-top" runat="server" Text="❏" ID="Label77"/></div>
                                            <div>
                                                <div>Trong tủ đầu giường phòng</div>
                                                <div class="subtitle font-10">In the hospital safety box</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px auto 1fr;">
                                        <div>-</div>
                                        <div>
                                            <div>Khác (ghi rõ):&nbsp;</div>
                                            <div class="subtitle font-10">Other (specify)</div>
                                        </div>
                                        <asp:Label runat="server" ID="Label78"/>
                                    </div>

                                    <div>&nbsp;</div>

                                    <div class="d-grid font-11" style="grid-template-columns: 20px 1fr;">
                                        <div></div>
                                        <div>
                                            <div>Tôi hiểu rõ rằng nếu Tôi và người bệnh/ thân nhân muốn giữ bên mình bất cứ đồ vật nào có giá trị hoặc tiền mặt trong thời gian nằm viện, Tôi sẽ không quy bất cứ trách nhiệm nào liên quan đến việc mất mát hoặc hư tổn nào cho những vật có giá trị/tiền mặt này cho Bệnh viện quốc tế Mỹ.</div>
                                            <div class="subtitle font-10">I clearly understand that if I and the patient/ families desire to keep any valuables or cash during hospitalization, I shall not impute the responsibility to AIH in the event of loss or damage of valuables/ cash.</div>
                                        </div>
                                    </div>
                                    <div>&nbsp;</div>
                                    <div class="d-grid font-weight-bold font-12" style="grid-template-columns: 1fr 1fr;">
                                        <div></div>
                                        <div class="text-center">
                                            <div>Họ tên, chữ ký người bệnh/người giám hộ</div>
                                            <div class="subtitle font-11">Patient/ Legal guardian’s full name and signature</div>
                                        </div>
                                    </div>
                                    
                                    <div style="display: none">
                                    <div class="d-grid" style="grid-template-columns: 150px 1fr 1fr 250px;">
                                        <div>
                                            Người xác nhận:<br />
                                            <span class="en">Acknowledged by</span>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                Tên:<br />
                                                <span class="en">Name</span>
                                            </div>
                                            <asp:Label runat="server" ID="Label89"/>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                Ký tên:<br />
                                                <span class="en">Signature</span>
                                            </div>
                                            <asp:Label runat="server" ID="Label90"/>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto auto auto auto">
                                            <div>
                                                Ngày:<br />
                                                <span class="en">Date</span>
                                            </div>
                                            <asp:Label runat="server" Text="___/__/20__;" ID="Label91"/>
                                            <div>
                                                Giờ:<br />
                                                <span class="en">Time</span>
                                            </div>
                                            <asp:Label runat="server" Text="___:___" ID="Label92"/>
                                        </div>
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: 150px 1fr 1fr 250px;">
                                        <div>
                                            Người làm chứng:<br />
                                            <span class="en">Witnessed by</span>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                Tên:<br />
                                                <span class="en">Name</span>
                                            </div>
                                            <asp:Label runat="server" ID="Label84"/>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                Ký tên:<br />
                                                <span class="en">Signature</span>
                                            </div>
                                            <asp:Label runat="server" ID="Label85"/>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: auto auto auto auto">
                                            <div>
                                                Ngày:<br />
                                                <span class="en">Date</span>
                                            </div>
                                            <asp:Label runat="server" Text="___/__/20__;" ID="Label86"/>
                                            <div>
                                                Giờ:<br />
                                                <span class="en">Time</span>
                                            </div>
                                            <asp:Label runat="server" Text="___:___" ID="Label87"/>
                                        </div>
                                    </div>
                                    
                                    <div><b>E. KẾ HOẠCH XUẤT VIỆN - ĐÁNH GIÁ LẠI / <span class="en">DISCHARGE PLANNING - REASSESSMENT</span></b></div>
                                    
                                    <div></div>

                                    <div><b>F. QUẢN LÝ XUẤT VIỆN (HOÀN THÀNH SỚM NHẤT CÓ THỂ TRONG GNÀY NHẬP VIỆN) <br />
                                        <span class="en" style="margin-left: 15px">DISCHARGE MANAGEMENT (TO BE DONE AS EARLY AT THE DAY OF ADMISSION)</span></b>
                                    </div>

                                    <div><asp:Label runat="server" ID="prt_dis_management"/></div>

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

                <div class="cssclsNoPrint">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="RedirectToPatientSummary" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Inpatient Initial Nursing Assessment</li>
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

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                            ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>
                        <%-- Patient Info --%>
                        <webUI:PatientInfo runat="server" ID="uc_patientInfo"></webUI:PatientInfo>
                        <div class="row visible-print" >
                            <div class="col-lg-12">
                                <div class="card mt-2">
                                    <div class="card-header">
                                        <h4 class="text-primary">INPATIENT INITIAL NURSING ASSESSMENT</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="LastestVersion">
                                                        <span class="mr-2"><i class="fa fa-exclamation-triangle" style="font-size:24px"></i></span>
                                                        <span class="mr-2">You are viewing an old version of this document</span>
                                                        <asp:LinkButton OnClick="GoToLastestVersion" ID="hlkLastestVersion" Text="[View latest version]" runat="server"></asp:LinkButton>
                                                    </div>
                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <span class="mr-2"><i style="font-size: 24px;" class="fa fa-exclamation-circle"></i></span>
                                                        <asp:Label runat="server" ID="lblLogHistory" CssClass="mr-1"></asp:Label>
                                                        <asp:UpdatePanel runat="server" ID="uplViewHistory">
                                                            <ContentTemplate>
                                                                <asp:LinkButton runat="server" ID="lbtnViewHistory" OnClick="ViewHistory" Text="[View History]"></asp:LinkButton>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-1">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Ngày vào khoa/ <span class="text-primary">Date of arrival:</span></label>
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_arrival_date_time" Width="200px" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Thời gian bắt đầu đánh giá/ <span class="text-primary">Time of assessment:</span></label>
                                                    <asp:Label runat="server" ID="lbl_assess_date_time"></asp:Label>
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_assess_date_time" Width="200px" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                                </div>
                                            </div>

                                             <div class="row">
                                                <div class="col-md-12">
                                                    <p>
                                                        Phiếu đánh giá phải được hoàn tất trong vòng 24 giờ sau khi người bệnh nhập viện, đánh dấu √ vào những ô thích hợp. <br />
                                                        <span class="text-primary">This form has to be completed within 24 hours of admission, tick √ on the appropriate boxes.</span>
                                                    </p>
                                                </div>
                                            </div>


                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">I. THÔNG TIN TỔNG QUÁT VỀ NGƯỜI BỆNH/ <span class="text-primary">GENERAL PATIENT INFORMATION</span></label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Quốc gia cư trú/ <span class="text-primary">Country of residence:</span></label>
                                                    <asp:Label runat="server" ID="lbl_residence_desc"></asp:Label>
                                                    <div runat="server" id="residence_desc_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_residence_code_vnm" name="rad_residence_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_residence_code_vnm">Việt Nam</label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="residence_other_field" type="radio" runat="server" id="rad_residence_code_oth" name="rad_residence_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_residence_code_oth">Khác</label>
                                                            <a href="javascript:void(0)" data-clear="rad_residence_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare2" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group d-inline-block w-n residence_other_field">
                                                            <webUI:TextField runat="server" ID="txt_residence_other" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Ngôn ngữ/ <span class="text-primary">Language:</span></label>
                                                    <asp:Label runat="server" ID="lbl_language_desc"></asp:Label>
                                                    <div runat="server" id="language_desc_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_language_code_vi" name="rad_language_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_language_code_vi">Tiếng Việt</label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_language_code_en" name="rad_language_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_language_code_en">Tiếng Anh</label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="language_other_field" type="radio" runat="server" id="rad_language_code_oth" name="rad_language_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_language_code_oth">Tiếng khác, ghi rõ:</label>
                                                            <a href="javascript:void(0)" data-clear="rad_language_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare4" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group language_other_field w-n d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_language_other" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Cần phiên dịch/ <span class="text-primary">Requires Interpreter:</span></label>
                                                    <asp:Label runat="server" ID="lbl_req_interpreter"></asp:Label>
                                                    <div runat="server" id="req_interpreter_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_req_interpreter_true" name="rad_req_interpreter" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_interpreter_true">Có/ <span class="text-primary">Yes</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_req_interpreter_false" name="rad_req_interpreter" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_interpreter_false">Không/ <span class="text-primary">No</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_req_interpreter" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare5" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Tôn giáo/ <span class="text-primary">Religion:</span></label>
                                                    <asp:Label runat="server" ID="lbl_religion_code"></asp:Label>
                                                    <div runat="server" id="religion_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_religion_code_bh" name="rad_religion_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_religion_code_bh">Phật giáo/ <span class="text-primary">Buddhism</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_religion_code_ch" name="rad_religion_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_religion_code_ch">Thiên chúa giáo/ <span class="text-primary">Catholic</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="religion_other_field" type="radio" runat="server" id="rad_religion_code_oth" name="rad_religion_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_religion_code_oth">Khác</label>
                                                            <a href="javascript:void(0)" data-clear="rad_religion_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare6" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group religion_other_field w-n d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_religion_other" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Nhu cầu tín ngưỡng/ <span class="text-primary">Spiritual counselling:</span></label>
                                                    <asp:Label runat="server" ID="lbl_spiritual_couns"></asp:Label>
                                                    <div runat="server" id="spiritual_couns_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_spiritual_couns_true" name="rad_spiritual_couns" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_spiritual_couns_true">Có/ <span class="text-primary">Yes</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_spiritual_couns_false" name="rad_spiritual_couns" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_spiritual_couns_false">Không/ <span class="text-primary">No</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_spiritual_couns" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare7" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-inline-block">Nghề nghiệp/ <span class="text-primary">Occupation:</span></label>
                                                    <asp:Label runat="server" ID="lbl_occupation"></asp:Label>
                                                    <div class="form-group d-inline-block" runat="server" id="occupation_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_occupation" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Hoàn cảnh sống/ <span class="text-primary">Living Status:</span></label>
                                                    <asp:Label runat="server" ID="lbl_living_status_desc"></asp:Label>
                                                    <div runat="server" id="living_status_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_living_status_code_aln" name="rad_living_status_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_living_status_code_aln">Một mình/ <span class="text-primary">Alone</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_living_status_code_wth" name="rad_living_status_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_living_status_code_wth">Với vợ, chồng, con, anh, chị, em ruột/ <span class="text-primary">With spouse, children, sibling</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="living_status_note_field" type="radio" runat="server" id="rad_living_status_code_oth" name="rad_living_status_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_living_status_code_oth">Khác</label>
                                                            <a href="javascript:void(0)" data-clear="rad_living_status_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare8" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group living_status_note_field">
                                                            <webUI:TextField runat="server" ID="txt_living_status_note" />
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Mối quan tâm khi nằm viện/ <span class="text-primary">Concerns related to hospitalization:</span></label>
                                                    <asp:Label runat="server" ID="lbl_hospital_concern_desc"></asp:Label>
                                                    <div runat="server" id="hospital_concern_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hospital_concern_code_non" name="rad_hospital_concern_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hospital_concern_code_non">Không/ <span class="text-primary">None</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hospital_concern_code_rel" name="rad_hospital_concern_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hospital_concern_code_rel">Gia đình, các mối quan hệ/ <span class="text-primary">Family, relationship issues</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hospital_concern_code_fin" name="rad_hospital_concern_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hospital_concern_code_fin">Tài chính/ <span class="text-primary">Financial</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hospital_concern_code_wor" name="rad_hospital_concern_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hospital_concern_code_wor">Lo âu/ <span class="text-primary">Worriedness</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="hospital_concern_other_field" type="radio" runat="server" id="rad_hospital_concern_code_oth" name="rad_hospital_concern_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hospital_concern_code_oth">Khác/ <span class="text-primary">Others</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_hospital_concern_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare13" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group hospital_concern_other_field">
                                                            <webUI:TextField runat="server" ID="txt_hospital_concern_other" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 d-inline-block">Tên người liên lạc/ <span class="text-primary">Contact person’s name:</span></label>
                                                    <asp:Label runat="server" ID="lbl_contact_name"></asp:Label>
                                                    <div class="form-group" runat="server" id="contact_name_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_contact_name" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 d-inline-block mr-2">Quan hệ/ <span class="text-primary">Relationship:</span></label>
                                                    <asp:Label runat="server" ID="lbl_contact_relationship"></asp:Label>
                                                    <div class="form-group" runat="server" id="contact_relationship_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_contact_relationship" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 d-inline-block">Người đi cùng/ <span class="text-primary">Accompanied by:</span></label>
                                                    <asp:Label runat="server" ID="lbl_accompanied"></asp:Label>
                                                    <div class="form-group" runat="server" id="accompanied_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_accompanied" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 d-inline-block mr-2">Quan hệ/ <span class="text-primary">Relationship:</span></label>
                                                    <asp:Label runat="server" ID="lbl_relationship"></asp:Label>
                                                    <div class="form-group" runat="server" id="relationship_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_relationship" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">II. BỆNH SỬ/ <span class="text-primary">MEDICAL HISTORY</span></label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Bệnh nhân nhập viện từ/ <span class="text-primary">Patient admitted from:</span></label>
                                                    <asp:Label runat="server" ID="lbl_admit_from_desc"></asp:Label>
                                                    <div runat="server" id="admit_from_desc_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_admit_from_code_opd" name="rad_admit_from_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_admit_from_code_opd">Khoa khám bệnh/ <span class="text-primary">OPD</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_admit_from_code_er" name="rad_admit_from_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_admit_from_code_er">Khoa cấp cứu/ <span class="text-primary">ER</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_admit_from_code_vd" name="rad_admit_from_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_admit_from_code_vd">Bác sĩ hợp tác/ <span class="text-primary">Visiting Doctor</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_admit_from_code_oth" disabled-for="admit_from_other_field" name="rad_admit_from_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_admit_from_code_oth">Khác/ <span class="text-primary">Referral</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_admit_from_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare9" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group admit_from_other_field w-n d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_admit_from_other" />
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-1">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Tình trạng khi đến/ <span class="text-primary">Admission condition</span></label>
                                                    <asp:Label runat="server" ID="lbl_arrived"></asp:Label>
                                                    <div runat="server" id="arrived_wrapper">
                                                        <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Always">
                                                            <ContentTemplate>
                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_w" />
                                                                    <span class="custom-control-label">Tự đi được/ <span class="text-primary">Walking</span></span>
                                                                </label>

                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_s" />
                                                                    <span class="custom-control-label">Bằng băng ca/ <span class="text-primary">Stretcher</span></span>
                                                                </label>

                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_wc" />
                                                                    <span class="custom-control-label">Bằng xe lăn/ <span class="text-primary">Wheelchair</span></span>
                                                                </label>

                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input onchange="__doPostBack('arrived_o_change','')" type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_o" />
                                                                    <span class="custom-control-label">Khác/ <span class="text-primary">Other</span></span>
                                                                </label>

                                                                <div>
                                                                    <webUI:TextField runat="server" ID="txt_arrived_other" />
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label">Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                    <asp:Label runat="server" ID="lbl_admission_reason"></asp:Label>
                                                    <div class="form-group" runat="server" id="admission_reason_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_admission_reason" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label">Lần nhập viện trước tại bệnh viện Quốc tế Mỹ/ <span class="text-primary">Previous admission at AIH</span></label>
                                                    <asp:Label CssClass="ml-2" runat="server" ID="lbl_previous_admission"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Tiền sử bệnh/ <span class="text-primary">Past medical history:</span></label>
                                                    <asp:Label runat="server" ID="lbl_past_med_history"></asp:Label>
                                                    <div runat="server" id="past_med_history_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_past_med_history_false" name="rad_past_med_history" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_past_med_history_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_past_med_history_true" disabled-for="past_med_history_note_field" name="rad_past_med_history" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_past_med_history_true">Có/ <span class="text-primary">Yes</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_past_med_history" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare10" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator11" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="past_med_history_ServerValidate"></asp:CustomValidator>--%>
                                                        <div class="form-group past_med_history_note_field d-inline-block w-n">
                                                            <webUI:TextField runat="server" ID="txt_past_med_history_note" />
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Tiền sử phẫu thuật/ <span class="text-primary">Past Surgical History:</span></label>
                                                    <asp:Label runat="server" ID="lbl_past_sur_history"></asp:Label>
                                                    <div runat="server" id="past_sur_history_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_past_sur_history_false" name="rad_past_sur_history" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_past_sur_history_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_past_sur_history_true" disabled-for="past_sur_history_note_field" name="rad_past_sur_history" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_past_sur_history_true">Có/ <span class="text-primary">Yes</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_past_sur_history" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare11" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator10" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="past_sur_history_ServerValidate"></asp:CustomValidator>--%>
                                                        <div class="form-group past_sur_history_note_field d-inline-block w-n">
                                                            <webUI:TextField runat="server" ID="txt_past_sur_history_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Lạm dụng chất kích thích/ <span class="text-primary">Substance abuse</span></label>
                                                    <asp:Label runat="server" ID="lbl_substance_abuse"></asp:Label>
                                                    <div runat="server" id="substance_abuse_wrapper">
                                                        <asp:UpdatePanel ID="updatePanel11" runat="server" UpdateMode="Always">
                                                            <ContentTemplate>
                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_substance_abuse_s" />
                                                                    <span class="custom-control-label">Hút thuốc/ <span class="text-primary">Smoking</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_substance_abuse_a" />
                                                                    <span class="custom-control-label">Rượu bia/ <span class="text-primary">Acohol</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input onchange="__doPostBack('substance_abuse_other_change','')" type="checkbox" class="custom-control-input" runat="server" id="cb_substance_abuse_oth" />
                                                                    <span class="custom-control-label">Khác/ <span class="text-primary">Other</span></span>
                                                                </label>
                                                                <div class="form-group d-inline-block w-n mb-2" runat="server" id="substance_abuse_other_wrapper">
                                                                    <webUI:TextField runat="server" ID="txt_substance_abuse_other" />
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Hồ sơ bệnh án kèm theo/ <span class="text-primary">Previous test results/documents:</span></label>
                                                    <asp:Label runat="server" ID="lbl_previous_document"></asp:Label>
                                                    <div runat="server" id="previous_document_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_previous_document_false" name="rad_previous_document" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_previous_document_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_previous_document_true" disabled-for="previous_document_note_field" name="rad_previous_document" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_previous_document_true">Yes/ <span class="text-primary">Có</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_previous_document" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare14" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator12" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="previous_document_ServerValidate"></asp:CustomValidator>--%>
                                                        <div class="form-group previous_document_note_field">
                                                            <webUI:TextField runat="server" ID="txt_previous_document_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Thuốc hiện đang dùng tại nhà/ <span class="text-primary">Current home medication:</span></label>
                                                    <asp:Label runat="server" ID="lbl_cur_home_medication"></asp:Label>
                                                    <div runat="server" id="cur_home_medication_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_cur_home_medication_false" name="rad_cur_home_medication" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_cur_home_medication_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_cur_home_medication_true" name="rad_cur_home_medication" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_cur_home_medication_true">Có/ Yes (Tham khảo đơn thuốc đính kèm)/ <span class="text-primary">If, yes please refer to the prescription attached</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_cur_home_medication" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare15" />
                                                            </a>
                                                            <%--<asp:CustomValidator ID="CustomValidator5" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="cur_home_medication_ServerValidate"></asp:CustomValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Dị ứng/ Phản ứng / <span class="text-primary">Allergy/ Reaction:</span></label>
                                                    <asp:Label runat="server" ID="lbl_allergy"></asp:Label>
                                                    <div runat="server" id="allergy_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_allergy_true" disabled-for="allergy_note_field" name="rad_allergy" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_allergy_true">Có (ghi rõ)/ <span class="text-primary">Yes (specify)</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare16" />
                                                            </a>
                                                            <%--<asp:CustomValidator ID="CustomValidator3" CssClass="text-danger" ValidationGroup="Group1"
                                                                OnServerValidate="allergy_ServerValidate"
                                                                Display="Dynamic"
                                                                ErrorMessage="Dị ứng/ Allergy is required"
                                                                runat="server" />
                                                        </div>--%>

                                                            <div class="form-group allergy_note_field w-n d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <asp:UpdatePanel ID="updatePanel12" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <div class="col-md-12 gt-2-a">
                                                            <label class="control-label mb-2">Nhóm người bệnh đặc biệt/ <span class="text-primary">Special patient group</span></label>
                                                            <asp:Label runat="server" ID="lbl_is_high_risk_patient"></asp:Label>
                                                            <div runat="server" id="is_high_risk_patient_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input onchange="__doPostBack('is_high_risk_patient_change','')" type="radio" runat="server" id="rad_is_high_risk_patient_false" name="rad_is_high_risk_patient" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_is_high_risk_patient_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input onchange="__doPostBack('is_high_risk_patient_change','')" type="radio" runat="server" id="rad_is_high_risk_patient_true" name="rad_is_high_risk_patient" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_is_high_risk_patient_true">Có, cụ thể/ <span class="text-primary">Yes, specify</span></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 gt-2-a" runat="server" id="is_high_risk_patient_true_wrapper">
                                                            <div></div>
                                                            <asp:Label runat="server" ID="lbl_high_risk_patient"></asp:Label>
                                                            <div runat="server" id="high_risk_patient_wrapper">
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_hrt" />
                                                                    <span class="custom-control-label">Người bệnh đang điều trị hóa trị liệu/ <span class="text-primary">Patients are receiving chemotherapy</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_eld" />
                                                                    <span class="custom-control-label">Người cao tuổi (≥ 80 tuổi)/ <span class="text-primary">Elderlies (≥ 80 years)</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_wil" />
                                                                    <span class="custom-control-label">Sản phụ đang chuyển dạ/ <span class="text-primary">Women in labor</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_ros" />
                                                                    <span class="custom-control-label">Người bệnh có nguy cơ tự tử hoặc tự làm hại bản thân/ <span class="text-primary">Patients are at risk of suicide or seft-harm</span></span>
                                                                </label>
                                                                <%--<label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_ch" />
                                                                    <span class="custom-control-label">Trẻ em (< hoặc 8 tuổi)/ <span class="text-primary">Children (<8 years old)</span></span>
                                                                </label>--%>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_sdp" />
                                                                    <span class="custom-control-label">Người bệnh tàn tật nặng/ <span class="text-primary">Severe disabled patients</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_ccp" />
                                                                    <span class="custom-control-label">Người bệnh lú lẫn/hôn mê/ <span class="text-primary">Confused or comatose patients</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_psp" />
                                                                    <span class="custom-control-label">Sản phụ có thai lưu/ sảy thai/ chấm dứt thai kỳ/ <span class="text-primary">Patient with stillbirth pregnancy/ abortion/ experiencing terminations in pregnancy</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_res" />
                                                                    <span class="custom-control-label">Người bệnh bị kìm giữ/ <span class="text-primary">Restrained patients</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_hrf" />
                                                                    <span class="custom-control-label">Người bệnh có tiền sử té ngã/ <span class="text-primary">Patient has a history of falls</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_isc" />
                                                                    <span class="custom-control-label">Người bệnh suy giảm miễn dịch/ <span class="text-primary">Patients whose immune systems are compromised</span></span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <h4>III. ĐÁNH GIÁ CỦA ĐIỀU DƯỠNG/ <span class="text-primary">NURSING ASSESSMENT</span></h4>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">1. Dấu hiệu sinh tồn và các chỉ số đo lường/ <span class="text-primary">vital signs and standard measurements</span></label>
                                                </legend>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_temperature"></asp:Label>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="vs_temperature_wrapper">
                                                        <input tabindex="1" data-type="number" runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Nhịp tim/ <span class="text-primary">Heart rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_heart_rate"></asp:Label>
                                                    <div class="form-group w-5 d-inline-block" runat="server" id="vs_heart_rate_wrapper">
                                                        <input tabindex="5" data-type="number" runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Cân nặng/ <span class="text-primary">Weight:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_weight"></asp:Label>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="vs_weight_wrapper">
                                                        <input tabindex="2" data-type="number" onchange="CalculateBmi()" runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                        <span class="append">kg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Nhịp thở/ <span class="text-primary">Respiration rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_respiratory_rate"></asp:Label>
                                                    <div class="form-group w-5 d-inline-block" runat="server" id="vs_respiratory_rate_wrapper">
                                                        <input tabindex="6" data-type="number" runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                        <span class="append">lần/phút (bpm)</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_height"></asp:Label>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="vs_height_wrapper">
                                                        <input tabindex="3" data-type="number" onchange="CalculateBmi()" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">HA/ <span class="text-primary">Blood pressure:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_blood_pressure"></asp:Label>
                                                    <div class="form-group w-5 d-inline-block" runat="server" id="vs_blood_pressure_wrapper">
                                                        <input tabindex="7" data-type="number1" id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label for="bmi" class="control-label mb-1 mr-2">Chỉ số BMI/ <span class="text-primary">BMI</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_BMI"></asp:Label>
                                                    <div class="form-group w-5 mb-1 d-inline-block" runat="server" id="vs_BMI_wrapper">
                                                        <input runat="server" id="txt_vs_bmi" class="form-control text-right" disabled="disabled" />
                                                        <span class="append">(Kg/m<sup>2</sup>)</span>
                                                    </div>
                                                    <asp:Label runat="server" ID="bmiStr"></asp:Label>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label for="spO2" class="control-label mb-1 mr-2"><span class="text-primary">SpO<sub>2</sub>:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_spO2"></asp:Label>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="vs_spO2_wrapper">
                                                        <input tabindex="8" data-type="number" runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>
                                                <%--<div class="col-md-12 mb-2">
                                                    <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_pulse"></asp:Label>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="vs_pulse_wrapper">
                                                        <input tabindex="4" data-type="number" runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>--%>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Hệ hô hấp/ <span class="text-primary">Respiratory system</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_respiratory_system"></asp:Label>

                                                        <div runat="server" id="respiratory_system_wrapper">
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_n" />
                                                                <span class="custom-control-label">Không có vấn đề/ <span class="text-primary">Normal</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_d" />
                                                                <span class="custom-control-label">Khó thở/ <span class="text-primary">Dyspnea</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_o" />
                                                                <span class="custom-control-label">Khó thở nằm/ <span class="text-primary">Orthopnea</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_w" />
                                                                <span class="custom-control-label">Khó thở khò khè/ <span class="text-primary">Wheeze</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_c" />
                                                                <span class="custom-control-label">Da xanh tái/ <span class="text-primary">Cyanosis</span></span>
                                                            </label>
                                                        </div>

                                                        <div>
                                                            <label class="control-label mb-2">Ho/ <span class="text-primary">Cough:</span></label>
                                                            <asp:Label runat="server" ID="lbl_cough"></asp:Label>

                                                            <div runat="server" class="d-inline-block" id="cough_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_cough_false" name="rad_cough" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_cough_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_cough_true" name="rad_cough" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_cough_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_cough" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare12" />
                                                                    </a>
                                                                    <%--<asp:CustomValidator ID="CustomValidator4" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="rad_cough_ServerValidate"></asp:CustomValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_pro_cough"></asp:Label>
                                                            <div runat="server" id="pro_cough_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_pro_cough_false" name="rad_pro_cough" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_pro_cough_false">Không có đờm/ <span class="text-primary">Without phlegm</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_pro_cough_true" name="rad_pro_cough" class="custom-control-input" disabled-for="pro_cough_note_field" />
                                                                    <label class="custom-control-label" for="rad_pro_cough_true">Có đờm (ghi rõ màu/ tính chất/ số lượng)/ <span class="text-primary">With phlegm (specify the colour/ nature/amount)</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_pro_cough" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare17" />
                                                                    </a>
                                                                </div>

                                                                <%--<asp:CustomValidator ID="CustomValidator13" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="pro_cough_ServerValidate"></asp:CustomValidator>--%>

                                                                <div class="form-group pro_cough_note_field d-inline-block">
                                                                    <webUI:TextField runat="server" ID="txt_pro_cough_note" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">3. Hệ tim mạch/ <span class="text-primary">Cardiovascular system</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Mạch/ <span class="text-primary">Pulse:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pulse_desc"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="pulse_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_pulse_code_r" name="rad_pulse_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_pulse_code_r">Đều/ <span class="text-primary">Regular</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_pulse_code_i" name="rad_pulse_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_pulse_code_i">Không đều/ <span class="text-primary">Irregular</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_pulse_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare18" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Tình trạng/ <span class="text-primary">Condition</span></label>

                                                    <asp:Label runat="server" ID="lbl_presence"></asp:Label>
                                                    <div runat="server" id="presence_wrapper" class="d-inline-block">
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_cp" />
                                                            <span class="custom-control-label">Đau ngực/ <span class="text-primary">Chest pain</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_di" />
                                                            <span class="custom-control-label">Chóng mặt/ <span class="text-primary">Dizziness</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_ca" />
                                                            <span class="custom-control-label">Đau bắp chân/ <span class="text-primary">Calf pain</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_pe" />
                                                            <span class="custom-control-label">Phù ngoại biên/  <span class="text-primary">Peripheral edema</span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a  mb-2">
                                                    <label class="control-label mb-2 d-block">Tứ chi/ <span class="text-primary">Extremities</span></label>
                                                    <asp:Label runat="server" ID="lbl_extremities"></asp:Label>
                                                    <div runat="server" id="extremities_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_wa" />
                                                            <span class="custom-control-label">Ấm/ <span class="text-primary">Warm</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_co" />
                                                            <span class="custom-control-label">Lạnh/ <span class="text-primary">Cold</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_cl" />
                                                            <span class="custom-control-label">Ẩm ướt/ <span class="text-primary">Clammy</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_cy" />
                                                            <span class="custom-control-label">Xanh tái/ <span class="text-primary">Cyanosis</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input onchange="_doPostBack('extremities_ot_change','')" type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_ot" />
                                                            <span class="custom-control-label">Khác, ghi rõ/ <span class="text-primary">Other, specify</span></span>
                                                        </label>
                                                        <webUI:TextField runat="server" ID="txt_extremities_specify" />
                                                        
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">4. Hệ thần kinh cảm giác/ <span class="text-primary">Neurosensory system</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Định hướng được/ <span class="text-primary">Oriented</span></label>
                                                    <asp:Label runat="server" ID="lbl_oriented"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="oriented_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_pla" />
                                                            <span class="custom-control-label">Nơi/ <span class="text-primary">Place</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_day" />
                                                            <span class="custom-control-label">Ngày/ <span class="text-primary">Day</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_time" />
                                                            <span class="custom-control-label">Thời gian/ <span class="text-primary">Time</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_per" />
                                                            <span class="custom-control-label">Người/ <span class="text-primary">Person</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_na" />
                                                            <span class="custom-control-label">Không định hướng được/ <span class="text-primary">Disoriented</span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Tình trạng tinh thần/ <span class="text-primary">Mental status</span></label>
                                                    <asp:Label runat="server" ID="lbl_mental_status"></asp:Label>
                                                    <div runat="server" id="mental_status_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_al" />
                                                            <span class="custom-control-label">Tỉnh táo/ <span class="text-primary">Alert</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_cf" />
                                                            <span class="custom-control-label">Nhầm lẫn/ <span class="text-primary">Confused</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_ag" />
                                                            <span class="custom-control-label">Kích động/ <span class="text-primary">Agitated</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_an" />
                                                            <span class="custom-control-label">Lo âu/ <span class="text-primary">Anxious</span></span>
                                                        </label>
                                                        <%--<label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_fr" />
                                                            <span class="custom-control-label">Quấy/ <span class="text-primary">Fretful</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_le" />
                                                            <span class="custom-control-label">Lơ mơ/ <span class="text-primary">Lethargic</span></span>
                                                        </label>--%>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_de" />
                                                            <span class="custom-control-label">Trầm cảm/ <span class="text-primary">Depressed</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_mental_status_oth" />
                                                            <span class="custom-control-label">Khác/ <span class="text-primary">Other</span></span>
                                                        </label>

                                                        <div class="form-group mental_status_other_field">
                                                            <webUI:TextField runat="server" ID="txt_mental_status_other" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Thính giác/ <span class="text-primary">Hearing:</span></label>
                                                    <asp:Label runat="server" ID="lbl_hearing_code"></asp:Label>
                                                    <div runat="server" id="hearing_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hearing_code_n" name="rad_hearing_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hearing_code_n">Bình thường/ <span class="text-primary">Normal</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hearing_code_hi" name="rad_hearing_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hearing_code_hi">Khiếm thính/ <span class="text-primary">Hearing impaired</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hearing_code_ha" name="rad_hearing_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hearing_code_ha">Dùng máy trợ thính (Trái/Phải)/ <span class="text-primary">Use hearing aids (Left/Right)</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_hearing_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare20" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Thị giác/ <span class="text-primary">Vision:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vision_code"></asp:Label>
                                                    <div runat="server" id="vision_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_vision_code_nm" name="rad_vision_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_vision_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_vision_code_gl" name="rad_vision_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_vision_code_gl">Đeo kính/ <span class="text-primary">Glasses</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_vision_code_cl" name="rad_vision_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_vision_code_cl">Kính sát tròng/ <span class="text-primary">Contact lenses</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" disabled-for="vision_other_field" runat="server" id="rad_vision_code_oth" name="rad_vision_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_vision_code_oth">Khác, ghi rõ/ <span class="text-primary">Other, specify</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_vision_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare21" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group vision_other_field">
                                                            <webUI:TextField runat="server" ID="txt_vision_other" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2 d-block">Khả năng ngôn ngữ/ <span class="text-primary">Speech:</span></label>
                                                    <asp:Label runat="server" ID="lbl_speech_code"></asp:Label>
                                                    <div runat="server" id="speech_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_nm" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_sl" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_sl">Nói lắp/ <span class="text-primary">Slurred</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_ap" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_ap">Chứng mất ngôn ngữ/ <span class="text-primary">Aphasic</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_si" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_si">Khiếm ngôn/ <span class="text-primary">Speech impaired</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_nv" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_nv">Chưa biết nói/ <span class="text-primary">Speechless</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_nc" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_nc">Không giao tiếp (Bất tỉnh, mê)/ <span class="text-primary">Non-communicative (Unconscious)</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_speech_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare19" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">5. Hệ tiêu hóa/ <span class="text-primary">Gastrointestinal system</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">Chế độ ăn uống/ <span class="text-primary">Diet</span></label>
                                                    <asp:Label runat="server" ID="lbl_diet_desc"></asp:Label>
                                                    <div runat="server" id="diet_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_diet_code_nm" name="rad_diet_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_diet_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_diet_code_bf" name="rad_diet_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_diet_code_bf">Bú bình/ <span class="text-primary">Bottle feeding</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_diet_code_tbf" name="rad_diet_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_diet_code_tbf">Đang cho con bú/ <span class="text-primary">Breast-feeding</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" disabled-for="diet_other_field" runat="server" id="rad_diet_code_oth" name="rad_diet_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_diet_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_diet_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare22" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group diet_other_field mt-1 mb-1">
                                                            <webUI:TextField runat="server" ID="txt_diet_other" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label d-block">Tình trạng hiện có/ <span class="text-primary">Current condition</span></label>
                                                    <div>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_diet_pre_desc"></asp:Label>
                                                        </div>
                                                        <div class="mb-2" runat="server" id="diet_pre_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_diet_pre_code_v" name="rad_diet_pre_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_diet_pre_code_v">Nôn/ <span class="text-primary">Vomiting</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_diet_pre_code_n" name="rad_diet_pre_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_diet_pre_code_n">Buồn nôn/ <span class="text-primary">Nausea</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_diet_pre_code_s" name="rad_diet_pre_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_diet_pre_code_s">Nuốt khó/ <span class="text-primary">Dysphagia</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_diet_pre_code" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare23" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label d-block">Ống thông dạ dày/ <span class="text-primary">Nasogastric tube</span></label>
                                                    <asp:Label runat="server" ID="lbl_ng_tube"></asp:Label>

                                                    <div runat="server" id="ng_tube_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_ng_tube_true" name="rad_ng_tube" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ng_tube_true">Có/ <span class="text-primary">Yes</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_ng_tube_false" name="rad_ng_tube" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ng_tube_false">Không/ <span class="text-primary">No</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_ng_tube" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare24" />
                                                            </a>
                                                        </div>

                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_gastrostomy_true" />
                                                            <span class="custom-control-label">Mở dạ dày/ <span class="text-primary">Gastrostomy</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" disabled-for="size_note_field" class="custom-control-input" runat="server" id="cb_size_true" />
                                                            <span class="custom-control-label">Kích cỡ/ <span class="text-primary">Size</span></span>
                                                        </label>

                                                        <asp:Label runat="server" ID="lbl_size_note"></asp:Label>

                                                        <div runat="server" id="size_note_wrapper" class="form-group w-s size_note_field d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_size_note" />
                                                        </div>

                                                        <label class="control-label">Ngày đặt ống gần nhất/ <span class="text-primary">Last Date Changed</span></label>

                                                        <asp:Label runat="server" ID="lbl_last_date_changed"></asp:Label>

                                                        <div class="d-inline-block" runat="server" id="last_date_changed_wrapper">
                                                            <telerik:RadDatePicker CssClass="ml-2" runat="server" ID="dpk_last_date_changed" Width="120px" />

                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="dpk_last_date_changed" ErrorMessage="field is required"
                                                                ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator9" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="ng_tube_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label d-block">Thức ăn không ưa thích/ <span class="text-primary">Food dislikes</span></label>
                                                    <asp:Label runat="server" ID="lbl_food_dislike"></asp:Label>
                                                    <div>
                                                        <webUI:TextField runat="server" ID="txt_food_dislike" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">Bài tiết/ <span class="text-primary">Bowel elimination</span></label>
                                                    <asp:Label runat="server" ID="lbl_bowel_elimination_desc"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="bowel_elimination_code_wrapper">
                                                        <asp:UpdatePanel ID="updatePanel13" runat="server" UpdateMode="Always">
                                                            <ContentTemplate>
                                                                <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                    <input onchange="__doPostBack('bowel_elimination_change','')" type="radio" runat="server" id="rad_bowel_elimination_code_two" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_bowel_elimination_code_two">2 lần/ ngày <span class="text-primary">(2 times/day)</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                    <input onchange="__doPostBack('bowel_elimination_change','')" type="radio" runat="server" id="rad_bowel_elimination_code_one" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_bowel_elimination_code_one">1 lần/ ngày <span class="text-primary">(1 times/day)</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                    <input onchange="__doPostBack('bowel_elimination_change','')" type="radio" runat="server" id="rad_bowel_elimination_code_eod" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_bowel_elimination_code_eod">Cách ngày/ <span class="text-primary">Every other day</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                    <input onchange="__doPostBack('bowel_elimination_change','')" type="radio" runat="server" id="rad_bowel_elimination_code_oth" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_bowel_elimination_code_oth">Khác, ghi rõ/ <span class="text-primary">Other, specify</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_bowel_elimination_code" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare27" />
                                                                    </a>
                                                                </div>

                                                                <webUI:TextField runat="server" ID="txt_bowel_elimination_specify" />
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">Tính chất phân/ <span class="text-primary">Consistency of stool</span></label>
                                                    <asp:Label runat="server" ID="lbl_stool_consistency_desc"></asp:Label>

                                                    <div class="d-inline-block" runat="server" id="stool_consistency_code_wrapper">
                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_stool_consistency_code_h" name="rad_stool_consistency_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stool_consistency_code_h">Cứng/ <span class="text-primary">Hard</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_stool_consistency_code_f" name="rad_stool_consistency_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stool_consistency_code_f">Có hình dạng/ <span class="text-primary">Formed</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_stool_consistency_code_l" name="rad_stool_consistency_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stool_consistency_code_l">Lỏng/ <span class="text-primary">Loose</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_stool_consistency_code_w" name="rad_stool_consistency_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stool_consistency_code_w">Phân nước/ <span class="text-primary">Watery</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_stool_consistency_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare25" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">
                                                        Tình trạng hiện có/ <span class="text-primary">Current condition</span>
                                                    </label>
                                                    <asp:Label runat="server" ID="lbl_gas_presence_desc"></asp:Label>
                                                    <div runat="server" id="gas_presence_code_wrapper">
                                                        <asp:UpdatePanel ID="updatePanel14" runat="server" UpdateMode="Always">
                                                            <ContentTemplate>
                                                                <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                    <input onchange="__doPostBack('gas_presence_code_change','')" type="radio" runat="server" id="rad_gas_presence_code_n" name="rad_gas_presence_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_gas_presence_code_n">Bình thường/ <span class="text-primary">Normal</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                    <input onchange="__doPostBack('gas_presence_code_change','')" type="radio" runat="server" id="rad_gas_presence_code_i" name="rad_gas_presence_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_gas_presence_code_i">Không kiểm soát/ <span class="text-primary">Incontinence</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                    <input onchange="__doPostBack('gas_presence_code_change','')" type="radio" runat="server" id="rad_gas_presence_code_s" name="rad_gas_presence_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_gas_presence_code_s">Hậu môn nhân tạo/ <span class="text-primary">Artificial anus</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_gas_presence_code" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare26" />
                                                                    </a>
                                                                </div>
                                                                <webUI:TextField runat="server" ID="txt_gas_presence_note" />
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">6. Hệ tiết niệu sinh dục/ <span class="text-primary">Genitourinary system</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">Tiểu/ <span class="text-primary">Urination</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_urination"></asp:Label>
                                                        <div class="mb-2" runat="server" id="urination_wrapper">
                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_nm" />
                                                                <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                            </label>
                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_no" />
                                                                <span class="custom-control-label">Tiểu đêm/ <span class="text-primary">Nocturia</span></span>
                                                            </label>
                                                            <%--<label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_fr" />
                                                                <span class="custom-control-label">Thường xuyên/ <span class="text-primary">Frequency</span></span>
                                                            </label>--%>
                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_dy" />
                                                                <span class="custom-control-label">Khó tiểu/ <span class="text-primary">Dysuria</span></span>
                                                            </label>
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_in" />
                                                                <span class="custom-control-label">Không kiểm soát/ <span class="text-primary">Incontinece</span></span>
                                                            </label>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_inter_catheter_true" />
                                                                <span class="custom-control-label">Thông tiểu ngắt quãng (lần/ ngày)/ <span class="text-primary">Intermittent catheterization</span></span>
                                                            </label>
                                                            <asp:Label runat="server" ID="lbl_inter_catheter"></asp:Label>
                                                            <div class="form-group w-s d-inline-block" runat="server" id="inter_catheter_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_inter_catheter_note" />
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_ind_catheter_true" />
                                                                <span class="custom-control-label">Ống thông tiểu lưu/ <span class="text-primary">Indwelling catheter</span></span>
                                                            </label>
                                                            <label class="mr-2">Kích cỡ/ <span class="text-primary">Size</span></label>
                                                            <asp:Label runat="server" ID="lbl_ind_catheter_size"></asp:Label>
                                                            <div class="form-group w-s mr-2 d-inline-block" runat="server" id="ind_catheter_size_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_ind_catheter_size" />
                                                            </div>

                                                            <div class="d-inline-block">
                                                                <label class="control-label mr-2">Ngày thay gần nhất/ <span class="text-primary">Fr, Date last changed</span></label>
                                                                <asp:Label runat="server" ID="lbl_ind_catheter_date"></asp:Label>
                                                                <div runat="server" id="ind_catheter_date_wrapper" class="d-inline-block">
                                                                    <telerik:RadDatePicker runat="server" ID="dpk_ind_catheter_date" Width="120px" />
                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="dpk_ind_catheter_date" ErrorMessage="field is required"
                                                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_sup_catheter_true" />
                                                                <span class="custom-control-label">Ống thông bàng quang qua da/ <span class="text-primary">Suprapubic catheter</span></span>
                                                            </label>

                                                            <label class="mr-2">Kích cỡ/ <span class="text-primary">Size</span></label>
                                                            <asp:Label runat="server" ID="lbl_sup_catheter_size"></asp:Label>
                                                            <div class="form-group w-s mr-2 size_note_field d-inline-block" runat="server" id="sup_catheter_size_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_sup_catheter_size" />
                                                            </div>

                                                            <label class="control-label mr-2">Ngày đặt gần nhất/ <span class="text-primary">Fr, Date last changed</span></label>
                                                            <asp:Label runat="server" ID="lbl_last_sup_catheter_date"></asp:Label>
                                                            <div runat="server" id="last_sup_catheter_date_wrapper" class="d-inline-block">
                                                                <telerik:RadDatePicker runat="server" ID="dpk_last_sup_catheter_date" Width="120px" />
                                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="dpk_last_sup_catheter_date" ErrorMessage="field is required"
                                                                    ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12" runat="server" id="female_patient_wrapper">
                                                    <div><label class="control-label d-block">Đối với người bệnh nữ/ <span class="text-primary">For female patients only:</span></label></div>
                                                    <label class="control-label d-block">Kinh nguyệt/ <span class="text-primary">Menstruation:</span></label>
                                                    <asp:Label runat="server" ID="lbl_menstruation_code"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="menstruation_code_wrapper">
                                                        <div class="custom-control custom-radio mr-2 d-inline-block">
                                                            <input disabled-for="final_screening" type="radio" runat="server" id="rad_menstruation_code_am" name="rad_menstruation_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_menstruation_code_am">Vô kinh/ <span class="text-primary">Amenorrhea</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio mr-2 d-inline-block">
                                                            <input disabled-for="final_screening" type="radio" runat="server" id="rad_menstruation_code_me" name="rad_menstruation_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_menstruation_code_me">Mãn kinh/ <span class="text-primary">Menopause</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio mr-2 d-inline-block">
                                                            <input disabled-for="final_screening" type="radio" runat="server" id="rad_menstruation_code_cy" name="rad_menstruation_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_menstruation_code_cy">Chu kỳ (ngày)/ <span class="text-primary">Cycle (day)</span></label>
                                                        </div>
                                                        <div class="form-group mr-2 w-s d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_cycle_day" />
                                                        </div>
                                                        <label class="control-label mr-2">Ngày đầu của kỳ kinh cuối/ <span class="text-primary">Last menstrual period started:</span></label>
                                                        <div class="form-group w-s mr-2 d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_last_mens_period" />
                                                        </div>
                                                    </div>

                                                    <label class="control-label d-block">Có thai/ <span class="text-primary">Pregnancy:</span></label>
                                                    <div><asp:Label runat="server" ID="lbl_not_pregnancy"></asp:Label></div>
                                                    <div runat="server" id="not_pregnancy_wrapper">
                                                        <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_not_pregnancy_true" />
                                                            <span class="custom-control-label">Không/ <span class="text-primary">No</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_pregnancy_true" />
                                                            <span class="custom-control-label">Đã từng mang thai trước đây/ <span class="text-primary">Previous pregnancy</span></span>
                                                        </label>
                                                        <label class="control-label mr-2"><span class="text-primary">PARA</span></label>
                                                        <div class="form-group w-s mr-2 d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_para" />
                                                        </div>
                                                        <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_cur_pregnancy_True" />
                                                            <span class="custom-control-label">Hiện đang mang thai/ <span class="text-primary">Current pregnancy</span></span>
                                                        </label>
                                                        <div class="form-group w-5 d-inline-block">
                                                            <input id="txt_pregnancy_week" runat="server" class="form-control text-right" />
                                                            <span class="append">tuần/ weeks</span>
                                                        </div>
                                                    </div>

                                                    <label class="control-label mb-1 d-block">Ngừa thai/ <span class="text-primary">Contraception</span></label>
                                                    <div><asp:Label runat="server" ID="lbl_contraception_code"></asp:Label></div>
                                                    <div runat="server" id="contraception_code_wrapper">
                                                        <div class="custom-control custom-radio mr-2 d-inline-block">
                                                            <input disabled-for="final_screening" type="radio" runat="server" id="rad_contraception_code_no" name="rad_contraception_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_contraception_code_no">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio mr-2 d-inline-block">
                                                            <input disabled-for="final_screening" type="radio" runat="server" id="rad_contraception_code_pill" name="rad_contraception_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_contraception_code_pill">Thuốc ngừa thai/ <span class="text-primary">Contraceptive pill</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio mr-2 d-inline-block">
                                                            <input disabled-for="final_screening" type="radio" runat="server" id="rad_contraception_code_dev" name="rad_contraception_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_contraception_code_dev">Dụng cụ ngừa thai đặt trong tử cung/ <span class="text-primary">Intrauterine Device</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio mr-2 d-inline-block">
                                                            <input disabled-for="final_screening" type="radio" runat="server" id="rad_contraception_code_oth" name="rad_contraception_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_contraception_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                                        </div>
                                                        <div class="form-group w-5 d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_contraception_other" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">7. Hệ cơ – xương khớp/ <span class="text-primary">Musculoskeletal system</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">Tiền sử/ <span class="text-primary">History</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_mus_history"></asp:Label>
                                                        <div runat="server" id="mus_history_wrapper">
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_nm" />
                                                                <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_jp" />
                                                                <span class="custom-control-label">Đau khớp/ <span class="text-primary">Joint pain</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_js" />
                                                                <span class="custom-control-label">Sưng khớp/ <span class="text-primary">Joint swelling</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_ms" />
                                                                <span class="custom-control-label">Sự co rút cơ/ <span class="text-primary">Muscle spasms</span></span>
                                                            </label>
                                                        </div>

                                                        <div><asp:Label runat="server" ID="lbl_paralysis"></asp:Label></div>
                                                        <div runat="server" class="mb-2" id="paralysis_wrapper">
                                                            <label class="custom-control custom-checkbox d-inline mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_paralysis_true" />
                                                                <span class="custom-control-label">Liệt/ (1/2 người/2 chi/4 chi)/ <span class="text-primary">Paralysis (Hemi/Para/Tetra)</span></span>
                                                            </label>
                                                            <div class="form-group w-s mt-1 d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_paralysis_note" />
                                                            </div>
                                                        </div>

                                                        <div><asp:Label runat="server" ID="lbl_amputation"></asp:Label></div>
                                                        <div runat="server" class="mb-2" id="amputation_wrapper">
                                                            <label class="custom-control custom-checkbox d-inline">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_amputation_true" />
                                                                <span class="custom-control-label">Đoạn chi/ <span class="text-primary">Amputation</span></span>
                                                            </label>
                                                            <div class="form-group w-s d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_amputation_note" />
                                                            </div>
                                                        </div>

                                                        <div><asp:Label runat="server" ID="lbl_contracture"></asp:Label></div>
                                                        <div runat="server" class="mb-2" id="contracture_wrapper">
                                                            <label class="custom-control custom-checkbox mb-1 d-inline mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_contracture_true" />
                                                                <span class="custom-control-label">Cơ bắp co rút/ <span class="text-primary">Muscle spasms</span></span>
                                                            </label>
                                                            <div class="form-group w-s d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_contracture_note" />
                                                            </div>
                                                        </div>

                                                        <div><asp:Label runat="server" ID="lbl_prosthesis"></asp:Label></div>
                                                        <div runat="server" id="prosthesis_wrapper">
                                                            <label class="custom-control custom-checkbox mb-1 d-inline">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_prosthesis_true" />
                                                                <span class="custom-control-label">Lắp bộ phận giả/ <span class="text-primary">Prosthesis</span></span>
                                                            </label>
                                                            <div class="form-group w-s d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_prosthesis_note" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">8. Đánh giá đau/ <span class="text-primary">Pain assessment:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label d-inline-block mr-2">Hiện đang đau/ <span class="text-primary">Currently in pain</span></label>
                                                    <asp:Label runat="server" ID="lbl_cur_in_pain"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="cur_in_pain_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_cur_in_pain_false" runat="server" name="rad_cur_in_pain" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_cur_in_pain_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_cur_in_pain_true" runat="server" name="rad_cur_in_pain" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_cur_in_pain_true">
                                                               Có, báo bác sĩ<span class="text-primary">Yes,inform doctor</span>
                                                            </label>

                                                            <a href="javascript:void(0)" data-clear="rad_cur_in_pain" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare43" />
                                                            </a>
                                                            <%--<asp:CustomValidator ID="CustomValidator6" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="cur_in_pain_ServerValidate"></asp:CustomValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <table class="table table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <th scope="row" style="width: 376px;">
                                                                    <div class="mt-2 mb-2">Mô tả đánh giá đau</div>
                                                                    <div>Pain Assessment Description</div>
                                                                </th>
                                                                <td>
                                                                    <div class="mt-2 mb-2">Vị trí 1</div>
                                                                    <div>Location 1</div>
                                                                </td>
                                                                <td>
                                                                    <div class="mt-2 mb-2">Vị trí 2</div>
                                                                    <div class="mt-2 mb-2">Location 2</div>
                                                                </td>
                                                                <td>
                                                                    <div class="mt-2 mb-2">Vị trí 3</div>
                                                                    <div class="mt-2 mb-2">Location 3</div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <div>P Nguyên nhân đau/ Provoking factors</div>
                                                                    <div>Các yếu tố gây ra cơn đau?</div>
                                                                    <div>What factors precipitated the discomfort?</div>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_p_location_1"></asp:Label>
                                                                    <div class="form-group" runat="server" id="p_location_1_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_p_location_1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_p_location_2"></asp:Label>
                                                                    <div class="form-group" runat="server" id="p_location_2_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_p_location_2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_p_location_3"></asp:Label>
                                                                    <div class="form-group" runat="server" id="p_location_3_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_p_location_3" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <div>Q Đau như thế nào?/ Quality</div>
                                                                    <div>Mô tả đau, sự khó chịu/ Describe the pain, discomfort, & characteristics of pain</div>
                                                                </th>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_q_location_1"></asp:Label>
                                                                    <div class="form-group" runat="server" id="q_location_1_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_q_location_1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_q_location_2"></asp:Label>
                                                                    <div class="form-group" runat="server" id="q_location_2_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_q_location_2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_q_location_3"></asp:Label>
                                                                    <div class="form-group" runat="server" id="q_location_3_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_q_location_3" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <div>R Nơi đau/ Region/ Radiation</div>
                                                                    <div>Đau ở đâu? Đau có lan truyền qua vị trí khác?/ Where is the pain? Does it radiate?</div>
                                                                </th>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_r_location_1"></asp:Label>
                                                                    <div class="form-group" runat="server" id="r_location_1_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_r_location_1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_r_location_2"></asp:Label>
                                                                    <div class="form-group" runat="server" id="r_location_2_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_r_location_2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_r_location_3"></asp:Label>
                                                                    <div class="form-group" runat="server" id="r_location_3_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_r_location_3" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <div>S  Mức độ đau/ Severity</div>
                                                                    <div>Rate pain score</div>
                                                                </th>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_s_location_1"></asp:Label>
                                                                    <div class="form-group" runat="server" id="s_location_1_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_s_location_1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_s_location_2"></asp:Label>
                                                                    <div class="form-group" runat="server" id="s_location_2_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_s_location_2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_s_location_3"></asp:Label>
                                                                    <div class="form-group" runat="server" id="s_location_3_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_s_location_3" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <div>T Thời gian/ Time</div>
                                                                    <div>Người bệnh đã bị đau trong bao lâu? How long the patient had the pain?</div>
                                                                </th>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_t_location_1"></asp:Label>
                                                                    <div class="form-group" runat="server" id="t_location_1_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_t_location_1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_t_location_2"></asp:Label>
                                                                    <div class="form-group" runat="server" id="t_location_2_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_t_location_2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_t_location_3"></asp:Label>
                                                                    <div class="form-group" runat="server" id="t_location_3_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_t_location_3" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label></label>
                                                    <img src="" id="pain_annotation_img" runat="server"  class="cssclsNoScreen" />
                                                    <asp:HiddenField runat="server" ID="pain_annotation_base64" />

                                                    <div class=""  style="width: 500px;">
                                                        <div id="controllers">
                                                            <span runat="server" class="controller btn btn-secondary" id="pain_annotation_undo">undo</span>
                                                            <span runat="server" class="controller btn btn-secondary" id="pain_annotation_redo">redo</span>
                                                            <div runat="server" id="pain_annotation_pencilWrapper"  class=" btn btn-secondary">
                                                                <svg id="pain_annotation_pencil" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                                    <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                                                </svg>
                                                            </div>
                                                        </div>
                                                        <canvas id="pain_annotation_canvas" runat="server"></canvas>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1 mr-2">Sử dụng thuốc giảm đau/ <span class="text-primary">Using painkiller:</span></label>
                                                    <asp:Label runat="server" ID="lbl_using_pain_killer"></asp:Label>
                                                    <div runat="server" id="using_pain_killer_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2" runat="server" id="sing_pain_killer_wrapper">
                                                            <input type="radio" id="rad_using_pain_killer_false" runat="server" name="rad_using_pain_killer" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_using_pain_killer_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_using_pain_killer_true" runat="server" name="rad_using_pain_killer" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_using_pain_killer_true">
                                                                Có (nếu có, báo cho BS điều trị đau)/ <span class="text-primary">Yes (if yes,  Inform the pain specialist)</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_using_pain_killer" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare44" />
                                                            </a>
                                                            <%--<asp:CustomValidator ID="CustomValidator15" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="this field is requested" CssClass="text-danger" OnServerValidate="using_pain_killer_ServerValidate"></asp:CustomValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Tên thuốc/ <span class="text-primary">Name of painkillers:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pain_killer_name"></asp:Label>
                                                    <webUI:TextField runat="server" ID="txt_pain_killer_name" />
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Nhận xét/ <span class="text-primary">Comments:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pa_comment"></asp:Label>
                                                    <webUI:TextField runat="server" ID="txt_pa_comment" />
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">9. Da & Nguy cơ loét tỳ đè/ <span class="text-primary">Skin & Pressure ulcer risk</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-2">Tình trạng/ <span class="text-primary">Condition</span></label>

                                                    <asp:Label runat="server" ID="lbl_condition"></asp:Label>

                                                    <div runat="server" id="condition_wrapper">
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_nm" />
                                                            <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_pa" />
                                                            <span class="custom-control-label">Tái/ <span class="text-primary">Pale</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_fl" />
                                                            <span class="custom-control-label">Đỏ/ <span class="text-primary">Flush</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_ja" />
                                                            <span class="custom-control-label">Vàng da/ <span class="text-primary">Jaundiced</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_dr" />
                                                            <span class="custom-control-label">Khô/ <span class="text-primary">Dry</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_oi" />
                                                            <span class="custom-control-label">Nhờn/ <span class="text-primary">Oily</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_sw" />
                                                            <span class="custom-control-label">Nhiều mồ hôi/ <span class="text-primary">Sweaty</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_ra" />
                                                            <span class="custom-control-label">Phát ban/ <span class="text-primary">Rash</span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-2">Vết thương/ <span class="text-primary">Wounds</span></label>
                                                    <asp:Label runat="server" ID="lbl_wounds"></asp:Label>
                                                    <div runat="server" id="wounds_wrapper">
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox1" />
                                                            <span class="custom-control-label">Không/ <span class="text-primary">No</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_1" />
                                                            <span class="custom-control-label">Máu tụ (1)/ <span class="text-primary">Haematoma</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_2" />
                                                            <span class="custom-control-label">Sự thâm tím (2)/ <span class="text-primary">Bruises</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_3" />
                                                            <span class="custom-control-label">Rách (3)/ <span class="text-primary">Laceration</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_4" />
                                                            <span class="custom-control-label">Sẹo (4)/ <span class="text-primary">Scar</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_5" />
                                                            <span class="custom-control-label">Bỏng (5)/ <span class="text-primary">Burn</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_6" />
                                                            <span class="custom-control-label">Loét do tỳ đè (6)/ <span class="text-primary">Pressure ulcer</span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <div>Biểu thị vùng da với chỉ số tương ứng trên sơ đồ cơ thể và mô tả vết thương dưới đây</div>
                                                    <div><span class="text-primary">Indicate the location with the corresponding number in the body diagram and describe the wound below.</span></div>
                                                    <asp:UpdatePanel ID="updatePanel_skin_anno" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:GridView ShowHeaderWhenEmpty="true" ShowHeader="true" ID="grid_skin_anno" runat="server" CssClass="tb-responsive table-bordered" OnRowDeleting="grid_skin_anno_RowDeleting" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div class="w-s pt-2 pb-2">Vùng</div>
                                                                            <div><span class="text-primary">Location</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <div class="form-group">
                                                                                <webUI:TextField runat="server" ID="location" Value='<%#Eval("location") %>' />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div class="w-n">Loại vết thương và mô tả vết thương (vd: kích cỡ, độ sâu, màu…)</div>
                                                                            <div><span class="text-primary">Type and description of wound (i.e. size, depth, colour…)</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("type") %>' ID="type" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                                <icon:Trash runat="server" ID="Trash" />
                                                                            </asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>

                                                            </asp:GridView>
                                                            <asp:UpdateProgress ID="updateProgress_skin_anno" runat="server" AssociatedUpdatePanelID="updatePanel_skin_anno">
                                                                <ProgressTemplate>
                                                                    Please wait....
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            <div class="mt-2">
                                                                <asp:Button ID="btn_grid_skin_anno_add" runat="server" CssClass="btn btn-sm btn-outline-primary" OnClick="btn_grid_skin_anno_add_Click" Text="Add row" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btn_grid_skin_anno_add" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <div>Chỉ rõ vùng của vết thương bằng chỉ số tương ứng (1-6) dưới đây</div>
                                                    <div><span class="text-primary">Specify the location of wound with corresponding numbers (1-6) as below</span></div>

                                                    <img class="cssclsNoScreen" src="" id="skin_anno_data_img" runat="server" />
                                                    <asp:HiddenField runat="server" ID="skin_anno_data_base64" />
                                                    <div class=""  style="width: 500px;">
                                                        <div id="controllers1">
                                                            <span runat="server" class="controller btn btn-secondary" id="skin_anno_data_undo">undo</span>
                                                            <span runat="server" class="controller btn btn-secondary" id="skin_anno_data_redo">redo</span>
                                                            <div runat="server" id="skin_anno_data_pencil_wrapper"  class=" btn btn-secondary">
                                                                <svg id="skin_anno_data_pencil" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                                    <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                                                </svg>
                                                            </div>
                                                        </div>
                                                        <canvas id="skin_anno_data_canvas" runat="server"></canvas>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    Đánh giá nguy cơ loét tỳ đè được cải tiến thang Braden<br />
                                                    <span class="text-primary">Pressure ulcer risk assessment modified with Braden scale</span><br />
                                                    Hướng dẫn: So sánh tình trạng của người bệnh với mô tả phù hợp nhất của từng loại. Ghi điểm (bằng số) ở cột bên phải. Cộng lại ở bên dưới để tính.<br />
                                                    <span class="text-primary">Guidance: Compare patient condition with the most appropriate description. Note the score (written as a number) at the right column. Plus together at the bottom to receive the total score.</span>
                                                </div>
                                                <div class="col-md-12 mb-2"><img style="width: 100%" src="../images/2021-05-25_21-54-42.png" /></div>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Nhận thức giác quan/ <span class="text-primary">Sensory perception</span></label>
                                                            <asp:Label runat="server" ID="lbl_sensory_code"></asp:Label>
                                                            <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_sensory_code" class="custom-select d-inline-block w-n mb-2">
                                                                <option></option>
                                                            </select>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Độ ẩm/ <span class="text-primary">Moisture</span></label>
                                                            <asp:Label runat="server" ID="lbl_moisture_code"></asp:Label>
                                                            <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_moisture_code" class="custom-select d-inline-block w-n mb-2">
                                                                <option></option>
                                                            </select>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Vận động/ <span class="text-primary">Activity</span></label>
                                                            <asp:Label runat="server" ID="lbl_activity_code"></asp:Label>
                                                            <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_activity_code" class="custom-select d-inline-block w-n mb-2">
                                                                <option></option>
                                                            </select>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Di chuyển/ <span class="text-primary">Mobility</span></label>
                                                            <asp:Label runat="server" ID="lbl_mobility_code"></asp:Label>
                                                            <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_mobility_code" class="custom-select d-inline-block w-n mb-2">
                                                                <option></option>
                                                            </select>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Dinh dưỡng/ <span class="text-primary">Nutrition</span></label>
                                                            <asp:Label runat="server" ID="lbl_nutrition_code"></asp:Label>
                                                            <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_nutrition_code" class="custom-select d-inline-block w-n mb-2">
                                                                <option></option>
                                                            </select>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Sự ma sát & trượt da/ <span class="text-primary">Friction & shear</span></label>
                                                            <asp:Label runat="server" ID="lbl_friction_code"></asp:Label>
                                                            <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_friction_code" class="custom-select d-inline-block w-n">
                                                                <option></option>
                                                            </select>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">
                                                                Tổng số điểm/ <span class="text-primary">Total score</span>
                                                                <icon:Calculator runat="server" Width="16" Height="16" />
                                                            </label>
                                                            <asp:Label Text="—" runat="server" ID="total_score"></asp:Label>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Nguy cơ loát tỳ đè/ <span class="text-primary">Pressure sore risk</span></label>
                                                            <asp:Label Text="—" runat="server" ID="pres_sore_risk_desc"></asp:Label>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label">Cách phòng ngừa tương ứng với những nguy cơ xác định/ <span class="text-primary">Preventive actions according to the identified risks</span></label>
                                                    <asp:Label Text="—" runat="server" ID="lbl_preven_action"></asp:Label>
                                                    <webUI:TextField runat="server" ID="txt_preven_action" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">10. Khả năng thực hiện những sinh hoạt hàng ngày/ <span class="text-primary">Ability to perform activities of daily living</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            <label class="control-label mb-1">Tắm/ <span class="text-primary">Bathing:</span></label>
                                                        </legend>
                                                        <asp:Label Text="—" runat="server" ID="lbl_bathing_desc"></asp:Label>
                                                        <div runat="server" id="bathing_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_bathing_code_in" runat="server" name="rad_bathing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_bathing_code_in">
                                                                    Tự tắm/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_bathing_code_as" runat="server" name="rad_bathing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_bathing_code_as">
                                                                    Cần sự hỗ trợ khi tắm/ <span class="text-primary">Assisted in shower</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_bathing_code_ab" runat="server" name="rad_bathing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_bathing_code_ab">
                                                                    Hỗ trợ tắm tại giường/ <span class="text-primary">Assisted bedside bathing</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_bathing_code_db" runat="server" name="rad_bathing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_bathing_code_db">
                                                                    Tự tắm tại giường/ <span class="text-primary">Bedside self-bathing</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_bathing_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare1" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            <label class="control-label mb-1 ">Chăm sóc răng miệng/ <span class="text-primary">Oral care:</span></label>
                                                        </legend>
                                                        <asp:Label Text="—" runat="server" ID="lbl_oral_care_desc"></asp:Label>
                                                        <div runat="server" id="oral_care_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_oral_care_code_oc" runat="server" name="rad_oral_care_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_oral_care_code_oc">
                                                                    Tự làm/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_oral_care_code_pu" runat="server" name="rad_oral_care_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_oral_care_code_pu">
                                                                    Chỉ chuẩn bị đồ dùng/ <span class="text-primary">Oral care kit prepared only</span>
                                                                </label>
                                                            </div>

                                                            <div class="d-inline-block mr-2">
                                                                <div class="custom-control custom-radio d-inline-block mr-2">
                                                                    <input type="radio" id="rad_oral_care_code_ab" runat="server" name="rad_oral_care_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_oral_care_code_ab">
                                                                        Hỗ trợ đánh răng/ <span class="text-primary">Assisted toothbrushing</span>
                                                                    </label>
                                                                </div>
                                                                <div class="form-group w-6 d-inline-block">
                                                                    <input runat="server" id="txt_oral_care_note" class="form-control text-right" />
                                                                    <span class="append">lần/ngày (times/day)</span>
                                                                </div>
                                                            </div>

                                                            <%--<div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_oral_care_code_oth" runat="server" name="rad_oral_care_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_oral_care_code_oth">.</label>
                                                                <a href="javascript:void(0)" data-clear="rad_oral_care_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare3" />
                                                                </a>
                                                            </div>--%>

                                                            <%--<div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_oral_care_code_db" runat="server" name="rad_oral_care_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_oral_care_code_db">
                                                                    Tự tắm tại giường/ <span class="text-primary">Dependent in bed</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_oral_care_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare3" />
                                                                </a>
                                                            </div>--%>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            <label class="control-label mb-1 ">Răng giả/ <span class="text-primary">Dentures:</span></label>
                                                        </legend>
                                                        <asp:Label Text="—" runat="server" ID="lbl_dentures_desc"></asp:Label>
                                                        <div runat="server" id="dentures_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_dentures_code_n" runat="server" name="rad_dentures_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dentures_code_n">
                                                                    Không có/ <span class="text-primary">None</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_dentures_code_u" runat="server" name="rad_dentures_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dentures_code_u">
                                                                    Hàm trên/ <span class="text-primary">Maxilla</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_dentures_code_l" runat="server" name="rad_dentures_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dentures_code_l">
                                                                    Hàm dưới/ <span class="text-primary">Mandible</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_dentures_code_p" runat="server" name="rad_dentures_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dentures_code_p">
                                                                    Từng phần/ <span class="text-primary">Partial</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_dentures_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare32" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            <label class="control-label">Đi vệ sinh/ <span class="text-primary">Toilet use:</span></label>
                                                        </legend>
                                                        <asp:Label Text="—" runat="server" ID="lbl_toilet_use_desc"></asp:Label>
                                                        <div runat="server" id="toilet_use_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_in" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_in">
                                                                    Tự vệ sinh/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_at" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_at">
                                                                    Cần hỗ trợ khi đi vệ sinh/ <span class="text-primary">Assisted for the toilet use</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_ac" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_ac">
                                                                    Cần hỗ trợ trên ghế dùng để tiểu tiện trong phòng/ <span class="text-primary">Assisted on the commode</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_di" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_di">
                                                                    Tã/ <span class="text-primary">Diaper</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_bu" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_bu">
                                                                    Bô dùng tại giường/ <span class="text-primary">Bedpan/urine bottle</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_ca" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_ca">
                                                                    Ống thông tiểu/ <span class="text-primary">Urinary catheter</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_toilet_use_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare33" />
                                                                </a>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_uc" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_uc">
                                                                    Ống thông tiểu đặt ngoài bàng quang/ <span class="text-primary">Urethral catheter</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            <label class="control-label">Trang phục/ <span class="text-primary">Dressing:</span></label>
                                                        </legend>
                                                        <asp:Label Text="—" runat="server" ID="lbl_dressing_desc"></asp:Label>
                                                        <div runat="server" id="dressing_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_dressing_code_in" runat="server" name="rad_dressing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dressing_code_in">
                                                                    Tự làm/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_dressing_code_wa" runat="server" name="rad_dressing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dressing_code_wa">
                                                                    Cần hỗ trợ/ <span class="text-primary">Assistance needed</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_dressing_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare34" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            <label class="control-label">Ăn/ Cho ăn/ <span class="text-primary">Eating/ Feeding:</span></label>
                                                        </legend>
                                                        <asp:Label Text="—" runat="server" ID="lbl_eating_desc"></asp:Label>
                                                        <div runat="server" id="eating_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_eating_code_in" runat="server" name="rad_eating_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_eating_code_in">
                                                                    Tự ăn/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_eating_code_dp" runat="server" name="rad_eating_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_eating_code_dp">
                                                                    Phụ thuộc về tư thế/ <span class="text-primary">Depend on position</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_eating_code_da" runat="server" name="rad_eating_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_eating_code_da">
                                                                    Phụ thuộc về ăn uống/ <span class="text-primary">Dependent to eat</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_eating_code_tu" runat="server" name="rad_eating_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_eating_code_tu">
                                                                    Cho ăn qua ống/ <span class="text-primary">NG tube/Gastrostomy</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_eating_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare35" />
                                                                </a>

                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            <label class="control-label">Xoay sở tư thế trên giường/ <span class="text-primary">Patient repositioning:</span></label>
                                                        </legend>
                                                        <asp:Label Text="—" runat="server" ID="lbl_turning_bed_desc"></asp:Label>
                                                        <div runat="server" id="turning_bed_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_turning_bed_code_in" runat="server" name="rad_turning_bed_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_turning_bed_code_in">
                                                                    Tự xoay trở/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_turning_bed_code_dn" runat="server" name="rad_turning_bed_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_turning_bed_code_dn">
                                                                    Không tự xoay sở/ <span class="text-primary">Unable to reposition</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_turning_bed_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare36" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            <label class="control-label">Đi lại/ <span class="text-primary">Ambulation:</span></label>
                                                        </legend>
                                                        <asp:Label Text="—" runat="server" ID="lbl_ambulation_desc"></asp:Label>
                                                        <div runat="server" id="ambulation_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_ambulation_code_in" runat="server" name="rad_ambulation_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_ambulation_code_in">
                                                                    Tự làm/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_ambulation_code_bf" runat="server" name="rad_ambulation_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_ambulation_code_bf">
                                                                    Liệt giường/ <span class="text-primary">Bedridden</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_ambulation_code_na" runat="server" name="rad_ambulation_code" class="custom-control-input" disabled-for="ambulation_note_field" />
                                                                <label class="custom-control-label" for="rad_ambulation_code_na">
                                                                    Cần hỗ trợ (ghi rõ)/ <span class="text-primary">Need assistance (specify)</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_ambulation_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare37" />
                                                                </a>
                                                            </div>

                                                            <div class="form-group ambulation_note_field w-n d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_ambulation_note" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset>
                                                        <legend>
                                                            <label class="control-label">Ngủ/ <span class="text-primary">Sleep:</span></label>
                                                        </legend>
                                                        <asp:Label Text="—" runat="server" ID="lbl_sleep_desc"></asp:Label>
                                                        <div runat="server" id="sleep_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_sleep_code_nm" runat="server" name="rad_sleep_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_sleep_code_nm">
                                                                    Bình thường/ <span class="text-primary">Normal</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_sleep_code_ae" runat="server" name="rad_sleep_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_sleep_code_ae">
                                                                    Thức sớm/ <span class="text-primary">Wake up early</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block  mr-2">
                                                                <input type="radio" id="rad_sleep_code_pfa" runat="server" name="rad_sleep_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_sleep_code_pfa">
                                                                    Khó ngủ/ <span class="text-primary">Sleep disturbances</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_sleep_code_pst" runat="server" name="rad_sleep_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_sleep_code_pst">
                                                                    Khó ngủ say/ <span class="text-primary">Insomnia</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_sleep_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare38" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <label class="control-label mb-1">Thuốc đã sử dụng/ <span class="text-primary">Medication used:</span></label>
                                                        <asp:Label runat="server" ID="lbl_medication_used"></asp:Label>
                                                        <webUI:TextField runat="server" ID="txt_medication_used" />
                                                    </fieldset>
                                                </div>
                                            </fieldset>

                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label mb-2">1. Đánh giá nguy cơ té ngã sử dụng Bảng Morse Scale/ <span class="text-primary">Fall risk assessment with Morse Scale</span></label>
                                                        </legend>

                                                        <div class="col-md-12 mb-2">
                                                            <fieldset>
                                                                <legend>
                                                                    <label>1.Tiền sử té ngã (bao gồm lần nhập viện hiện tại và trong 12 tháng gần đây)/ <span class="text-primary">History of fall (include current admission and last 12 months)</span></label>
                                                                </legend>
                                                                <asp:Label Text="—" runat="server" ID="lbl_fall_history_desc"></asp:Label>
                                                                <div runat="server" id="fall_history_code_wrapper">
                                                                    <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_fall_history_code_25" runat="server" name="rad_fall_history_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_fall_history_code_25">
                                                                            Có/ <span class="text-primary">Yes</span>  = 25
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_fall_history_code_0" runat="server" name="rad_fall_history_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_fall_history_code_0">
                                                                            Không/ <span class="text-primary">No</span>  = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_fall_history_code" onclick="clear_fall_history_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare39" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <fieldset>
                                                                <legend>
                                                                    <label>2. Có từ 2 bệnh lý trở lên, ví dụ: bệnh tiểu đường kết hợp với bệnh cao huyết áp,v.v… và/ hoặc đang dùng một trong các loại thuốc thuộc nhóm: thuốc ngủ, thuốc lợi tiểu, thuốc hạ huyết áp, thuốc chống trầm cảm, chống động kinh, thuốc nhuận tràng, thuốc gây nghiện, thuốc kháng đông *<span class="text-primary">Has a secondary Diagnostic e.g. with co morbidities-diabetic, hypertension, etc…and/ or has any administrated medication of Hypnotics, Barbiturates; antihypertension, Phenothiazines Antidepressants; Anti-convulsants, Laxatives,Diuretics, Narcotics, Anticoagulant *</span></label>
                                                                </legend>
                                                                <asp:Label Text="—" runat="server" ID="lbl_secon_diagnosis_desc"></asp:Label>
                                                                <div runat="server" id="secon_diagnosis_code_wrapper">
                                                                    <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_secon_diagnosis_code_15" runat="server" name="rad_secon_diagnosis_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_secon_diagnosis_code_15">
                                                                            Có/ <span class="text-primary">Yes</span>  = 15
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_secon_diagnosis_code_0" runat="server" name="rad_secon_diagnosis_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_secon_diagnosis_code_0">
                                                                            Không/ <span class="text-primary">No</span>  = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_secon_diagnosis_code" onclick="clear_secon_diagnosis_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare40" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <fieldset>
                                                                <legend>
                                                                    <label>Khả năng di chuyển/ <span class="text-primary">Ambulatory ability</span></label>
                                                                </legend>
                                                                <asp:Label Text="—" runat="server" ID="lbl_ambula_aids_desc"></asp:Label>
                                                                <div runat="server" id="ambula_aids_code_wrapper">
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_ambula_aids_code_30" runat="server" name="rad_ambula_aids_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_ambula_aids_code_30">
                                                                            Vịnh vào vật dụng để đi lại/ <span class="text-primary">Holds on to Furniture</span>  = 30
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_ambula_aids_code_15" runat="server" name="rad_ambula_aids_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_ambula_aids_code_15">
                                                                            Nạng chống/ nạng bốn chân/ khung tập đi/ hỗ trợ điều dưỡng/ hỗ trợ đi lại/<span class="text-primary">Crutch/Quad Cane/Walking Frame/ Nurse Assist/ Walking aid</span> = 15
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_ambula_aids_code_0" runat="server" name="rad_ambula_aids_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_ambula_aids_code_0">
                                                                            Không cần trợ giúp để đi lại hoặc nằm tại giường/ <span class="text-primary">No ambulatory aid or bedrest</span> = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_ambula_aids_code" onclick="clear_ambula_aids_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare42" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <fieldset>
                                                                <legend>
                                                                    <label>Liệu pháp tiêm tĩnh mạch/ có khóa heparin <span class="text-primary"> Intravenous therapy/Heparin lock</span></label>
                                                                </legend>
                                                                <asp:Label Text="—" runat="server" ID="lbl_intra_therapy_desc"></asp:Label>
                                                                <div runat="server" id="intra_therapy_code_wrapper">
                                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_intra_therapy_code_20" runat="server" name="rad_intra_therapy_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_intra_therapy_code_20">
                                                                            Có/ <span class="text-primary">Yes</span> = 20
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_intra_therapy_code_0" runat="server" name="rad_intra_therapy_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_intra_therapy_code_0">
                                                                            Không/ <span class="text-primary">No</span> = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_intra_therapy_code" onclick="clear_intra_therapy_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare41" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <fieldset>
                                                                <legend>
                                                                    <label class="control-label">Dáng đi/ di chuyển/ <span class="text-primary">Gait/ movement</span></label>
                                                                </legend>
                                                                <asp:Label Text="—" runat="server" ID="lbl_gait_trans_desc"></asp:Label>
                                                                <div runat="server" id="gait_trans_code_wrapper">
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_gait_trans_code_20" runat="server" name="rad_gait_trans_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gait_trans_code_20">
                                                                            Suy yếu/ <span class="text-primary">Impaired</span> = 20
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_gait_trans_code_10" runat="server" name="rad_gait_trans_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gait_trans_code_10">
                                                                            Yếu/ <span class="text-primary">Weak</span> = 10
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_gait_trans_code_0" runat="server" name="rad_gait_trans_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gait_trans_code_0">
                                                                            Bình thường, nằm tại giường/ <span class="text-primary">Normal, bedrest</span> = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_gait_trans_code" onclick="clear_gait_trans_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare45" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <fieldset>
                                                                <legend>
                                                                    <label class="control-label">Trạng thái tâm thần/ <span class="text-primary">Mental status</span></label>
                                                                </legend>
                                                                <asp:Label Text="—" runat="server" ID="lbl_fr_mental_status_desc"></asp:Label>
                                                                <div runat="server" id="fr_mental_status_code_wrapper">
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_fr_mental_status_code_15" runat="server" name="rad_fr_mental_status_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_fr_mental_status_code_15">
                                                                            Không hiểu được giới hạn bản thân/ <span class="text-primary">Do not understand personal limits</span> = 15
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_fr_mental_status_code_0" runat="server" name="rad_fr_mental_status_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_fr_mental_status_code_0">
                                                                            Hiểu được giới hạn bản thân/ <span class="text-primary">Understanding of personal limits</span> = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_fr_mental_status_code" onclick="clear_fr_mental_status_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare46" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mr-2">
                                                                Tổng điểm/ <span class="text-primary">Total score:</span><icon:Calculator Width="16" Height="16" runat="server" ID="Calculator" />
                                                            </label>
                                                            <asp:Label runat="server" ID="fr_total_score"></asp:Label>
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label class="control-label mr-2">0-24: Thấp/ <span class="text-primary">Low</span></label>
                                                            <label class="control-label mb-1 mr-2">25-44: Trung bình/ <span class="text-primary">Medium</span></label>
                                                            <label class="control-label mb-1">≥ 45: Cao/ <span class="text-primary">High</span></label>
                                                        </div>
                                                    </fieldset>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 h4">IV. KẾ HOẠCH XUẤT VIỆN/ <span class="text-primary">DISCHARGE PLANING</span></label>
                                                <div>Đánh giá lại và mời hội chẩn nếu tình trạng sức khỏe của người bệnh thay đổi. Nếu cần, chuyển bệnh đến khoa thích hợp. Nếu có nghi vấn, thảo luận với bác sĩ phụ trách.</div>
                                                <div><span class="text-primary">Reassessment and consultation if patient’s health condition is changed. If need, refer the patient to the relevant department. If in doubt, discuss with a doctor in charge</span></div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Nhiều chuyên khoa cùng tham gia điều trị/ <span class="text-primary">Multidisciplinary team involvement:</span></label>
                                                    <asp:Label runat="server" ID="lbl_involvement"></asp:Label>
                                                    <div runat="server" id="involvement_wrapper" class="d-inline-block">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_involvement_true" runat="server" name="rad_involvement" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_involvement_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_involvement_false" runat="server" name="rad_involvement" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_involvement_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_involvement" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare48" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator7" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="involvement_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Yêu cầu thiết bị y tế, máy tạo oxy và dịch vụ giúp đỡ chăm sóc tại nhà/ <span class="text-primary">Requires medical equipment, oxygen concentrator and home care help services:</span></label>
                                                    <asp:Label runat="server" ID="lbl_req_med_equipment"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="req_med_equipment_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_med_equipment_true" runat="server" name="rad_req_med_equipment" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_med_equipment_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_med_equipment_false" runat="server" name="rad_req_med_equipment" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_med_equipment_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_req_med_equipment" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare49" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Yêu cầu theo dõi điều trị/ <span class="text-primary">Requires follow-up care:</span></label>
                                                    <asp:Label runat="server" ID="lbl_req_foll_care"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="req_foll_care_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_foll_care_true" runat="server" name="rad_req_foll_care" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_foll_care_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_foll_care_false" runat="server" name="rad_req_foll_care" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_foll_care_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_req_foll_care" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare50" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Các trường hợp tự tử (cần hội chẩn khẩn cấp)/ <span class="text-primary">Suicidal cases (Urgent referral):</span></label>
                                                    <asp:Label runat="server" ID="lbl_suicidal_referral"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="suicidal_referral_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_suicidal_referral_true" runat="server" name="rad_suicidal_referral" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_suicidal_referral_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_suicidal_referral_false" runat="server" name="rad_suicidal_referral" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_suicidal_referral_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_suicidal_referral" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare51" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Sống một mình với tình trạng suy giảm chức năng và không được chăm sóc điều trị hay hỗ trợ từ gia đình/ <span class="text-primary">Lives alone with reduced functional status and no other care giver or family support:</span></label>
                                                    <asp:Label runat="server" ID="lbl_alone_reduce_functional"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="alone_reduce_functional_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_alone_reduce_functional_true" runat="server" name="rad_alone_reduce_functional" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_alone_reduce_functional_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_alone_reduce_functional_false" runat="server" name="rad_alone_reduce_functional" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_alone_reduce_functional_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_alone_reduce_functional" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare47" />
                                                            </a>
                                                            <%--<asp:CustomValidator ID="CustomValidator1" CssClass="text-danger" ValidationGroup="Group1"
                                                                OnServerValidate="alone_reduce_functional_ServerValidate"
                                                                Display="Dynamic"
                                                                ErrorMessage=" is required"
                                                                runat="server" />--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Mời bác sĩ vật lý trị liệu hội chẩn/ <span class="text-primary">Referral to Physiotherapist:</span></label>
                                                    <asp:Label runat="server" ID="lbl_ref_physiotherapist"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="ref_physiotherapist_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_physiotherapist_true" runat="server" name="rad_ref_physiotherapist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_physiotherapist_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_physiotherapist_false" runat="server" name="rad_ref_physiotherapist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_physiotherapist_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_ref_physiotherapist" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare52" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Mời chuyên gia ngôn ngữ trị liệu hội chẩn/ <span class="text-primary">Referral to speech therapist</span></label>
                                                    <asp:Label runat="server" ID="lbl_ref_speech_therapist"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="ref_speech_therapist_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_speech_therapist_true" runat="server" name="rad_ref_speech_therapist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_speech_therapist_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_speech_therapist_false" runat="server" name="rad_ref_speech_therapist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_speech_therapist_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_ref_speech_therapist" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare53" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Giới thiệu đến chuyên gia dinh dưỡng/ <span class="text-primary">Referral to Dietician:</span></label>
                                                    <asp:Label runat="server" ID="lbl_ref_dietician"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="ref_dietician_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_dietician_true" runat="server" name="rad_ref_dietician" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_dietician_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_dietician_false" runat="server" name="rad_ref_dietician" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_dietician_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_ref_dietician" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare54" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Giới thiệu đến chuyên gia tâm lý/ <span class="text-primary">Referral to Psychologist:</span></label>
                                                    <asp:Label runat="server" ID="lbl_ref_psychologist"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="ref_psychologist_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_psychologist_True" runat="server" name="rad_ref_psychologist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_psychologist_True">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_psychologist_False" runat="server" name="rad_ref_psychologist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_psychologist_False">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_ref_psychologist" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare55" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Yêu cầu chuyển đến bệnh viện khác/ <span class="text-primary">Requires referral to other hospital:</span></label>
                                                    <asp:Label runat="server" ID="lbl_ref_other_hospital"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="ref_other_hospital_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_other_hospital_true" runat="server" name="rad_other_hospital" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_other_hospital_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_other_hospital_false" runat="server" name="rad_other_hospital" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_other_hospital_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_other_hospital" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare56" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator14" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="rad_ref_other_hospital_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Người nhà hỗ trợ tại nhà/ <span class="text-primary">Support system at home:</span></label>
                                                    <asp:Label runat="server" ID="lbl_support_at_home"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="support_at_home_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_support_at_home_true" runat="server" name="rad_support_at_home" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_support_at_home_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_support_at_home_false" runat="server" name="rad_support_at_home" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_support_at_home_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_support_at_home" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare57" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Người bệnh yêu cầu phương tiện vận chuyển về nhà/ <span class="text-primary">Will patient require transportation arrangements to go home:</span></label>
                                                    <asp:Label runat="server" ID="lbl_req_transportation"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="req_transportation_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_transportation_true" runat="server" name="rad_req_transportation" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_transportation_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_transportation_false" runat="server" name="rad_req_transportation" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_transportation_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_req_transportation" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare58" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Cầu thang bộ tại nhà/ <span class="text-primary">Stairs to climb at home:</span></label>
                                                    <asp:Label runat="server" ID="lbl_stairs_climb_home"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="stairs_climb_home_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_stairs_climb_home_true" runat="server" name="rad_stairs_climb_home" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stairs_climb_home_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_stairs_climb_home_false" runat="server" name="rad_stairs_climb_home" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stairs_climb_home_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_stairs_climb_home" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare59" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-1 h4">Kế hoạch xuất viện/ <span class="text-primary">Discharge planing</span></label>
                                            </div>

                                            <div class="col-md-12 gt-2-a mb-2">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_dis_planning"></asp:Label>
                                                <webUI:TextField runat="server" ID="txt_dis_planning" />
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-1 h4">Đánh giá lại/ <span class="text-primary">Reassessment</span></label>
                                            </div>

                                            <div class="col-md-12 gt-2-a mb-2">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_reassessment"></asp:Label>
                                                <webUI:TextField runat="server" ID="txt_reassessment" />
                                            </div>

                                            <div class="font-bold">V. HƯỚNG DẪN NGƯỜI BỆNH VỀ NHỮNG TIỆN NGHI TRONG PHÒNG VÀ CÁC DỊCH VỤ/ <span class="text-primary">PATIENT GUIDES TO ROOM FACILITIES AND SERVICES</span></div>
                                            
                                            <div class="font-bold">Hướng dẫn/ <span class="text-primary">Instructions provided to</span></div>
                                            <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <label class="custom-control custom-checkbox mb-1 d-inline">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_instructions_provided_to_pat" />
                                                        <span class="custom-control-label">Người bệnh/ <span class="text-primary">Patient</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox mb-1 d-inline">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_instructions_provided_to_rel" />
                                                        <span class="custom-control-label">Thân nhân/ <span class="text-primary">Relative</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox mb-1 d-inline">
                                                        <input onchange="__doPostBack('instructions_provided_to_oth_change','')" type="checkbox" class="custom-control-input" runat="server" id="cb_instructions_provided_to_oth" />
                                                        <span class="custom-control-label">Khác/ <span class="text-primary">Other</span></span>
                                                    </label>
                                                    <div class="form-group d-inline-block" runat="server" id="instructions_provided_to_oth_wrapper">
                                                        <webUI:TextField Width="320px" runat="server" ID="txt_instructions_provided_to_oth" />
                                                    </div>
                                                    <label class="custom-control custom-checkbox mb-1 d-inline">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_instructions_provided_to_nap" />
                                                        <span class="custom-control-label">Không áp dụng/ <span class="text-primary">Not applicable</span></span>
                                                    </label>
                                                    <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="instructions_provided_to_ServerValidate"></asp:CustomValidator>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div class="font-bold">1. Nhân viên/ <span class="text-primary">Personnel</span></div>
                                            <div class="mb-1">
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_personnel_sta" />
                                                    <span class="custom-control-label">Giới thiệu với ĐD phụ trách và nhân viên khác/ <span class="text-primary">Introduction to a nurse in charge and other staff</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_personnel_pat" />
                                                    <span class="custom-control-label">Giới thiệu với NB khác/ <span class="text-primary">Introduction to other patients</span></span>
                                                </label>
                                                <asp:CustomValidator ID="CustomValidator2" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="personnel_ServerValidate"></asp:CustomValidator>
                                            </div>

                                            <div class="font-bold">2. Tiện nghi vật chất/ <span class="text-primary">Physical facilities</span></div>
                                            <div>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_physical_facilities_bel" />
                                                    <span class="custom-control-label">Vị trí giường/ <span class="text-primary">Bed location</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_physical_facilities_bat" />
                                                    <span class="custom-control-label">Phòng tắm/nhà vệ sinh/ <span class="text-primary">Bathroom/toilet</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_physical_facilities_tel" />
                                                    <span class="custom-control-label">Sử dụng tivi/ <span class="text-primary">Use of television</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_physical_facilities_tep" />
                                                    <span class="custom-control-label">Sử dụng điện thoại/ <span class="text-primary">Use of telephone</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_physical_facilities_ncs" />
                                                    <span class="custom-control-label">Hệ thống gọi điều dưỡng/ <span class="text-primary">Nurse call system</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_physical_facilities_mco" />
                                                    <span class="custom-control-label">Trạm điều dưỡng và quầy chính/ <span class="text-primary">Nurse station and main counter</span></span>
                                                </label>
                                                <asp:CustomValidator ID="CustomValidator3" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="physical_facilities_ServerValidate"></asp:CustomValidator>

                                            </div>

                                            <div class="font-bold">3. Chính sách và quy trình/ <span class="text-primary">Policies and procedure</span></div>
                                            <div>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_policies_and_procedure_vih" />
                                                    <span class="custom-control-label">Khách thăm bệnh, giờ thăm/ <span class="text-primary">Visitors and visiting hours</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_policies_and_procedure_pcc" />
                                                    <span class="custom-control-label">Thẻ chăm bệnh/ <span class="text-primary">Patient care card</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_policies_and_procedure_pun" />
                                                    <span class="custom-control-label">Đồng phục người bệnh/ <span class="text-primary">Patient uniform</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_policies_and_procedure_mse" />
                                                    <span class="custom-control-label">Dịch vụ ăn uống/ <span class="text-primary">Meal service</span></span>
                                                </label>
                                                
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_policies_and_procedure_ppp" />
                                                    <span class="custom-control-label">Quy trình trước và sau phẫu thuật, nếu có/ <span class="text-primary">Pre and postoperative procedures (if available)</span></span>
                                                </label>
                                                
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_policies_and_procedure_wcn" />
                                                    <span class="custom-control-label">Số liên lạc với khoa/phòng/ <span class="text-primary">Ward contact number</span></span>
                                                </label>
                                                <asp:CustomValidator ID="CustomValidator4" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="policies_and_procedure_ServerValidate"></asp:CustomValidator>

                                            </div>

                                            <div class="font-bold">4. Biện pháp an toàn/ <span class="text-primary">Safety precautions</span></div>
                                            <div>
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_safety_precautions_lfe" />
                                                    <span class="custom-control-label">Vị trí cửa thoát hiểm/ <span class="text-primary">Location of fire exits</span></span>
                                                </label>
                                                
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_safety_precautions_fpr" />
                                                    <span class="custom-control-label">Biện pháp phòng ngừa té ngã/ <span class="text-primary">Fall precaution</span></span>
                                                </label>
                                                
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_safety_precautions_iwb" />
                                                    <span class="custom-control-label">Sử dụng vòng đeo tay nhận diện/ <span class="text-primary">Use of an identification wrist band</span></span>
                                                </label>
                                                
                                                <label class="custom-control custom-checkbox mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_safety_precautions_nsh" />
                                                    <span class="custom-control-label">Nguy cơ cháy-Không hút thuốc trong phạm vi bệnh viện/ <span class="text-primary">Fire risk – No smoking hospital</span></span>
                                                </label>
                                                <asp:CustomValidator ID="CustomValidator5" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="safety_precautions_ServerValidate"></asp:CustomValidator>

                                            </div>

                                            <div class="font-bold">5. Tư trang/ vật dụng cá nhân/ <span class="text-primary">Valuables/Belongings</span></div>

                                            <div>Răng giả/ <span class="text-primary">Dentures</span></div>
                                            <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onchange="__doPostBack('vb_dentures_change','NO')" type="radio" id="rad_vb_dentures_no" runat="server" name="rad_vb_dentures" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vb_dentures_no">
                                                            Không/ <span class="text-primary">No</span>
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onchange="__doPostBack('vb_dentures_change','YES')" type="radio" id="rad_vb_dentures_yes" runat="server" name="rad_vb_dentures" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vb_dentures_yes">
                                                            Có/ <span class="text-primary">Yes</span>
                                                        </label>
                                                    </div>
                                                    <div runat="server" class="d-inline-block" id="vb_dentures_wrapper">
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_dentures_wpa" />
                                                            <span class="custom-control-label">NB giữ/ <span class="text-primary">With patient</span></span>
                                                        </label>
                                                
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_dentures_wre" />
                                                            <span class="custom-control-label">Thân nhân giữ/ <span class="text-primary">With relative</span></span>
                                                        </label>

                                                        Ghi rõ:

                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_dentures_max" />
                                                            <span class="custom-control-label">Hàm trên/ <span class="text-primary">Maxilla</span></span>
                                                        </label>
                                                
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_dentures_man" />
                                                            <span class="custom-control-label">Hàm dưới/ <span class="text-primary">Mandible</span></span>
                                                        </label>
                                                
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_dentures_par" />
                                                            <span class="custom-control-label">Từng phần/ <span class="text-primary">Partial</span></span>
                                                        </label>
                                                    </div>
                                                    <asp:CustomValidator ID="CustomValidator6" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="vb_dentures_ServerValidate"></asp:CustomValidator>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            
                                            <div>Máy trợ thính/ <span class="text-primary">Hearing aid</span></div>
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onchange="__doPostBack('vb_hearing_aid_change','NO')" type="radio" id="rad_vb_hearing_aid_no" runat="server" name="rad_vb_hearing_aid" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vb_hearing_aid_no">
                                                            Không/ <span class="text-primary">No</span>
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onchange="__doPostBack('vb_hearing_aid_change','YES')" type="radio" id="rad_vb_hearing_aid_yes" runat="server" name="rad_vb_hearing_aid" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vb_hearing_aid_yes">
                                                            Có/ <span class="text-primary">Yes</span>
                                                        </label>
                                                    </div>
                                                    <div runat="server" id="vb_hearing_aid_wrapper" class="d-inline-block">
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_hearing_aid_wpa" />
                                                            <span class="custom-control-label">NB giữ/ <span class="text-primary">With patient</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_hearing_aid_wre" />
                                                            <span class="custom-control-label">Thân nhân giữ/ <span class="text-primary">With relative</span></span>
                                                        </label>
                                                        Ghi rõ:
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_hearing_aid_lef" />
                                                            <span class="custom-control-label">Trái/ <span class="text-primary">Left</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_hearing_aid_rig" />
                                                            <span class="custom-control-label">Phải/ <span class="text-primary">Right</span></span>
                                                        </label>
                                                    </div>
                                                    <asp:CustomValidator ID="CustomValidator7" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="vb_hearing_aid_ServerValidate"></asp:CustomValidator>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div>Mắt kính/ <span class="text-primary">Eyeglasses</span></div>
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onchange="__doPostBack('vb_eyeglasses_change','NO')" type="radio" id="rad_vb_eyeglasses_no" runat="server" name="rad_vb_eyeglasses" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vb_eyeglasses_no">
                                                            Không/ <span class="text-primary">No</span>
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onchange="__doPostBack('vb_eyeglasses_change','YES')" type="radio" id="rad_vb_eyeglasses_yes" runat="server" name="rad_vb_eyeglasses" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vb_eyeglasses_yes">
                                                            Có/ <span class="text-primary">Yes</span>
                                                        </label>
                                                    </div>
                                                    <div runat="server" id="vb_eyeglasses_wrapper" class="d-inline-block">
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_eyeglasses_wpa" />
                                                            <span class="custom-control-label">NB giữ/ <span class="text-primary">With patient</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_eyeglasses_wre" />
                                                            <span class="custom-control-label">Thân nhân giữ/ <span class="text-primary">With relative</span></span>
                                                        </label>
                                                    </div>
                                                    <asp:CustomValidator ID="CustomValidator8" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="vb_eyeglasses_ServerValidate"></asp:CustomValidator>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div>Kính sát tròng/ <span class="text-primary">Contact lenses</span></div>
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onchange="__doPostBack('vb_contact_lenses_change','NO')" type="radio" id="rad_vb_contact_lenses_no" runat="server" name="rad_vb_contact_lenses" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vb_contact_lenses_no">
                                                            Không/ <span class="text-primary">No</span>
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onchange="__doPostBack('vb_contact_lenses_change','YES')" type="radio" id="rad_vb_contact_lenses_yes" runat="server" name="rad_vb_contact_lenses" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vb_contact_lenses_yes">
                                                            Có/ <span class="text-primary">Yes</span>
                                                        </label>
                                                    </div>
                                                    <div runat="server" id="vb_contact_lenses_wrapper" class="d-inline-block">
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_contact_lenses_wpa" />
                                                            <span class="custom-control-label">NB giữ/ <span class="text-primary">With patient</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_contact_lenses_wre" />
                                                            <span class="custom-control-label">Thân nhân giữ/ <span class="text-primary">With relative</span></span>
                                                        </label>
                                                    </div>
                                                    <asp:CustomValidator ID="CustomValidator9" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="vb_contact_lenses_ServerValidate"></asp:CustomValidator>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div>Tiền mặt/nữ trang/ <span class="text-primary">Cash/ Jewelry</span></div>
                                            <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onchange="__doPostBack('vb_cash_jewelry_change','NO')" type="radio" id="rad_vb_cash_jewelry_no" runat="server" name="rad_vb_cash_jewelry" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vb_cash_jewelry_no">
                                                            Không/ <span class="text-primary">No</span>
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onchange="__doPostBack('vb_cash_jewelry_change','YES')" type="radio" id="rad_vb_cash_jewelry_yes" runat="server" name="rad_vb_cash_jewelry" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vb_cash_jewelry_yes">
                                                            Có/ <span class="text-primary">Yes</span>
                                                        </label>
                                                    </div>
                                                    <div runat="server" id="vb_cash_jewelry_wrapper" class="d-inline-block">
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_cash_jewelry_wpa" />
                                                            <span class="custom-control-label">NB giữ/ <span class="text-primary">With patient</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_cash_jewelry_wre" />
                                                            <span class="custom-control-label">Thân nhân giữ/ <span class="text-primary">With relative</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_vb_cash_jewelry_hsb" />
                                                            <span class="custom-control-label">Trong tủ đầu giường phòng/ <span class="text-primary">In the hospital safety box</span></span>
                                                        </label>
                                                    </div>
                                                    <asp:CustomValidator ID="CustomValidator10" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="vb_cash_jewelry_ServerValidate"></asp:CustomValidator>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div>Khác (ghi rõ)/ <span class="text-primary">Other (specify)</span></div>
                                            <div>
                                                <webUI:TextField runat="server" ID="txt_vb_other" />
                                            </div>

                                            <div>Tôi hiểu rõ rằng nếu Tôi và người bệnh/ thân nhân muốn giữ bên mình bất cứ đồ vật nào có giá trị hoặc tiền mặt trong thời gian nằm viện, Tôi sẽ không quy bất cứ trách nhiệm nào liên quan đến việc mất mát hoặc hư tổn nào cho những vật có giá trị/tiền mặt này cho Bệnh viện quốc tế Mỹ.</div>
                                            <div><span class="text-primary">I clearly understand that if I and the patient/ families desire to keep any valuables or cash during hospitalization, I shall not impute the responsibility to AIH in the event of loss or damage of valuables/ cash.</span></div>

                                            <%--<div class="col-md-12 gt-2-a mb-2">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_dis_management"></asp:Label>
                                                <div class="form-group" runat="server" id="dis_management_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_dis_management" />
                                                </div>
                                            </div>--%>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-actions" style="display: flex; gap: 6px">
                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel8">
                                                            <ContentTemplate>
                                                                <asp:LinkButton ValidationGroup="Group2" runat="server" OnClick="CompleteDocument" ID="btnComplete" CssClass="btn btn-primary">Complete</asp:LinkButton>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="SaveDocument" ID="btnSave" runat="server" CssClass="btn btn-primary">Save</asp:LinkButton>
                                                        <asp:UpdatePanel runat="server" ID="uplPrintDocument">
                                                            <ContentTemplate>
                                                                <asp:LinkButton runat="server" OnClick="DeleteDocument" ID="btnDelete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        <asp:LinkButton runat="server" OnClick="AmendDocument" ID="btnAmend" CssClass="btn btn-secondary">Amend</asp:LinkButton>
                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel15">
                                                            <ContentTemplate>
                                                                <asp:LinkButton runat="server" OnClick="PrintDocument" ID="btnPrint" CssClass="btn btn-secondary">Print</asp:LinkButton>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        <asp:LinkButton runat="server" OnClick="PrintDocument" ID="LinkButton1" CssClass="btn btn-secondary">Print</asp:LinkButton>
                                                        <asp:LinkButton runat="server" OnClick="CancelAmendDocument" ID="btnCancel" CssClass="btn btn-secondary">Cancel</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
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
    <script src="../scripts/checkValidFields.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>

    <script>
        function load_pain_annotation_Image() {
            const pain_annotation_canvas = document.querySelector('#pain_annotation_canvas');

            const ctx = pain_annotation_canvas.getContext("2d");
            pain_annotation_canvas.height = 500;
            pain_annotation_canvas.width = 500;
            ctx.strokeStyle = "red";
            
            let pain_annotation_img = new Image();

            pain_annotation_img.onload = function () {
                ctx.drawImage(pain_annotation_img, 0, 0);
            }

            //pain_annotation_img.src = document.getElementById("pain_annotation_img").src;
            //console.log(document.getElementById("pain_annotation_base64").value);

            //pain_annotation_img.src = JSON.parse(JSON.parse(sessionStorage.getItem(sessionStorage.getItem("doc_id"))).pain_annotation).dataURI;

            pain_annotation_img.src = document.getElementById("pain_annotation_base64").value;

            //document.getElementById("pain_annotation_base64").value;
            //console.log('obj ', JSON.parse(JSON.parse(sessionStorage.getItem(sessionStorage.getItem("doc_id"))).pain_annotation).dataURI);

            var pain_annotation_history = {
                redo_list: [],
                undo_list: [],
                saveState: function (canvas, list, keep_redo) {
                    keep_redo = keep_redo || false;
                    if (!keep_redo) {
                        this.redo_list = [];
                    }

                    (list || this.undo_list).push(canvas.toDataURL());
                },
                undo: function (canvas, ctx) {
                    this.restoreState(canvas, ctx, this.undo_list, this.redo_list);
                },
                redo: function (canvas, ctx) {
                    this.restoreState(canvas, ctx, this.redo_list, this.undo_list);
                },
                restoreState: function (canvas, ctx, pop, push) {
                    if (pop.length) {
                        this.saveState(canvas, push, true);
                        var restore_state = pop.pop();
                        var img = document.createElement("img");
                        img.src = restore_state;

                        img.onload = function () {
                            ctx.clearRect(0, 0, canvas.width, 400);
                            ctx.drawImage(img, 0, 0, canvas.width, canvas.height, 0, 0, canvas.width, canvas.height);
                        }
                    }
                }
            }

            var pain_annotation_pencil = {
                options: {
                    stroke_color: "red",
                    dim: 4
                },
                init: function (canvas, ctx) {
                    this.canvas = canvas;
                    this.ctx = ctx;
                    this.ctx.strokeColor = this.options.stroke_color;
                    this.drawing = false;
                    this.addCanvasEvents();
                },
                addCanvasEvents: function () {
                    this.canvas.addEventListener('mousedown', this.start.bind(this));
                    this.canvas.addEventListener('mousemove', this.stroke.bind(this));
                    this.canvas.addEventListener('mouseup', this.stop.bind(this));
                    this.canvas.addEventListener('mouseout', this.stop.bind(this));
                },
                start: function (e) {
                    if (currentAct != act.PEN) return;
                    this.ctx.beginPath();
                    pain_annotation_history.saveState(this.canvas);
                    this.drawing = true;
                },
                stroke: function (e) {
                    if (currentAct != act.PEN) return;

                    if (this.drawing) {
                        let rect = pain_annotation_canvas.getBoundingClientRect();

                        var x = e.clientX - rect.left;
                        var y = e.clientY - rect.top;

                        this.ctx.lineTo(x, y);
                        this.ctx.stroke(); // draw line
                        this.ctx.beginPath();
                        this.ctx.moveTo(x, y);
                    }
                },
                stop: function (e) {
                    if (currentAct != act.PEN) return;

                    if (this.drawing) {
                        this.drawing = false;
                        this.ctx.beginPath();
                    }

                    var image = document.getElementById("pain_annotation_canvas").toDataURL("image/png");
                    //image = image.replace('data:image/png;base64,', '');

                    document.getElementById("pain_annotation_base64").value = image;
                }
            };

            const act = { PEN: 1, NOTE: 2 };
            Object.freeze(act);

            let currentAct;

            $('#pain_annotation_pencil').click(function () {
                currentAct = act.PEN;
                pain_annotation_pencil.init(pain_annotation_canvas, ctx);
            });

            $('#pain_annotation_undo').click(function () {
                pain_annotation_history.undo(pain_annotation_canvas, ctx);
            });

            $('#pain_annotation_redo').click(function () {
                pain_annotation_history.redo(pain_annotation_canvas, ctx);
            });
        };

        function load_skin_anno_data_Image() {
            const skin_anno_data_canvas = document.querySelector('#skin_anno_data_canvas');

            const ctx = skin_anno_data_canvas.getContext("2d");
            skin_anno_data_canvas.height = 500;
            skin_anno_data_canvas.width = 500;
            ctx.strokeStyle = "red";

            let skin_anno_data_img = new Image();

            skin_anno_data_img.onload = function () {
                ctx.drawImage(skin_anno_data_img, 0, 0);
            }

            skin_anno_data_img.src = document.getElementById("skin_anno_data_base64").value;

            var skin_anno_data_history = {
                redo_list: [],
                undo_list: [],
                saveState: function (canvas, list, keep_redo) {
                    keep_redo = keep_redo || false;
                    if (!keep_redo) {
                        this.redo_list = [];
                    }

                    (list || this.undo_list).push(canvas.toDataURL());
                },
                undo: function (canvas, ctx) {
                    this.restoreState(canvas, ctx, this.undo_list, this.redo_list);
                },
                redo: function (canvas, ctx) {
                    this.restoreState(canvas, ctx, this.redo_list, this.undo_list);
                },
                restoreState: function (canvas, ctx, pop, push) {
                    if (pop.length) {
                        this.saveState(canvas, push, true);
                        var restore_state = pop.pop();
                        var img = document.createElement("img");
                        img.src = restore_state;

                        img.onload = function () {
                            ctx.clearRect(0, 0, canvas.width, 400);
                            ctx.drawImage(img, 0, 0, canvas.width, canvas.height, 0, 0, canvas.width, canvas.height);
                        }
                    }
                }
            }

            var skin_anno_data_pencil = {
                options: {
                    stroke_color: "red",
                    dim: 4
                },
                init: function (canvas, ctx) {
                    this.canvas = canvas;
                    this.ctx = ctx;
                    this.ctx.strokeColor = this.options.stroke_color;
                    this.drawing = false;
                    this.addCanvasEvents();
                },
                addCanvasEvents: function () {
                    this.canvas.addEventListener('mousedown', this.start.bind(this));
                    this.canvas.addEventListener('mousemove', this.stroke.bind(this));
                    this.canvas.addEventListener('mouseup', this.stop.bind(this));
                    this.canvas.addEventListener('mouseout', this.stop.bind(this));
                },
                start: function (e) {
                    if (currentAct != act.PEN) return;
                    this.ctx.beginPath();
                    skin_anno_data_history.saveState(this.canvas);
                    this.drawing = true;
                },
                stroke: function (e) {
                    if (currentAct != act.PEN) return;

                    if (this.drawing) {
                        let rect = skin_anno_data_canvas.getBoundingClientRect();

                        var x = e.clientX - rect.left;
                        var y = e.clientY - rect.top;

                        this.ctx.lineTo(x, y);
                        this.ctx.stroke(); // draw line
                        this.ctx.beginPath();
                        this.ctx.moveTo(x, y);
                    }
                },
                stop: function (e) {
                    if (currentAct != act.PEN) return;

                    if (this.drawing) {
                        this.drawing = false;
                        this.ctx.beginPath();
                    }
                    var image = document.getElementById("skin_anno_data_canvas").toDataURL("image/png");
                    
                    document.getElementById("skin_anno_data_base64").value = image;
                }
            };

            const act = { PEN: 1, NOTE: 2 };
            Object.freeze(act);

            let currentAct;

            $('#skin_anno_data_pencil').click(function () {
                currentAct = act.PEN;
                skin_anno_data_pencil.init(skin_anno_data_canvas, ctx);
            });

            $('#skin_anno_data_undo').click(function () {
                skin_anno_data_history.undo(skin_anno_data_canvas, ctx);
            });

            $('#skin_anno_data_redo').click(function () {
                skin_anno_data_history.redo(skin_anno_data_canvas, ctx);
            });
        };
    </script>

    <script>

        load_pain_annotation_Image();
        load_skin_anno_data_Image();
        formGroup_init();
        checkboxRadiobutton_init();
        InputFilter("data-type='number'");
        InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
        if (document.getElementById('txt_vs_bmi') != null) { setbmiStr(document.getElementById('txt_vs_bmi').value); }

        function beforeAsyncPostBack() {
            var curtime = new Date();
            
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter("data-type='number'");
            InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
            if (document.getElementById('txt_vs_bmi') != null) { setbmiStr(document.getElementById('txt_vs_bmi').value); }

            load_pain_annotation_Image();

            load_skin_anno_data_Image();
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

        function print_document() {
            let print_page = document.querySelector("#print_page");
            print_page.style.display = "block";
            setTimeout(() => { print_page.style.display = "none"; }, 100);
            window.print();
        }

        function btnPrint_Click() {
            //let printContent = document.querySelector("#printContent");
            //printContent.setAttribute("style", "display: block");

            //let total = Math.ceil(printContent.offsetHeight / 1021);

            //for (let i = 1; i <= total; i++) {
            //    let div = document.createElement("div");
            //    div.setAttribute("class", "watermark page");
            //    div.setAttribute("style", "top: " + (1173 * (i - 1)) + "px");
            //    div.setAttribute("data-page", "Page " + i + " of " + total);
            //    document.getElementById("print_content").append(div);
            //}

            //setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);

            window.print();
        }
    </script>

</body>
</html>
