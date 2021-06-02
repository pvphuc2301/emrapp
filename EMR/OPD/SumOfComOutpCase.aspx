<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SumOfComOutpCase.aspx.cs" Inherits="EMR.SummaryOfComplexOutpatientCases" %>

<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>

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
                                <div style="color: #007297; font-size: 26.6667px;">TÓM TẮT CA BỆNH NGOẠI TRÚ PHỨC TẠP</div>
            <div style="color: #e20e5a; font-size: 16.6667px;">SUMMARY OF COMPLEX OUTPATIENT CASES</div>
                            </div>
                            <webUI:PatientLabel1 runat="server" id="PatientLabel1" />
                        </div>
                        <webUI:Line runat="server" id="Line" />
                    </th>
                </tr>
            </thead>
            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main" runat="server" id="print_content">
                            <div class="row mb-2">
                <div class="col-6">
                    <webUI:Label runat="server" Title="Họ tên bệnh nhân:" SubTitle="Patient's name" />
                    <div class="d-inline-block ml-2 align-top">MAI MAI MAI</div>
                </div>
                <div class="col-6">
                    <webUI:Label runat="server" Title="Ngày xuất viện:" SubTitle="Date of Discharge" />
                    <div class="d-inline-block ml-2 align-top">04-10-1960</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-6">
                    <webUI:Label runat="server" Title="Giới tính:" SubTitle="Gender" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
                <div class="col-6">
                    <webUI:Label runat="server" Title="Mã BN:" SubTitle="Patient ID" />
                    <div class="d-inline-block ml-2 align-top">900005754</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="Ngày làm tóm tắt:" SubTitle="Date of summary report" />
                    <div class="d-inline-block ml-2 align-top">17-04-2020</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="Dị ứng:" SubTitle="Allergy" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="Các cận lâm sàng nổi bật:" SubTitle="Remarkable para-clinical tests" />
                    <div class="d-inline-block ml-2 align-top">Remarkable para-clinical tests</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="Tiền sử bệnh:" SubTitle="Past history" />
                    <div class="d-inline-block ml-2 align-top">No History</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="Các chuẩn đoán chính:" SubTitle="Significant diagnosis" />
                    <div class="d-inline-block ml-2 align-top">J10: Influenza due to other identified influenza virus (J10);J11.0: Influenza with pneumonia, virus not identified (J11.0);N40: Hyperplasia of prostate (N40)\buou tuyen tien liet;</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="Các thuốc đang dùng:" SubTitle="Current treatment and medications" />
                    <div class="d-inline-block ml-2 align-top">No Medication</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="Kế hoạch điều trị:" SubTitle="Current care plans" />
                    <div class="d-inline-block ml-2 align-top">Current care plans</div>
                </div>
            </div>


            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="Lời khuyên và theo dõi:" SubTitle="Recommendation and Follow-up" />
                    <div class="d-inline-block ml-2 align-top">Recommendation and Follow-up</div>
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
    <form id="form1" runat="server">
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="loader">
                <div class="loader__figure"></div>
                <p class="loader__label">AIH Hospital</p>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div class="scroll-sidebar h-100 w-100">
            <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
            <asp:Panel runat="server" ID="messagePlaceHolder">
                <webUI:AmendReason runat="server" ID="txt_amendReason" />
            </asp:Panel>

            <webUI:PatientInfo runat="server" ID="PatientInfo1" />
 
            <div class="row">
                <div class="col-md-12">
                    <div class="card mt-2">
                        <div class="card-header">
                            <h4 class="text-primary">SUMMARY OF COMPLEX OUTPATIENTS CASES</h4>
                            <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                        </div>
                            <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body mb-4">
                                        
                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-2">Tình trạng dị ứng/ <span class="text-primary">Allergy profile:</span></label>
                                                <div class="custom-control custom-radio d-inline-block">
                                                    <input type="radio" runat="server" id="rad_disc_reason_code_dama" disabled-for="dama_field" name="rad_disc_reason_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_disc_reason_code_dama"><span class="text-primary">Không/ </span>No</label>
                                                </div>
                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                    <input type="radio" runat="server" id="rad_disc_reason_code_transfer" disabled-for="allery_field" name="rad_disc_reason_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_disc_reason_code_transfer">Có, ghi rõ/ <span class="text-primary">Yes, specify</span></label>
                                                    <a href="javascript:void(0)" class="el-hide" data-clear="rad_disc_reason_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare38" />
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-12 allery_field mb-2">
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_admission_reason" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group has-error">
                                                    <label class="control-label mb-1">Các cận lâm sàng nổi bật/ <span class="text-primary">Remarkable para-clinical tests:</span></label>
                                                    <webUI:TextField runat="server" ID="TextField1" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Tiền sử bệnh/ <span class="text-primary">Past history:</span></label>
                                                    <webUI:TextField runat="server" ID="TextField2" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Các chẩn đoán chính/<span class="text-primary">Significant diagnosis:</span></label>
                                                    <webUI:TextField runat="server" ID="TextField3" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Các thuốc đang dùng/<span class="text-primary">Current treatment and medications:</span></label>
                                                    <webUI:TextField runat="server" ID="TextField4" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Kế hoạch điều trị/<span class="text-primary">Current care plans:</span></label>
                                                    <webUI:TextField runat="server" ID="TextField5" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Lời khuyên và theo dõi/<span class="text-primary">Recommendation and Follow-up:</span></label>
                                                    <webUI:TextField runat="server" ID="TextField6" />
                                                </div>
                                            </div>
                                        </div>

                                        <fieldset class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />
                                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                                    <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>

                                                    <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                    <asp:Button ID="btnPrint" OnClientClick="window.print()" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                                </div>
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
                    <!-- Row -->

                </div>
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

