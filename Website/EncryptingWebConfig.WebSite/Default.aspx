<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Not Encrypted App Settings</h1>
            <table>
                <tr>
                    <td>App Settings Key : </td><td>appSettingsKey</td>
                </tr>
                <tr>
                    <td>App Settings Value : </td><td><asp:Literal runat="server" ID="LitValue" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
