<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logon.aspx.cs" Inherits="Logon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Image Sharer</title>
    <link href="style2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="title">
    <asp:Image ID="Image1" runat="server" ImageURl="Images/NYC%20(1).jpg" CssClass="Title" />
    </div>
    
    <div class="form" id="loginpage" runat="server">
                <table  style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td colspan="2">Log In</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="username" runat="server" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="color:Red;" class="auto-style1">
                                    <asp:Label ID="Notfound" runat="server" Text="Username or Password is incorrect"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td" colspan="2">
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
        <asp:Button ID="LoginButton" runat="server" CommandName="Login" OnClick="LoginButton_Click" Text="Log In" ValidationGroup="Login1" />
                <asp:Button runat="server" ID="Signuppage" Text="Sign up Page" OnClick="Signuppage_Click" />
    
    </div>
    <div class="form" id="register" runat="server">
    Username
    <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Required" ValidationGroup="CreateUser" ControlToValidate="UserNameEnter"></asp:RequiredFieldValidator>
    <asp:TextBox ID="UsernameEnter" runat="server" Height="20px" Width="250px"></asp:TextBox>
    <br />
    Password
    <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password Required" ValidationGroup="CreateUser" ControlToValidate="PasswordEnter"></asp:RequiredFieldValidator>
        <asp:TextBox ID="PasswordEnter" runat="server" Height="20px" Width="250px"></asp:TextBox>
    <br />
    Email
    <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email Required" ValidationGroup="CreateUser" ControlToValidate="EmailEnter"></asp:RequiredFieldValidator>
    <asp:TextBox ID="EmailEnter" runat="server" Height="20px" Width="250px"></asp:TextBox>
    <br />
    <asp:Button ID="SignUp" runat="server" Text="Sign up" OnClick="Signup_Click" ValidationGroup="CreateUser" />
    <asp:Button ID="LoginPageButton" runat="server" Text="Login Page" OnClick="LoginPageButton_Click"  CausesValidation="false" />
    
        <asp:SqlDataSource ID="LoginData" runat="server" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>" DeleteCommand="DELETE FROM [Accounts] WHERE [Username] = @Username" InsertCommand="INSERT INTO [Accounts] ([Username], [Password], [Email]) VALUES (@Username, @Password, @Email)" SelectCommand="SELECT [Username], [Password] FROM [Accounts] WHERE (([Username] = @Username) AND ([Password] = @Password))" UpdateCommand="UPDATE [Accounts] SET [Password] = @Password WHERE [Username] = @Username">
            <DeleteParameters>
                <asp:Parameter Name="Username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="username" Name="Username" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="Password" Name="Password" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Double" runat="server" Text="Account already exists"></asp:Label>
    </div>
        
    </form>
</body>
</html>