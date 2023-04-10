﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.ascx.cs" Inherits="Project_web_ban_hoa.Private.Admin.User.UserInfo.UserInfo" %>
<div class="container">
    <div class="wrapper-info">
        <div class="user-info">
            <div class="user-info-top">
                <asp:FileUpload runat="server" CssClass="fulAvatar" ID="fulAvatar" Style="display: none" onchange="previewImage()" accept="image/png, image/jpg, image/gif, image/jpeg" />
                <a href="#" id="uploadLink">
                    <img src='<%=  GetAvatar() != null ?  GetAvatar()  :$"../../../../Publics/Images/DefaultImg/{GetAvatar()}" %>' id="preview" alt="user img" />

                    <i class="fa fa-pen uploadLink--edit"></i>
                </a>
                <div class="user-info-top-right">
                    <h4 class="user-info-top-right__name"><%= user.FirstName + " " + user.LastName %></h4>
                    <p class="user-info-top-right__address">
                        <i class="fa-solid fa-address-card"></i>
                        <%= user.Address %>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <div class="form-gr">
                        <asp:Label Text="Chức vụ: " CssClass="form-gr__label" runat="server" />
                        <asp:DropDownList CssClass="form-gr__control" ID="ddlRoles" runat="server">
                        </asp:DropDownList>
                    </div>
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
                <div class="user-info-bot">
                    <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-solid btn--green" OnClick="btnUpdate_Click" Text="Cập nhật" />
                </div>
            </div>
        </div>
    </div>

    <script>
        const userInfoBotElement = document.querySelector(".user-info-bot");
        console.log(userInfoBotElement);
        //userInfoBotElement.setAttribute("style", "display: none");
        document.getElementById("uploadLink").onclick = function () {
            document.querySelector(".fulAvatar").click();
        };

        function previewImage() {
            var fileUpload = document.querySelector(".fulAvatar");
            var preview = document.getElementById("preview");

            // Kiểm tra nếu không có file nào được chọn
            if (fileUpload.files.length === 0) {
                return;
            }

            // Đọc file hình ảnh được chọn
            var reader = new FileReader();
            reader.onload = function (e) {
                preview.setAttribute("src", e.target.result);
                preview.style.display = "block";
            };
            reader.readAsDataURL(fileUpload.files[0]);
        }
        const swapElement = $("#chkSwapPassword");

        swapElement.change(function (e) {
            if (swapElement.prop("checked")) {
                $(".user-info-mid-right.user-info-mid-right--toggle").addClass("user-info-mid-right--active")
            } else {
                $(".user-info-mid-right.user-info-mid-right--toggle").removeClass("user-info-mid-right--active")

            }
        });

    </script>
