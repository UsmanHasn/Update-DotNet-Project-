<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Crud_Application.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <%--<div class="form-group col-12">
            <h2 style="margin-left: -2%">Transaction Form</h2>
        </div>--%>
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm  border-bottom box-shadow mb-3" style="width: 100%; background-color: #023b6d; color: #ffffff;">
            <div class="d-flex justify-content-between" style="width: 200%; margin-right:-10px">
                <h3 class="text-white">Transaction Form</h3>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" Style="float: right; margin-top: -1px" class="btn btn-primary active ml-auto" Font-Size="Medium" OnClick="btnLogout_Click" /><br />
            </div>
        </nav>
        <div class="row">
            <div class=" form-group col-6">
                <div class="form-group">
                    <label id="lblxpin" runat="server">Xpin</label>
                    <asp:TextBox ID="txtxpin" runat="server" Class="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group col-6">
                <div class="form-group">
                    <label id="lblcusref" runat="server">Cusref #</label>
                    <asp:TextBox ID="txtcusref" runat="server" Class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class=" form-group col-6">
                <div class="form-group">
                    <label id="lblbeneficient" runat="server">Beneficient Name</label>
                    <asp:TextBox ID="txtbeneficient" runat="server" Class="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group col-6">
                <div class="form-group">
                    <label id="Label2" runat="server">Sender Name</label>
                    <asp:TextBox ID="txtSenderName" runat="server" Class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row">
            <div class=" form-group col-6">
                <div class="form-group">
                    <label id="lblfromdate" runat="server">From Date</label>
                    <asp:TextBox ID="txtfromdate" runat="server" Class="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group col-6">
                <div class="form-group">
                    <label id="lblTodate" runat="server">To Date</label>
                    <asp:TextBox ID="txttodate" runat="server" Class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group" style="margin-left: 1%">
                <asp:Button ID="btnSave" Width="80px" runat="server"   Text="Save" Class="btn btn-primary active" OnClick="btnSave_Click" />
                <asp:Button ID="btnUpdate" Width="80px" runat="server" Text="Update" Class="btn btn-primary active" OnClick="btnUpdate_Click"  />
                <asp:Button ID="btnDelete" Width="80px" runat="server" Text="Delete" Class="btn btn-primary active" OnClick="btnDelete_Click"  />


            </div>
        </div>
        <div class="col-lg-12">
            <div class="text-left" style="margin-left: -2%">
                <asp:GridView ID="GridCrud" runat="server" Width="100%"
                    PageSize="20" CellPadding="4" AutoGenerateColumns="false" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Xpin">
                            <%--<EditItemTemplate>
                                <asp:TextBox ID="txtxpin" runat="server" Text='<%# Eval("xpin") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="lblxpin" runat="server" Text='<%# Eval("xpin") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cusref No">
                            <%--<EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("cusref") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="lblcusref" runat="server" Text='<%# Eval("CustomerRef") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Beneficient Name">
                            <%-- <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("txtbeneficient") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="lblbeneficient" runat="server" Text='<%# Eval(" BeneficiaryName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sender Name">
                            <ItemTemplate>
                                <asp:Label ID="lblsender" runat="server" Text='<%# Eval("SenderName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="From date">
                            <ItemTemplate>
                                <asp:Label ID="lblfromdate" runat="server" Text='<%# Eval("FromDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="To date">
                            <ItemTemplate>
                                <asp:Label ID="lbltodate" runat="server" Text='<%# Eval("ToDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
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
        </div>
        <%--<div style="text-align: center;  margin-top: 50px; font-size:30px" class="container">
            <asp:Label ID="lblmesg" runat="server" Text=""></asp:Label>
        </div>--%>
    </form>

</body>
</html>
