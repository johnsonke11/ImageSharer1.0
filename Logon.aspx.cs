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

public partial class Logon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Notfound.Visible = false;
        loginpage.Visible = true;
        register.Visible = false;
        Double.Visible = false;

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        DataView productsTable = (DataView)LoginData.Select
            (DataSourceSelectArguments.Empty);
        if (productsTable.Count == 1)
        {
            FormsAuthentication.RedirectFromLoginPage(username.Text, RememberMe.Checked);
        }
        else
        {
            Notfound.Visible = true;
        }


    }

    protected void Signuppage_Click(object sender, EventArgs e)
    {
        register.Visible = true;
        loginpage.Visible = false;
    }

    protected void LoginPageButton_Click(object sender, EventArgs e)
    {

    }

    protected void Signup_Click(object sender, EventArgs e)
    {
        DataView productsTable = (DataView)LoginData.Select
           (DataSourceSelectArguments.Empty);

        if (productsTable == null)
        {
            LoginData.InsertParameters["Email"].DefaultValue
          =  EmailEnter.Text;
            LoginData.InsertParameters["Username"].DefaultValue
                = UsernameEnter.Text;
            LoginData.InsertParameters["Password"].DefaultValue
                = PasswordEnter.Text;
            LoginData.Insert();
        }
        else
        {
            Double.Visible = true;
        }

      
    }
}
