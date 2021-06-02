using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls.PrintTemplate
{
    public partial class PrintWindow : System.Web.UI.UserControl
    {
        private ITemplate printContent = null;
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
        [TemplateContainer(typeof(PrintContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate PrintContent { get { return printContent; } set { printContent = value; } }

        [DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
        [TemplateContainer(typeof(PrintContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate PrintHeader { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            BarcodeLib.Barcode code128 = new BarcodeLib.Barcode();
            System.Drawing.Image barcode = code128.Encode(BarcodeLib.TYPE.CODE128, "900000488");

            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            barcode.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
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
    }
}