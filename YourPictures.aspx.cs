using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class YourPictures : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        test.Text = HttpContext.Current.User.Identity.Name;
        UploadedPhotos.Visible = true;
        OfYou.Visible = false;
    }
    protected void LogOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }

    protected void YourPhotos_Click(object sender, EventArgs e)
    {
        UploadedPhotos.Visible = true;
        OfYou.Visible = false;
    }

    protected void PhotosOf_Click(object sender, EventArgs e)
    {
        UploadedPhotos.Visible = false;
        OfYou.Visible = true;
    }
}