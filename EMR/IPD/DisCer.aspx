<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisCer.aspx.cs" Inherits="EMR.DischargeCertificate" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
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
                                    <div class="header-info" style="display: grid; grid-template-columns: 250px 1fr 150px">
                                        <div class="text-center align-top" style="line-height: 16.6667px; height: 90px; background: blue;">
                                            <div>SỞ Y TẾ TP.HCM</div>
                                            <div class="text-primary">HCMC DOH</div>
                                            <div>BỆNH VIỆN QUỐC TẾ MỸ</div>
                                            <div class="text-primary">AMERICAN INTERNATIONAL HOSPITAL</div>
                                            <div style="margin-top: 10px;" class="font-bold">KHOA/<span class="text-primary">DEPARTMENT:</span></div>
                                            <asp:Label runat="server" ID="prt_disc_ward_desc"></asp:Label>
                                        </div>
                                        <div class="text-center ml-2 mr-2  align-top" style="height: 90px">
                                            <div class="font-bold">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</div>
                                            <div class="text-primary">SOCIALIST REPUBLIC OF VIETNAM</div>
                                            <div style="margin-top: 10px;" class="font-bold">Độc lập - Tự do - Hạnh phúc</div>
                                            <div class="text-primary">Independence – Freedom – Happiness</div>
                                        </div>
                                        <div class="align-top" style="height: 90px">
                                            <div>MS: 01/BV-01</div>
                                            <div>Số lưu trữ/ <span class="text-primary">No:</span></div>
                                            <div>
                                                Mã Y tế/ <span class="text-primary">PID:</span>
                                                <asp:Label runat="server" ID="prt_vpid" />
                                            </div>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                        </thead>

                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main">
                                        <div class="text-center font-bold h4 mt-4 mb-4">
                                            <div>GIẤY RA VIỆN</div>
                                            <div class="text-primary">DISCHARGE CERTIFICATE</div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 325px 275px 139px">
                                            <div>
                                                <webUI:Label runat="server" SubTitle="Patient's Name" Title="Họ tên người bệnh:" />
                                                <asp:Label runat="server" ID="prt_fullname" />
                                            </div>

                                            <div>
                                                <webUI:Label runat="server" SubTitle="DOB" Title="Ngày tháng năm sinh:" />
                                                <asp:Label runat="server" ID="prt_dob" />
                                            </div>

                                            <div>
                                                <webUI:Label runat="server" SubTitle="Gender" Title="Giới tính:" />
                                                <asp:Label runat="server" ID="prt_gender" />
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 325px 1fr">
                                            <div>
                                                <webUI:Label runat="server" SubTitle="Nationality" Title="Dân tộc:" />
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_nationality" />
                                            </div>
                                            <div>
                                                <webUI:Label runat="server" SubTitle="Occupation" Title="Nghề nghiệp:" />
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_occupation" />
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 150px 1fr 1fr 1fr">
                                            <div>
                                                <webUI:Label runat="server" SubTitle="Health Insurance" Title="BHYT:" />
                                            </div>
                                            <div>
                                                <webUI:Label runat="server" SubTitle="Valid from" Title="Giá trị từ:" />
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_valid_from" />
                                            </div>
                                            <div>
                                                <webUI:Label runat="server" SubTitle="to" Title="đến:" />
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_to" />
                                            </div>
                                            <div>
                                                <webUI:Label runat="server" SubTitle="No" Title="Số:" />
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_no_health_insurance" />
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 150px 1fr">
                                            <webUI:Label runat="server" SubTitle="Address" Title="Địa chỉ:" />
                                            <asp:Label CssClass="align-top" runat="server" ID="prt_address" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 150px 1fr">
                                            <webUI:Label runat="server" SubTitle="Admitted time" Title="Vào viện lúc:" />
                                            <webUI:DateTime runat="server" ID="prt_admitted_time" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 150px 1fr">
                                            <webUI:Label runat="server" SubTitle="Discharged time" Title="Ra viện lúc:" />
                                            <webUI:DateTime runat="server" ID="prt_disc_date_time" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 150px 1fr">
                                            <webUI:Label runat="server" SubTitle="Diagnosis" Title="Chẩn đoán:" />
                                            <asp:Label CssClass="align-top" runat="server" ID="prt_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 190px 1fr">
                                            <webUI:Label runat="server" SubTitle="Treatment" Title="Phương pháp điều trị:" />
                                            <asp:Label CssClass="align-top" runat="server" ID="prt_treatment" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 190px 1fr">
                                            <webUI:Label runat="server" SubTitle="Doctor’s recommendation" Title="Lời dặn của bác sĩ:" />
                                            <asp:Label CssClass="align-top" runat="server" ID="prt_followup_instruc" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 80px 1fr">
                                            <webUI:Label runat="server" SubTitle="Notes" Title="Ghi chú:" />
                                            <asp:Label CssClass="align-top" runat="server" ID="prt_notes" />
                                        </div>

                                        <div class="d-grid grid-template-2 mt-4" style="page-break-inside: avoid;">
                                            <div class="text-center">
                                                <webUI:Date runat="server" ID="prt_date" />
                                                <div class="mt-2"><span class="font-bold">TỔNG GIÁM ĐỐC/ </span>CEO</div>
                                                <div><span class="text-primary"><span class="font-bold">Họ tên, chữ ký, MSNV</span>/ Full name, Signature, ID</span></div>
                                                <div style="height: 50px"></div>
                                            </div>

                                            <div class="text-center">
                                                <webUI:Date runat="server" ID="prt_date1" />
                                                <div class="mt-2"><span class="font-bold">TRƯỞNG KHOA/ </span>HEAD OF DEPARTMENT</div>
                                                <div><span class="text-primary"><span class="font-bold">Họ tên, chữ ký, MSNV</span>/ Full name, Signature, ID</span></div>
                                                <div style="height: 50px"></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <%--<td class="report-footer-cell" style="font-size: 10px">
                                <img style="width: 100%" src="../images/bottomline.png" />
                                <div class="footer-info">
                                    <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                                    <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM</div>
                                    <div>Tel: 028 3910 9999</div>
                                    <div>www.aih.com.vn</div>
                                </div>
                            </td>
                            <td class="report-footer-space"></td>--%>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <telerik:RadWindowManager RenderMode="Lightweight"  
                                  EnableShadow="true"  
                                  Behaviors="Close, Move, Resize,Maximize" ID="RadWindowManager" DestroyOnClose="true"
                                  RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" Height="400">
            <Windows>
                <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" Title="Version History"   runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ShowHeader="false" ID="RadGrid1" runat="server" AllowSorting="true" OnItemCommand="RadGrid1_ItemCommand">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id,document_log_id">
                                <Columns>
                                    <telerik:GridTemplateColumn Display="false" HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="RadLinkButton1" runat="server" CommandName="Open" Text=""></asp:LinkButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn>
                                        <ItemTemplate>
                                            <telerik:RadLabel runat="server" ID="RadLabel1" Text='<%# GetHistoryName(Eval("status"),Eval("created_name_e"), Eval("created_date_time"), Eval("modified_name_e"), Eval("modified_date_time"), Eval("amend_reason")) %>'>
</telerik:RadLabel>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                                <ClientEvents OnRowDblClick="RowDblClick" />
                            </ClientSettings>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

                <div class="cssclsNoPrint" >
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd;border-radius:0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Discharge certificate</li>
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

                    <div class="card">
                        <div class="card-header">
                            <h4 class="text-primary">Discharge certificate</h4>
                            <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                        </div>
                        <div class="card-body collapse show" id="collapseOne">
                            <div class="form-body">

                                <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="currentLog">
                                                        <telerik:RadLabel runat="server" ID="RadLabel2">
</telerik:RadLabel>
                                                        <telerik:RadButton  RenderMode="Mobile"  OnClick="RadButton1_Click" ID="RadButton1" runat="server" CssClass="btn-sm" Text="View Latest Version"  />
                                                    </div>

                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <telerik:RadLabel runat="server" ID="RadLabel1">
</telerik:RadLabel>
                                                        <telerik:RadButton  RenderMode="Mobile" AutoPostBack="false" ID="Button1" runat="server" OnClientClicked="showWindow" CssClass="btn-sm" Text="View History"  />
                                                    </div>
                                                </div>
                                            </div>

                                <div class="row">
                                    <div class="col-md-12 mb-2 gt-2-a">
                                        <label class="control-label mb-1">Khoa xuất viện/ <span class="text-primary">Discharge ward <span class="text-danger">*</span>:</span></label>
                                        <asp:Label runat="server" ID="lbl_disc_ward_desc"></asp:Label>
                                        <div runat="server" id="disc_ward_code_wrapper">
                                            <select class="custom-select" id="select_disc_ward_code" style="width: unset; width: 405px;" runat="server"></select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">BHYT/ <span class="text-primary">HealthInsurance:</span></label>
                                    </div>
                                    <div class="col-md-12 gt-2-a">
                                        <label></label>
                                        <div>
                                            <asp:Label runat="server" ID="lbl_no_health_insurance"></asp:Label>
                                            <div class="form-group mb-2 d-inline-block w-n" runat="server" id="no_health_insurance_wrapper">
                                                <aih:TextField runat="server" ID="txt_no_health_insurance" />
                                            </div>
                                            <div class="form-group mb-2 d-inline-block">
                                                <label class="control-label mb-1">Giá trị từ/ <span class="text-primary">Valid from: </span></label>
                                                <asp:Label runat="server" ID="lbl_valid_from"></asp:Label>
                                                <div runat="server" class="d-inline-block" id="valid_from_wrapper">
                                                    <telerik:RadDatePicker Width="120px" ID="dpk_valid_from" runat="server"></telerik:RadDatePicker>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12 gt-2-a">
                                        <label class="control-label mb-1 mr-2"><span class="text-primary">Discharge date time:</span></label>
                                        <asp:Label runat="server" ID="lbl_disc_date_time"></asp:Label>
                                        <div class="d-inline-block" runat="server" id="disc_date_time_wrapper">
                                            <telerik:RadDateTimePicker runat="server" ID="dtpk_disc_date_time" Width="204px" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-12 gt-2-a">
                                        <label class="control-label mb-1">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                        <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
                                        <div class="form-group" runat="server" id="diagnosis_wrapper">
                                            <aih:TextField runat="server" ID="txt_diagnosis" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-12 gt-2-a">
                                        <label class="control-label mb-1">Phương pháp điều trị/ <span class="text-primary">Treatment:</span></label>
                                        <asp:Label runat="server" ID="lbl_disc_medication"></asp:Label>
                                        <div class="form-group" runat="server" id="disc_medication_wrapper">
                                            <aih:TextField runat="server" ID="txt_disc_medication" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-12 gt-2-a">
                                        <label class="control-label mb-1">Lời dặn của bác sĩ/ <span class="text-primary">Doctor’s recommendation:</span></label>
                                        <asp:Label runat="server" ID="lbl_followup_instruc"></asp:Label>
                                        <div class="form-group" runat="server" id="followup_instruc_wrapper">
                                            <aih:TextField runat="server" ID="txt_followup_instruc" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-12 gt-2-a">
                                        <label class="control-label mb-1">Ghi chú/ <span class="text-primary">Notes:</span></label>
                                        <asp:Label runat="server" ID="lbl_notes"></asp:Label>
                                        <div class="form-group" runat="server" id="notes_wrapper">
                                            <aih:TextField runat="server" ID="txt_notes" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-5">
                                    <div class="col-md-12 gt-2-a">
                                        <label class="control-label mb-1 mr-2"><span class="text-primary">Signature Date:</span></label>
                                        <asp:Label runat="server" ID="lbl_signature_date"></asp:Label>
                                        <div class="d-inline-block" runat="server" id="signature_date_wrapper">
                                            <telerik:RadDatePicker Width="120px" ID="dpk_signature_date" runat="server"></telerik:RadDatePicker>
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

                                            <asp:LinkButton runat="server" OnClientClick="window.print(); return false;" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

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
                <asp:LinkButton runat="server" OnClick="clearSession_Click" ID="clearSession"></asp:LinkButton>
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


        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
        }

        function showWindow(sender, eventArgs) {
            var oWnd = $find("<%=RadWindow1.ClientID%>");
            oWnd.show();
        }


       function RowDblClick(sender, eventArgs) {
            console.log('sdfsdf');

           var grid = $find("<%= RadGrid1.ClientID %>");
           var masterTable = grid.get_masterTableView();
           var item = eventArgs.get_itemIndexHierarchical();

           var row = masterTable.get_dataItems()[item];

           var button = row.findElement("RadLinkButton1");
           button.click();

           //console.log(row);
       }
    </script>
</body>
</html>
