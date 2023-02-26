<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Project_web_ban_hoa.Admin" %>

<%@ Register Src="~/Private/Admin/AdminControl.ascx" TagPrefix="uc1" TagName="AdminControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang admin</title>
    <link href="Publics/Css/Library/Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="Publics/Css/Reset.css" rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800&display=swap"
        rel="stylesheet" />

    <link href="Publics/Css/Admin.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <div class="container">
                <header class="admin-header">
                    <a href="/admin.aspx">
                        <img src="Publics/Images/logo-hoa-yeu-thuong.png" class="admin-header__logo" alt="logo page" /></a>
                    <div class="admin-header-user">
                        <img src="Publics/Images/Admin/user-icon.png" alt="user-icon" class="admin-header-user__icon" />
                    </div>
                </header>
            </div>
            <nav class="admin-nav">
                <div class="container">
                    <ul class="admin-nav-list">
                        <li class="admin-nav-list__item"><a href="/Admin.aspx?modul=category">Trang quản lý
                            danh mục</a></li>
                        <li class="admin-nav-list__item"><a href="/Admin.aspx?modul=product">Trang quản lý san
                            phẩm</a></li>
                        <li class="admin-nav-list__item"><a href="/Admin.aspx?modul=user">Trang quản lý người
                            dùng</a></li>
                    </ul>
                </div>
            </nav>

            <section class="admin-content">
                <uc1:AdminControl runat="server" ID="AdminControl" />
            </section>
        </div>
    </form>


</body>
</html>
