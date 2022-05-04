<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InpIniMedAss.aspx.cs" Inherits="EMR.InpIniMedAss" ValidateRequest="false" %>

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

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print.css" rel="stylesheet" />
    <style>
        @media print {
            .page:after {
                bottom: 3px;
            }

            .watermark {
                height: 945px;
            }
        }

        .v20:after {
           content: 'Version: 2.0';
            font-size: 10px;
            color: #343a40;
            position: absolute;
            right: 10px;
            bottom: 4px;
        }

        .dg {
            display: grid;
            width: 100%;
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
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="UpPrintForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="printContent">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img width="200" src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>BỆNH ÁN NỘI TRÚ</h4>
                                            <h5>INPATIENT INITIAL MEDICAL ASSESSMENT</h5>
                                        </div>
                                        <div style="width: 160px; text-align: left; font-size: 11px">
                                            <div runat="server" id="prt_fullname"></div>
                                            <div runat="server" id="prt_gender"></div>
                                            <div class="d-block" runat="server" id="prt_DOB"></div>
                                            <div runat="server" id="prt_vpid" class="d-block font-bold"></div>
                                            <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
                                        </div>
                                    </div>
                                    <div style="height: 25px">
                                        <span style="width: 190px; border-bottom-style: solid; border-bottom-color: #e20e5a; border-bottom-width: 5px; display: inline-block; font-size: 26.6667px;"></span>
                                        <span style="display: inline-block; border-bottom-style: solid; border-bottom-color: #007297; border-bottom-width: 5px; width: calc(100% - 191px); margin-left: -5px;"></span>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div style="position: relative" class="main" runat="server" id="print_content">
                                        <img style="height: 1px" src="../images/logo-opacity.png" />
                                        
                                        <div class="mb-1">
                                            <b>I. Lí do nhập viện</b>/ Reason for admission: <asp:Label runat="server" ID="prt_chief_complaint"/>
                                        </div>

                                        <div class="mb-1">
                                            <b>II. Bệnh sử</b>/ Medical history:
                                        </div>

                                        <div class="mb-1">
                                            <b>1. Bệnh sử hiện tại</b>/ Current medical history: <asp:Label runat="server" ID="prt_cur_med_history"/>
                                        </div>

                                        <div class="mb-1">
                                            <b>* Thuốc đang sử dụng</b>/ Current medications: <asp:Label runat="server" ID="prt_cur_medication"/>
                                        </div>

                                        <div class="mb-1">
                                            <b>2. Tiền sử bệnh</b>/ Antecedent medical history:
                                        </div>

                                        <div class="mb-1" style="margin-left: 10px">
                                            <b>- Bản thân</b>/ Personal: <asp:Label runat="server" ID="prt_personal"/>
                                        </div>

                                        <div class="row mb-2 " style="margin-left: 10px">
                                            <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                                <asp:Label runat="server"> Đã từng nhiễm COVID-19 trong vòng 6 tháng qua</span>/ <span class="text-primary">Have been infected with COVID-19 within the last 6 months:</span> </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 " style="margin-left: 10px">
                                            <div  class="col-12 ">
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_infected_with_covid_true" Text="❏"/>&nbsp;Có/ Yes
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_infected_with_covid_false" Text="❏"/>&nbsp;Không/ No
                                            </div>
                                        </div>

                                        <div class="row mb-2 " style="margin-left: 10px">
                                            <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                                <asp:Label runat="server">Tiền sử tiêm chủng</span>/ <span class="text-primary">Immunization history:</span> </asp:Label>
                                            </div>
                                            <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                                <asp:Label runat="server">• Tiêm vắc xin phòng COVID-19/ <span class="text-primary">COVID-19 vaccination:</span> </asp:Label>
                                            </div>
                                            <div  class="col-12 ">
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_received_1_dose_true" Text="❏"/>&nbsp;Đã tiêm mũi 1/ <span class="text-primary">Received 1<sup>st</sup> dose</span>
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_received_2_dose_true" Text="❏"/>&nbsp;Đã tiêm mũi 2/ <span class="text-primary">Received 2<sup>nd</sup> dose</span>
                                            </div>
                                            <div  class="col-12 ">
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_received_additional_true" Text="❏"/>&nbsp;Đã tiêm mũi bổ sung, nhắc lại/ <span class="text-primary">Received additional, booster dose</span>
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_not_yet_vaccinations_true" Text="❏"/>&nbsp;Chưa tiêm/ <span class="text-primary">Not yet</span>
                                            </div>
                                        </div>

                                        <div class="row mb-2 " style="margin-left: 10px">
                                            <div  class="col-12 ">
                                                <asp:Label runat="server" ID="prt_immunization"/>
                                            </div>
                                        </div>

                                        <div class="mb-1" style="margin-left: 20px">
                                            • Thói quen/ Habits:
                                        </div>

                                        <div class="mb-1 d-grid" style="grid-template-columns: 150px 1fr; margin-left: 10px">
                                            Hút thuốc lá/ Smoking: <asp:Label runat="server" ID="prt_habits_smoking"/>
                                        </div>

                                        <div class="mb-1 d-grid" style="grid-template-columns: 150px 1fr; margin-left: 10px">
                                            Uống rượu/ Alcohol: <asp:Label runat="server" ID="prt_habits_alcohol"/>
                                        </div>

                                        <div class="mb-1 d-grid" style="grid-template-columns: 150px 1fr; margin-left: 10px">
                                            Chất gây nghiện/ Drugs: <asp:Label runat="server" ID="prt_habits_drugs"/>
                                        </div>

                                        <div class="mb-1" style="margin-left: 10px">
                                            Tập thể dục thường xuyên/ Regular physical exercise:
                                        </div>

                                        <div class="mb-1 d-grid" style="grid-template-columns: 150px 1fr; margin-left: 10px">
                                            <div></div>
                                            <asp:Label runat="server" ID="prt_habits_physical_exercise"/>
                                        </div>

                                        <div class="mb-1" style="margin-left: 10px">
                                            <asp:Label runat="server" ID="prt_habits_other"/>
                                        </div>

                                        <div class="mb-1 d-grid" style="grid-template-columns: 150px 1fr; margin-left: 10px">
                                            Tiền sử dị ứng/ Allergy: <asp:Label runat="server" ID="prt_allergy"/>
                                        </div>

                                        <div class="mb-1" style="margin-left: 10px">
                                            <b>- Gia đình</b>/ Family: <asp:Label runat="server" ID="prt_family"/>
                                        </div>

                                        <div class="mb-1">
                                            <b>III. Khám bệnh</b>/ Physical Examination:
                                        </div>

                                        <div class="mb-1" style="margin-left: 20px">
                                            <b>DẤU HIỆU SINH TỒN</b>/ VITAL SIGNS
                                        </div>

                                        <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%;">
                                            <tr>
                                                <td class="p-2">Nhiệt độ/ Temperature (C degree)</td>
                                                <td class="p-2 text-right" style="width: 100px;">
                                                    <asp:Label runat="server" ID="prt_vs_temperature" /></td>
                                                <td class="p-2">Nhịp tim/ Heart rate (/min)</td>
                                                <td class="p-2 text-right" style="width: 100px;">
                                                    <asp:Label runat="server" ID="prt_vs_heart_rate" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Cân nặng/ Weight (Kg)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_weight" /></td>
                                                <td class="p-2">Nhịp thở/ Respiratory Rate (/min)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_respiratory_rate" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chiều cao/Height (cm)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_height" /></td>
                                                <td class="p-2">Huyết áp/Blood pressure (mmHg)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_blood_pressure" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chỉ số khối cơ thể/ BMI (Kg/m2)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_BMI" /></td>
                                                <td class="p-2">Độ bão hòa Oxy/ SpO2 (%)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_spO2" /></td>
                                            </tr>
                                        </table>

                                        <div class="mb-1" style="margin-left: 20px">
                                            <asp:Label runat="server" ID="prt_physical_exam"/>
                                        </div>

                                        <div class="mb-1 d-grid" style="grid-template-columns: auto 1fr; margin-left: 10px">
                                            <div><b>❖ Yêu cầu khám chuyên khoa tâm lý</b>/ Psychological consultation required:&nbsp;</div>
                                            <asp:Label runat="server" ID="prt_psy_consul_required"/>
                                        </div>

                                        <div class="mb-1">
                                            <b>IV. Chỉ định và kết quả xét nghiệm</b>/ Laboratory indications and results:
                                        </div>

                                        <div class="mb-1" style="margin-left: 20px">
                                            <asp:Label runat="server" ID="prt_laboratory_result"/>
                                        </div>

                                        <div class="mb-1" style="margin-left: 20px">
                                            <asp:Label runat="server" ID="prt_add_investigation"/>
                                        </div>

                                        <div class="mb-1">
                                            <b>V. Kết luận</b>/ Conclusion:
                                        </div>
                            
                                        <div class="mb-1 d-grid" style="grid-template-columns: auto 1fr; margin-left: 20px">
                                            <div>Chẩn đoán ban đầu/ Initial diagnosis:&nbsp;</div>
                                            <asp:Label runat="server" ID="prt_initial_diagnosis"/>
                                        </div>

                                        <div class="mb-1 d-grid" style="grid-template-columns: auto 1fr; margin-left: 20px">
                                            <div>Chẩn đoán phân biệt/ Differential diagnosis:&nbsp;</div>
                                            <asp:Label runat="server" ID="prt_diff_diagnosis"/>
                                        </div>

                                        <div class="mb-1 d-grid" style="grid-template-columns: auto 1fr; margin-left: 20px">
                                            <div>Bệnh kèm theo/ Associated conditions:&nbsp;</div>
                                            <asp:Label runat="server" ID="prt_associated_conditions"/>
                                        </div>

                                        <div class="mb-1 d-grid" style="grid-template-columns: auto 1fr; margin-left: 20px">
                                            <div>Kế hoạch điều trị/ Treatment Plan:&nbsp;</div>
                                            <asp:Label runat="server" ID="prt_treatment_plan"/>
                                        </div>

                                        <div class="mb-1 d-grid" style="grid-template-columns: auto 1fr; margin-left: 20px">
                                            <div>Kế hoạch xuất viện/ Discharge plan:&nbsp;</div>
                                            <asp:Label runat="server" ID="prt_discharge_plan"/>
                                        </div>

                                        <div class="mt-4" style="margin-left: 20px">
                                            <div>Ngày giờ/ Date & time: <asp:Label runat="server" ID="prt_signature_date"/></div>
                                            <div>Họ tên bác sĩ và mã số nhân viên/ Doctor's name and ID:</div>
                                            <div>Chữ ký/ Signature</div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell">
                                    <img style="width: 100%" src="../images/ExcellentCare.png" />
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

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" MaxHeight="400">
                    <Windows>
                        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" Title="Version History" runat="server">
                            <ContentTemplate>
                                <telerik:RadGrid ShowHeader="false" ID="RadGrid1" runat="server" AllowSorting="true" OnItemCommand="RadGrid1_ItemCommand">
                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id,document_log_id">
                                        <Columns>
                                            <telerik:GridTemplateColumn>
                                                <ItemTemplate>
                                                    <telerik:RadLabel runat="server" ID="RadLabel1" Text='<%# GetHistoryName(Eval("status"),Eval("created_name_e"), Eval("created_date_time"), Eval("modified_name_e"), Eval("modified_date_time"), Eval("amend_reason")) %>'>
        </telerik:RadLabel>
                                           
                                                    <asp:HyperLink CssClass="btn-link" Text="View Log" runat="server" NavigateUrl='<%# GetLogUrl(Eval("document_log_id")) %>'></asp:HyperLink>
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
                        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow2" Title="Warning" runat="server">
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
                        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow3" Title="Warning" runat="server">
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
                      <li>Inpatient Initial Medical Assessment</li>
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

                            <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
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
                            <div class="col-lg-12">
                                <div class="card mt-2 v20">
                                    <div class="card-header">
                                        <h4 class="text-primary">INPATIENT INITIAL MEDICAL ASSESSMENT</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="currentLog">
                                                        <span class="mr-2">You are viewing an old version of this document</span>
                                                        <asp:HyperLink OnLoad="LinkViewLastestVersion_Load" ID="HyperLink1" CssClass="btn-link" Text="View Latest Version" runat="server" />
                                                    </div>

                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <telerik:RadLabel runat="server" ID="RadLabel1" />
                                                        <a class="btn-link" href="javascript:void(0)" onclick="showWindow('RadWindow1')">View History</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mb-1"><span class="font-bold">I. Lí do nhập viện</span>/ <span class="text-primary">Reason for admission:</span></div>
                                            
                                            <div class="dg gtc-1 mb-1">
                                                <div></div>
                                                <div>
                                                    <asp:Label CssClass="d-block" runat="server" ID="lbl_chief_complaint"></asp:Label>
                                                    <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mb-1"><span class="font-bold">II. Bệnh sử</span>/ <span class="text-primary">Medical History:</span></div>

                                            <div class="mb-1"><span class="font-bold">1. Bệnh sử hiện tại</span>/ <span class="text-primary">Current Medical History:</span></div>

                                            <div class="dg gtc-1 mb-1">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_cur_med_history"></asp:Label>
                                                    <div class="form-group" runat="server" id="cur_med_history_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_cur_med_history" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mb-1"><span class="font-bold">Thuốc đang sử dụng</span>/ <span class="text-primary">Current medications:</span></div>
                                            
                                            <div class="dg gtc-1 mb-1">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_cur_medication"></asp:Label>
                                                    <div class="form-group" runat="server" id="cur_medication_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_cur_medication" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mb-1"><span class="font-bold">2. Tiền sử bệnh</span>/ <span class="text-primary">Antecedent Medical History:</span></div>

                                            <div>
                                                <div class="mb-1"><span class="font-bold">a. Bản thân</span>/ <span class="text-primary">Personal:</span></div>
                                                
                                                <div class="dg gtc-1 mb-1">
                                                    <div></div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_personal"></asp:Label>
                                                        <div class="form-group" runat="server" id="personal_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_personal" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="add-v20">
                                                    <label class="control-label"><span class="font-bold">• Đã từng nhiễm COVID-19 trong vòng 6 tháng qua</span>/ <span class="text-primary">Have been infected with COVID-19 within the last 6 months:</span></label>
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

                                                    <div class="mb-1"><label class="control-label"><span class="font-bold">• Tiền sử tiêm chủng</span>/ <span class="text-primary">Immunization history:</span></label></div>
                                            
                                                    <div>
                                                        <label class="control-label">- Tiêm vắc xin phòng COVID-19/ <span class="text-primary">COVID-19 vaccination:</span></label>
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

                                                        <div class="dg gtc-1 mb-2">
                                                            <label class="control-label">- Tiêm vắc xin khác (ghi rõ)/ <span class="text-primary">Other vaccinations (specify):</span></label>
                                                            <div>
                                                                <asp:Label runat="server" ID="lbl_immunization"></asp:Label>
                                                                <div class="form-group" runat="server" id="immunization_wrapper">
                                                                    <webUI:TextField runat="server" ID="txt_immunization" />
                                                                </div>
                                                                <%--<asp:Label runat="server" ID="lbl_other_vaccinations"></asp:Label>
                                                                <div class="form-group" runat="server" id="other_vaccinations_wrapper">
                                                                    <webUI:TextField runat="server" ID="txt_other_vaccinations" />
                                                                </div>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <label class="control-label"><span class="font-bold">• Habits</span>/ <span class="text-primary">Thói quen:</span></label>

                                                <div class="dg gtc-1 mb-1">
                                                    <label class="control-label mb-1">- Hút thuốc lá/ <span class="text-primary">Smoking:</span></label>
                                                
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_habits_smoking"></asp:Label>
                                                        <div class="form-group" runat="server" id="habits_smoking_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_habits_smoking_false" name="rad_habits_smoking" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_habits_smoking_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                <input disabled-for="habits_smoking_field" type="radio" runat="server" id="rad_habits_smoking_true" name="rad_habits_smoking" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_habits_smoking_true">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_habits_smoking" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare3" />
                                                                </a>
                                                            </div>
                                                            <div class="form-group habits_smoking_field">
                                                                <input runat="server" class="form-control" id="txt_habits_smoking_pack" data-type="number" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="dg gtc-1 mb-1">
                                                    <label class="control-label mb-1 mr-2">- Uống rượu/ <span class="text-primary">Alcohol:</span></label>
                                                
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_habits_alcohol"></asp:Label>
                                                        <div class="form-group" runat="server" id="habits_alcohol_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_habits_alcohol_false" name="rad_habits_alcohol" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_habits_alcohol_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                <input disabled-for="habits_alcohol_field" type="radio" runat="server" id="rad_habits_alcohol_true" name="rad_habits_alcohol" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_habits_alcohol_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_habits_alcohol" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare4" />
                                                                </a>
                                                            </div>
                                                            <div class="form-group habits_alcohol_field">
                                                                <webUI:TextField runat="server" ID="txt_habits_alcohol_note" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="dg gtc-1 mb-1">
                                                    <label class="control-label mb-1 mr-2">- Chất gây nghiện/ <span class="text-primary">Drugs:</span></label>

                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_habits_drugs"></asp:Label>
                                                        <div class="form-group" runat="server" id="habits_drugs_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_habits_drugs_false" name="rad_habits_drugs" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_habits_drugs_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                <input disabled-for="habits_drugs_field" type="radio" runat="server" id="rad_habits_drugs_true" name="rad_habits_drugs" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_habits_drugs_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_habits_drugs" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare5" />
                                                                </a>
                                                            </div>
                                                            <div class="form-group habits_drugs_field">
                                                                <webUI:TextField runat="server" ID="txt_habits_drugs_note" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="dg gtc-1 mb-1">
                                                    <label class="control-label mb-1 mr-2">- Tâp thê dục thường xuyên/ <span class="text-primary">Regular physical exercise:</span></label>
                                                
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_habits_physical_exercise"></asp:Label>
                                                        <div class="form-group" runat="server" id="habits_physical_exercise_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_habits_physical_exercise_false" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_habits_physical_exercise_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                <input disabled-for="habits_physical_exercise_field" type="radio" runat="server" id="rad_habits_physical_exercise_true" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_habits_physical_exercise_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_habits_physical_exercise" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare6" />
                                                                </a>
                                                            </div>
                                                            <div class="form-group habits_physical_exercise_field">
                                                                <webUI:TextField runat="server" ID="txt_habits_phy_exer_note" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="dg gtc-1 mb-1">
                                                    <div class="mb-1"><label class="control-label">- Khác, ghi rõ/ <span class="text-primary">Other, specify:</span></label></div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_habits_other"></asp:Label>
                                                        <div class="form-group" runat="server" id="habits_other_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_habits_other" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="dg gtc-1 mb-1">
                                                    <label class="control-label mb-2">- Tiền sử dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_allergy"></asp:Label>
                                                        <div class="form-group" runat="server" id="allergy_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio mb-1  d-inline-block">
                                                                <input disabled-for="allergy_field" type="radio" runat="server" id="rad_allergy_true" name="rad_allergy" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                <a href="javascript:void(0)"  data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare2" />
                                                                </a>
                                                            </div>
                                                        <div class="form-group allergy_field">
                                                            <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                        </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="mb-1"><span class="font-bold">b. Gia đình</span>/ <span class="text-primary">Family:</span></div>

                                                <div class="dg gtc-1 mb-1">
                                                    <div></div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_family"></asp:Label>
                                                        <div class="form-group" runat="server" id="family_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_family" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                           
                                            <div class="mb-1"><span class="font-bold">III. Khám bệnh</span>/ <span class="text-primary">Physical Examination:</span></div>
                                                 
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

                                            <div class="dg gtc-1 mb-1">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_physical_exam"></asp:Label>
                                                    <div class="form-group" runat="server" id="physical_exam_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_physical_exam" />
                                                    </div>
                                                </div>
                                            </div>

                                            <label class="control-label mb-1">❖ <span class="font-bold">Yêu cầu khám chuyên khoa tâm lý</span>/ <span class="text-primary">Psychological consultation required:</span></label>

                                            <div class="dg gtc-1 mb-1">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_psy_consul_required"></asp:Label>
                                                    <div class="form-group d-inline-block" runat="server" id="psy_consul_required_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_psy_consul_required_false" name="rad_psy_consul_required" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_psy_consul_required_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_psy_consul_required_true" name="rad_psy_consul_required" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_psy_consul_required_true">Có/ <span class="text-primary">Yes</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_psy_consul_required" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare1" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mb-2"><span class="font-bold">IV. Chỉ định và kết quả xét nghiệm</span>/ <span class="text-primary">Laboratory indications and results:</span></div>

                                            <div class="dg gtc-1 mb-1">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_laboratory_result"></asp:Label>
                                                    <div class="form-group" runat="server" id="laboratory_result_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_laboratory_result" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dg gtc-1 mb-1">
                                                <div><label class="control-label">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_add_investigation"></asp:Label>
                                                    <div class="form-group " runat="server" id="add_investigation_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_add_investigation" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mb-2"><span class="font-bold">V. Kết luận</span>/ <span class="text-primary">Conclusion:</span></div>

                                            <div class="dg gtc-1 mb-2">
                                                <div><label class="control-label">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_initial_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="initial_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dg gtc-1 mb-2">
                                                <div><label class="control-label">Chẩn đoán xác định/ <span class="text-primary">Diagnosis:</span></label></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
                                                                    <div class="form-group" runat="server" id="diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="dg gtc-1 mb-2">
                                                <div><label class="control-label">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_diff_diagnosis"></asp:Label>
                                                                    <div class="form-group" runat="server" id="diff_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_diff_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dg gtc-1 mb-2">
                                                <div><label class="control-label">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_associated_conditions"></asp:Label>
                                                    <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dg gtc-1 mb-2">
                                                <div><label class="control-label">Kế hoạch điều trị/ <span class="text-primary">Treatment Plan:</span></label></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_treatment_plan"></asp:Label>
                                                    <div class="form-group" runat="server" id="treatment_plan_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_treatment_plan" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dg gtc-1 mb-2">
                                                <div><label class="control-label">Kế hoạch xuất viện/ <span class="text-primary">Discharge Plan:</span></label></div>
                                                <div>
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
                                                    <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>

                                                    <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                    <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

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
                                                    <h4 class="mt-4 mb-4">Delete document?
                                                    </h4>
                                                </div>
                                                <div class="text-right">
                                                    <div class="btn btn-default waves-effect" data-dismiss="modal">Close</div>
                                                    <asp:LinkButton OnClick="btnDelete_Click" OnClientClick="window.removeEventListener('beforeunload',comfirm_leave_page,true);" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
                                                </div>
                                            </ModalBody>
                                        </webUI:PopupModal>

                                        <icon:PopupShowDelay runat="server" ID="PopupShowDelay" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<asp:LinkButton runat="server" OnClick="clearSession_Click" ID="clearSession"></asp:LinkButton>--%>

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

            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                    document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

        function printDiv() {
            var printContents = document.getElementById("print_content").innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }

        function btnPrint_Click() {
            let printContent = document.querySelector("#printContent");
            printContent.setAttribute("style", "display: block");

            let total = Math.ceil(printContent.offsetHeight / 1096);

            for (let i = 1; i <= total; i++) {
                let div = document.createElement("div");
                div.setAttribute("class", "watermark page");
                div.setAttribute("style", "top: " + (1093 * (i - 1)) + "px");
                div.setAttribute("data-page", "Page " + i + " of " + total);
                document.getElementById("print_content").append(div);
            }

            setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);

            window.print();
        }
    </script>

</body>
</html>
