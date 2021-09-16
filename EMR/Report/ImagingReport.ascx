<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImagingReport.ascx.cs" Inherits="EMR.ImagingReport" %>
<style>
    html body blockquote {
        margin: 0;
        margin-left: 2em;
        border-left: 0;
        border: 0;
        padding: 0;
    }

    html body blockquote p {
        font-family: Arial;
        font-size: 10pt;
        margin: 0pt 0pt 0pt 0pt;
            margin-top: 0pt;
            margin-bottom: 0pt;
        margin-bottom: 0pt;
        margin-top: 0pt;
    }

    p {
        margin-bottom: 6px;
    }

    .scroll-sidebar {
        height: calc(100% - 73px);
    }
</style>

<div class="recipeImage qsf-ib">
    <div class="scroll-sidebar w-100" style="overflow: scroll">
        <div style="width: 702px; margin: 0 auto;">
            <table style="width: 100%;">
                <tr>
                    <td colspan="4">
                        <h4 class="text-center mt-4 mb-4">KẾT QUẢ CHẨN ĐOÁN
                            <div class="text-primary">IMAGING DIAGNOSTIC REPORTING</div>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td style="width: 194px;">Mã bệnh nhân/ <span class="text-primary">PID:</span></td>
                    <td style="width: 156px;"><asp:Label ID="lbPID" runat="server"></asp:Label></td>
                    <td style="width: 186px;"><span class="text-primary">RPID:</span></td>
                    <td style="width: 144px;"><asp:Label ID="lbRadRequestNo" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Họ Tên/ <span class="text-primary">Patient Name:</span></td>
                    <td colspan="3"><asp:Label ID="lbFullName" runat="server"></asp:Label></td>
                                                    
                </tr>
                <tr>
                    <td>Giới tính/ <span class="text-primary">Gender:</span></td>
                    <td><asp:Label ID="lbSex" runat="server"></asp:Label></td>
                    <td>Ngày sinh / <span class="text-primary">DOB:</span></td>
                    <td><asp:Label ID="lbBirthday" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Ngày chỉ định/<span class="text-primary">Req.  Date:</span></td>
                    <td><asp:Label ID="lbOrderDate" runat="server"></asp:Label></td>
                    <td>Hoàn thành / <span class="text-primary">Completed:</span></td>
                    <td><asp:Label ID="lbCompletedDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Loại khám/ <span class="text-primary">Visit Type:</span></td>
                    <td><span class="text-primary"><asp:Label ID="lbVisitType" runat="server"></asp:Label></span></td>
                    <td>BS chỉ định / <span class="text-primary">Ref. Physician:</span></td>
                    <td><asp:Label ID="lbOrderDr" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Tên chỉ định/ <span class="text-primary">Study:</span></td>
                    <td colspan="3"><asp:Label ID="lbOrderName" runat="server"></asp:Label></td>
                </tr>
            </table>
            
            <asp:Label runat="server" ID="temp_field"></asp:Label>
            
            <asp:Panel runat="server" ID="diagnosis_field">
                <div class="bg-primary text-white">CHẨN ĐOÁN / DIAGNOSIS:</div>
                <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
            </asp:Panel>

            <asp:Panel runat="server" ID="history_field">
                <div class="bg-primary text-white">TIỀN SỬ BỆNH / HISTORY:</div>
                <asp:Label runat="server" ID="lbl_history"></asp:Label>
            </asp:Panel>

            <asp:Panel runat="server" ID="technique_field">
                <div class="bg-primary text-white">KỸ THUẬT / TECHNIQUE:</div>
                <asp:Label runat="server" ID="lbl_technique"></asp:Label>
            </asp:Panel>

            <asp:Panel runat="server" ID="findings_field">
                <div class="bg-primary text-white">MÔ TẢ / FINDINGS:</div>
                <asp:Label runat="server" ID="lbl_findings"></asp:Label>
            </asp:Panel>

            <asp:Panel runat="server" ID="impression_field">
                <div class="bg-primary text-white">KẾT LUẬN/ IMPRESSION:</div>
                <asp:Label runat="server" ID="lbl_impression"></asp:Label>
            </asp:Panel>

            <asp:Panel runat="server" ID="addendum_field">
                <div class="bg-primary text-white">ADDENDUM:</div>
                <p id="lbl_addendum" runat="server"></p>
            </asp:Panel>

        </div>
    </div>
</div>