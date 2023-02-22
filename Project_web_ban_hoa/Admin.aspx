<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Project_web_ban_hoa.Admin" %>

<%@ Register Src="~/Private/Admin/AdminControl.ascx" TagPrefix="uc1" TagName="AdminControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Đây là trang admin</h1>
            <ul>
                <li><a href="/Admin.aspx">Trang Admin</a></li>
                <li><a href="/Admin.aspx?modul=category">content</a></li>
            </ul>
            <div>
                <uc1:AdminControl runat="server" id="AdminControl" />
            </div>
        </div>
    </form>
</body>
</html>
