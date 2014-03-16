<%@ WebHandler Language="C#" Class="Captcha" %>

using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.Drawing.Drawing2D;
using System.Web.UI.WebControls;
using VirtualNetwork;
public class Captcha : IHttpHandler,System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        Bitmap objBmp = new Bitmap(75, 25);

        Graphics objGraphics = Graphics.FromImage(objBmp);
        objGraphics.SmoothingMode = SmoothingMode.AntiAlias;
        objGraphics.Clear(Color.Gray);
        objGraphics.TextRenderingHint = TextRenderingHint.AntiAlias;

        Font objFont = new Font("Arial", 12, System.Drawing.FontStyle.Bold);

        string strCaptcha = Guid.NewGuid().ToString("N").Substring(0, 7);
        HttpContext.Current.Session["Captcha"] = strCaptcha;
       
        objGraphics.DrawString(strCaptcha, objFont, Brushes.White, 3, 3);

        MemoryStream ms = new MemoryStream();
        objBmp.Save(ms, ImageFormat.Png);

        byte[] bmpBytes = ms.GetBuffer();
        context.Response.ContentType = "image/png";
        context.Response.BinaryWrite(bmpBytes);

        objBmp.Dispose();
        objFont.Dispose();
        objGraphics.Dispose();
        ms.Close();
        context.Response.End();

    //     string text = (Guid.NewGuid().ToString()).Substring(0, 5);
    // //   HttpContext.Current.Response.Cookies["Captcha"]["value"] = text;
    //    //imgcaptcha.ImageUrl = "captcha.aspx";
    //    // errorcaptcha.Visible = false;
    //    Bitmap bmp = new Bitmap(HttpContext.Current.Server.MapPath("~\\images\\captcha2.jpg"));
    //    MemoryStream memStream = new MemoryStream();

    //    int width = bmp.Width;
    //    int height = bmp.Height;
    //    string familyName = "Arial";
    //    text = HttpContext.Current.Request.Cookies["Captcha"]["value"];

    //    Bitmap bitmap = new Bitmap(bmp, new Size(width, height));
    //    Graphics g = Graphics.FromImage(bitmap);
    //    g.SmoothingMode = SmoothingMode.AntiAlias;

    //    int xCopyright = width - 150;
    //    int yCopyright = height - 50;

    //    Rectangle rect;
    //    Font font;
    //    int newfontsize = 45;

    //    font = new Font(familyName, newfontsize, FontStyle.Italic);

    //    rect = new Rectangle(xCopyright, yCopyright, 0, 0);

    //    StringFormat format = new StringFormat();
    //    format.Alignment = StringAlignment.Near;
    //    format.LineAlignment = StringAlignment.Near;
    //    GraphicsPath path = new GraphicsPath();
    //    path.AddString(text, font.FontFamily, (int)font.Style, font.Size, rect, format);

    //    HatchBrush hatchBrush = new HatchBrush(HatchStyle.LargeConfetti,
    //        Color.FromName("White"),
    //        Color.FromName("Black"));
    //    g.FillPath(hatchBrush, path);


    //    HttpContext.Current.Response.ContentType = "image/jpeg";
    ////    bitmap.Save(memStream, ImageFormat.Jpeg);

    //    bmp.Dispose();
    //    font.Dispose();
    //    hatchBrush.Dispose();
    //    g.Dispose();

    //    memStream.WriteTo(HttpContext.Current.Response.OutputStream);
    //    bitmap.Dispose();





        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}