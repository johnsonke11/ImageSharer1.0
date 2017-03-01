<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImagePage.aspx.cs" Inherits="ImagePage" %>

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
    <asp:TableCell> <asp:Button ID="YourPictures" Text="Your Pictures" runat="server" PostBackUrl="~/YourPictures.aspx" CssClass="btn"  /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="Favorites" Text="Favorites" runat="server" PostBackUrl="~/Favorites.aspx" CssClass="btn"  /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="MainPageButton" Text="Main Page" runat="server" PostBackUrl="~/Default.aspx" CssClass="btn"  /> </asp:TableCell>
    <asp:TableCell> <asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOut_Click" CssClass="btn"  /> </asp:TableCell>
    </asp:TableRow>
    </asp:Table>
    </div>
    <div id="ImageShow" class="form">
        <asp:Label ID="CurrentUser" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:SqlDataSource ID="ImageDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>" SelectCommand="SELECT [ImageId], [Uploader], [ImageURL] FROM [Images] WHERE ([ImageId] = @ImageId)" DeleteCommand="DELETE FROM [Images] WHERE [ImageId] = @ImageId" InsertCommand="INSERT INTO [Images] ([Uploader], [ImageURL]) VALUES (@Uploader, @ImageURL)" UpdateCommand="UPDATE [Images] SET [Uploader] = @Uploader, [ImageURL] = @ImageURL WHERE [ImageId] = @ImageId">
            <DeleteParameters>
                <asp:QueryStringParameter Name="ImageId" QueryStringField="ImageID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Uploader" Type="String" />
                <asp:Parameter Name="ImageURL" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ImageId" QueryStringField="ImageID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Uploader" Type="String" />
                <asp:Parameter Name="ImageURL" Type="String" />
                <asp:Parameter Name="ImageId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        Owner: <asp:Label ID="Owner" runat="server" Text="Label"></asp:Label>

        <br />
        <asp:Image ID="Shown" runat="server" Width="100px" />


        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="FavoriteDataSource" DataTextField="FavoriteUser" DataValueField="FavoriteUser">
        </asp:DropDownList>
        <asp:Button ID="SharePicture" runat="server" Text="Share Picture" OnClick="SharePicture_Click" />


        <asp:Button ID="Delete" runat="server" Text="Delete" OnClick="Delete_Click" />


        <asp:SqlDataSource ID="FavoriteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>" SelectCommand="SELECT [CurrentUser], [FavoriteID], [FavoriteUser] FROM [Favorites] WHERE ([CurrentUser] = @CurrentUser)" DeleteCommand="DELETE FROM [Favorites] WHERE [ImageID] = @ImageId" InsertCommand="INSERT INTO [Favorites] ([CurrentUser], [FavoriteUser]) VALUES (@CurrentUser, @FavoriteUser)" UpdateCommand="UPDATE [Favorites] SET [CurrentUser] = @CurrentUser, [FavoriteUser] = @FavoriteUser WHERE [FavoriteID] = @FavoriteID">
            <DeleteParameters>
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
        

        <asp:SqlDataSource ID="ShareDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>" DeleteCommand="DELETE FROM [Share] WHERE [ImageID] = @ImageId" InsertCommand="INSERT INTO [Share] ([ImageID], [AccountShared]) VALUES (@ImageID, @AccountShared)" SelectCommand="SELECT [ShareID], [ImageID], [AccountShared] FROM [Share] WHERE (([AccountShared] = @AccountShared) AND ([ImageID] = @ImageID))" UpdateCommand="UPDATE [Share] SET [ImageID] = @ImageID, [AccountShared] = @AccountShared WHERE [ShareID] = @ShareID">
            <DeleteParameters>
                <asp:QueryStringParameter Name="ImageId" QueryStringField="ImageID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ImageID" Type="Int32" />
                <asp:Parameter Name="AccountShared" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="AccountShared" PropertyName="SelectedValue" Type="String" />
                <asp:QueryStringParameter Name="ImageID" QueryStringField="Image" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ImageID" Type="Int32" />
                <asp:Parameter Name="AccountShared" Type="String" />
                <asp:Parameter Name="ShareID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="CommentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ImageSharerConnectionString %>" SelectCommand="SELECT [Commenter], [ImageID], [CommentID], [CommentText] FROM [Comments] WHERE ([ImageID] = @ImageID)" DeleteCommand="DELETE FROM [Comments] WHERE [ImageID] = @ImageId" InsertCommand="INSERT INTO [Comments] ([Commenter], [ImageID], [CommentText]) VALUES (@Commenter, @ImageID, @CommentText)" UpdateCommand="UPDATE [Comments] SET [Commenter] = @Commenter, [ImageID] = @ImageID, [CommentText] = @CommentText WHERE [CommentID] = @CommentID">
            <DeleteParameters>
                <asp:QueryStringParameter Name="ImageId" QueryStringField="ImageID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Commenter" Type="String" />
                <asp:Parameter Name="ImageID" Type="Int32" />
                <asp:Parameter Name="CommentText" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ImageID" QueryStringField="ImageID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Commenter" Type="String" />
                <asp:Parameter Name="ImageID" Type="Int32" />
                <asp:Parameter Name="CommentText" Type="String" />
                <asp:Parameter Name="CommentID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="Comment" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter A Comment" ValidationGroup="comments" ControlToValidate="Comment"></asp:RequiredFieldValidator>
        <asp:Button ID="Addcomment" runat="server" Text="Add comment" OnClick="Addcomment_Click" ValidationGroup="comments" />
        

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="CommentID" DataSourceID="CommentDataSource">
            <AlternatingItemTemplate>
                <span style="background-color: #FAFAD2;color: #284775;">
                
                Commenter:
                <asp:Label ID="CommenterLabel" runat="server" Text='<%# Eval("Commenter") %>' />
                <br />
                CommentText:
                <asp:Label ID="CommentTextLabel" runat="server" Text='<%# Eval("CommentText") %>' />
                <br />
<br /></span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="background-color: #FFCC66;color: #000080;">CommentID:
                <asp:Label ID="CommentIDLabel1" runat="server" Text='<%# Eval("CommentID") %>' />
                <br />
                Commenter:
                <asp:TextBox ID="CommenterTextBox" runat="server" Text='<%# Bind("Commenter") %>' />
                <br />
                CommentText:
                <asp:TextBox ID="CommentTextTextBox" runat="server" Text='<%# Bind("CommentText") %>' />
                <br />
                ImageID:
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br /><br /></span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">Commenter:
                <asp:TextBox ID="CommenterTextBox" runat="server" Text='<%# Bind("Commenter") %>' />
                <br />CommentText:
                <asp:TextBox ID="CommentTextTextBox" runat="server" Text='<%# Bind("CommentText") %>' />
                <br />ImageID:
                <asp:TextBox ID="ImageIDTextBox" runat="server" Text='<%# Bind("ImageID") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br /><br /></span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="background-color: #FFFBD6;color: #333333;">
                Commenter:
                <asp:Label ID="CommenterLabel" runat="server" Text='<%# Eval("Commenter") %>' />
                <br />
                CommentText:
                <asp:Label ID="CommentTextLabel" runat="server" Text='<%# Eval("CommentText") %>' />
                <br />
                
<br /></span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">CommentID:
                <asp:Label ID="CommentIDLabel" runat="server" Text='<%# Eval("CommentID") %>' />
                <br />
                Commenter:
                <asp:Label ID="CommenterLabel" runat="server" Text='<%# Eval("Commenter") %>' />
                <br />
                CommentText:
                <asp:Label ID="CommentTextLabel" runat="server" Text='<%# Eval("CommentText") %>' />
                <br />
                ImageID:
                <asp:Label ID="ImageIDLabel" runat="server" Text='<%# Eval("ImageID") %>' />
                <br />
<br /></span>
            </SelectedItemTemplate>
        </asp:ListView>
        

    </div>
    </form>
</body>
</html>
