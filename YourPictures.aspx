<%@ Page Language="C#" AutoEventWireup="true" CodeFile="YourPictures.aspx.cs" Inherits="YourPictures" %>

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
    <asp:TableCell> <asp:Button ID="AddPicture" Text="Add Picture" runat="server" PostBackUrl="~/AddPictures.aspx" CssClass="btn"  /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="YourPicturesButton" Text="Your Pictures" runat="server" PostBackUrl="~/YourPictures.aspx" CssClass="btn"  /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="Favorites" Text="Favorites" runat="server" PostBackUrl="~/Favorites.aspx" CssClass="btn"  /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="MainPage" Text="Main Page" runat="server" PostBackUrl="~/Default.aspx" CssClass="btn"  /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOut_Click" CssClass="btn"  /> </asp:TableCell>
    </asp:TableRow>
    </asp:Table>
    
    </div>
    <div class="form">
    <div id="switch">
   <asp:Button ID="YourPhotos" Text="Your Photos" runat="server" OnClick="YourPhotos_Click" /> 
    <asp:Button ID="PhotosOf" Text="Photos of You" runat="server" OnClick="PhotosOf_Click" />
    </div>
    
    <div id="UploadedPhotos" runat="server">
        
        <asp:Label ID="test" runat="server"></asp:Label> 's Photos
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="YourImageSource">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">Uploader:
                    <asp:Label ID="UploaderLabel" runat="server" Text='<%# Eval("Uploader") %>' />
                    <br />
                    ImageURL:
                    <asp:Image style="height: 100px; width: 100px; border:groove" CssClass="btnProduct" ImageUrl='<%#"~/Images/" + Eval("ImageURL") %>' runat="server" />
                    <br />
                    <asp:HyperLink ID="lnkProduct" runat="server" NavigateUrl='<%# "ImagePage.aspx?ImageId=" + Eval("ImageID") %>'>View Item</asp:HyperLink>
                      </td>
                    
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">Uploader:
                    <asp:TextBox ID="UploaderTextBox" runat="server" Text='<%# Bind("Uploader") %>' />
                    <br />
                    ImageURL:
                    <asp:TextBox ID="ImageURLTextBox" runat="server" Text='<%# Bind("ImageURL") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Uploader:
                    <asp:TextBox ID="UploaderTextBox" runat="server" Text='<%# Bind("Uploader") %>' />
                    <br />ImageURL:
                    <asp:TextBox ID="ImageURLTextBox" runat="server" Text='<%# Bind("ImageURL") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">Uploader:
                    <asp:Label ID="UploaderLabel" runat="server" Text='<%# Eval("Uploader") %>' />
                    <br />
                    ImageURL:
                    <asp:Image style="height: 100px; width: 100px; border:groove" CssClass="btnProduct" ImageUrl='<%#"~/Images/" + Eval("ImageURL") %>' runat="server" />
                    <br />
                    <asp:HyperLink ID="lnkProduct" runat="server" NavigateUrl='<%# "ImagePage.aspx?ImageId=" + Eval("ImageID") %>'>View Item</asp:HyperLink>
                   
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </table>
                <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">Uploader:
                    <asp:Label ID="UploaderLabel" runat="server" Text='<%# Eval("Uploader") %>' />
                    <br />
                    ImageURL:
                    <asp:Label ID="ImageURLLabel" runat="server" Text='<%# Eval("ImageURL") %>' />
                    
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="YourImageSource" runat="server" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>" SelectCommand="SELECT [Uploader], [ImageURL], [ImageId] FROM [Images] WHERE ([Uploader] = @Uploader)" DeleteCommand="DELETE FROM [Images] WHERE [ImageId] = @ImageId" InsertCommand="INSERT INTO [Images] ([Uploader], [ImageURL]) VALUES (@Uploader, @ImageURL)" UpdateCommand="UPDATE [Images] SET [Uploader] = @Uploader, [ImageURL] = @ImageURL WHERE [ImageId] = @ImageId">
            <DeleteParameters>
                <asp:Parameter Name="ImageId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Uploader" Type="String" />
                <asp:Parameter Name="ImageURL" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="test" Name="Uploader" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Uploader" Type="String" />
                <asp:Parameter Name="ImageURL" Type="String" />
                <asp:Parameter Name="ImageId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        

    </div>
    <div id="OfYou" runat="server">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>" SelectCommand="SELECT [Uploader], [AccountShared], [ImageURL], [ImageId] FROM [PhotosOfYou] WHERE ([AccountShared] = @AccountShared)">
            <SelectParameters>
                <asp:ControlParameter ControlID="test" Name="AccountShared" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">Uploader:
                    <asp:Label ID="UploaderLabel" runat="server" Text='<%# Eval("Uploader") %>' />
                    <br />
                    AccountShared:
                    <asp:Label ID="AccountSharedLabel" runat="server" Text='<%# Eval("AccountShared") %>' />
                    <br />
                    ImageURL:
                    <asp:Image style="height: 100px; width: 100px; border:groove" CssClass="btnProduct" ImageUrl='<%#"~/Images/" + Eval("ImageURL") %>' runat="server" />
                    <br />
                    <asp:HyperLink ID="lnkProduct" runat="server" NavigateUrl='<%# "ImagePage.aspx?ImageId=" + Eval("ImageID") %>'>View Item</asp:HyperLink>
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">Uploader:
                    <asp:TextBox ID="UploaderTextBox" runat="server" Text='<%# Bind("Uploader") %>' />
                    <br />
                    AccountShared:
                    <asp:TextBox ID="AccountSharedTextBox" runat="server" Text='<%# Bind("AccountShared") %>' />
                    <br />
                    ImageURL:
                    <asp:TextBox ID="ImageURLTextBox" runat="server" Text='<%# Bind("ImageURL") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Uploader:
                    <asp:TextBox ID="UploaderTextBox" runat="server" Text='<%# Bind("Uploader") %>' />
                    <br />AccountShared:
                    <asp:TextBox ID="AccountSharedTextBox" runat="server" Text='<%# Bind("AccountShared") %>' />
                    <br />ImageURL:
                    <asp:TextBox ID="ImageURLTextBox" runat="server" Text='<%# Bind("ImageURL") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">Uploader:
                    <asp:Label ID="UploaderLabel" runat="server" Text='<%# Eval("Uploader") %>' />
                    <br />
                    AccountShared:
                    <asp:Label ID="AccountSharedLabel" runat="server" Text='<%# Eval("AccountShared") %>' />
                    <br />
                    ImageURL:
                    <asp:Image style="height: 100px; width: 100px; border:groove" CssClass="btnProduct" ImageUrl='<%#"~/Images/" + Eval("ImageURL") %>' runat="server" />
                    <br />
                    <asp:HyperLink ID="lnkProduct" runat="server" NavigateUrl='<%# "ImagePage.aspx?ImageId=" + Eval("ImageID") %>'>View Item</asp:HyperLink>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </table>
                <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">Uploader:
                    <asp:Label ID="UploaderLabel" runat="server" Text='<%# Eval("Uploader") %>' />
                    <br />
                    AccountShared:
                    <asp:Label ID="AccountSharedLabel" runat="server" Text='<%# Eval("AccountShared") %>' />
                    <br />
                    ImageURL:
                    <asp:Label ID="ImageURLLabel" runat="server" Text='<%# Eval("ImageURL") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>

    </div>
    </div>
    </form>
</body>
</html>
