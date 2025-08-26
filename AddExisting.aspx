<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddExisting.aspx.cs" Inherits="AddExisting" %>
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
        td,th
        {
           text-align:left;
        }
</style>
</head>
<body>
    <div style="margin-left:450px">
        <h3>ADD EXISTING SCHEME</h3>
        <form id="form1" runat="server">
            <table>
                <tr>
                    <th>Group Code *</th>
                    <td>
                        <input id="groupCode" runat="server" type="text" />
                    </td>
                </tr>
                <tr>
                    <th>Regno</th>
                    <td>
                        <input id="regno" runat="server" type="number" />
                    </td>
                </tr>
                <br />
                <br/>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" />
                    </td>
                </tr>
            </table>
        </form>
    </div>    
</body>
</html>
