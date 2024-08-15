<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Crud_Application.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        
    </style>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">

        <h2 class="form-group mt-3">Student Form</h2>
        <div class="row">
            <div class="form-group col-12">
                <asp:Label ID="lblId" runat="server" Text="Student Id"></asp:Label>
                <asp:TextBox ID="txtId" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

            </div>
        </div>

        <div class="row">
            <div class="form-group col-12">
                <asp:Label ID="lblstdname" runat="server" Text="Student Name"></asp:Label>
                <asp:TextBox ID="txtstdname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Student Name Required" ControlToValidate="txtstdname" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>

            </div>
        </div>

        <div class="row">
            <div class="form-group col-6">
                <asp:Label ID="lblfname" runat="server" Text="Father Name"></asp:Label>
                <asp:TextBox ID="txtfname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Student FName Required" ControlToValidate="txtfname" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group col-6">
                <asp:Label ID="lblstdclass" runat="server" Text="Student Class"></asp:Label>
                <asp:DropDownList ID="dropdownstdclass" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Dropdown required" ControlToValidate="dropdownstdclass" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>

            </div>
        </div>

        <div class="row">
            <div class="form-group col-6">
                <asp:Label ID="lblFromdate" runat="server" Text="From Date"></asp:Label>
                <asp:TextBox ID="txtfromdate" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvfromdate" runat="server" ErrorMessage="from date required" ControlToValidate="txtfromdate" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>

            </div>

            <div class="form-group col-6">
                <asp:Label ID="lbltodate" runat="server" Text="To Date"></asp:Label>
                <asp:TextBox ID="txttodate" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="To date required" ControlToValidate="txtfromdate" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>

            </div>
        </div>

        <div class="row">
            <div class="form-group" style="margin-top: 3%; margin-left: 1%">
                <asp:Button ID="btnSave" CssClass="btn btn-primary active" runat="server" Text="Save" ValidationGroup="a" OnClick="btnSave_Click" />
                <asp:Button ID="btnReset" CssClass="btn btn-primary active" runat="server" Text="Reset" OnClick="btnReset_Click" />
            </div>
        </div>

        <div class="col-12" style="text-align: center; margin-top: 3%; margin-left: -2%; top: 0px; left: 0px;">
            <asp:GridView ID="GridCrud" Width="105%" AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333"
                GridLines="None" DataKeyNames="Id" OnRowDeleting="GridCrud_RowDeleting" OnRowEditing="GridCrud_RowEditing" OnRowCancelingEdit="GridCrud_RowCancelingEdit" OnRowUpdating="GridCrud_RowUpdating">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="StudentId">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtstudentId" runat="server" Text='<%# Eval("Id") %>' CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblstdName" Text='<%# Eval("Id") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtstudentName" runat="server" Text='<%# Eval("StudentName") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblstdName" Text='<%# Eval("StudentName") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student FName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtfname" runat="server" Text='<%# Eval("StudentFName") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFName" Text='<%# Eval("StudentFName") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student ClsName">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlclasname" CssClass="form-control" runat="server">
                                <asp:ListItem Text="One"></asp:ListItem>
                                <asp:ListItem Text="Two"></asp:ListItem>
                                <asp:ListItem Text="Three"></asp:ListItem>

                            </asp:DropDownList>


                            <%--<asp:TextBox ID="txtStdClasname" runat="server" Text='<%# Eval("StudentClass") %>' CssClass="form-control"></asp:TextBox>--%>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSclsName" runat="server" Text='<%# Eval("StudentClass") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student FrmDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtstfromdate" runat="server" Text='<%# Eval("Stfromdate") %>' CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStdFDate" runat="server" Text='<%# Eval("Stfromdate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student ToDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="txttodate" runat="server" Text='<%# Eval("stdtpdate") %>' CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStdToDate" runat="server" Text='<%# Eval("stdtpdate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-success"  HeaderText="Remove Record" />
                    <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary col-sm" HeaderText="Edit" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            DisplayMode="BulletList" ShowSummary="true" HeaderText="Errors:" />
    </form>
</body>
</html>
