<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Crud_Application.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 style="text-align: left; margin-left: 1%; color: blue">Login Form</h2>
        <br />
        <div class="form-group col-6">
            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group col-6">
            <label for="txtPassword">Pasword:</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" />
        </div>
        <br />
        <div class="form-group col-6">
            <asp:Button ID="BtnLogin" runat="server" Text="Login" CssClass="btn btn-primary active" OnClick="BtnLogin_Click" />
            <asp:Label ID="lblerror" Style="font-weight: bold;" runat="server" Text=""></asp:Label>
        </div>
    </form>

</body>
</html>
