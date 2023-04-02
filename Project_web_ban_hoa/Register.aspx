<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Project_web_ban_hoa.Register" %>

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
        <div class="wrapper-form wrapper-form--register">
            <form id="form1" class="form-login" runat="server">
                <h2>Đăng ký</h2>
                <div class="form-group-login">
                    <div class="form-login-wrapper-controls">
                        <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-login-wrapper-controls__control"
                            required="required" />
                        <span>Họ</span>
                        <i></i>
                    </div>
                    <asp:RequiredFieldValidator ID="rvlFirstName" runat="server" CssClass="form-err-msg" ErrorMessage="* Vui lòng nhập trường này" Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group-login">
                    <div class="form-login-wrapper-controls">
                        <asp:TextBox runat="server" ID="txtLastName" CssClass="form-login-wrapper-controls__control"
                            required="required" />
                        <span>Tên</span>
                        <i></i>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" CssClass="form-err-msg" ErrorMessage="* Vui lòng nhập trường này" Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group-login">
                    <div class="form-login-wrapper-controls">
                        <asp:TextBox runat="server" ID="txtAddress" CssClass="form-login-wrapper-controls__control"
                            required="required" />
                        <span>Địa chỉ</span>
                        <i></i>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="form-err-msg" ErrorMessage="* Vui lòng nhập trường này" Display="Dynamic" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group-login">
                    <div class="form-login-wrapper-controls">
                        <asp:TextBox runat="server" ID="txtGmail" CssClass="form-login-wrapper-controls__control"
                            required="required" />
                        <span>Gmail</span>
                        <i></i>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" CssClass="form-err-msg" ErrorMessage="* Vui lòng nhập trường này" Display="Dynamic" ControlToValidate="txtGmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="form-err-msg"
                        runat="server" ErrorMessage="Trường này phải là email" Display="Dynamic" ControlToValidate="txtGmail"
                        ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group-login">
                    <div class="form-login-wrapper-controls">
                        <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" CssClass="form-login-wrapper-controls__control"
                            required="required" />
                        <span>Mật khẩu</span>
                        <i></i>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" CssClass="form-err-msg" ErrorMessage="* Vui lòng nhập trường này" Display="Dynamic" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Mật khẩu ít nhất 6 ký tự" CssClass="form-err-msg" Display="Dynamic" ValidationExpression="(?=^.{6,255}$)(?=.*\d).*$" ControlToValidate="txtPassword"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group-login">
                    <div class="form-login-wrapper-controls">
                        <asp:TextBox runat="server" TextMode="Password" ID="txtAgainPassword" CssClass="form-login-wrapper-controls__control"
                            required="required" />
                        <span>Nhập lại mật khẩu</span>
                        <i></i>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvAgainPassword" runat="server" CssClass="form-err-msg" ErrorMessage="* Vui lòng nhập trường này" Display="Dynamic" ControlToValidate="txtAgainPassword"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu chưa chính xác" ControlToCompare="txtPassword" ControlToValidate="txtAgainPassword" CssClass="form-err-msg" Display="Dynamic"></asp:CompareValidator>
                </div>

                <div class="form-login-links">
                    <asp:HyperLink NavigateUrl="#" Text="Quên mật khẩu ?" runat="server" />
                    <asp:HyperLink NavigateUrl="~/Login.aspx" Text="Đăng nhập" runat="server" />
                </div>

                <asp:Button Text="Đăng ký" OnClick="btnRegister_Click" CssClass="form-login__btn-submit" runat="server" ID="btnRegister" />
            </form>
        </div>
    </section>

</body>
</html>
