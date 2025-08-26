<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ledger.aspx.cs" Inherits="Ledger" %>

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
        <form id="form1" runat="server">
            <div>
                <h3>Ledger Details</h3>
            </div>
            <div style="margin-left: 450px">
                <h3><asp:Label ID="scheme" runat="server" Text=""></asp:Label></h3>
            </div>
            <table style="margin-left: 450px">
                <tr>
                    <th>Name</th>
                    <th>Mobileno</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="name" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="mobile" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Account</th>
                    <th>Installment</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="accountId" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="inst" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Total Amount</th>
                    <th>Total Weight</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="totAmt" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="totWgt" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <div style="margin-left: 450px">
                <asp:Button ID="transactionDetails" runat="server" Text="Transaction Details" Width="344px" OnClick="transactionDetails_Click" />
            </div>
            <asp:Repeater ID="RepeatInformation" runat="server">
                <ItemTemplate>
                <table style="margin-left: 450px">
                    <tr>
                        <th>INS NO</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="instNo" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.instNo")%>  ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Transaction Type</th>
                        <th>Rate</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="typeOfTrans" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.typeOfTrans")%> ></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="rate" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.rateOnPay")%> ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <th>Receipt</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="payDate" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.paidDate","{0:yyyy-MM-dd}")%> ></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="receipt" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.receiptNo")%> ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Amount</th>
                        <th>Weight</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="amount" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.amount")%> ></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="weight" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.weight")%> ></asp:Label>
                        </td>
                    </tr>
                </table>
                </ItemTemplate>
            </asp:Repeater>
        </form>
    </body>
</html>
