using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPictures : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        test.Text = HttpContext.Current.User.Identity.Name;
    }

    protected void SubmitPicture_Click(object sender, EventArgs e)
    {
        if (Upload.HasFile)
            try
            {
                Upload.SaveAs("D:/ImageSharer/Images/" + Upload.FileName);
                Message.Text = "File name: " +
                     Upload.PostedFile.FileName + "<br>" +
                     Upload.PostedFile.ContentLength + " kb<br>" +
                     "Content type: " +
                     Upload.PostedFile.ContentType;
                AddPictureSource.InsertParameters["Uploader"].DefaultValue = HttpContext.Current.User.Identity.Name;
                AddPictureSource.InsertParameters["ImageURL"].DefaultValue = Upload.FileName;
                AddPictureSource.Insert();

            }
            catch (Exception ex)
            {
                Message.Text = "ERROR: " + ex.Message.ToString();
            }
        else
        {
            Message.Text = "You have not specified a file.";
        }
    }
    protected void LogOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}