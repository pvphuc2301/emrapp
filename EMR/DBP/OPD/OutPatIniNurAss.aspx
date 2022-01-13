<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatIniNurAss.aspx.cs" Inherits="EMR.DBP.OPD.OutPatIniNurAss" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtGender.ascx" TagPrefix="webUI" TagName="PrtGender" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtDate.ascx" TagPrefix="webUI" TagName="PrtDate" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../styles/alertify.css" rel="stylesheet" />
    <style type="text/css">
        table { page-break-after:auto }
        tr    { page-break-inside:avoid; page-break-after:auto }
        td    { page-break-inside:avoid; page-break-after:auto }
        thead { display:table-header-group }
        tfoot { display:table-footer-group }
        .report-footer-space {
            height: 0;
        }
        @media print {
            .watermark {
                background-image: none !important;
            }
        }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel ID="UpPrintForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img style="width: 180px" src="../../images/DBP/AIH_CLINIC_logo_final_02.png" />
                                        <div class="header-info-title">
                                            <h5 style="color: #007297; margin: 5px 0">PHIẾU ĐÁNH GIÁ ĐIỀU DƯỠNG BAN ĐẦU <br /> DÀNH CHO BỆNH NGOẠI TRÚ</h5>
                                            <h5>OUTPATIENT INITIAL NURSING ASSESSMENT</h5>
                                        </div>
                                        <div style="width: 150px; text-align: left; font-size: 11px">
                                            <asp:Label runat="server" ID="prt_fullname" CssClass="d-block"></asp:Label>
                                            <asp:Label CssClass="d-block" runat="server" ID="prt_DOB"></asp:Label>
                                            <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
                                            <asp:Label runat="server" ID="prt_vpid" CssClass="d-block font-bold"></asp:Label>
                                        </div>
                                    </div>
                                    <div style="height: 20px;">
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

                                        <div style="margin-bottom: 6px">
                                            <webUI:PrtRowS1 Order="I." FontBold="true" Title="DẤU HIỆU SINH TỒN:" SubTitle="VITAL SIGNS" runat="server" />
                                        </div>

                                        <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%">
                                            <tr>
                                                <td class="p-2">Nhiệt độ/ Temperature (C degree)</td>
                                                <td class="p-2 text-right" style="width: 100px;">
                                                    <asp:Label runat="server" ID="prt_vs_temperature" /></td>
                                                <td class="p-2">Mạch/ Pulse (/min)</td>
                                                <td class="p-2 text-right" style="width: 100px;">
                                                    <asp:Label runat="server" ID="prt_pulse" /></td>
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

                                        <div style="margin-bottom: 6px">
                                            <webUI:PrtRowS1 FontBold="true" Order="II." Title="ĐÁNH GIÁ:" SubTitle="ASSESSMENT" runat="server" />
                                        </div>
                                        
                                        <div class="d-grid" style="grid-template-columns: auto 1fr; margin-bottom: 6px">
                                            <webUI:PrtRowS1 FontBold="true" Order="1." FixedWidth="152" Title="Lý do đến khám:" SubTitle="Chief complaint"  runat="server" />
                                            <asp:Label runat="server" ID="prt_chief_complaint" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; margin-bottom: 6px">
                                        <webUI:PrtRowS1 FontBold="true" Order="2." FixedWidth="152" Title="Dị ứng:" SubTitle="Allergy" runat="server"  />
                                            <asp:Label runat="server" ID="prt_allergy"/>
                                        </div>

                                        <div style="margin-bottom: 6px">
                                            <webUI:PrtRowS1 FontBold="true" Order="3." Title="Trạng thái tinh thần" SubTitle="Mental status" runat="server" />
                                            </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; margin-bottom: 6px">
                                            <webUI:PrtRowS1 FixedLeft="30" FixedWidth="152" Title="Đáp ứng phù hợp" SubTitle="Appropriate response" runat="server" />
                                            <asp:Label runat="server" ID="prt_mental_status" />
                                        </div>

                                        <div  class="d-grid" style="grid-template-columns: auto 1fr; margin-bottom: 6px">
                                            <webUI:PrtRowS1 FontBold="true" Order="4." FixedWidth="152" Title="Thang điểm đau:" SubTitle="Pain Score" runat="server" />
                                            <asp:Label runat="server" ID="prt_paint_score_code" />
                                        </div>

                                        <div class="text-center">
                                            <img src="../../images/pain_score.png" />
                                        </div>

                                        <div  class="d-grid" style="grid-template-columns: auto 1fr; margin-bottom: 6px">
                                            <webUI:PrtRowS1 FontBold="true" Order="5." FixedWidth="235" Title="Tầm soát nguy cơ té ngã:" SubTitle="Fall Risk Morse Scale" runat="server"  />
                                            <asp:Label runat="server" ID="prt_fall_risk"  />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; margin-bottom: 6px">
                                            <webUI:PrtRowS1 FontBold="true" Order="6." FixedWidth="235" Title="Đánh giá tình trạng dinh dưỡng:" SubTitle="Nutritional Status Screening" runat="server" />
                                            <asp:Label runat="server" ID="prt_nutrition_status_code"  />
                                        </div>

                                        <div style="margin-bottom: 6px">
                                        <webUI:PrtRowS1 FontBold="true" Order="III." Title="ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH(DUY NHẤT CHO LẦN KHÁM ĐẦU TIÊN):" SubTitle="SOCIAL FACTORS ASSESSMENT(ONLY FOR THE FIRST VISIT)" runat="server" />
                                            </div>


                                        <div class="d-grid" style="grid-template-columns: auto 1fr; margin-bottom: 6px">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="30" FixedWidth="152" Title="Tình trạng sinh sống:" SubTitle="Housing" runat="server" />
                                            
                                            <asp:Label runat="server" ID="prt_housing" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; margin-bottom: 6px">

                                            <webUI:PrtRowS1 FontBold="true" Order="IV." FixedWidth="152"  Title="MỨC ĐỘ ƯU TIÊN:" SubTitle="PRIORITIZATION" runat="server" />
                                            <asp:Label runat="server" ID="prt_prioritization_code" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr auto">
                                            <div></div>
                                            <div class="text-center">
                                                <asp:Label CssClass="d-block" runat="server" ID="prt_signature_date" />
                                                <asp:Label CssClass="d-block" runat="server" Text="Điều dưỡng đánh giá/ Assessment done by Nurse" />
                                                <asp:Label CssClass="d-block" runat="server" Style="margin-bottom: 70px;" ID="Label5" Text="(Họ tên, MSNV và ký tên)/ (Name, ID and signature)" />
                                                <%--<asp:Label  runat="server" ID="prt_signature_name" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell" style="font-size: 10px">
                                    <%--<img style="width: 100%" src="../../images/Footer.jpg" />--%>
                                    <img style="width: 100%" src="../../images/ExcellentCare.png" />
                                    <div class="footer-info" style="font-size: 9.5px">
                                        <div style="font-weight: bold;">PHÒNG KHÁM ĐA KHOA <br />(THUỘC CÔNG TY CỔ PHẦN PHÒNG KHÁM BỆNH VIỆN QUỐC TẾ MỸ)</div>
                                        <div>Số 79, Đường Điện Biên Phủ, Phường ĐaKao, Quận 1, Tp.HCM</div>
                                        <div>Tel: 028 3910 9888</div>
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
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0; border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Outpatient Initial Nursing Assessment</li>
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
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">Outpatient Initial Nursing Assessment</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>

                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body mb-4">
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

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <label class="control-label h5">I. DẤU HIỆU SINH TỒN/ <span class="text-primary">VITAL SIGNS</span></label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_temperature"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_temperature_wrapper">
                                                        <input tabindex="1" id="txt_vs_temperature" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhịp tim/ <span class="text-primary">rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_heart_rate"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_heart_rate_wrapper">
                                                        <input id="txt_vs_heart_rate" data-type="number" style="width: 160px" tabindex="5" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label  mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_weight"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_weight_wrapper">
                                                        <input tabindex="2" onchange="CalculateBmi()" id="txt_vs_weight" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">Kg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_respiratory_rate" />
                                                    <div class="form-group d-inline-block" runat="server" id="vs_respiratory_rate_wrapper">
                                                        <input  id="txt_vs_respiratory_rate" tabindex="6" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_height"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_height_wrapper">
                                                        <input tabindex="3" id="txt_vs_height" onchange="CalculateBmi()"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_blood_pressure" />
                                                    <div class="form-group d-inline-block" runat="server" id="vs_blood_pressure_wrapper">
                                                        <input  tabindex="7" id="txt_vs_blood_pressure" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 ">
                                                    <div class="d-flex no-block">
                                                        <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                        <asp:Label runat="server" ID="lbl_vs_bmi"></asp:Label>
                                                        <div class="form-group d-inline-block" runat="server" id="vs_bmi_wrapper">
                                                            <input  id="txt_vs_bmi" data-type="number" style="width: 120px; height: 23.2px;" runat="server" disabled="disabled" class="form-control text-right" />
                                                            <span class="append">(Kg/m <sup>2</sup>)</span>
                                                        </div>
                                                        <asp:Label runat="server" ID="bmiStr"></asp:Label>
                                                    </div>
                                                    <p class="mt-1">
                                                        (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
        applicable for children and pregnant</span>)
                                                    </p>
                                                </div>
                                                <div class="col-sm-6 mb-2  d-flex no-block">
                                                    <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_spo2"/>
                                                    <div class="form-group d-inline-block" runat="server" id="vs_spo2_wrapper">
                                                        <input  tabindex="8" id="txt_vs_spo2"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-12 mb-2 d-flex no-block">
                                                    <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <asp:Label runat="server" ID="lbl_pulse"/>
                                                    <div class="form-group d-inline-block" runat="server" id="pulse_wrapper">
                                                        <input tabindex="4" id="txt_pulse"  data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label  h5">II. ĐÁNH GIÁ/ <span class="text-primary">ASSESSMENT</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">1. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <asp:Label  runat="server" ID="lbl_chief_complaint"  />
                                                    <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                        <webUI:TextField TabIndex="9" runat="server" ID="txt_chief_complaint" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                </legend>

                                                <div class="col-md-12" runat="server" id="allergy_wrapper">
                                                    <div class="custom-control custom-radio d-inline-block ml-2 mb-1">
                                                        <input type="radio" onchange="radioButtonChange(this)" data-target="allergy_field" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block ml-2 mb-1">
                                                        <input disabled-for="allergy_field" type="radio" runat="server" onchange="radioButtonChange(this)" id="rad_allergy_true" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare5" />
                                                        </a>
                                                        <%--<asp:CustomValidator ID="CustomValidator3" CssClass="text-danger" ValidationGroup="Group1"
                                                            OnServerValidate="CustomValidatorAllergy_ServerValidate"
                                                            Display="Dynamic"
                                                            ErrorMessage="Dị ứng/ Allergy is required"
                                                            runat="server" />--%>
                                                    </div>

                                                    <div class="form-group allergy_field">
                                                        <webUI:TextField tabindex="10" runat="server" ID="txt_allergy_note" TextMode="SingleLine" />
                                                        <asp:CustomValidator ID="CustomValidator3" CssClass="text-danger" ValidationGroup="Group1" OnServerValidate="CustomValidatorAllergy_ServerValidate" Display="Dynamic" ErrorMessage="Too many characters. 256 allowed." runat="server" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_allergy" /><br />
                                                    <asp:Label runat="server" ID="lbl_allergy_note" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">3. Trạng thái tinh thần/ <span class="text-primary">Mental status:</span></label>
                                                </legend>
                                                <div class="col-md-12 d-grid" style="grid-template-columns:  auto 1fr; grid-gap: 5px;">
                                                    <label class="control-label mb-1">Đáp ứng phù hợp/ <span class="text-primary">Appropriate response:</span></label>

                                                    <asp:Label runat="server" ID="lbl_mental_status" />

                                                    <div  runat="server" id="mental_status_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" runat="server" id="rad_mental_status_true" onchange="radioButtonChange(this)" data-target="mental_status_note_field" name="rad_mental_status" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_mental_status_true">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio  d-inline-block ml-2">
                                                        <input onchange="radioButtonChange(this)" disabled-for="mental_status_note_field" type="radio" runat="server" id="rad_mental_status_false" name="rad_mental_status" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_mental_status_false">No, ghi rõ/ <span class="text-primary">No, specify:</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_mental_status" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare6" />
                                                        </a>
                                                        <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="Group1" ErrorMessage="Trạng thái tinh thần/ Appropriate response is required" CssClass="text-danger" OnServerValidate="CustomValidatorMentalStatus_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>

                                                    <div class="form-group mental_status_note_field">
                                                        <webUI:TextField runat="server" ID="txt_mental_status_note" tabindex="11" TextMode="SingleLine" />
                                                        <asp:CustomValidator ID="CustomValidator1" CssClass="text-danger" ValidationGroup="Group1" OnServerValidate="CustomValidatorMentalStatusNote_ServerValidate" Display="Dynamic" ErrorMessage="Too many characters. 256 allowed." runat="server" />
                                                    </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <%-- 4. Pain score --%>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">4. Thang điểm đau/ <span class="text-primary">Pain score:</span></label>
                                                </legend>
                                                <div class="col-md-12" runat="server" id="paint_score_code_wrapper">
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_0" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_0">Không đau/ <span class="text-primary">No hurt</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_1" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_1">Đau rất ít/ <span class="text-primary">Little hurt</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_2" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_2">Đau nhẹ/ <span class="text-primary">Slight hurt</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_3" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_3">Đau vừa/ <span class="text-primary">Considerable hurt</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_4" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_4">Đau nhiều/ <span class="text-primary">Serious hurt</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                        <input type="radio" id="rad_paint_score_code_5" runat="server" name="rad_paint_score_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_paint_score_code_5">Rất đau/ <span class="text-primary">Worst hurt</span></label>
                                                        <a class="btn-clear-option" href="javascript:void(0)" data-clear="rad_paint_score_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare2" />
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_paint_score_description" />
                                                </div>
                                                <div class="col-md-12">
                                                    <img src="../../images/pain_score.png" style="max-width: 720px; width: 100%;" alt="" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">5. Tầm soát nguy cơ té ngã/ <span class="text-primary">Fall risk MORSE SCALE:</span></label>
                                                </legend>
                                                <div class="col-md-12" runat="server" id="fall_risk_wrapper">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_fall_risk_false" name="rad_fall_risk" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_fall_risk_false">Không có nguy cơ/ <span class="text-primary">No risk</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio mb-1">
                                                        <input disabled-for="fall_risk_assistance_field" onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_fall_risk_true" name="rad_fall_risk" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_fall_risk_true">có, cung cấp phương tiện hỗ trợ/ <span class="text-primary">Yes, provide assistance:</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_fall_risk" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare22" />
                                                        </a>
                                                        
                                                        <%--<asp:CustomValidator ID="CustomValidator4" ValidationGroup="Group1" runat="server" ErrorMessage="Tầm soát nguy cơ té ngã/ Fall risk MORSE SCALE is required" CssClass="text-danger" OnServerValidate="CustomValidatorFallRisk_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>
                                                    <div class="form-group fall_risk_assistance_field">
                                                        <webUI:TextField runat="server" ID="txt_fall_risk_assistance" tabindex="12" TextMode="SingleLine"/>
                                                        <asp:CustomValidator ID="CustomValidator2" CssClass="text-danger" ValidationGroup="Group1" OnServerValidate="CustomValidatorFallRiskAssistance_ServerValidate" Display="Dynamic" ErrorMessage="Too many characters. 256 allowed." runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_fall_risk" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">6. Đánh giá tình trang dinh dưỡng/ <span class="text-primary">Nutritional status screening:</span></label>
                                                </legend>
                                                <div class="col-md-12" runat="server" id="nutrition_status_code_wrapper">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_nutrition_status_code_n" name="rad_nutrition_status_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_nutrition_status_code_n">Bình thường/ <span class="text-primary">Normal</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_nutrition_status_code_u" name="rad_nutrition_status_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_nutrition_status_code_u">Suy dinh dưỡng/ <span class="text-primary">Undernutrition</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_nutrition_status_code_o" name="rad_nutrition_status_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_nutrition_status_code_o">Thừa cân hoặc béo phì/ <span class="text-primary">Overweight or obesity</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_nutrition_status_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare1" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_nutrition_status_description" />
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label  h5">III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH (DUY NHẤT CHO LẦN KHÁM ĐẦU TIÊN)/ <span class="text-primary">SOCIAL FACTORS ASSESSMENT (ONLY FOR THE FIRST VISIT):</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-1">Tình trạng sinh sống/ <span class="text-primary">Housing</span></label>
                                                </legend>
                                                <div class="col-md-12" runat="server" id="housing_code_wrapper">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_housing_code_aln" name="rad_housing_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_housing_code_aln">Sống một mình/ <span class="text-primary">Lives alone</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_housing_code_rel" name="rad_housing_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_housing_code_rel">Sống với người thân/ <span class="text-primary">With relatives</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_housing_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare3" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_housing_description" />
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">IV. MỨC ĐỘ ƯU TIÊN/ <span class="text-primary">PRIORITIZATION:</span></label>
                                                </div>

                                                <div class="col-md-12" runat="server" id="prioritization_code_wrapper">
                                                    <div class="custom-control custom-radio ml-2">
                                                        <input type="radio" runat="server" id="rad_prioritization_code_im" name="rad_prioritization_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_prioritization_code_im">Cần được khám ngay/ <span class="text-primary">Immediate consulting requirement</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio ml-2">
                                                        <input type="radio" runat="server" id="rad_prioritization_code_wa" name="rad_prioritization_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_prioritization_code_wa">Có thể chờ khám trong khoảng thời gian xác định/ <span class="text-primary">Be able to wait for consultation at a specific time</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_prioritization_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare4" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <asp:Label runat="server" ID="lbl_prioritization_description" />
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                                    <label class="control-label mb-1 h5">Ngày, giờ đánh giá/ <span class="text-primary">Time, Date of assessment:</span></label>
                                                    <div class="col-md-12" runat="server" id="assessment_date_time_wrapper">
                                                        <telerik:RadDateTimePicker runat="server" TabIndex="13" ID="dtpk_assessment_date_time" Width="200px" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_assessment_date_time" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-actions">
                                                        <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete"  CssClass="btn btn-primary waves-effect" >Complete</asp:LinkButton>

                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect" >Save</asp:LinkButton>

                                                        <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>

                                                        <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                        <asp:LinkButton runat="server" OnClientClick="window.print(); return false;" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

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

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
    <script src="../../scripts/checkValidFields.js"></script>
    <script src="../../scripts/waves.js"></script>
    <script src="../../scripts/sweetalert.min.js"></script>
    <script src="../../scripts/alertify.js"></script>

    <script>
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        formGroup_init();
        checkboxRadiobutton_init();
        InputFilter("data-type='number'");
        InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
        if (document.getElementById('txt_vs_bmi') != null) setbmiStr(document.getElementById('txt_vs_bmi').value);

        $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter("data-type='number'");
            InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
            if (document.getElementById('txt_vs_bmi') != null) setbmiStr(document.getElementById('txt_vs_bmi').value);
            $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

    </script>

</body>
</html>
