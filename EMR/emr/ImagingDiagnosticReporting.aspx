<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImagingDiagnosticReporting.aspx.cs" Inherits="EMR.Report.ImagingDiagnosticReporting" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100" style="overflow: scroll">
            <div style="width: 702px; margin: 0 auto;">

                <table style="width: 100%;">
                                                <tr>
                                                    <td colspan="4">
                                                        <h4 class="text-center mt-4 mb-4" >KẾT QUẢ CHẨN ĐOÁN
                                        <div class="text-primary">IMAGING DIAGNOSTIC REPORTING</div>
                                    </h4>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 194px;">Mã bệnh nhân/ <span class="text-primary">PID:</span></td>
                                                    <td style="width: 156px;">900000488</td>
                                                    <td style="width: 186px;"><span class="text-primary">RPID:</span></td>
                                                    <td style="width: 144px;">AIH1900822101</td>
                                                </tr>
                                                <tr>
                                                    <td>Họ Tên/ <span class="text-primary">Patient Name:</span></td>
                                                    <td colspan="3">MAI MAI MAI</td>
                                                    
                                                </tr>
                                                <tr>
                                                    <td>Giới tính/ <span class="text-primary">Gender:</span></td>
                                                    <td>Male</td>
                                                    <td>Ngày sinh / <span class="text-primary">DOB:</span></td>
                                                    <td>04/10/1960</td>
                                                </tr>
                                                <tr>
                                                    <td>Ngày chỉ định/<span class="text-primary">Req.  Date:</span></td>
                                                    <td>28/03/2019 4:31 CH</td>
                                                    <td>Hoàn thành / <span class="text-primary">Completed:</span></td>
                                                    <td>28/03/2019 4:33 CH</td>
                                                </tr>
                                                <tr>
                                                    <td>Loại khám/ <span class="text-primary">Visit Type:</span></td>
                                                    <td><span class="text-primary">OPD Visit / 5547</td>
                                                    <td>BS chỉ định / <span class="text-primary">Ref. Physician:</span></td>
                                                    <td>No Title HIS User Test</td>
                                                </tr>
                                                <tr>
                                                    <td>Tên chỉ định/ <span class="text-primary">Study:</span></td>
                                                    <td colspan="3">2D Ultrasound (OBS & GYN)</td>
                                                </tr>

                                            </table>

                <div>
                    <div class="bg-primary text-white">CHẨN ĐOÁN / DIAGNOSIS:</div>
                    <div id="lbl_diagnosis" runat="server"></div>
                </div>

                <div>
                    <div class="bg-primary text-white">KỸ THUẬT / TECHNIQUE:</div>
                    <div id="lbl_technique" runat="server"></div>
                </div>

                <div>
                    <div class="bg-primary text-white">MÔ TẢ / FINDINGS:</div>
                    <p id="lbl_findings" runat="server"></p>
                </div>        

                <div>
                    <div class="bg-primary text-white">KẾT LUẬN/ IMPRESSION:</div>
                    <div id="lbl_impression" runat="server"></div>
                </div>

                <div>
                    <div class="bg-primary text-white">ADDENDUM:</div>
                    <p id="lbl_addendum" runat="server"></p>
                </div>
            </div>
        </div>
    </form>
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>
</html>
