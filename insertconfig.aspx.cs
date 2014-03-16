using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using VirtualNetwork;
public partial class insertconfig : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void insert_Click(object sender, EventArgs e)
    {
        Config c = new Config();
        if (c.InsertConfig(txtKey.Text, txtValue.Text))
        {
            Response.Write("وارد دیتا بیس شد ");
        }
        else
        {
            Response.Write("این مقدار در دیتا بیس وجو دارد ");
        }
        
        
    }
}