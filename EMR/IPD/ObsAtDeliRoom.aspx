﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObsAtDeliRoom.aspx.cs" Inherits="EMR.ObstetricObservationAtDeliveryRoom" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/TextField1.ascx" TagPrefix="webUI" TagName="TextField1" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="Button" TagName="PopupShowDelay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OBSTETRIC OBSERVATION AT DELIVERY ROOM</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <style>
        @page{
            margin-top: 15px;
        }
        #print_content {
		    line-height: initial !important;
	    }
    </style>
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />

        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
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
                                            <div><span style="font-size: 12pt; font-weight: bold">THEO DÕI THAI PHỤ TẠI PHÒNG SINH</span></div>
                                            <div class="en"><i style="font-size: 11pt; font-weight: bold">OBSTETRIC OBSERVATION AT DELIVERY ROOM</i></div>
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
                                <div class="main" runat="server" id="print_content" style="font-size: 12pt; margin: 0 1.5cm 0 2cm; line-height: 1.5">
                                    <div>
                                        Nhập phòng sinh lúc/ <span class="en">Admission to Delivery room at: </span>
                                        <asp:Label runat="server" ID="prt_admis_delivery_hour"/> giờ/<span class="en">hour </span>
                                        <asp:Label runat="server" ID="prt_admis_delivery_minute"/> phút/ <span class="en">minute</span>, ngày/ <span class="en">date </span>
                                        <asp:Label runat="server" ID="prt_admis_delivery_date"/>
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: 1fr 250px">
                                        <div>Người theo dõi/ <span class="en">Observer's name: </span><asp:Label runat="server" ID="prt_obs_name"/></div>
                                        <div>Chức danh/ <span class="en">Initial: </span><asp:Label runat="server" ID="prt_obs_initial"/></div>
                                    </div>
                                    
                                    <div>
                                        <span class="font-bold">1. Đặc điểm trẻ sơ sinh</span>/ <span class="en">Neonatal features:</span>
                                    </div>

                                    <div>
                                        - Sinh lúc/ <span class="en">Delivered at: </span><asp:Label runat="server" ID="prt_delivery_at_hour"/> giờ/<span class="en">hour </span><asp:Label runat="server" ID="prt_delivery_at_minute"/> phút/ <span class="en">minute</span>, ngày/ <span class="en">date </span><asp:Label runat="server" ID="prt_delivery_at_date"/>
                                    </div>

                                    <div>
                                        - Điểm số Apgar/ <span class="en">Apgar score:</span> phút thứ nhất/ <span class="en">1st minute:</span> <asp:Label runat="server" ID="prt_apgar_score_1"/> điểm/ <span class="en">points</span>, phút thứ 5/ <span class="en">5th minute: </span><asp:Label runat="server" ID="prt_apgar_score_5"/> điểm/ <span class="en">points</span>, phút thứ 10/ <span class="en">10th minute:</span> <asp:Label runat="server" ID="prt_apgar_score_10"/> điểm/ <span class="en">points</span>
                                    </div>

                                    <div>
                                        - Cân nặng lúc sinh/ <span class="en">WOB: </span><asp:Label runat="server" ID="prt_weight_of_birth"/> gram, Chiều dài/ <span class="en">length:</span> <asp:Label runat="server" ID="prt_length_of_birth"/> cm, Vòng đầu/ <span class="en">Head circumference: </span><asp:Label runat="server" ID="prt_head_circum"/> cm
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: auto 1fr">
                                        <div>Trẻ/ <span class="en">Newborn:</span>&nbsp;</div>
                                        <div>
                                            <div class="d-grid" style="grid-template-columns: 140px 100px 1fr">
                                                <div>- Đơn thai/ <span class="en">Singleton:</span></div>
                                                <div>
                                                    <asp:Label runat="server" Text="❏" ID="prt_singleton_sex_m"/> Nam/ <span class="en">Male</span>
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" Text="❏" ID="prt_singleton_sex_f"/> Nữ/ <span class="en">Female</span>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 140px 100px 1fr">
                                                <div>- Đa thai/ <span class="en">Multiple: </span></div>
                                                <div>
                                                    <asp:Label runat="server" Text="❏" ID="prt_multiple_sex_m"/> Nam/ <span class="en">Male</span>
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" Text="❏" ID="prt_multiple_sex_f"/> Nữ/ <span class="en">Female</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: auto 1fr">
                                        <div>- Dị tật bẩm sinh/ <span class="en">Birth defect:</span>&nbsp;</div>
                                        <asp:Label runat="server" ID="prt_birth_defect"/>
                                    </div>

                                    <div>- Tình trạng trẻ sơ sinh sau sinh/ <span class="en">Neonatal status after birth: </span><asp:Label runat="server" ID="prt_neonatal_status"/></div>

                                    <div class="d-grid" style="grid-template-columns: auto 1fr">
                                        <div>- Can thiệp và kết quả/ <span class="en">Intervention and results:</span>&nbsp;</div>
                                        <asp:Label runat="server" ID="prt_intervention"/>
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: auto 1fr">
                                        <span class="font-bold">2. Sổ nhau/ <span class="en">Placenta delivery:</span> &nbsp;</span> <asp:Label runat="server" ID="prt_placenta_deli"/>
                                    </div>

                                    <div>- <span class="en">At:</span> <asp:Label runat="server" ID="prt_pacental_deli_dt_h"/> <span class="en">hour </span><asp:Label runat="server" ID="prt_pacental_deli_dt_m"/><span class="en"> minute day </span><asp:Label runat="server" ID="prt_pacental_deli_dt"/></div>

                                    <div>- Cách sổ nhau/ <span class="en">Placenta delivery mode: </span><asp:Label runat="server" ID="prt_placenta_deli_mode"/></div>

                                    <div>- Cân nặng/ <span class="en">Weight:</span> <asp:Label runat="server" ID="prt_placenta_weight"/> gram</div>

                                    <div class="d-grid" style="grid-template-columns: auto 1fr">
                                       <div>- Dây rốn quấn cổ/ <span class="en">Umbilical coil:</span> &nbsp;</div>
                                        <asp:Label runat="server" ID="prt_umbilical_coil"/>
                                    </div>

                                    <div>- Chiều dài dây rốn/ <span class="en">Umbilical length: </span><asp:Label runat="server" ID="prt_umbilical_length"/> cm</div>

                                    <div>Lượng máu mất sau khi sổ nhau/ <span class="en">Quantity of blood loss after placenta delivery: </span><asp:Label runat="server" ID="prt_blood_loss"/> ml</div>

                                    <div class="d-grid" style="grid-template-columns: auto 1fr">
                                        <div>Can thiệp và kết quả/ <span class="en">Intervention and results:</span> &nbsp;</div>
                                        <asp:Label runat="server" ID="prt_p_intervention"/>
                                    </div>

                                    <div><span class="font-bold">3. Tình trạng sản phụ sau sinh/ <span class="en">Maternal status after delivery:</span></span></div>

                                    <div>SpO2: <asp:Label runat="server" ID="prt_spO2"/> %</div>

                                    <div>T°: <asp:Label runat="server" ID="prt_temp"/> °C</div>

                                    <div>Huyết áp/ <span class="en">BP:</span> <asp:Label runat="server" ID="prt_BP"/> mmHg</div>

                                    <div>Nhịp tim/ <span class="en">HR:</span> <asp:Label runat="server" ID="prt_HR"/> lần/phút/bpm</div>

                                    <div>Nhịp thở/ <span class="en">RR:</span> <asp:Label runat="server" ID="prt_RR"/> lần/phút/bpm</div>

                                    <div><span class="font-bold">Tổng trạng chung/ <span class="en">General appearance:</span></span></div>

                                    <div>- Phương pháp sinh/ <span class="en">Delivery mode:</span></div>

                                    <div style="margin-left: 20px">
                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div>
                                                <div>Sanh ngã âm đạo/ <span class="en">Vaginal delivery:</span></div>
                                                <div><asp:Label runat="server" Text="❏" ID="prt_vaginal_deli_code_s"/> Sanh tự nhiên/ <span class="en">Spontaneous</span></div>
                                                <div><asp:Label runat="server" Text="❏" ID="prt_vaginal_deli_code_v"/> Sanh hút/ <span class="en">Vacuum-assisted</span></div>
                                                <div><asp:Label runat="server" Text="❏" ID="prt_vaginal_deli_code_f"/> Sanh kềm/ <span class="en">Forceps-assisted</span></div>
                                            </div>
                                            <div>
                                                <div>Sanh mổ/ <span class="en">C-Section:</span></div>
                                                <div><asp:Label runat="server" Text="❏" ID="prt_section_code_el"/> Mổ chương trình/ <span class="en">Elective</span></div>
                                                <div><asp:Label runat="server" Text="❏" ID="prt_section_code_em"/> Mổ cấp cứu/ <span class="en">Emergency</span></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div style="margin-left: 20px">- Lí do can thiệp, nếu có/ <span class="en">Reason for intervention, if yes: </span><asp:Label runat="server" ID="prt_interven_reason"/></div>

                                    <div class="d-grid" style="grid-template-columns: 180px 150px 1fr">
                                        <div>- Tầng sinh môn/ <span class="en">Perineum: </span></div>
                                        <div><asp:Label runat="server" Text="❏" ID="prt_pre_intact_true"/> Nguyên vẹn/ <span class="en">Intact</span></div>
                                        <div><asp:Label runat="server" Text="❏" ID="prt_prt_pre_lacera_true"/> Rách, độ/ <span class="en">Laceration, degree:</span> <asp:Label runat="server" ID="prt_pre_lacera_degree"/></div>
                                    </div>

                                    <div><asp:Label runat="server" ID="prt_pre_episiotomy_true" Text="❏"/> Cắt/ <span class="en">Episiotomy</span>. Nếu có, cách khâu và loại chỉ/ <span class="en">If yes, suture and silk type:</span> <asp:Label runat="server" ID="prt_pre_episiotomy_st" /></div>

                                    <div class="d-grid" style="grid-template-columns: auto 1fr">
                                        <div>Cổ tử cung/ <span class="en">Cervix:</span> &nbsp;</div>
                                        <div style="display: grid; grid-template-columns: 150px 1fr">
                                            <div><asp:Label runat="server" Text="❏" ID="prt_cervix_intact_true"/> Nguyên vẹn/ <span class="en">Intact</span></div>
                                            <div><asp:Label runat="server" Text="❏" ID="prt_cervix_intact_false"/> Rách/ <span class="en">Laceration</span></div>
                                        </div>
                                    </div>

                                    <div><span class="font-bold">4. Thông tin phẫu thuật (nếu có)/ <span class="en">Operation details</span></span> <span class="en">(if possible):</span></div>

                                    <div>Chẩn đoán tiền phẫu/ <span class="en">Preoperative diagnosis: </span><asp:Label runat="server" ID="prt_preo_diagnosis" /></div>

                                    <div>Chẩn đoán hậu phẫu/ <span class="en">Postoperative diagnosis:</span> <asp:Label runat="server" ID="prt_post_diagnosis" /></div>

                                    <table style="table-layout: fixed; width: 100%" class="table-bordered" runat="server" id="prt_operations">
                                        <tr>
                                            <td class="p-1 text-center" style="width: 125px">
                                                <div>Giờ, ngày</div>
                                                <div class="en">Hour, date</div>
                                            </td>
                                            <td class="p-1 text-center" style="width: 239px">
                                                <div>Phương pháp phẫu thuật và vô cảm/ <span class="en">Surgical and Anesthesia methods</span></div>
                                            </td>
                                            <td class="p-1 text-center">
                                                <div>Phẫu thuật viên</div>
                                                <div class="en">Surgeon</div>
                                            </td>
                                            <td class="p-2 text-center">
                                                <div>Bác sĩ gây mê</div>
                                                <div class="en">Anesthesiologist</div>
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="d-grid" style="grid-template-columns: 180px 1fr">
                                        <div>- Tai biến/ <span class="en">Incident:</span> &nbsp;</div>
                                        <asp:Label runat="server" ID="prt_sur_incident" />
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: 180px 1fr">
                                        <div>- Biến chứng/ <span class="en">Complication:</span> &nbsp;</div>
                                        <asp:Label runat="server" ID="prt_sur_complication" />
                                    </div>

                                    <div><span class="font-bold">5. Kế hoạch điều trị/ <span class="en">Treatment plan:</span> </span> <asp:Label runat="server" ID="prt_treatment_plan" /></div>

                                    <div class="d-grid" style="grid-template-columns: 1fr 1fr; grid-gap: 5px">
                                        <div></div>
                                        <div class="text-center" style="break-inside: avoid !important; page-break-inside: avoid !important">
                                            <div><span class="font-bold">Họ tên, chữ ký & MSNV của Bác sĩ</span></div>
                                            <div class="en">Doctor’s full name, signature & ID</div>
                                        </div>
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: 1fr 1fr; grid-gap: 5px; display: none;">
                                        <div></div>
                                        <div>
                                            <div>Ngày giờ/ <span class="en">Date & time:</span> <asp:Label runat="server" ID="prt_signature_date"/></div>
                                            <div>Họ tên bác sĩ và mã số nhân viên/ <span class="en">Doctor's name and ID:</span></div>
                                            <div>Chữ ký/ <span class="en">Signature</span></div>
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
                      <li>Obstetric Observation At Delivery Room</li>
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

                            <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group2" HeaderText="Please complete the highlighted field(s)." />
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

                        <div class="row" >
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">OBSTETRIC OBSERVATION AT DELIVERY ROOM</h4>
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
                                                <div class="col-md-12 mb-2">
                                                    <label class="h5">VI. Theo dõi thai phụ tại phòng sinh/ <span class="text-primary">Observation at delivery room</span></label>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-2">Nhập phòng sinh lúc/ <span class="text-primary">Admission to Delivery room at:</span></label>
                                                    <div class="align-top">
                                                        <asp:Label  runat="server"  id="lbl_admis_delivery"></asp:Label>
                                                        <div class="form-group d-inline-block" runat="server" id="admis_delivery_wrapper">
                                                            <telerik:RadDateTimePicker runat="server" ID="dtpk_admis_delivery" Width="200px" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_admis_delivery" ErrorMessage="Please enter amend reason"
                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Người theo dõi/ <span class="text-primary">Observer’s name:</span></label>
                                                    <asp:Label  runat="server"  id="lbl_obs_name"></asp:Label>
                                                    <div class="form-group d-inline-block w-n" runat="server" id="obs_name_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_obs_name" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Chức danh/ <span class="text-primary">Initial:</span></label>
                                                    <asp:Label  runat="server"  id="lbl_obs_initial"></asp:Label>
                                                    <div class="form-group d-inline-block w-n" runat="server" id="obs_initial_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_obs_initial" />
                                                    </div>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">1. Đặc điểm trẻ sơ sinh/ <span class="text-primary">Neonatal features:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Sinh lúc/ <span class="text-primary">Delivered at:</span></label>
                                                    <asp:Label runat="server" ID="lbl_delivery_at"></asp:Label>
                                                    <div class="form-group d-inline-block" runat="server" id="delivery_at_wrapper">
                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_delivery_at" Width="200px" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_delivery_at" ErrorMessage="Please enter amend reason"
                                    ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label">Điểm số Apgar/ <span class="text-primary">Apgar score:</span></label>
                                                    <div>
                                                        <div class="mb-2">
                                                            <label class="control-label mb-1">Phút thứ nhất/ <span class="text-primary">1st minute:</span></label>
                                                            <asp:Label runat="server" ID="lbl_apgar_score_1"></asp:Label>
                                                            <div class="form-group d-inline-block" runat="server" id="apgar_score_1_wrapper">
                                                                <input id="txt_apgar_score_1" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                                <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="control-label mb-1">Phút thứ 5/ <span class="text-primary">5st minute:</span></label>
                                                            <asp:Label runat="server" ID="lbl_apgar_score_5"></asp:Label>
                                                            <div class="form-group d-inline-block" runat="server" id="apgar_score_5_wrapper">
                                                                <input id="txt_apgar_score_5" data-type="number" runat="server" style="width: 160px" class="form-control text-right" />
                                                                <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="control-label mb-1">Phút thứ 10/ <span class="text-primary">10st minute:</span></label>
                                                            <asp:Label runat="server" ID="lbl_apgar_score_10"></asp:Label>
                                                            <div class="form-group d-inline-block" runat="server" id="apgar_score_10_wrapper">
                                                                <input id="txt_apgar_score_10" data-type="number" runat="server" style="width: 160px" class="form-control text-right" />
                                                                <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Cân nặng lúc sinh/ <span class="text-primary">WOB:</span></label>

                                                    <div>
                                                        <div class="mb-2">
                                                            <asp:Label runat="server" ID="lbl_weight_of_birth"></asp:Label>
                                                            <div class="form-group d-inline-block " runat="server" id="weight_of_birth_wrapper">
                                                                <input id="txt_weight_of_birth" data-type="number" style="width: 100px" runat="server" class="form-control text-right" />
                                                                <span class="append">gram</span>
                                                            </div>
                                                        </div>
                                                        <div class="mb-2">
                                                            <label class="control-label mb-1">Chiều dài/ <span class="text-primary">Length:</span></label>
                                                            <asp:Label runat="server" ID="lbl_length_of_birth"></asp:Label>
                                                            <div class="form-group d-inline-block" runat="server" id="length_of_birth_wrapper">
                                                                <input id="txt_length_of_birth" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                                <span class="append">cm</span>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="control-label mb-1">Vòng đầu/ <span class="text-primary">Head circumference:</span></label>
                                                            <asp:Label runat="server" ID="lbl_head_circum"></asp:Label>
                                                            <div class="form-group d-inline-block" runat="server" id="head_circum_wrapper">
                                                                <input id="txt_head_circum" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                                <span class="append">cm</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Trẻ/ <span class="text-primary">Newborn:</span></label>
                                                    <div>
                                                        <div class="mb-2">
                                                            <label class="control-label">Đơn thai/ <span class="text-primary">Signleton:</span></label>
                                                            <asp:Label runat="server" ID="lbl_singleton_sex_code"></asp:Label>
                                                            <div class="d-inline-block" runat="server" id="singleton_sex_code_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block" >
                                                                    <input type="radio" id="rad_singleton_sex_code_m" name="rad_singleton_sex_code" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_singleton_sex_code_m">Nam/ <span class="text-primary">Male</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" id="rad_singleton_sex_code_f" name="rad_singleton_sex_code" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_singleton_sex_code_f">Nữ/ <span class="text-primary">Female</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_singleton_sex_code" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare38" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="control-label">Đa thai/ <span class="text-primary">Multiple:</span></label>
                                                            <asp:Label runat="server" ID="lbl_multiple_sex"></asp:Label>
                                                            <div runat="server" id="multiple_sex_wrapper">
                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_multiple_sex_m" />
                                                                    <span class="custom-control-label">Nam/ <span class="text-primary">Male</span></span>
                                                                </label>

                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_multiple_sex_f" />
                                                                    <span class="custom-control-label">Nữ/ <span class="text-primary">Female</span></span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Dị tật bẩm sinh/ <span class="text-primary">Birth defect:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_birth_defect"></asp:Label>
                                                        <div class="mb-2" runat="server" id="birth_defect_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_birth_defect_false" name="rad_birth_defect" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_birth_defect_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_birth_defect_true" name="rad_birth_defect" class="custom-control-input" disabled-for="txt_birth_defect_note" />
                                                                <label class="custom-control-label" for="rad_birth_defect_true">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_birth_defect" onclick="clear_radiobutton(this)">
                                                                    <icon:XSquare runat="server" ID="XSquare1" />
                                                                </a>
                                                            </div>

                                                            <div class="form-group txt_birth_defect_note">
                                                                <webUI:TextField runat="server" ID="txt_birth_defect_note" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Tình trạng trẻ sơ sinh sau sinh/ <span class="text-primary">Neonatal status after birth:</span></label>
                                                    <asp:Label runat="server" ID="lbl_neonatal_status"></asp:Label>
                                                    <div class="form-group" runat="server" id="neonatal_status_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_neonatal_status" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label mb-1">Can thiệp và kết quả/ <span class="text-primary">Intervention and results:</span></label>
                                                    <div>
                                                        <label class="align-top">Intervention</label>
                                                        <asp:Label runat="server" ID="lbl_intervention"></asp:Label>
                                                        <div  runat="server" id="intervention_wrapper">
                                                            <div class="d-inline-block">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" id="rad_intervention_false" name="rad_intervention" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_intervention_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" id="rad_intervention_true" name="rad_intervention" class="custom-control-input" runat="server" disabled-for="intervention_note_field" />
                                                                    <label class="custom-control-label" for="rad_intervention_true">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_intervention" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare2" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="intervention_note_field">
                                                                <label>Intervention note</label>
                                                                <div class="form-group">
                                                                    <webUI:TextField runat="server" ID="txt_intervention_note" />
                                                                </div>
                                                            </div>  
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Sổ nhau/ <span class="text-primary">Placenta delivery:</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label"></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_placenta_deli"></asp:Label>
                                                        <div class="mb-2" runat="server" id="placenta_deli_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_placenta_deli_true" name="rad_placenta_deli" class="custom-control-input" runat="server" />
                                                                <label class="custom-control-label" for="rad_placenta_deli_true">Bằng tay/ <span class="text-primary">Manual</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_placenta_deli_false" name="rad_placenta_deli" class="custom-control-input" runat="server" />
                                                                <label class="custom-control-label" for="rad_placenta_deli_false">Tự nhiên/ <span class="text-primary">Spontaneous</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_placenta_deli" onclick="clear_radiobutton(this)">
                                                                    <icon:XSquare runat="server" ID="XSquare3" />
                                                                </a>
                                                            </div>

                                                            <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Placenta delivery is required" CssClass="text-danger" OnServerValidate="placenta_deli_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                        <label class="control-label mb-1">vào lúc/ At</label>
                                                        <asp:Label runat="server" ID="lbl_pacental_deli_dt"></asp:Label>
                                                        <div class="d-inline-block mb-2" runat="server" id="pacental_deli_dt_wrapper">
                                                            <div class="form-group d-inline-block">
                                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_pacental_deli_dt" Width="200px" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_pacental_deli_dt" ErrorMessage="vào lúc/ At is required"
                                    ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Cách sổ nhau/ <span class="text-primary">Placenta delivery mode:</span></label>
                                                    <asp:Label runat="server" ID="lbl_placenta_deli_mode"></asp:Label>
                                                    <div class="form-group" runat="server" id="placenta_deli_mode_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_placenta_deli_mode" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Cân nặng/ <span class="text-primary">Weight:</span></label>
                                                    <asp:Label runat="server" ID="lbl_placenta_weight"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="placenta_weight_wrapper">
                                                        <input id="txt_placenta_weight" data-type="number" style="width: 120px" runat="server" class="form-control text-right" />
                                                        <span class="append">gram</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Dây rốn quấn cổ/ <span class="text-primary">Umbilical coil:</span></label>
                                                    <asp:Label runat="server" ID="lbl_umbilical_coil"></asp:Label>
                                                    <div runat="server" id="umbilical_coil_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" data-type="number" id="rad_umbilical_coil_false" name="rad_umbilical_coil" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_umbilical_coil_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" data-type="number" id="rad_umbilical_coil_true" name="rad_umbilical_coil" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_umbilical_coil_true">Có/ <span class="text-primary">Yes</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_umbilical_coil" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare4" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Chiều dài dây rốn/ <span class="text-primary">Umbilical length:</span></label>
                                                    <asp:Label runat="server" ID="lbl_umbilical_length"></asp:Label>
                                                    <div class="form-group mb-2" data-type="number" runat="server" id="umbilical_length_wrapper">
                                                        <input id="txt_umbilical_length" data-type="number" style="width: 120px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Lượng máu mất sau khi sổ nhau/ <span class="text-primary">Quantity of blood loss after placenta delivery:</span></label>
                                                    <asp:Label runat="server" ID="lbl_blood_loss"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="blood_loss_wrapper">
                                                        <input id="txt_blood_loss" data-type="number" style="width: 120px" runat="server" class="form-control text-right" />
                                                        <span class="append">ml</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Can thiệp và kết quả/ <span class="text-primary">Intervention and results:</span></label>
                                                    <asp:Label runat="server" ID="lbl_p_intervention"></asp:Label>
                                                    <div runat="server" id="p_intervention_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_p_intervention_false" name="rad_p_intervention" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_p_intervention_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_p_intervention_true" name="rad_p_intervention" class="custom-control-input" disabled-for="p_intervention_note_field" runat="server" />
                                                            <label class="custom-control-label" for="rad_p_intervention_true">Có, chi tiết/ <span class="text-primary">Yes, specify</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_p_intervention" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare5" />
                                                            </a>
                                                        </div>
                                                        <asp:CustomValidator ID="CustomValidator2" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Can thiệp và kết quả/ Intervention and results is required" CssClass="text-danger" OnServerValidate="p_intervention_ServerValidate"></asp:CustomValidator>
                                                        <div class="form-group p_intervention_note_field">
                                                            <webUI:TextField runat="server" ID="txt_p_intervention_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">3. Tình trạng sản phụ sau sinh/ <span class="text-primary">Maternal status after delivery:</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">SpO2:</label>
                                                    <asp:Label runat="server" ID="lbl_spO2"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="spO2_wrapper">
                                                        <input id="txt_spO2" data-type="number" runat="server" style="width: 120px" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">T°:</span></label>
                                                    <asp:Label runat="server" ID="lbl_temp"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="temp_wrapper">
                                                        <input id="txt_temp" data-type="number" style="width: 120px" runat="server" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Huyết áp/ <span class="text-primary">BP</span></label>
                                                    <asp:Label runat="server" ID="lbl_BP"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="BP_wrapper">
                                                        <input id="txt_bp" data-type="number" runat="server" style="width: 120px" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Nhịp tim/ <span class="text-primary">HR</span></label>
                                                    <asp:Label runat="server" ID="lbl_HR"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="HR_wrapper">
                                                        <input id="txt_hr" data-type="number" runat="server" style="width: 160px" class="form-control text-right" />
                                                        <span class="append">lần/phút/bpm</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Nhịp thở/ <span class="text-primary">RR</span></label>
                                                    <asp:Label runat="server" ID="lbl_RR"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="RR_wrapper">
                                                        <input id="txt_rr" data-type="number" runat="server" style="width: 160px" class="form-control text-right" />
                                                        <span class="append">lần/phút/bpm</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Tổng trạng chung/ <span class="text-primary">General appearance:</span></label>
                                                        </legend>

                                                        <div class="col-md-12 gt-2-a">
                                                            <label  class="control-label">Phương pháp sinh/ <span class="text-primary">Delivery mode:</span></label>
                                                            <div class="mb-2">
                                                                <asp:Label runat="server" ID="lbl_delivery_mode_desc"></asp:Label>
                                                                <div  runat="server" id="delivery_mode_code_wrapper">
                                                                    <div class="mb-2">
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input disabled-for="vaginal_deli_field" type="radio" id="rad_delivery_mode_code_v" name="rad_delivery_mode_code" class="custom-control-input" runat="server" />
                                                                            <label class="custom-control-label" for="rad_delivery_mode_code_v">Sanh ngã âm đạo/ <span class="text-primary">Vaginal delivery</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input disabled-for="section_field" type="radio" id="rad_delivery_mode_code_s" name="rad_delivery_mode_code" class="custom-control-input" runat="server" />
                                                                            <label class="custom-control-label" for="rad_delivery_mode_code_s">Sanh mổ/ <span class="text-primary">C-Section:</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_delivery_mode_code" onclick="clear_radiobutton(this)">
                                                                                <icon:XSquare runat="server" ID="XSquare6" />
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                
                                                                    <div>
                                                                        <div class="vaginal_deli_field">
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="rad_vaginal_deli_code_s" name="rad_vaginal_deli_code" class="custom-control-input" runat="server" />
                                                                                <label class="custom-control-label" for="rad_vaginal_deli_code_s">Sanh tự nhiên/ <span class="text-primary">Spontaneous</span></label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="rad_vaginal_deli_code_v" name="rad_vaginal_deli_code" class="custom-control-input" runat="server" />
                                                                                <label class="custom-control-label" for="rad_vaginal_deli_code_v">Sanh hút/ <span class="text-primary">Vacuum-assisted</span></label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="rad_vaginal_deli_code_f" name="rad_vaginal_deli_code" class="custom-control-input" runat="server" />
                                                                                <label class="custom-control-label" for="rad_vaginal_deli_code_f">Sanh kềm/ <span class="text-primary">Forceps-assisted</span></label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="section_field">
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="rad_section_code_el" name="rad_section_code" class="custom-control-input" runat="server" />
                                                                                <label class="custom-control-label" for="rad_section_code_el">Mổ chương trình/ <span class="text-primary">Elective</span></label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="rad_section_code_em" name="rad_section_code" class="custom-control-input" runat="server" />
                                                                                <label class="custom-control-label" for="rad_section_code_em">Mổ cấp cứu/ <span class="text-primary">Emergency</span></label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 gt-2-a">
                                                            <label  class="control-label">Lí do can thiệp, nếu có/ <span class="text-primary">Reason for intervention, if yes:</span></label>
                                                            <asp:Label runat="server" ID="lbl_interven_reason"></asp:Label>
                                                            <div class="form-group" runat="server" id="interven_reason_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_interven_reason" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 gt-2-a">
                                                            <label  class="control-label">Tầng sinh môn/ <span class="text-primary">Perineum:</span></label>
                                                            <asp:Label runat="server" ID="lbl_pre_intact"></asp:Label>

                                                            <div runat="server" id="pre_intact_wrapper">

                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_intact_true" />
                                                                    <span class="custom-control-label">Nguyên vẹn/ <span class="text-primary">Intact</span></span>
                                                                </label>

                                                                <div class="d-inline-block">
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_lacera_true" disabled-for="pre_lacera_degree" />
                                                                        <span class="custom-control-label">Rách, độ/ <span class="text-primary">Laceration, degree:</span></span>
                                                                    </label>
                                                                    <div class="d-inline-block">
                                                                        <div class="form-group pre_lacera_degree">
                                                                            <webUI:TextField runat="server" ID="txt_pre_lacera_degree" Width="120px" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="d-inline-block">
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_episiotomy_true" disabled-for="pre_episiotomy_st_field" />
                                                                        <span class="custom-control-label">Cắt/ <span class="text-primary">Episiotomy. Nếu có, cách khâu và loại chỉ/ If yes, suture and silk type:</span></span>
                                                                    </label>
                                                                    <div class="d-inline-block">
                                                                        <div style="width: 120px" class="form-group pre_episiotomy_st_field">
                                                                            <webUI:TextField Width="120px" runat="server" ID="txt_pre_episiotomy_st" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label  class="control-label">Cổ tử cung/ <span class="text-primary">Cervix:</span></label>
                                                            <asp:Label runat="server" ID="lbl_cervix_intact"></asp:Label>
                                                            <div runat="server" id="cervix_intact_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" id="rad_cervix_intact_true" name="rad_cervix_intact" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_cervix_intact_true">Nguyên vẹn/ <span class="text-primary">Intact</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" id="rad_cervix_intact_false" name="rad_cervix_intact" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_cervix_intact_false">Rách/ <span class="text-primary">Laceration</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_cervix_intact" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare7" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">4. Thông tin phẫu thuật (nếu có)/ <span class="text-primary">Operation details (if possible):</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Chẩn đoán tiền phẫu/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                                    <asp:Label runat="server" ID="lbl_preo_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="preo_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_preo_diagnosis" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Chẩn đoán hậu phẫu/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                    <asp:Label runat="server" ID="lbl_post_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="post_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_post_diagnosis" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-2">
                                                    <div  class="mb-2 table-responsive">
                                                        <asp:UpdatePanel ID="updatePanel_operations" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>
                                                    <div >
                                    <asp:GridView ID="grid_operations"  OnRowDataBound="grid_operations_RowDataBound" OnRowDeleting="grid_operations_RowDeleting" runat="server" ShowHeaderWhenEmpty="true" ShowHeader="true" CssClass="table-bordered" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 75px" class="pt-2 pb-2">Ngày/ <span class="text-primary">Date</span> - Giờ/ <span class="text-primary">hour</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <div class="form-group">
                                                                                <%--<telerik:RadDateTimePicker ID="date_time" SelectedDate='<%# DBNull.Value.Equals(Eval("date_time")) ? null : Eval("date_time") %>' Width="200px" runat="server" />--%>
                                                                                <telerik:RadDateTimePicker ID="date_time" Width="200px" runat="server" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                                                                <asp:HiddenField ID="date_time_check" runat="server" Value='<%# Eval("date_time") %>' />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 180px">Phương pháp phẫu thuật và vô cảm/ <span class="text-primary">Surgical and Anesthesia methods</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("surgical_anesthesia") %>' ID="surgical_anesthesia" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 165px">Phẫu thuật viên/ <span class="text-primary">Surgeon</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("surgeon") %>' ID="surgeon" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 165px">Bác sĩ gây mê/ <span class="text-primary">Anesthesiologist</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("anesthesiologist") %>' ID="anesthesiologist" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                                <icon:Trash runat="server"/>
                                                                            </asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:UpdateProgress ID="updateProgress_operations" runat="server" AssociatedUpdatePanelID="updatePanel_operations">
                                                                <ProgressTemplate>
                                                                    Please wait....
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            
                                                        
                                                    </div>
                                                        <div class="mt-2">
                                                                <asp:Button ID="btn_grid_operations_add" OnClick="btn_grid_operations_add_Click" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Add row" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btn_grid_operations_add" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Tai biến/ <span class="text-primary">Incident:</span></label>
                                                    <asp:Label runat="server" ID="lbl_sur_incident"></asp:Label>
                                                    <div runat="server" id="sur_incident_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_sur_incident_false" name="rad_sur_incident" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_sur_incident_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_sur_incident_true" name="rad_sur_incident" class="custom-control-input" disabled-for="sur_incident_note_field" runat="server" />
                                                            <label class="custom-control-label" for="rad_sur_incident_true">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_sur_incident" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare8" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group sur_incident_note_field mb-2">
                                                            <webUI:TextField runat="server" ID="txt_sur_incident_note" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Biến chứng/ <span class="text-primary">Complication:</span></label>
                                                    <asp:Label runat="server" ID="lbl_sur_complication"></asp:Label>
                                                    <div runat="server" id="sur_complication_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_sur_complication_false" name="rad_sur_complication" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_sur_complication_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_sur_complication_true" name="rad_sur_complication" class="custom-control-input" disabled-for="sur_complication_note_field" runat="server" />
                                                            <label class="custom-control-label" for="rad_sur_complication_true">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_sur_complication" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare9" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group sur_complication_note_field">
                                                            <webUI:TextField runat="server" ID="txt_sur_complication_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-4">
                                                <legend>
                                                    <label class="control-label">5. Kế hoạch điều trị/ <span class="text-primary">Treatment plan:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <span></span>
                                                    <asp:Label runat="server" ID="lbl_treatment_plan"></asp:Label>
                                                    <div class="form-group" runat="server" id="treatment_plan_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_treatment_plan" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-actions">
                                                        <asp:LinkButton ValidationGroup="Group2" runat="server" OnClick="btnComplete_Click" ID="btnComplete"  CssClass="btn btn-primary waves-effect" >Complete</asp:LinkButton>

                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect" >Save</asp:LinkButton>

                                                        <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>

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
                                        </div>
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
        checkboxRadiobutton_init();
        formGroup_init();

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            InputFilter();
            checkboxRadiobutton_init();
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                    document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

        function btnPrint_Click() {

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

