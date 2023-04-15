<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Project_web_ban_hoa.Admin" %>

<%@ Register Src="~/Private/Admin/AdminControl.ascx" TagPrefix="uc1" TagName="AdminControl" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Trang admin</title>

    <%-- Thêm CSS Library --%>
    <link href="Publics/Css/Library/Bootstrap/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="Publics/Css/Library/JqueryConfirm/sweetalert2.min.css" rel="stylesheet" />
    <%-- Thêm Font chữ  --%>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />



    <%-- Css Main --%>
    <link href="Publics/Css/Reset.css" rel="stylesheet" />
    <link href="Publics/Css/Admin.css" rel="stylesheet" />

    <%-- Library Javascript --%>
    <script src="Publics/Js/Library/Jquery/jquery-3.6.4.min.js"></script>
    <script src="Publics/Js/Library/Toastify/toastify-js.js"></script>
    <script src="Publics/Js/Library/Chart/chart.js"></script>
    <script src="Publics/Js/Library/JqueryConfirm/sweetalert2.all.min.js"></script>

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
                        <img src='<%= GetAvatar() %>' alt="user-icon" class="admin-header-user__icon" />
                        <div class="wrapper-control-user">
                            <div class="wrapper-control-user__top-menu">
                                <p>
                                    <i class="fa-solid fa-user-tag"></i>
                                    <%= fullName %>
                                </p>
                            </div>
                            <div class="wrapper-control-user__body-menu">
                                <a href="/" class="wrapper-control-user__control"><i class="fa-solid fa-house"></i>Trở
                                    về trang Home</a>
                                <a href="/Admin.aspx?modul=user&t=user-info" class="wrapper-control-user__control">
                                    <i class="fa fa-info"></i>Thông tin cá nhân  </a>
                                <asp:Button ID="hplLogOut" Text="Đăng Xuất" runat="server" CssClass="wrapper-control-user__control"
                                    OnClick="hplLogOut_Click" UseSubmitBehavior="false" />
                            </div>
                        </div>
                    </div>
                </header>
            </div>
            <nav class="admin-nav">
                <div class="container">
                    <ul class="admin-nav-list">
                        <li class="admin-nav-list__item <%= Request.QueryString["modul"] == "category" ? "admin-nav-list__item--active" : "" %>"><a href="/Admin.aspx?modul=category">Trang quản lý
                            danh mục</a></li>
                        <li class="admin-nav-list__item <%= Request.QueryString["modul"] == "product" ? "admin-nav-list__item--active" : "" %>"><a href="/Admin.aspx?modul=product">Trang quản lý san
                            phẩm</a></li>
                        <li class="admin-nav-list__item <%= Request.QueryString["modul"] == "user" ? "admin-nav-list__item--active" : "" %>"><a href="/Admin.aspx?modul=user&t=view">Trang quản lý người
                            dùng</a></li>
                    </ul>
                </div>
            </nav>
            <section class="admin-content">
                <script src="Publics/Js/Admin.js"></script>
                <uc1:AdminControl runat="server" ID="AdminControl" />
            </section>
        </div>
    </form>

</body>
</html>
