<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JoinScheme.aspx.cs" Inherits="JoinScheme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        table
        {
            border-spacing:5px;
            padding:10px;
        }
        th{
            font-size:15px;
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
        <center>
            <h2>JOIN SCHEME</h2>
            <table>
                <tr>
                    <th>Enter Amount</th>
                </tr>
                <tr>
                    <td><input id="amt" runat="server" type="number" /></td>
                </tr>
                <tr>
                    <th>Select Branch</th>
                </tr>
                <tr>
                    <td>
                        <select id="Select1">
                            <option value="">Select</option>
                            <option value="REDHILLS">REDHILLS</option>
                            <option value="PERAMBUR">PERAMBUR</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Name</th>
                </tr>
                <tr>
                    <td><input id="name" runat="server" type="text" /></td>
                </tr>
                <tr>
                    <th>Mobile</th>
                </tr>
                <tr>
                    <td><input id="mobile" runat="server" type="number" /></td>               
                </tr>
                <tr>
                    <th>Email</th>
                </tr>
                <tr>
                    <td>
                        <input id="email" runat="server" type="email" />
                    </td>
                </tr>
                <tr>
                    <th>Address</th>
                </tr>
                <tr>
                    <td>
                        <input id="addr" runat="server" type="text" />
                    </td>
                </tr>
            </table>
        </center>
    </form>
</body>
</html>
