<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OnlinePay.aspx.cs" Inherits="OnlinePay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <style type="text/css">
            td,th
            {
               text-align:left;
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <center>
                <h2>ONLINE PAYMENT</h2>
                <table>
                    <tr>
                        <th>Type Of Transaction :</th>
                        <td>
                            <asp:Dropdownlist id="selectTrans" runat="server" AutoPostBack="true" OnSelectedIndexChanged="selectTransChanged">
                                <asp:ListItem Value="">Select</asp:ListItem>
                                <asp:ListItem Value="UPI">UPI Transaction</asp:ListItem>
                                <asp:ListItem Value="DEBIT">DEBIT Transaction</asp:ListItem>
                            </asp:Dropdownlist>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label1" runat="server" Text="ENTER UPI ID" Visible="false"></asp:Label>
                        </th>
                        <td>
                            <input id="upi" runat="server" type="text" visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label2" runat="server" Text="ENTER DEBIT Card No" Visible="false"></asp:Label>
                        </th>
                        <td>
                            <input id="debit" runat="server" type="number" visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label3" runat="server" Text="ENTER CVC" Visible="false"></asp:Label>
                        </th>
                        <td>
                            <input id="cvc" runat="server" type="number" visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label4" runat="server" Text="ENTER PIN" Visible="false"></asp:Label>
                        </th>
                        <td>
                            <input id="pin" runat="server" type="password" visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <th>Enter Amount :</th>
                        <td>
                            <asp:Label ID="amt" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="Pay" runat="server" Text="" OnClick="Pay_Click" Enabled="false"/>
                        </td>
                    </tr>
                </table>
            </center>                
        </form>
    </body>
</html>
