using System;
using System.Web.UI.WebControls;

namespace EMR.Classes
{
    public interface IBarcodeGenerator
    {
        Image Generator(string value);
        string GeneratorToBase64String(string value);
    }
    public class BarcodeGenerator : IBarcodeGenerator
    {
        public Image Generator(string value)
        {
            Image image = new Image();
            BarcodeLib.Barcode code128 = new BarcodeLib.Barcode();
            System.Drawing.Image barcode = code128.Encode(BarcodeLib.TYPE.CODE39, value);
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            barcode.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            ms.ToArray();

            image.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(ms.ToArray());
            image.Width = 100;
            image.Height = 15;
            return image;
        }
        public string GeneratorToBase64String(string value)
        {
            BarcodeLib.Barcode code128 = new BarcodeLib.Barcode();
            System.Drawing.Image barcode = code128.Encode(BarcodeLib.TYPE.CODE39, value);
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            barcode.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            ms.ToArray();

            return "data:image/jpeg;base64," + Convert.ToBase64String(ms.ToArray());
        }
    }
}
