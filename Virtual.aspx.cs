using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.Drawing.Drawing2D;
using VirtualNetwork;
using System.Net.Mail;

public partial class Virtual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool flag = true;
        IGuest gu = new Guest();
        IActiveUser user = new User();
        ISMS sms = new SMS();
        user.Name = txtName.Text;
        user.Family = txtFamily.Text;
        user.Email = txtEmail.Text;
        user.Username = txtNN.Text;
        user.Sex = Convert.ToBoolean(txtsex.SelectedValue);
        user.Password = txtPassword.Text;
        user.IdentificationNumber = txtidn.Text;
        showMessage.Visible = true;
        string SacnAdress = "d:\\" + this.txtNNS.FileName;
        if (txtNNS.HasFile)
        {
            txtNNS.SaveAs(SacnAdress);
        }
        string ImageAdress = "d:\\" + this.txtImage.FileName;
        if (txtImage.HasFile)
        {
            txtImage.SaveAs(ImageAdress);
        }
        user.NNScan = SacnAdress;
        user.ImageSrc = ImageAdress;
        user.NN = txtNN.Text;
        user.CellPhone = txtCellPhoneNumber.Text;
        user.PrePhoneNumber = txtpre.Text;
        user.PhoneNumber = txtCellPhoneNumber.Text;
        user.State = txtState.Text;
        user.City = txtCity.Text;
        user.Address = txtAddress.Text;
        user.ZipCode = txtZipCode.Text;
        user.ActivationKey = Helper.ActivationKeyGenerator();
        try
        {
            showMessage.Text = "";
            List<Field> fields = gu.RegisterCheck(user);
            foreach (Field f in fields)
            {
                if (f.IsEmpty)
                {
                    showMessage.Text += f.Name + "isEmpty" + "<br/>";
                    flag = false;
                }
            }
        }
        catch (NullReferenceException ex)
        {
            showMessage.Text = ex.Message;

        }
        catch (Exception ex)
        {
            showMessage.Text = ex.Message;
        }
        //captcha check
        if ((Session["Captcha"].ToString() == txtcaptcha.Text) == false)
        {
            showMessage.Text = "The text is  not correct!";
        }
        Check check = new Check();
        //Email part
        if (check.CheckEmail(txtEmail.Text) == false)
        {
            showMessage.Text += Resources.Register.Email + "<br/>";
            flag = false;

        }
        //UserName part 
        try
        {
            if (gu.isNNExist(txtNN.Text))
            {
                showMessage.Text += Resources.Register.UserNameExitst + "<br/>";
                flag = false;
            }
        }
        catch (Exception ex)
        {
            showMessage.Text += "Redirect to db ";
        }
        //Name part
        if (check.CheckLenght(txtName.Text, 20) == true)
        {
            showMessage.Text += Resources.Register.FirstName + "<br/>";
            flag = false;
        }
        //Family part
        if (check.CheckLenght(txtFamily.Text, 20) == true)
        {
            showMessage.Text += Resources.Register.LastName + "<br/>";
            flag = false;
        }

        //ZipCode part
        if (check.CheckZipCode(txtZipCode.Text) == false)
        {
            showMessage.Text += Resources.Register.ZipCode + "<br/>";
            flag = false;
        }
        if (check.CheckIsNumber(txtZipCode.Text) == Errors.isNotNumber)
        {
            showMessage.Text += Resources.Register.ZipCodeNumberErrore + "<br/>";
            flag = false;
        }
        //Identification Number part
        if (check.CheckIsNumber(txtidn.Text) == Errors.isNotNumber)
        {
            showMessage.Text += Resources.Register.IdNo + "<br/>";
            flag = false;
        }
        //NN part
        if ((check.CheckIsNumber(txtNN.Text) == Errors.isNotNumber))
        {
            showMessage.Text += Resources.Register.NNNumberErrore + "<br/>";
            flag = false;
        }
        if (check.CheckNN(txtNN.Text) == false)
        {
            showMessage.Text += Resources.Register.SSN + "<br/>";
            flag = false;
        }
        //PhoneNumber part
        if (check.CheckIsNumber(txtPhoneNumber.Text) == Errors.isNotNumber)
        {
            showMessage.Text += Resources.Register.PhoneNumber + "<br/>";
            flag = false;
        }
        //Cellphonenumber part
        if (check.CheckIsNumber(txtCellPhoneNumber.Text) == Errors.isNotNumber)
        {
            showMessage.Text += Resources.Register.CellPhoneNumber + "<br/>";
            flag = false;
        }
        if (txtCellPhoneNumber.Text.Length > 11)
        {
            showMessage.Text += Resources.Register.CellPhoneIsnumberErrore + "<br/>";
        }
        //Password part
        if ((check.CheckPassword(txtPassword.Text, txtreturnpass.Text, 8, 16) == Errors.passwordDontMatch))
        {
            showMessage.Text += Resources.Register.Pass + "<br/>";
            flag = false;
        }
        if (check.CheckPassword(txtPassword.Text, txtreturnpass.Text, 8, 16) == Errors.passwordLengthisHigh)
        {
            showMessage.Text += Resources.Register.Passlenght + "<br/>";
            flag = false;
        }
        if (check.CheckPassword(txtPassword.Text, txtreturnpass.Text, 8, 16) == Errors.passwordLengthisLow)
        {
            showMessage.Text += Resources.Register.Passlenght + "<br/>";
            flag = false;
        }

        if (flag)
        {
            try
            {
                CheckMail("mh3rahmani@gmail.com", txtEmail.Text, Resources.Register.TitleForEmail, Resources.Register.SubjectForEmail, Resources.Register.BodyForEmail + user.ActivationKey);
                sms.Send(txtCellPhoneNumber.Text, Resources.Register.BodyForSms + user.ActivationKey);
            }
            catch (Exception ex)
            {
            }

            Errors a = gu.Register(user);
            if (a == Errors.DatabaseError)
            {
                showMessage.Text += Resources.Register.DataBaseStore;
            }
            if (a == Errors.Success)
            {
                showMessage.Text += Resources.Register.DataBaseSucess;
            }
            if (a == Errors.DatabaseError)
            {
                showMessage.Text += Resources.Register.DataBaseStore;
            }

        }



    }
    public void CheckMail(string from, string to, string title, string subject, string body) 
    { 

        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
        mail.To.Add(to);
        mail.From = new MailAddress(from, title , System.Text.Encoding.UTF8);
        mail.Subject = subject;
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = body;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true ;
        mail.Priority = MailPriority.High;

        SmtpClient client = new SmtpClient();

        client.Credentials = new System.Net.NetworkCredential(from, "mh884072");

        client.Port = 587; // Gmail works on this port<o:p />
        client.Host = "smtp.gmail.com";
        client.EnableSsl = true; //Gmail works on Server Secured Layer
            try
              {
            client.Send(mail);
              }
              catch (Exception ex) 
             {
                 Exception ex2 = ex;
                 string errorMessage = string.Empty;
                while (ex2 != null)
                {
                errorMessage += ex2.ToString();
                ex2 = ex2.InnerException;
                }
                    HttpContext.Current.Response.Write(errorMessage );
              } // end try 

    }
    
  

    protected void txtSate_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txtCity_SelectedIndexChanged(object sender, EventArgs e)
    {


    }
}