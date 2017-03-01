<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPictures.aspx.cs" Inherits="AddPictures" %>

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
    <asp:TableCell> <asp:Button ID="Button1" Text="Add Picture" runat="server" PostBackUrl="~/AddPictures.aspx" CssClass="btn" /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="YourPictures" Text="Your Pictures" runat="server" PostBackUrl="~/YourPictures.aspx" CssClass="btn"  /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="Favorites" Text="Favorites" runat="server" PostBackUrl="~/Favorites.aspx" CssClass="btn"  /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="MainPage" Text="Main Page" runat="server" PostBackUrl="~/Default.aspx" CssClass="btn"  /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOut_Click" CssClass="btn"  /> </asp:TableCell>
    </asp:TableRow>
    </asp:Table>

       
    </div>
    
    
    <div id="addpicture" class="form" runat="server">
    <asp:Label ID="test" runat="server"></asp:Label> Uploads
    <br />
    <asp:FileUpload ID="Upload" runat="server" />
    <br />
    <asp:Button ID="SubmitPicture" runat="server" Text="Submit Picture" OnClick="SubmitPicture_Click" />
    <asp:Label ID="Message" runat="server"></asp:Label>
        <asp:SqlDataSource ID="AddPictureSource" runat="server" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>" DeleteCommand="DELETE FROM [Images] WHERE [ImageId] = @ImageId" InsertCommand="INSERT INTO [Images] ([Uploader], [ImageURL]) VALUES (@Uploader, @ImageURL)" SelectCommand="SELECT [ImageId], [Uploader], [ImageURL] FROM [Images] WHERE ([Uploader] = @Uploader)" UpdateCommand="UPDATE [Images] SET [Uploader] = @Uploader, [ImageURL] = @ImageURL WHERE [ImageId] = @ImageId">
            <DeleteParameters>
                <asp:Parameter Name="ImageId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Uploader" Type="String" />
                <asp:Parameter Name="ImageURL" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="Uploader" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Uploader" Type="String" />
                <asp:Parameter Name="ImageURL" Type="String" />
                <asp:Parameter Name="ImageId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
