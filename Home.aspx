<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <style>
            table
            {
                table-layout: fixed;
            }
            td,th
            {
               text-align:left;
                margin-left: 80px;
            }
        </style>
    </head>
    <body>
        <center>
            <h2>REVATHI STORES</h2>        
            <table style="width:15%">
                <tr>
                    <th>
                        <asp:Label ID="p1" runat="server"></asp:Label>
                    </th>
                    <th>
                        <asp:Label ID="p2" runat="server"></asp:Label>
                    </th>
                </tr> 
                <tr>
                    <td>
                        <asp:Label ID="pr1" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="pr2" runat="server"></asp:Label>
                    </td>
                </tr> 
            </table>
            <form id="form1" runat="server">
                <br />
                <table style="width:50%">
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Paydue" OnClick="Button1_Click" />
                        </td>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Join Scheme" OnClick="Button2_Click" />
                        </td>
                        <td>
                            <asp:Button ID="Button3" runat="server" Text="Add Existing" OnClick="Button3_Click" />
                        </td>
                        <td>
                            <asp:Button ID="Button4" runat="server" Text="Ledger" OnClick="Button4_Click" />
                        </td>
                    </tr>
                </table>
            </form>
        </center>
    
    </body>
</html>
