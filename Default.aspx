<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    
    <div id="title">
    <asp:Image ID="Title" runat="server" ImageURl="Images/NYC%20(1).jpg" CssClass="Title" />
    <br />
    </div>
    <div id="links">
    <asp:Table runat="server" Width="1360px"  CssClass="LinkTable">
    <asp:TableRow>
    <asp:TableCell> <asp:Button ID="AddPicture" Text="Add Picture" runat="server" PostBackUrl="~/AddPictures.aspx" CssClass="btn" /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="YourPictures" Text="Your Pictures" runat="server" PostBackUrl="~/YourPictures.aspx" CssClass="btn" /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="Favorites" Text="Favorites" runat="server" PostBackUrl="~/Favorites.aspx" CssClass="btn" /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="MainPageButton" Text="Main Page" runat="server" PostBackUrl="~/Default.aspx" CssClass="btn" /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOut_Click" CssClass="btn" />  </asp:TableCell>
    </asp:TableRow>
    </asp:Table>
    </div>
    
    <div id="Currentupdate" class="form">

        <asp:Label ID="CurrentUser" runat="server"></asp:Label>

        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"  SelectCommand="SELECT [Uploader], [AccountShared], [ImageURL] FROM [PhotosOfYou] WHERE ([AccountShared] = @AccountShared)" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>">
            <SelectParameters>
                <asp:ControlParameter ControlID="CurrentUser" Name="AccountShared" PropertyName="Text" Type="String" />
            </SelectParameters>
        
        </asp:SqlDataSource>

        <br />
        

        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                Uploader:
                <asp:Label ID="UploaderLabel" runat="server" Text='<%# Eval("Uploader") %>' />
                <br />
                AccountShared:
                <asp:Label ID="AccountSharedLabel" runat="server" Text='<%# Eval("AccountShared") %>' />
                <br />
                Image:
                <asp:Image style="height: 100px; width: 100px; border:groove" CssClass="btnProduct" ImageUrl='<%#"~/Images/" + Eval("ImageURL") %>' runat="server" />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
        

    </div>
    
    </form>
</body>
</html>
