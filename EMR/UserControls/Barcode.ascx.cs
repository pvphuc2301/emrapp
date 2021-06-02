using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls
{
    public partial class Barcode : System.Web.UI.UserControl
    {
        public string Text { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            pictureBox_Barcode.Width = Width;
            pictureBox_Barcode.Height = Height;
            if (!string.IsNullOrEmpty(Text))
            {
                BarcodeLib.Barcode code128 = new BarcodeLib.Barcode();
                System.Drawing.Image barcode = code128.Encode(BarcodeLib.TYPE.CODE128, Text);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                barcode.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                ms.ToArray();

                pictureBox_Barcode.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(ms.ToArray());
            }

        }
    }
}