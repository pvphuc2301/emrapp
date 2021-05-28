<%@ Control Language="C#" ClassName="PrintWindow" %>
<%@ Import Namespace="EMR.UserControls" %>
<%@ Import Namespace="System.ComponentModel"  %>
<%@ Import Namespace="System.Drawing"  %>

<script runat="server">

    private ITemplate printContent = null;
    [DesignerSerializationVisibility( DesignerSerializationVisibility.Visible)]
    [TemplateContainer(typeof(PrintContainer))]
    [PersistenceMode(PersistenceMode.InnerProperty)]
    public ITemplate PrintContent { get { return printContent; } set { printContent = value; } }

    [DesignerSerializationVisibility( DesignerSerializationVisibility.Visible)]
    [TemplateContainer(typeof(PrintContainer))]
    [PersistenceMode(PersistenceMode.InnerProperty)]
    public ITemplate PrintHeader { get; set; }

    void Page_Init()
    {
        BarcodeLib.Barcode code128 = new BarcodeLib.Barcode();
        System.Drawing.Image barcode = code128.Encode(BarcodeLib.TYPE.CODE128, "900000488");

        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        barcode.Save(ms,System.Drawing.Imaging.ImageFormat.Jpeg);
        ms.ToArray();

        //pictureBox_Barcode.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(ms.ToArray());

        //pictureBox_Barcode.Image = barcode; 
        //QRCodeGenerator qrGenerator = new QRCodeGenerator();
        //QRCode qrCode = new QRCode(qrGenerator.CreateQrCode(txtDataQRCode.Text, QRCodeGenerator.ECCLevel.Q));
        ////QRCodeGenerator.ECCLevel.Q là mức chịu lỗi 25%; .L là 7%; .M là 15% và .H là trên 25%
        //pictureBox_QRCode.Image = qrCode.GetGraphic(2, Color.Black, Color.White, false);
        //qrGenerator.Dispose();
        //qrCode.Dispose();

        if (PrintHeader != null)
        {
            PrintContainer container = new PrintContainer();

            PrintHeader.InstantiateIn(container);
            printHeader.Controls.Add(container);
        }
        if (printContent != null)
        {
            PrintContainer container = new PrintContainer();

            printContent.InstantiateIn(container);
            print_content.Controls.Add(container);
        }
    }

    public class PrintContainer : Control, INamingContainer
    {
        internal PrintContainer() { }
    }

</script>

<div class="cssclsNoScreen">
    <table class="report-container">
        <thead class="report-header">
            <tr>
                <th class="report-header-cell">
                    <div class="header-info" style="display: flex; align-items: center;">
                        <asp:PlaceHolder runat="server" id="printHeader" />
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
