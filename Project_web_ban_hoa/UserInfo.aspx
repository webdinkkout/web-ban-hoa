<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="Project_web_ban_hoa.UserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="wrapper-info">
            <div class="user-info">
                <div class="user-info-top">
                    <asp:FileUpload runat="server" CssClass="fulAvatar" ID="fulAvatar" Style="display: none" onchange="previewImage('.fulAvatar','preview')" accept="image/png, image/jpg, image/gif, image/jpeg" />
                    <a href="#" id="uploadLink" onclick="onClickShowImg('.fulAvatar')">
                        <img src='<%=  GetAvatar().Length > 0 ?  GetAvatar()  : "Publics/Images/DefaultImg/user.png" %>' id="preview" alt="user img" />
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
    </div>

</asp:Content>
