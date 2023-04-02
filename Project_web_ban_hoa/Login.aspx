<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_web_ban_hoa.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Publics/Css/Reset.css" rel="stylesheet" />
    <link href="Publics/Css/Login.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css" />

    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script src="Publics/Js/Admin.js"></script>
</head>
<body>
    <section class="section-login">
        <div class="wrapper-form">
            <form id="form1" class="form-login" runat="server">
                <h2>Đăng nhập</h2>
                <div class="form-group-login">
                    <div class="form-login-wrapper-controls">
                        <asp:TextBox runat="server" ID="txtGmail" CssClass="form-login-wrapper-controls__control"
                            required="required" />
                        <span>Gmail</span>
                        <i></i>
                    </div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="form-err-msg"
                        runat="server" ErrorMessage="Trường này phải là email" Display="Dynamic" ControlToValidate="txtGmail"
                        ForeColor="Red" Font-Size="Small" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group-login">
                    <div class="form-login-wrapper-controls">
                        <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" CssClass="form-login-wrapper-controls__control"
                            required="required" />
                        <span>Mật khẩu</span>
                        <i></i>
                    </div>

                </div>

                <div class="form-login-links">
                    <asp:HyperLink NavigateUrl="~/Register.aspx" Text="Bạn chưa có tài khoản ?" runat="server" />
                    <asp:HyperLink NavigateUrl="~/Register.aspx" Text="Đăng ký ngay" runat="server" />
                </div>

                <asp:Button Text="Login" CssClass="form-login__btn-submit" runat="server" ID="btnLogin"
                    OnClick="btnLogin_Click" />
            </form>
        </div>
    </section>

</body>
</html>
