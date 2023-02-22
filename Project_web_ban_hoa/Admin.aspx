<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Project_web_ban_hoa.Admin" %>

<%@ Register Src="~/Private/Admin/AdminControl.ascx" TagPrefix="uc1" TagName="AdminControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Publics/Css/Library/Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="Publics/Css/Reset.css" rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800&display=swap"
        rel="stylesheet">
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
                <uc1:AdminControl runat="server" ID="AdminControl" />
            </div>
        </div>
    </form>
</body>
</html>
