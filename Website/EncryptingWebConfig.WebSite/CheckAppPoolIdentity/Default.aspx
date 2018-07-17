<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Sitefinity_SNPO_Dev_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dev Info</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <style>
            table, th, td {
                border: 1px solid black
            }
        </style>
        <table>
            <thead>
            <th>
                VARIABLE    
            </th>
            <th>
                VALUE
            </th>
            </thead>
            <tbody>
            <tr>
                <td>
                    System.Security.Principal.WindowsIdentity.GetCurrent().Name
                </td>
                <td>
                    <% Response.Write(System.Security.Principal.WindowsIdentity.GetCurrent().Name); %>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    </form>
</body>
</html>
