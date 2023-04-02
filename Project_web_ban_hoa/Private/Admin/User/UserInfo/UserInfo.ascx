<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.ascx.cs" Inherits="Project_web_ban_hoa.Private.Admin.User.UserInfo.UserInfo" %>
<div class="container">
    <div class="wrapper-info">
        <div class="user-info">
            <div class="user-info-top">
                <img src="../../../../Publics/Images/DefaultImg/user.png" alt="user img" />
                <div class="user-info-top-right">
                    <h4 class="user-info-top-right__name">Lê Trần Tấn Tài</h4>
                    <p class="user-info-top-right__address">
                        <i class="fa-solid fa-address-card"></i>
                        Bình chánh
                    </p>
                </div>
            </div>
            <div class="user-info-mid">
                <div class="user-info-mid-left">
                    <div class="form-gr">
                        <asp:Label Text="Họ và tên lót: " CssClass="form-gr__label" runat="server" />
                        <asp:TextBox runat="server" CssClass="form-gr__control" ID="txtFirstName" />
                    </div>
                    <div class="form-gr">
                        <asp:Label Text="Tên: " CssClass="form-gr__label" runat="server" />
                        <asp:TextBox runat="server" CssClass="form-gr__control" ID="txtLastName" />
                    </div>
                </div>
                <div class="user-info-mid-right">
                    <div class="form-gr">
                        <asp:Label Text="Địa chỉ Email: " CssClass="form-gr__label" runat="server" />
                        <asp:TextBox runat="server" CssClass="form-gr__control" ID="txtEmail" />
                    </div>
                    <div class="form-gr">
                        <asp:Label Text="Địa chỉ: " CssClass="form-gr__label" runat="server" />
                        <asp:TextBox runat="server" CssClass="form-gr__control" ID="txtAddress" />
                    </div>
                </div>


            </div>
            <div class="user-info-bot">
                <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-solid btn--green" Text="Cập nhật" />
            </div>
        </div>
    </div>
</div>

<script>
    const userInfoBotElement = document.querySelector(".user-info-bot");
    console.log(userInfoBotElement);
    //userInfoBotElement.setAttribute("style", "display: none");
</script>
