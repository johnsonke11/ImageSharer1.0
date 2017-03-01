<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Favorites.aspx.cs" Inherits="Favorites" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="title">
    <asp:Image ID="Image1" runat="server" ImageURl="Images/NYC%20(1).jpg" CssClass="Title" />
    <br />
    </div>
    <div id="links">
    <asp:Table runat="server" Width="1360px" CssClass="LinkTable">
    <asp:TableRow>
    <asp:TableCell> <asp:Button ID="AddPicture" Text="Add Picture" runat="server" PostBackUrl="~/AddPictures.aspx" CssClass="btn" /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="YourPictures" Text="Your Pictures" runat="server" PostBackUrl="~/YourPictures.aspx" CssClass="btn" /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="FavoritesButton" Text="Favorites" runat="server" PostBackUrl="~/Favorites.aspx" CssClass="btn" /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="MainPage" Text="Main Page" runat="server" PostBackUrl="~/Default.aspx" CssClass="btn" /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOut_Click" CssClass="btn"  /> </asp:TableCell>

    </asp:TableRow>
    </asp:Table>
    </div>
    <div id="divfav" class="form" runat="server">
    <h3>
        <asp:Label ID="CurrentUser" runat="server" Text="Label"></asp:Label>
        &nbsp;&#39;s Favorites</h3>
        <asp:SqlDataSource ID="FavoriteSource" runat="server" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>" DeleteCommand="DELETE FROM [Favorites] WHERE [FavoriteID] = @FavoriteID" InsertCommand="INSERT INTO [Favorites] ([CurrentUser], [FavoriteUser]) VALUES (@CurrentUser, @FavoriteUser)" SelectCommand="SELECT [FavoriteID], [CurrentUser], [FavoriteUser] FROM [Favorites] WHERE ([CurrentUser] = @CurrentUser)" UpdateCommand="UPDATE [Favorites] SET [CurrentUser] = @CurrentUser, [FavoriteUser] = @FavoriteUser WHERE [FavoriteID] = @FavoriteID">
            <DeleteParameters>
                <asp:Parameter Name="FavoriteID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CurrentUser" Type="String" />
                <asp:Parameter Name="FavoriteUser" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="CurrentUser" Name="CurrentUser" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CurrentUser" Type="String" />
                <asp:Parameter Name="FavoriteUser" Type="String" />
                <asp:Parameter Name="FavoriteID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <br />
        <asp:SqlDataSource ID="CheckUser" runat="server" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>" SelectCommand="SELECT [Username] FROM [Accounts] WHERE ([Username] = @Username)">
            <SelectParameters>
                <asp:ControlParameter ControlID="username" Name="Username" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:TextBox ID="username" runat="server" Height="35px" Width="330px"></asp:TextBox>
       
    <br />
    <asp:Button ID="adduser" runat="server" Text="Add User" OnClick="adduser_Click" ValidationGroup="AddFavorite"/>  <asp:Label ID="Message" runat="server" Text=""></asp:Label> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter a Username" ValidationGroup="AddFavorite" ControlToValidate="username"></asp:RequiredFieldValidator>
    <div id="table">
        <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="FavoriteSource" DataTextField="FavoriteUser" DataValueField="FavoriteID">
        </asp:BulletedList>
    </div>
    </div>
    
    </form>
</body>
</html>
