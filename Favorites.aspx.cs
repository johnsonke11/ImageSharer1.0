using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Favorites : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CurrentUser.Text = HttpContext.Current.User.Identity.Name;
    }

    protected void adduser_Click(object sender, EventArgs e)
    {
        DataView productsTable = (DataView)CheckUser.Select
            (DataSourceSelectArguments.Empty);
        if (productsTable.Count == 1)
        {
            DataView checkFavorite = (DataView)FavoriteSource.Select
           (DataSourceSelectArguments.Empty);
            checkFavorite.RowFilter = "FavoriteUser = '" + username.Text + "'";
            if(checkFavorite.Count == 0)
            {
                FavoriteSource.InsertParameters["CurrentUser"].DefaultValue = HttpContext.Current.User.Identity.Name;
                FavoriteSource.InsertParameters["FavoriteUser"].DefaultValue = username.Text;
                FavoriteSource.Insert();
            }
        }
        else
        {
            Message.Text = "User not found";
            Message.Visible = true;
        }

    }
    protected void LogOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}