<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Schemes.aspx.cs" Inherits="Schemes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <style>
            table
            {
                border-spacing:5px;
                width:50%;
                padding:10px;
            }
            .head{
                font-size:12px;
                text-align:left;
            }
            td,th
            {
               text-align:left;
            }
    </style>
    </head>
    <body>
        <h2>Join Scheme</h2>
        <form id="form1" runat="server">
            <center>
                <asp:Repeater ID="SchemeList" runat="server" OnItemCommand="SchemeList_ItemCommand">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <th>
                                    <asp:Label ID="scheme" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.scheme")%>></asp:Label>
                                </th>
                            </tr>
                            <tr class="head">
                                <th>Schemetype</th>
                                <th>Installments</th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="schemeType" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.schemeType")%> ></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="ins" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.ins")%> ></asp:Label>
                                </td>
                            </tr>
                            <tr class="head">
                                <th>Joining In</th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="joinDate" runat="server" Text= <%#DataBinder.Eval(Container,"DataItem.joinDate")%> ></asp:Label>
                                </td>
                            </tr>
                            <tr class="head">
                                <th>* You can claim your gold only after your date of maturity</th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="joinScheme" runat="server" Text="Join Scheme" OnClick="joinScheme" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </center>
        </form>
    </body>
</html>
