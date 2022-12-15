<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdmissionRequest.aspx.cs" Inherits="EMR.AdmissionRequest" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/DateTime.ascx" TagPrefix="webUI" TagName="DateTime" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="aih" TagName="Line" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="webUI" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="aih" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature2.ascx" TagPrefix="aih" TagName="Signature2" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtDate.ascx" TagPrefix="aih" TagName="PrtDate" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/UserControls/UserControlPatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style>
        @page {
            /*margin-left: 65px; 
	        margin-right: 20px;*/

/*            margin-left: 1.8cm; 
	        margin-right: 1.5cm;*/
        }
        .cursor-wait {
            pointer-events: none;
            background-color: #007bff;
            border-color: #007bff;
            opacity: .65;
        }
        #print_content {
		    line-height: initial !important;
	    }
        .font-10 {
            font-size: 10pt  !important;
        }
    </style>
    <link href="../styles/telerik-custom.css" rel="stylesheet" />

    <style>
        .subtitle {
            color: #0070c0 !important;
            font-style: italic;
        }
        .font-9 {
            font-size: 9pt;
        }
        .font-10 {
            font-size: 10pt;
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
        #print_content {
		    line-height: initial !important;
	    }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <%-- Print page --%>
        <asp:UpdatePanel runat="server" ID="uplPrintPage">
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
                                                <div class="font-12 font-bold">PHIẾU YÊU CẦU NHẬP VIỆN</div>
                                                <div class="font-11 font-bold subtitle">ADMISSION REQUEST</div>
                                            </div>
                                            <div style="width: 150px; text-align: center; font-size: 11px"></div>
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
                                    <div class="main font-11" runat="server" id="print_content" style="margin: 0 1.5cm 0 2cm;">
                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div class="font-bold">A.</div>
                                            <div>
                                                <div class="font-bold">Thông tin người bệnh (Hoàn tất bởi nhân viên phụ trách nhập viện nhập viện)</div>
                                                <div class="subtitle font-10">Patient information (To be completed by the Admission officer)</div>
                                            </div>
                                        </div>
                                        
                                        <div style="display: grid; grid-template-columns: 18px 1fr; margin-bottom: 6px">
                                            <div></div>
                                            <div class="font-10 pl-2 pr-2" style="border: 1px dashed #000; line-height: 2; margin-right: 20px; width: 260px">
                                                <div>Họ tên: <asp:Label runat="server" ID="prt_patient_name"/></div>
                                                <div>Ngày sinh: <asp:Label runat="server" ID="prt_dob"/></div>
                                                <div>Giới tính: <asp:Label runat="server" ID="prt_gender"/></div>
                                                <div>PID: <asp:Label runat="server" ID="prt_pid"/></div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div class="font-bold">B.</div>
                                            <div>
                                                <div><span class="font-bold">Thông tin y khoa (Hoàn tất bởi Bác sĩ chỉ định nhập viện)</span></div>
                                                <div><span class="subtitle font-10">Medical information (To be completed by the Admitting doctor)</span></div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div>•</div>
                                            <div>BS chỉ định nhập viện/ <span class="subtitle font-10">Admitting doctor: </span><asp:Label runat="server" ID="prt_admitting_doctor"/></div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div>•</div>
                                            <div>Thời gian nhập viện/ <span class="subtitle font-10">Time of admission: </span><asp:Label runat="server" ID="prt_time_of_admission"/></div>
                                        </div>
                                        
                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div>•</div>
                                            <div>Chẩn đoán nhập viện/ <span class="subtitle font-10">Diagnosis on admission: </span><asp:Label runat="server" ID="prt_diagnosis_on_admission"/></div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div>•</div>
                                            <div>Thời gian điều trị dự kiến/ <span class="subtitle font-10">Expected duration of hospitalization: </span><asp:Label runat="server" ID="prt_expected_duration_hospital"/></div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div>•</div>
                                            <div style="display: grid; grid-template-columns: 320px 100px 1fr">
                                                <div>Yêu cầu sử dụng phòng cách ly/ <span class="subtitle font-10">Isolation request: </span></div>
                                                <div><asp:Label runat="server" ID="prt_isolation_request_n" Text="❏"></asp:Label> Không/ <span class="subtitle font-10">No</span></div>
                                                <div><asp:Label runat="server" ID="prt_isolation_request_y"  Text="❏"></asp:Label> Có/ <span class="subtitle font-10">Yes</span></div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div>•</div>
                                            <div>Khoa/ phòng nhận bệnh nhập viện/ <span class="subtitle font-10">Admission department: </span></div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div></div>
                                            <div style="display: grid; grid-template-columns: 18px 1fr 18px 1fr 18px 1fr;">
                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_admission_department_code_day" Text="❏"></asp:Label></div>
                                                <div>
                                                    <div><span class="font-bold">Khoa điều trị trong ngày</span></div>
                                                    <div><span class="subtitle font-10">Daycare ward</span></div>
                                                </div>

                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_admission_department_code_med"  Text="❏"></asp:Label></div>
                                                <div>
                                                    <div><span class="font-bold">Khoa Nội</span></div>
                                                    <div><span class="subtitle font-10">Medical ward</span></div>
                                                </div>

                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_admission_department_code_sur"  Text="❏"></asp:Label> </div>
                                                <div>
                                                    <div><span class="font-bold">Khoa ngoại</span></div>
                                                    <div><span class="subtitle font-10">Surgery ward</span></div>
                                                </div>

                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_admission_department_code_obg" Text="❏"></asp:Label></div>
                                                <div>
                                                    <div><span class="font-bold">Khoa sản</span></div>
                                                    <div><span class="subtitle font-10">OBG ward</span></div>
                                                </div>

                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_admission_department_code_icu"  Text="❏"></asp:Label></div>
                                                <div>
                                                    <div><span class="font-bold">Hồi sức tích cực</span></div>
                                                    <div><span class="subtitle font-10">ICU</span></div>
                                                </div>

                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_admission_department_code_ped"  Text="❏"></asp:Label> </div>
                                                <div>
                                                    <div><span class="font-bold">Nhi khoa</span></div>
                                                    <div><span class="subtitle font-10">Pediatric ward</span></div>
                                                </div>

                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_admission_department_code_del" Text="❏"></asp:Label></div>
                                                <div>
                                                    <div><span class="font-bold">Phòng sanh</span></div>
                                                    <div><span class="subtitle font-10">Delivery suite</span></div>
                                                </div>

                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_admission_department_code_ope"  Text="❏"></asp:Label></div>
                                                <div>
                                                    <div><span class="font-bold">Phòng mổ</span></div>
                                                    <div><span class="subtitle font-10">Operating Theatre/OT</span></div>
                                                </div>

                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_admission_department_code_oth"  Text="❏"></asp:Label> </div>
                                                <div>
                                                    <div><span class="font-bold">Khác</span>:<asp:Label runat="server" ID="prt_admission_department_other"></asp:Label></div>
                                                    <div><span class="subtitle font-10">Other</span></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div>•</div>
                                            <div>
                                                <div>BS phụ trách điều trị nội trú/ <span class="subtitle font-10">Primary doctor: </span><asp:Label runat="server" ID="prt_primary_doctor"></asp:Label></div>
                                                <div>(Trước khi hoàn tất chỉ định nhập viện cho NB, Bác sĩ chỉ định phải liên hệ, trao đổi với BS phụ trách điều trị nội trú để bàn giao, thống nhất kế hoạch chỉ định nhập viện cho NB/ <span class="subtitle font-10">Before completing Admission Request for patient, the doctor who gives request must contact and discuss with attending doctor who is responsible for inpatient care to handover, concur admission plan for patient)</span></div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div class="font-bold">C.</div>
                                            <div style="display: grid; grid-template-columns: 280px 100px 1fr;">
                                                <div><span class="font-bold">Chỉ định phẫu thuật</span>/ <span class="subtitle font-10">For surgical cases:</span></div>
                                                <div><asp:Label runat="server" ID="prt_for_surgical_cases_n"  Text="❏"></asp:Label> Không/ <span class="subtitle font-10">No</span></div>
                                                <div><asp:Label runat="server" ID="prt_for_surgical_cases_y"  Text="❏"></asp:Label> Có/ <span class="subtitle font-10">Yes</span></div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div></div>
                                            <div>
                                                <div>
                                                    Tên phẫu thuật, thủ thuật dự kiến thực hiện/ <span class="subtitle font-10">Name of expected surgery/procedure:</span> 
                                                    <asp:Label runat="server" ID="prt_name_of_expected" ></asp:Label>
                                                </div>
                                                <div>
                                                    (Nếu NB có chỉ định thực hiện phẫu thuật/ thủ thuật, vui lòng hoàn tất Phiếu đặt lịch phòng mổ/ <span class="subtitle font-10">Please kindly complete "Booking for surgery/procedure" form if patient has surgery/procedure request order)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div class="font-bold">D.</div>
                                            <div style="display: grid; grid-template-columns: 120px 80px 1fr;">
                                                <div>
                                                    <div class="font-bold">Thông tin khác</div>
                                                    <div class="subtitle font-10">Other information:</div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 18px auto">
                                                    <div><asp:Label CssClass="align-top" runat="server" ID="prt_other_information_code_n"  Text="❏"></asp:Label></div>
                                                    <div>
                                                        <div>Không</div>
                                                        <div class="subtitle font-10">No</div>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 18px auto 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" ID="prt_other_information_code_y"  Text="❏"></asp:Label></div>
                                                    <div>
                                                        <div>Có, vui lòng ghi rõ:</div>
                                                        <div class="subtitle font-10">Yes, specify</div>
                                                    </div>
                                                    <div><asp:Label runat="server" ID="prt_other_information_specify"></asp:Label></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 18px 1fr;">
                                            <div class="font-bold">E.</div>
                                            <div style="display: grid; grid-template-columns: 120px 80px 1fr;">
                                                <div>
                                                    <div class="font-bold">Yêu cầu thêm</div>
                                                    <div class="subtitle font-10">Special request:</div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 18px auto">
                                                    <div><asp:Label CssClass="align-top" runat="server" ID="prt_special_request_code_n"  Text="❏"></asp:Label></div>
                                                    <div>
                                                        <div>Không</div> 
                                                        <div class="subtitle font-10">No</div>
                                                    </div>
                                                </div>
                                                <div class="d-grid" style="grid-template-columns: 18px auto 1fr">
                                                    <div><asp:Label CssClass="align-top" runat="server" ID="prt_special_request_code_y"  Text="❏"></asp:Label></div>
                                                    <div>
                                                        <div>Có, vui lòng ghi rõ:</div>
                                                        <div class="subtitle font-10">Yes, specify</div>
                                                    </div>
                                                    <div><asp:Label runat="server" ID="prt_special_request_specify"></asp:Label></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>&nbsp;</div>
                                        <div class="d-grid" style="grid-template-columns: 1fr 400px">
                                            <div></div>
                                            <div class="text-center avoid-page-break">
                                                <div>Ngày, giờ chỉ định/ <span class="subtitle font-10">Date, time request: </span><asp:Label runat="server" ID="prt_time_request"></asp:Label></div>
                                                <div class="font-bold">Bác sĩ chỉ định/ <span class="subtitle">Admitting doctor</span></div>
                                                <div>(Họ tên, chữ ký, MSNV/<span class="subtitle">Name, signature & ID)</span></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_signature1"></asp:Label>
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
        <%-- Select print language --%>
        <div class="cssclsNoPrint" >
            <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd;border-radius:0;">
                <li><asp:LinkButton OnClick="RedirectToPatientSummary" runat="server" ID="btnHome" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                <li>Admission Request</li>
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
                <div class="card">
                    <div class="card-header">
                        <h4 class="text-primary">Admission Request</h4>
                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                    </div>
                    <div class="card-body collapse show" id="collapseOne">
                        <div class="form-body">
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
                            <div></div>
                            <div class="font-weight-bold">A. Thông tin người bệnh (Hoàn tất bởi nhân viên phụ trách nhập viện nhập viện)/ <span class="text-primary">Patient information (To be completed by the Admission officer)</span></div>
                            <div class="font-weight-bold">B. Thông tin y khoa (Hoàn tất bởi Bác sĩ chỉ định nhập viện)/ <span class="text-primary">Medical information (To be completed by the Admitting doctor)</span></div>
                            <div>• BS chỉ định nhập viện/ <span class="text-primary">Admitting doctor</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_admitting_doctor" />
                                    <webUI:TextField runat="server" ID="txt_admitting_doctor" />
                                </div>
                            </div>
                            <div>• Thời gian nhập viện/ <span class="text-primary">Time of admission</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_time_of_admission" />
                                    <telerik:RadDateTimePicker Width="180px" ID="dtpk_time_of_admission" runat="server" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                </div>
                            </div>
                            <div>• Chẩn đoán nhập viện/ <span class="text-primary">Diagnosis on admission</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_diagnosis_on_admission" />
                                    <webUI:TextField runat="server" ID="txt_diagnosis_on_admission" />
                                </div>
                            </div>
                            <div>• Thời gian điều trị dự kiến/ <span class="text-primary">Expected duration of hospitalization</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_expected_duration_hospital" />
                                    <webUI:TextField runat="server" ID="txt_expected_duration_hospital" />
                                </div>
                            </div>
                            <div>• Yêu cầu sử dụng phòng cách ly / <span class="text-primary">Isolation request</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_isolation_request" />
                                <div runat="server" id="isolation_request_wrapper">
                                    <div class="custom-control custom-radio d-inline-block">
                                        <input type="radio" onchange="radioButtonChange(this)" runat="server" id="rad_isolation_request_n" name="rad_isolation_request" class="custom-control-input" />
                                        <label class="custom-control-label" for="rad_isolation_request_n">Không/ <span class="text-primary">No</span></label>
                                    </div>
                                    <div class="custom-control custom-radio d-inline-block">
                                        <input onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_isolation_request_y" name="rad_isolation_request" class="custom-control-input" />
                                        <label class="custom-control-label" for="rad_isolation_request_y">Có/ <span class="text-primary">Yes</span></label>
                                    </div>
                                </div>
                            </div>
                            <div>• Khoa/ phòng nhận bệnh nhập viện/ <span class="text-primary">Admission department</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_admission_department" />
                                <div runat="server" id="admission_department_wrapper">
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('admission_department_code','DAY')" type="radio" runat="server" id="rad_admission_department_code_day" name="rad_admission_department_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admission_department_code_day"><span class="font-weight-bold">Khoa điều trị trong ngày</span>/ <span class="text-primary">Daycare ward</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('admission_department_code','MED')" type="radio" runat="server" id="rad_admission_department_code_med" name="rad_admission_department_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admission_department_code_med"><span class="font-weight-bold">Khoa Nội</span>/ <span class="text-primary">Medical ward</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('admission_department_code','SUR')" type="radio" runat="server" id="rad_admission_department_code_sur" name="rad_admission_department_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admission_department_code_sur"><span class="font-weight-bold">Khoa ngoại</span>/ <span class="text-primary">Surgery ward</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('admission_department_code','OBG')" type="radio" runat="server" id="rad_admission_department_code_obg" name="rad_admission_department_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admission_department_code_obg"><span class="font-weight-bold">Khoa sản</span>/ <span class="text-primary">OBG ward</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('admission_department_code','ICU')" type="radio" runat="server" id="rad_admission_department_code_icu" name="rad_admission_department_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admission_department_code_icu"><span class="font-weight-bold">Hồi sức tích cực</span>/ <span class="text-primary">ICU</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('admission_department_code','PED')" type="radio" runat="server" id="rad_admission_department_code_ped" name="rad_admission_department_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admission_department_code_ped"><span class="font-weight-bold">Nhi khoa</span>/ <span class="text-primary">Pediatric ward</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('admission_department_code','DEL')" type="radio" runat="server" id="rad_admission_department_code_del" name="rad_admission_department_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admission_department_code_del"><span class="font-weight-bold">Phòng sanh</span>/ <span class="text-primary">Delivery suite</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('admission_department_code','OPE')" type="radio" runat="server" id="rad_admission_department_code_ope" name="rad_admission_department_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admission_department_code_ope"><span class="font-weight-bold">Phòng mổ</span>/ <span class="text-primary">Operating Theatre/OT</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('admission_department_code','OTH')" type="radio" runat="server" id="rad_admission_department_code_oth" name="rad_admission_department_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admission_department_code_oth"><span class="font-weight-bold">Khác</span>/ <span class="text-primary">Other</span></label>
                                            </div>
                                            <div runat="server" id="admission_department_other_wrapper">
                                                <webUI:TextField runat="server" ID="txt_admission_department_oth" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>

                            <div>• BS phụ trách điều trị nội trú/ <span class="text-primary">Primary doctor</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_primary_doctor" />
                                    <webUI:TextField runat="server" ID="txt_primary_doctor" />
                                </div>
                            </div>
                            <div>
                                (Trước khi hoàn tất chỉ định nhập viện cho NB, Bác sĩ chỉ định phải liên hệ, trao đổi với BS phụ trách điều trị nội trú để bàn giao, thống nhất kế hoạch chỉ định nhập viện cho NB/ <span class="text-primary">Before completing Admission Request for patient, the doctor who gives request must contact and discuss with attending doctor who is responsible for inpatient care to handover, concur admission plan for patient)</span>
                            </div>
                            <div><span class="font-weight-bold">C. Chỉ định phẫu thuật</span>/ <span class="text-primary">For surgical cases</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_for_surgical_cases" />
                                <div runat="server" id="for_surgical_cases_wrapper">
                                    <div class="custom-control custom-radio d-inline-block">
                                        <input type="radio" onchange="radioButtonChange(this)" runat="server" id="rad_for_surgical_cases_n" name="rad_for_surgical_cases" class="custom-control-input" />
                                        <label class="custom-control-label" for="rad_for_surgical_cases_n">Không/ <span class="text-primary">No</span></label>
                                    </div>
                                    <div class="custom-control custom-radio d-inline-block">
                                        <input disabled-for="allergy_field" onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_for_surgical_cases_y" name="rad_for_surgical_cases" class="custom-control-input" />
                                        <label class="custom-control-label" for="rad_for_surgical_cases_y">Có/ <span class="text-primary">Yes</span></label>
                                    </div>
                                </div>
                            </div>
                            <div>Tên phẫu thuật, thủ thuật dự kiến thực hiện/ <span class="text-primary">Name of expected surgery/procedure</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_name_of_expected" />
                                    <webUI:TextField runat="server" ID="txt_name_of_expected" />
                                </div>
                            </div>
                            <div>
                                (Nếu NB có chỉ định thực hiện phẫu thuật/ thủ thuật, vui lòng hoàn tất Phiếu đặt lịch phòng mổ/ <span class="text-primary">Please kindly complete "Booking for surgery/procedure" form if patient has surgery/procedure request order)</span>
                            </div>
                            <div><span class="font-weight-bold">D. Thông tin khác</span>/ <span class="text-primary">Other information</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_other_information" />
                                <div runat="server" id="other_information_wrapper">
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('other_information_code','N')" type="radio" runat="server" id="rad_other_information_code_n" name="rad_other_information_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_other_information_code_n">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('other_information_code','Y')" type="radio" runat="server" id="rad_other_information_code_y" name="rad_other_information_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_other_information_code_y">Có/ <span class="text-primary">Yes</span>, vui lòng ghi rõ/ <span class="text-primary">specify:</span></label>
                                            </div>
                                            <div runat="server" id="other_information_specify_wrapper">
                                                <webUI:TextField runat="server" ID="txt_other_information_specify" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div><span class="font-weight-bold">E. Yêu cầu thêm</span>/ <span class="text-primary">Special request</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_special_request" />
                                <div runat="server" id="special_request_wrapper">
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('special_request_code','N')" type="radio" runat="server" id="rad_special_request_code_n" name="rad_special_request_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_special_request_code_n">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('special_request_code','Y')" type="radio" runat="server" id="rad_special_request_code_y" name="rad_special_request_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_special_request_code_y">Có/ <span class="text-primary">Yes</span>, vui lòng ghi rõ/ <span class="text-primary">specify:</span></label>
                                            </div>
                                            <div runat="server" id="special_request_specify_wrapper">
                                                <webUI:TextField runat="server" ID="txt_special_request_specify" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-12">
                                    <div class="form-actions" style="display: flex; gap: 6px">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                            <ContentTemplate>
                                                <asp:LinkButton OnClick="CompleteDocument1" ValidationGroup="Group2" runat="server"  ID="btnComplete" CssClass="btn btn-primary">Complete</asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:LinkButton OnClick="SaveDocument" ValidationGroup="Group1"  ID="btnSave" runat="server" CssClass="btn btn-primary">Save</asp:LinkButton>
                                        <asp:UpdatePanel runat="server" ID="uplPrintDocument">
                                            <ContentTemplate>
                                                <asp:LinkButton OnClick="DeleteDocument" runat="server" ID="btnDelete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:LinkButton OnClick="AmendDocument" runat="server"  ID="btnAmend" CssClass="btn btn-secondary">Amend</asp:LinkButton>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                            <ContentTemplate>
                                                <asp:LinkButton runat="server" OnClick="PrintDocument" ID="btnPrint" CssClass="btn btn-secondary">Print</asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:LinkButton OnClick="CancelAmendDocument" runat="server"  ID="btnCancel" CssClass="btn btn-secondary">Cancel</asp:LinkButton>
                                    </div>
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
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>
    <script type="text/javascript">
        function print_document() {
            //var print_header = document.getElementById("print_header");
            //var height = print_header.style.height.substring(0, print_header.style.height.length - 2);
            //console.log(height);
            //var newHeight = parseFloat(height);

            //console.log(newHeight);

            //print_header.style.height = newHeight + "px";

            //console.log(print_header.style.height);

            let print_page = document.querySelector("#print_page");
            print_page.style.display = "block";
            setTimeout(() => { print_page.style.display = "none"; }, 100);
            window.print();
        }
        function show_window(rwndID) {
            var oWnd = $find(rwndID);
            oWnd.show();
        }
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
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
            setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);
            window.print();
        }
    </script>
</body>
</html>
