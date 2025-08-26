<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OnlineTransactions.aspx.cs" Inherits="OnlineTransactions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
/*        table
        {
            border-spacing:5px;
            table-layout: fixed;
            width:35%;
        }*/
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
    <div style="margin-left: 450px">
    <h3>Previous Transactions</h3>
    <form id="form1" runat="server">
           <asp:Repeater ID="OTransRepeater" runat="server">
            <ItemTemplate>
            <table>
                <tr>
                    <th>Pay Date</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="payDate" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.payDate","{0:d/M/yyyy hh:mm:ss tt}")%>  ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Transaction Id</th>
                    <th>Amount</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="transId" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.transId")%> ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="amount" runat="server" Text= <%# DataBinder.Eval(Container,"DataItem.amount") %> ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Account</th>
                    <th>Ins</th>
                    <th>Receipt</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="account" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.account")%> ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="ins" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.ins")%> ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="receipt" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.receipt")%> ></asp:Label>
                    </td>
                </tr>
            </table>
            </ItemTemplate>
        </asp:Repeater>
        </div>

    </form>
</body>
</html>
