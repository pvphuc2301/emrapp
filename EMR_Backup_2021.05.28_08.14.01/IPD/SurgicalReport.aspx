<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurgicalReport.aspx.cs" Inherits="EMR.SurgicalReport" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

</head>
<body>
    
    <div class="cssclsNoScreen">
    <table class="report-container">
        <thead class="report-header">
            <tr>
                <th class="report-header-cell">
                    <div class="header-info" style="display: flex; align-items: center;">
                        <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
            <div style="flex-grow: 1; text-align: center;">
                <div style="color: #007297; font-size: 26.6667px;">GIẤY CHỨNG NHẬN ĐIỀU TRỊ</div>
            <div style="color: #e20e5a; font-size: 16.6667px;">MEDICAL CERTIFICATE - Mr Chung test</div>
            </div>
            <div style="width: 200px; text-align: center">
                <div>MAI MAI MÃI1</div>
                <div>05-10-1960 | Nữ</div>
                <webUI:Barcode runat="server" id="Barcode" Text="900000488" Width="200" Height="40" />
                <div>900000488</div>
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
                    <div class="main" runat="server" id="print_content">
                        <!-- Design Printed form here -->
                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">5. Chẩn đoán sau phẫu thuật/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                        <label id="lblChanDoanTruocPhauThuat" runat="server" >
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>

                                         
                            <!-- Design Printed form here -->


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


   <%-- <div class="cssclsNoPrint">--%>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    

    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="AmendReasonPlaceHolder" runat="server"></div>
                    <webUI:AmendReason runat="server" ID="txt_amendReason" />
                    <webUI:PatientInfo runat="server" ID="PatientInfo1" />
                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">SURGICAL REPORT</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body">
                                    <form action="#" class="form-horizontal form-bordered">
                                        <div class="form-body">

                                            <div class="row">
                                                <div class="col-sm-6 col-md-4 mb-2">
                                                    <label class="control-label mb-1 font-bold">3. Ngày phẫu thuật/ <span class="text-primary">Procedure Date:</span></label>

                                                    <div class="form-group">
                                                        <telerik:RadDatePicker RenderMode="Classic" ID="rad_procedure_date" runat="server"></telerik:RadDatePicker>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 col-md-4 mb-2">
                                                    <label class="control-label mb-1">Giờ bắt đầu/ <span class="text-primary">Procedure Date:</span></label>
                                                    <div class="form-group">
                                                        <telerik:RadTimePicker RenderMode="Classic" Width="218px" ID="rad_start_time" runat="server">
                                                        </telerik:RadTimePicker>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 col-md-4 mb-2">
                                                    <label class="control-label mb-1">Giờ kết thúc/ <span class="text-primary">Finish time:</span></label>
                                                    <div class="form-group">
                                                        <telerik:RadTimePicker RenderMode="Classic" Width="218px" ID="rad_finish_time" runat="server">
                                                        </telerik:RadTimePicker>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">4. Chẩn đoán trước phẫu thuật/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                                        <webUI:TextField runat="server" id="txt_preo_diagnosis" />
                                                     </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">5. Chẩn đoán sau phẫu thuật/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                        <webUI:TextField runat="server" id="txt_post_diagnosis" />

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">6. Phương pháp phẫu thuật/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                        <webUI:TextField runat="server" id="txt_name_procedure" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">7. Phương pháp vô cảm/ <span class="text-primary">Type of Anesthesia:</span></label>
                                                        <webUI:TextField runat="server" id="txt_anesthesia" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">8. Bác sĩ phẫu thuật/ <span class="text-primary">Surgeon:</span></label>
                                                        <webUI:TextField runat="server" id="txt_surgeon" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">9. Phụ mổ/ <span class="text-primary">Assistant surgeon:</span></label>
                                                        <webUI:TextField runat="server" id="txt_assistant_surgeon" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">10. Bác sĩ gây mê hồi sức/ <span class="text-primary">Anesthesiologist:</span></label>
                                                        <webUI:TextField runat="server" id="txt_anesthesiologist" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">11. Điều dưỡng gây mê/ <span class="text-primary">Anesthetic nurse:</span></label>
                                                        <webUI:TextField runat="server" id="txt_anesthetic_nurse" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">12. Điều dưỡng vòng trong/ <span class="text-primary">Scrub nurse:</span></label>
                                                        <webUI:TextField runat="server" id="txt_scrub_nurse" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">13. Điều dưỡng vòng ngoài/ <span class="text-primary">Circulating nurse:</span></label>
                                                        <webUI:TextField runat="server" id="txt_circulating_nurse" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">14. Ước lượng lượng máu mất/ <span class="text-primary">Estimated bloodloss:</span></label>
                                                        <webUI:TextField runat="server" id="txt_estimated_bloodloss" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">15. Giải phẫu bệnh/ <span class="text-primary">Biopsy pathology:</span></label>
                                                        <webUI:TextField runat="server" id="txt_biopsy_pathology" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                        <label class="control-label mb-1 font-bold">16. Biến chứng/ <span class="text-primary">Complications:</span></label>
                                                        <webUI:TextField runat="server" id="txt_complications" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 font-bold">LƯỢC ĐỒ PHẪU THUẬT/ <span class="text-primary">PROCEDURECHART</span></label>
                                                </div>
                                                <div class="col-md-12">
                                                    <webUI:TextField runat="server" id="txt_procedure_chart" />
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 font-bold">TƯỜNG TRÌNH PHẪU THUẬT/ <span class="text-primary">PROCEDURE NARRATIVE</span></label>
                                                </div>
                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_procedure_narrative" />
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- End Hospitalisation required -->

                                            <div class="form-actions mb-3">
                                                <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                                <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                                <asp:Button ID="btnDeleteModal" data-toggle="modal" data-target="#deleteDocumentModal" OnClick="btnAmend_Click" class="btn btn-danger" runat="server" Text="Delete" />

                                                <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                                <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" OnClientClick="Print()" Text="Print" />

                                                <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                                            </div>

                                            <div class="modal fade" id="deleteDocumentModal" tabindex="-1" role="dialog" aria-labelledby="deleteDocumentModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="deleteDocumentModalLabel">Delete document</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p runat="server">Please provide reason for deletion</p>
                                                            <div class="form-group mb-2">
                                                                <webUI:TextField runat="server" id="TextField1" />
                                                            </div>
                                                            <div class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                            <asp:Button runat="server" Text="Delete" ID="btnDelete" class="btn btn-danger" OnClick="btnDelete_Click" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnAmend" />
                    <asp:PostBackTrigger ControlID="btnCancel" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>

  <%--</div>--%>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
     <script>
        function Print() {

        <% LoadDataToPrint(); %>
        window.print();
        }
     </script>
</body>
</html>


