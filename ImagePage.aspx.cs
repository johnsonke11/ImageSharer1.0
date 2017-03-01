using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImagePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DataView productsTable = (DataView)ImageDataSource.Select(DataSourceSelectArguments.Empty);

        if (productsTable == null)
        {
            Response.Redirect("Default.aspx");
        }

        DataRowView row = (DataRowView)productsTable[0];

        Shown.ImageUrl = "/Images/" + row["ImageURL"].ToString();
        Owner.Text = row["Uploader"].ToString();
        if (Owner.Text != HttpContext.Current.User.Identity.Name)
        {
            SharePicture.Visible = false;
            Delete.Visible = false;
            DropDownList1.Visible = false;
        }

        CurrentUser.Text = HttpContext.Current.User.Identity.Name;
    }

    protected void SharePicture_Click(object sender, EventArgs e)
    {
        DataView productsTable = (DataView)ImageDataSource.Select(DataSourceSelectArguments.Empty);
        DataRowView row = (DataRowView)productsTable[0];
        string imageid = row["ImageID"].ToString();
        ShareDataSource.InsertParameters["ImageID"].DefaultValue = imageid;
        ShareDataSource.InsertParameters["AccountShared"].DefaultValue = DropDownList1.SelectedValue;
        ShareDataSource.Insert();
    }
    protected void LogOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }

    protected void Addcomment_Click(object sender, EventArgs e)
    {
        DataView productsTable = (DataView)ImageDataSource.Select(DataSourceSelectArguments.Empty);
        DataRowView row = (DataRowView)productsTable[0];
        string imageid = row["ImageID"].ToString();
        CommentDataSource.InsertParameters["Commenter"].DefaultValue = HttpContext.Current.User.Identity.Name;
        CommentDataSource.InsertParameters["ImageID"].DefaultValue = imageid;
        CommentDataSource.InsertParameters["CommentText"].DefaultValue = Comment.Text;
        CommentDataSource.Insert();
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        CommentDataSource.Delete();
        
        ShareDataSource.Delete();
        ImageDataSource.Delete();
        Response.Redirect("YourPictures.aspx");
    }
}