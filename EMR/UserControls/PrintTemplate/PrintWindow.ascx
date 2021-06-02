<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrintWindow.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.PrintWindow" %>

<div class="cssclsNoScreen">
    <table class="report-container">
        <thead class="report-header">
            <tr>
                <th class="report-header-cell">
                    <div class="header-info" style="display: flex; align-items: center;">
                        <asp:PlaceHolder runat="server" id="printHeader" />
                    </div>
                    
                </th>
            </tr>
        </thead>
        <tbody class="report-content">
            <tr>
                <td class="report-content-cell">
                    <div class="main" runat="server" id="print_content">
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
