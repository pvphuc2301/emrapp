<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedRecForNeoVaccin.aspx.cs" Inherits="EMR.OPD.MedRecForNeoVaccin" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

</head>
<body>
    <webui:printwindow runat="server" id="PrintWindow">
        <PrintHeader>
            <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
            <div style="flex-grow: 1; text-align: center;">
                <div style="color: #007297; font-size: 26.6667px;">BỆNH ÁN TIÊM CHỦNG SƠ SINH</div>
            <div style="color: #e20e5a; font-size: 16.6667px;">MEDICAL RECORD FOR NEONATAL VACCINATION</div>
            </div>
            <div style="width: 200px; text-align: center">
                <div>MAI MAI MÃI1</div>
                <div>05-10-1960 | Nữ</div>
                <webUI:Barcode runat="server" id="Barcode" Text="900000488" Width="200" Height="40" />
                <div>900000488</div>
            </div>
        </PrintHeader>
        <PrintContent>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT" />
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-6">
                   <webUI:Label runat="server" Title="Họ tên bệnh nhân:" SubTitle="Patient's name" />
                    <div class="d-inline-block ml-2 align-top">MAI MAI MÃI1</div>
                </div>
                <div class="col-6">
                   <webUI:Label runat="server" Title="Ngày sinh:" SubTitle="DOB" />
                    <div class="d-inline-block ml-2 align-top">05-10-1960</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Giới tính:" SubTitle="Gender" />
                    <webUI:Label runat="server" Title="Nam" SubTitle="Male" />
                    <webUI:Label runat="server" Title="Nữ " SubTitle="Female" />
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-6">
                    <webUI:Label runat="server" Title="Khoa:" SubTitle="Dept" />
                    <div class="d-inline-block ml-2 align-top">Khoa khám bệnh</div>
                </div>
                <div class="col-6">
                    <webUI:Label runat="server" Title="Mã BN:" SubTitle="Patient ID" />
                    <div class="d-inline-block ml-2 align-top">900000488</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau:" SubTitle="Visited and received treatment at our hospital, with the following information" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="I. Lý do đến khám/ " /><webUI:Label runat="server" Title="Chief complaint:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="II. Bệnh sử/"  /><webUI:Label runat="server" Title="Medical history:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="1. Bệnh sử hiện tại/ "/><webUI:Label runat="server" Title="Current medical history:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12" style ="margin-left:5px">
                   * <webUI:Label runat="server" Title="Thuốc đang sử dụng/ "/><webUI:Label runat="server" Title="Current medications:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12" style ="margin-left:5px">
                   <webUI:Label runat="server" Title="2. Tiền sử bệnh/" /><webUI:Label runat="server" Title="Antecedent medical history:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12" style ="margin-left:5px">
                    * <webUI:Label runat="server" Title="Bản thân/ " /><webUI:Label runat="server" Title="Personal:"/>
                    <div class="d-inline-block ml-2 align-top"></div>

                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12" style ="margin-left:5px">
                   <webUI:Label runat="server" Title=" Gia đình/ " /><webUI:Label runat="server" Title="Family:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12" style ="margin-left:5px">
                   <webUI:Label runat="server" Title="Dị ứng/ " /><webUI:Label runat="server" Title="Allergy:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12" style ="margin-left:10px">
                   <webUI:Label runat="server" Title="• Nếu có, nêu rõ/ " /><webUI:Label runat="server" Title="If yes, specify:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="III. Khám bệnh/ " /><webUI:Label runat="server" Title="Physical examination:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="• Dấu hiệu sinh tồn/ "/><webUI:Label runat="server" Title="Vital signs:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12">
                   table
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="• Khám sàng lọc trước tiêm chủng/" /><webUI:Label runat="server" Title="Screening before vaccination:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12" style="margin-left: 5px">
                   <webUI:Label runat="server" Title="1. Tình trạng sức khỏe chưa ổn định/ " /><webUI:Label runat="server" Title="Unstable health condition:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12"style="margin-left: 5px">
                    <webUI:Label runat="server" Title="2. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 37,5°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ " /><webUI:Label runat="server" Title="Fever / Hypothermia (Fever:temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12"style="margin-left: 5px">
                   <webUI:Label runat="server" Title="3. Khóc bé hoặc không khóc/ " /><webUI:Label runat="server" Title="Cry or unable to cry:"/>
                    <div class="d-inline-block ml-2 align-top">
                    </div>
                </div>
            </div>
             <div class="row mb-2">
                <div class="col-12"style="margin-left: 5px">
                   <webUI:Label runat="server" Title="4. Da, môi không hồng/ Fever/ "/><webUI:Label runat="server" Title="Skin and lips are not pink:"/>
                    <div class="d-inline-block ml-2 align-top">
                    </div>
                </div>
            </div>
             <div class="row mb-2">
                <div class="col-12"style="margin-left: 5px">
                   <webUI:Label runat="server" Title="5. Bú kém hoặc bỏ bú/ "/><webUI:Label runat="server" Title="Poor breastfeeding or breastfeeding refusal:"/>
                    <div class="d-inline-block ml-2 align-top">
                    </div>
                </div>
            </div>
             <div class="row mb-2">
                <div class="col-12"style="margin-left: 5px">
                   <webUI:Label runat="server" Title="6. Tuổi thai < 28 tuần/ " /><webUI:Label runat="server" Title="Gestational age < 28 weeks:"/>
                    <div class="d-inline-block ml-2 align-top">
                    </div>
                </div>
            </div>
             <div class="row mb-2">
                <div class="col-12"style="margin-left: 5px">
                   <webUI:Label runat="server" Title="7. Trẻ < 34 tuần tuổi/ "/><webUI:Label runat="server" Title="Children < 34 weeks old:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
             <div class="row mb-2">
                <div class="col-12"style="margin-left: 5px">
                   <webUI:Label runat="server" Title="8. Cân nặng của trẻ < 2000 g, mẹ có HBsAg (-) / "/><webUI:Label runat="server" Title="Child's weight < 2000g, his/her morther HbsAg (-):"/>
                    <div class="d-inline-block ml-2 align-top">abc</div>
                </div>
            </div>
             <div class="row mb-2">
                <div class="col-12"style="margin-left: 5px">
                   <webUI:Label runat="server" Title="9. Các chống chỉ định khác, nếu có ghi rõ/ "/><webUI:Label runat="server" Title="Other contraindications, if yes specified:"/>
                    <div class="d-inline-block ml-2 align-top">
                    </div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="IV. Chỉ định và kết quả xét nghiệm/ "/><webUI:Label runat="server" Title="Laboratory indications and results:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12" style="margin-left:5px">
                   <webUI:Label runat="server" Title="• Loại vắc xin tiêm chủng lần này/ "/><webUI:Label runat="server" Title="Appointed vaccine:"/>
                    <div class="d-inline-block ml-2 align-top">table</div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12" style="margin-left:5px">
                   <webUI:Label runat="server" Title="• Khảo sát bổ sung khác/ " /><webUI:Label runat="server" Title="Additional investigations:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="V. Kết luận/ "/><webUI:Label runat="server" Title="Conclusion:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12" style="margin-left:5px">
                   <webUI:Label runat="server" Title="• Chẩn đoán ban đầu/ " /><webUI:Label runat="server" Title="Initial diagnosis:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12" style="margin-left:5px">
                   <webUI:Label runat="server" Title="• Chẩn đoán phân biệt/ "/><webUI:Label runat="server" Title="Differential diagnosis:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12" style="margin-left:5px">
                   <webUI:Label runat="server" Title="• Bệnh kèm theo/ "/><webUI:Label runat="server" Title="Associated conditions:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12" style="margin-left:5px">
                   <webUI:Label runat="server" Title="• Điều trị/ " /><webUI:Label runat="server" Title="Treatment:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="* Yêu cầu ý kiến chuyên khoa/ "/><webUI:Label runat="server" Title="Specialized opinion requested:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12"style="margin-left:5px">
                   <webUI:Label runat="server" Title="• Nếu có, nêu rõ/ "/><webUI:Label runat="server" Title="If yes, specify:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12"style="margin-left:5px">
                   <webUI:Label runat="server" Title="• Hướng dẫn cụ thể dành cho bệnh nhân/ " /><webUI:Label runat="server" Title="Specific education required:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12"style="margin-left:5px">
                   <webUI:Label runat="server" Title="• Hẹn lần khám tới/ " /><webUI:Label runat="server" Title="Next appointment:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="VI. Xác nhận của người tiêm chủng/người giám hộ hợp pháp / "/><webUI:Label runat="server" Title="Confirmation of patient/legal guardian:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12" style="margin-left:2px">
                   <webUI:Label runat="server" Title="• Tôi đã được nghe bác sĩ tư vấn và đồng ý tiêm chủng cho tôi/người mà tôi làm giám hộ hợp pháp.Tôi đãkiểm tra đúng thuốc tiêm và thuốc còn thời hạn dùng." 
                       SubTitle="I have been consulted and agree on vaccination. I checked right medication and medication has still notexpired." />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12" style="margin-left:2px">
                   <webUI:Label runat="server" Title="• Họ tên người tiêm chủng/người giám hộ/ "/><webUI:Label runat="server" Title="Full name of patient/ guardian:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-12" style="margin-left:2px">
                   <webUI:Label runat="server" Title="• Chữ ký người tiêm chủng/người giám hộ/ "/><webUI:Label runat="server" Title="Signature of patient / guardian:"/>
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-6">

                </div>
                <div class="col-6 mb-2">
                    <div>
                        <webUI:Signature runat="server" Title="BÁC SĨ ĐIỀU TRỊ" SubTitle="ATTENDING DOCTOR" FullName="Dr. Nguyen Dinh My">
                            <ItemTemplate>
                                <webUI:Date runat="server" Day="23" Month="5" Year="2021" />
                            </ItemTemplate>
                        </webUI:Signature>
                    </div>
                </div>
            </div>

        </PrintContent>
    </webui:printwindow>
    <div class="cssclsNoPrint">
    <form method="post" action="#" id="form1" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
            <div class="scroll-sidebar h-100 w-100">
                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <webUI:AmendReason runat="server" ID="txt_amendReason" />
                        </asp:Panel>

                        <uc1:PatientInfo runat="server" ID="PatientInfo" />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">MEDICAL RECORD FOR NEONATAL VACCINATION</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-body collapse show" id="collapseOne">
                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">1. Bệnh sử hiện tại/ <span class="text-primary">Current medical history:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_cur_med_history" />
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <label class="control-label mb-1 d-inline-block ">* Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_cur_medications" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Tiền sử bệnh/ <span class="text-primary">Antecedent medical history:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <label class="control-label mb-1">Bản thân/ <span class="text-primary">Personal:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_personal" />
                                                    </div>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_family" />
                                                    </div>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <label class="control-label mb-1 d-block">Dị ứng/ <span class="text-primary">Allergy:</span></label>

                                                    <div class="custom-control custom-radio d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_allergy_False" runat="server" name="rad_allergy" class="custom-control-input" />
			                                            <label class="custom-control-label" for="rad_allergy_False">Không/<span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                        <input disabled-for="required_code_field" type="radio" id="rad_allergy_True" runat="server" name="rad_allergy" class="custom-control-input" />
			                                            <label class="custom-control-label" for="rad_allergy_True">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
			                                            <a href="javascript:void(0)" class="el-hide" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
				                                            <icon:xsquare runat="server" ID="XSquare2" />
			                                            </a>
                                                    </div>

                                                    <div class="form-group txt_allergy_note mt-2">
                                                        <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                                </legend>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                    <div class="form-group w-5 d-inline-block">
                                                        <input runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                        <span class="append">Kg</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                    <div class="form-group w-5 d-inline-block">
                                                        <input runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input maxlength="3" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <div class="form-group w-5 d-inline-block">
                                                        <input id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_BMI" class="form-control text-right" disabled="disabled" />
                                                        <span class="append">(Kg/m <sup>2</sup>)</span>
                                                    </div>
                                                    <p class="mt-1">
                                                        (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not applicable for children and pregnant</span>)
                                                    </p>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Khám sàng lọc trước tiêm chủng/ <span class="text-primary">Screening before vaccination:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">1. Tình trạng sức khỏe chưa ổn định/ <span class="text-primary">Unstable health condition:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_1" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">2. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 37,5°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ <span class="text-primary">Fever / Hypothermia (Fever: temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_2" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">3. Khóc bé hoặc không khóc/ <span class="text-primary">Cry or unable to cry:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_3" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">4. Da, môi không hồng/ <span class="text-primary">Skin and lips are not pink:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_4" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">5. Bú kém hoặc bỏ bú/ <span class="text-primary">Poor breastfeeding or breastfeeding refusal:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_5" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">6. Tuổi thai < 28 tuần/ <span class="text-primary">Gestational age <28 weeks:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_6" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">7. Trẻ < 34 tuần tuổi/ <span class="text-primary">Children <34 weeks old:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_7" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">8. Cân nặng của trẻ < 2000 g, mẹ có HBsAg (-)/ <span class="text-primary">Child's weight < 2000g, his/her morther HbsAg (-):</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_8" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">9. Các chống chỉ định khác, nếu có ghi rõ/ <span class="text-primary">Other contraindications, if yes specified:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_9" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                </div>
                                                <div class="col-12">
                                                    <asp:UpdatePanel ID="updatePanel_appointed_vaccine" runat="server" UpdateMode="Always">
		                                                <ContentTemplate>
			                                                <asp:GridView ShowHeaderWhenEmpty="true"
				                                                ID="grid_appointed_vaccine" runat="server"
				                                                OnRowDeleting="grid_appointed_vaccine_RowDeleting"
				                                                OnRowUpdating="gridappointed_vaccine_RowUpdating"
				                                                OnRowDataBound="gridappointed_vaccine_RowDataBound"
				                                                CssClass="tb-responsive"
				                                                AutoGenerateColumns="false">
				                                                <Columns>
					                                                <asp:TemplateField>
						                                                <HeaderTemplate>
							                                                <div style="width: 300px">Tên vaccin/ <span class="text-primary">Drug names</span></div>
						                                                </HeaderTemplate>
						                                                <ItemTemplate>
							                                                <webUI:TextField Value='<%#Eval("drug_name") %>' DataKey="drug_name" runat="server" />
						                                                </ItemTemplate>
					                                                </asp:TemplateField>
					                                                <asp:TemplateField>
						                                                <HeaderTemplate>
							                                                <div style="width: 300px">Hàm lượng/ <span class="text-primary">Strength</span></div>
						                                                </HeaderTemplate>
						                                                <ItemTemplate>
							                                                <webUI:TextField Value='<%#Eval("strength") %>' DataKey="strength" runat="server" />
						                                                </ItemTemplate>
					                                                </asp:TemplateField>
					                                                <asp:TemplateField>
						                                                <HeaderTemplate>
							                                                <div style="width: 300px">Đường dùng/ <span class="text-primary">Route</span></div>
						                                                </HeaderTemplate>
						                                                <ItemTemplate>
							                                                <webUI:TextField Value='<%#Eval("router") %>' DataKey="router" runat="server" />
						                                                </ItemTemplate>
					                                                </asp:TemplateField>
					                                                <asp:TemplateField>
						                                                <HeaderTemplate>
							                                                <div style="width: 300px">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do/ <span class="text-primary">Additional instruction/ PRN order with reason</span></div>
						                                                </HeaderTemplate>
						                                                <ItemTemplate>
							                                                <webUI:TextField Value='<%#Eval("reason") %>' DataKey="reason" runat="server" />
						                                                </ItemTemplate>
					                                                </asp:TemplateField>
					                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
				                                                </Columns>
			                                                </asp:GridView>
			                                                <asp:UpdateProgress ID="updateProgress_appointed_vaccine" runat="server" AssociatedUpdatePanelID="updatePanel_appointed_vaccine">
				                                                <ProgressTemplate>
					                                                Please wait....
				                                                </ProgressTemplate>
			                                                </asp:UpdateProgress>
			                                                <div class="mt-2">
				                                                <asp:Button ID="btn_grid_appointed_vaccine_add" runat="server" CssClass="btn btn-sm btn-outline-primary " OnClick="btn_grid_appointed_vaccine_add_Click" Text="Add row" />
			                                                </div>
		                                                </ContentTemplate>
		                                                <Triggers>
			                                                <asp:AsyncPostBackTrigger ControlID="btn_grid_appointed_vaccine_add" EventName="Click" />
		                                                </Triggers>
	                                                </asp:UpdatePanel>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Loại vắc xin tiêm chủng lần này/ <span class="text-primary">Appointed Vaccine:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_additional_investigations" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis (ICD 10):</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis (ICD 10):</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_differential_diagnosis" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Kế hoạch điều trị/ <span class="text-primary">Treatment:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_treatment_code_OPD" runat="server" name="rad_treatment_code" class="custom-control-input" />
			                                            <label class="custom-control-label" for="rad_treatment_code_OPD">
				                                            Ngoại trú/ <span class="text-primary">Ambulatory care</span>
			                                            </label>
                                                    </div>
                                                    <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_treatment_code_IPD" runat="server" name="rad_treatment_code" class="custom-control-input" />
			                                            <label class="custom-control-label" for="rad_treatment_code_IPD">
				                                            Nhập viện/ <span class="text-primary">Admission</span>
			                                            </label>
                                                    </div>
                                                    <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_treatment_code_TRF" runat="server" name="rad_treatment_code" class="custom-control-input" />
			                                            <label class="custom-control-label" for="rad_treatment_code_TRF">
				                                            Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_treatment_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare1" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="custom-control custom-radio d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_spec_opinion_req_False" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
			                                            <label class="custom-control-label" for="rad_spec_opinion_req_False">Không/<span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                        <input disabled-for="spec_opinion_req_text_field" type="radio" id="rad_spec_opinion_req_True" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
			                                            <label class="custom-control-label" for="rad_spec_opinion_req_True">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
			                                            <a href="javascript:void(0)" class="el-hide" data-clear="rad_spec_opinion_req" onclick="clear_radiobutton(this)">
				                                            <icon:xsquare runat="server" ID="XSquare3" />
			                                            </a>
                                                    </div>

                                                    <div class="form-group par spec_opinion_req_text_field">
                                                        <webUI:TextField runat="server" ID="txt_spec_opinion_req_text" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <webUI:TextField runat="server" ID="txt_pecific_edu_req" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <webUI:TextField runat="server" ID="txt_next_appointment" />
                                                </div>
                                            </fieldset>

                                        </div>

                                        <fieldset class="row mb-2">
                                            <div class="form-actions">
                                                <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" /> 
                                                <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                                <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                <asp:Button OnClientClick="window.print()" ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
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

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        <asp:PostBackTrigger ControlID="btnAmend" />
                        <asp:PostBackTrigger ControlID="btnCancel" />
                        <asp:PostBackTrigger ControlID="btnComplete" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </form>

    </div>
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>
</html>

