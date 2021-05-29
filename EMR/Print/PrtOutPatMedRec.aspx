<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrtOutPatMedRec.aspx.cs" Inherits="EMR.Print.PrtOutPatMedRec" %>

<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="Input" TagName="TextField" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../style/style-custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            font-family: Tahoma, Helvetica, sans-serif;
            font-size: 10.5px;
            margin: 0;
            padding: 0;
        }

        table {
            font-size: 17px;
        }

            table.report-container {
                page-break-after: always;
                box-shadow: 0 .5rem 1rem rgba(0,0,0,.15);
            }

        thead.report-header {
            display: table-header-group;
        }

        tfoot.report-footer {
            display: table-footer-group;
        }

        /*.header, .header-space,
        .footer, .footer-space {
            height: 100px;
            max-width: 992px;
            margin: 0 auto;
        }*/

        .header {
            display: none;
            position: fixed;
            top: 0;
        }

        .footer-space {
            height: 56px;
            width: 100%;
        }

        /*.footer {
            display: none;
            position: fixed;
            bottom: 0;
        }*/

        @page {
            size: A4;
            margin: 1mm 7mm 7mm 7mm;
        }

        @media print {
            .report-footer .report-footer-cell {
                display: inline-block;
                position: fixed;
                bottom: 0;
                left: 0;
                right: 0;
            }
            .printToolBar {
                display: none;
            }

            table.report-container {
                box-shadow: none !important;
            }
            .cssclsNoPrint{display:none}
        }
        @media screen {
        .cssclsNoScreen {
            display: none
        }
}
    </style>
</head>
<body>
    <div class="printToolBar" style="position: sticky; top: 0; left: 0; right: 0; padding: 4px; background: #ddd;">
        <div class="btn btn-sm btn-secondary" onclick="window.print()">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-printer" viewBox="0 0 16 16">
                <path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z" />
                <path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z" />
            </svg>
        </div>
    </div>
    <form id="form1" runat="server" style="display: flex; justify-content: center; align-items: center;">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		    <Scripts></Scripts>
	    </telerik:RadScriptManager>        
    <asp:FormView ID="PatientInfor" runat="server" Width="100%" RowStyle-ForeColor="Black" Font-Size="Medium" Visible="true">
        <ItemTemplate>
            <div class="cssclsNoScreen">
        <table class="report-container" style="max-width: 992px; width: 100%; margin-top: 20px; margin-bottom: 100px;">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info" style="display: flex; align-items: center;">
                            <img width="200px" src="../images/AIH_PI_FULL.png" />
                            <div style="flex-grow: 1">
                                <div style="color: #007297; font-size: 26.6667px;">BỆNH ÁN NGOẠI TRÚ</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">OUTPATIENT MEDICAL RECORD</div>
                            </div>
                            <div style="font-size: 13.3333px">
                                <div>MAI MAI MÃI1</div>
                                <div>05-10-1960 | Nữ</div>
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
                    <th><div style="text-align:center; font-size:large;">
                        <b><asp:Label ID="lbTitle" runat="server" Text=""></asp:Label></b></div>
                    </th>
                  </tr>                  
                  <tr>
                    <th>
                        Họ tên KH/ Patient Name: <asp:Label ID="lbPatientName" runat="server" Text='<%# Eval("customer_name") %>'></asp:Label> </th>
                  </tr>
                  <tr>
                    <th>
                        Ngày sinh/ DOB: <asp:Label ID="lbBirthday" runat="server" Text='<%# Eval("date_of_birth") %>'></asp:Label></th>                
                  </tr>
                  <tr>
                    <th>
                        Chính sách KM/ Discount policy: <asp:Label ID="lbPolicy" runat="server"></asp:Label></th>
                  </tr>                  

            </tbody>

            <tfoot class="report-footer">
                <tr>
                    <td class="report-footer-cell">
                        <img style="width: 100%" src="../images/bottomline.png" />
                        <div class="footer-info" style="display: flex; justify-content: space-between; width: 100%;">
                            <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                            <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM</div>
                            <div>Tel: 028 3910 9999</div>
                            <div>www.aih.com.vn</div>
                        </div>
                    </td>
                    <td class="report-footer-space" style="height: 100px;">
                    </td>
                </tr>
            </tfoot>

        </table>
                </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="cssclsNoPrint">
            <div class="row" style="margin-bottom: 50px;">
                        <div class="col-lg-12">
<table>
                            <tr>
                    <th><div style="text-align:center; font-size:large;">
                        <b><asp:Label ID="lbTitle" runat="server" Text=""></asp:Label></b></div>
                    </th>
                  </tr>                  
                  <tr>
                    <th>
                        Họ tên KH/ Patient Name: <asp:TextBox ID="PatientName" runat="server" Text='<%# Eval("customer_name") %>'></asp:TextBox> </th>
                  </tr>
                  <tr>
                    <th>
                        Ngày sinh/ DOB: <asp:TextBox ID="Birthday" runat="server" Text='<%# Eval("date_of_birth") %>'></asp:TextBox></th>                
                  </tr>
                  <tr>
                    <th>
                        Chính sách KM/ Discount policy: <asp:TextBox ID="Policy" runat="server"></asp:TextBox></th>
                  </tr>
</table>    
                        </div>
            </div>
                <asp:Button runat="server" ID="Button1" Text="Preview" OnClick="ButtonPreview_Click" 
                                Width="80px" CssClass="cssclsNoPrint" />
                </div>
        </EditItemTemplate>
        </asp:FormView>
         <asp:SqlDataSource ID="DataSource" runat="server" ConnectionString="" />
    </form>
</body>
</html>
