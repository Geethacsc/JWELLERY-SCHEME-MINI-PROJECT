<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Paydue.aspx.cs" Inherits="paydue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <style>
            table
            {
                border-spacing:5px;
                table-layout: fixed;
                width:35%;
            }
            th{
                font-size:12px;
                text-align:left;
            }
            td
            {
               text-align:left;
            }
    </style>
    </head>
    <body>
        <h2>Account Details</h2>
        <div style="margin-left: 450px">
            <form id="form1" runat="server">
                <h3><asp:Label ID="scheme" runat="server" Text=""></asp:Label></h3>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Account</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="name" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="account" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Amount</th>
                        <th>Weight</th>
                        <th>Paid Inst</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="amt" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="weight" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="paidIns" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Ledger" runat="server" OnClick="Ledger_Click" Text="Ledger" />
                        </td>
                        <td>
                            <asp:Button ID="Pay" runat="server" OnClick="Pay_Click" Enabled="false"/>
                        </td>
                        <td>
                            <asp:Button ID="home" runat="server" Text="Home" OnClick="Home_Click"/>
                        </td>
                    </tr>
                    
                </table>
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/OnlineTransactions.aspx">Previous Transaction Details</asp:HyperLink>
            </form>

        </div>
    </body>
</html>
