<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_web_ban_hoa.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Publics/Css/Reset.css" rel="stylesheet" />
    <link href="Publics/Css/Login.css" rel="stylesheet" />
</head>
<body>
    <section class="section-login">
        <div class="wrapper-form">
            <form id="form1" class="form-login" runat="server">
                <h2>Đăng nhập</h2>
                <div class="form-login-wrapper-controls">
                    <asp:TextBox runat="server" ID="txtGmail" CssClass="form-login-wrapper-controls__control"
                        required="required" />
                    <span>Gmail</span>
                    <i></i>
                </div>
                <div class="form-login-wrapper-controls">
                    <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" CssClass="form-login-wrapper-controls__control"
                        required="required" />
                    <span>Mật khẩu</span>
                    <i></i>
                </div>
                <div class="form-login-links">
                    <asp:HyperLink NavigateUrl="#" Text="Quên mật khẩu ?" runat="server" />
                    <asp:HyperLink NavigateUrl="#" Text="Đăng ký" runat="server" />
                </div>

                <asp:Button Text="Login" CssClass="form-login__btn-submit" runat="server" />
            </form>
        </div>
    </section>
</body>
</html>
