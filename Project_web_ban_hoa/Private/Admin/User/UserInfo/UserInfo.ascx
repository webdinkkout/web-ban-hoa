<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.ascx.cs" Inherits="Project_web_ban_hoa.Private.Admin.User.UserInfo.UserInfo" %>
<div class="container">
    <div class="info-user">
        <div class="info-user-img">
            <img src="../../../../Publics/Images/DefaultImg/null-image.png" />
        </div>
        <div class="info">

            <div class="info__group-control">
                <asp:Label CssClass="info__label" Text="Họ và tên lót" runat="server" AssociatedControlID="txtFirstName" />
                <asp:TextBox ID="txtFirstName" CssClass="info__control" runat="server" />
            </div>
            <div class="info__group-control">
                <asp:Label CssClass="info__label" Text="Tên" runat="server" AssociatedControlID="txtLastName" />
                <asp:TextBox ID="txtLastName" CssClass="info__control" runat="server" />
            </div>
            <div class="info__group-control">
                <asp:Label CssClass="info__label" Text="Email" runat="server" AssociatedControlID="txtEmail" />
                <asp:TextBox ID="txtEmail" CssClass="info__control" runat="server" />
            </div>
            <div class="info__group-control">
                <asp:Label CssClass="info__label" Text="Chức vụ" runat="server" AssociatedControlID="ddlRole" />
                <asp:DropDownList ID="ddlRole" runat="server"
                    CssClass="info__control info__control--ddl"
                    DataTextField="Name" DataValueField="Id">
                </asp:DropDownList>
            </div>
        </div>
    </div>
</div>
