<%@ Control Language="C#" ClassName="Barcode" %>
<%@ Import Namespace="EMR.UserControls" %>

<script runat="server">

    public string Text { get; set; }
    public string CssClass { get; set; }
    public int Width { get; set; }
    public int Height { get; set; }

    void Page_Init()
    {
        pictureBox_Barcode.Width = Width;
        pictureBox_Barcode.Height = Height;

        BarcodeLib.Barcode code128 = new BarcodeLib.Barcode();
        System.Drawing.Image barcode = code128.Encode(BarcodeLib.TYPE.CODE128, Text);

        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        barcode.Save(ms,System.Drawing.Imaging.ImageFormat.Jpeg);
        ms.ToArray();

        pictureBox_Barcode.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(ms.ToArray());
    }
</script>

<div class="<%= CssClass %> d-inline-block" >
    <asp:Image runat="server" ID="pictureBox_Barcode" />
</div>
