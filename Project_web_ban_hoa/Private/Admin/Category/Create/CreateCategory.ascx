<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateCategory.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Category.Create.CreateCategory" %>
<div class="wrapper-create-category">
    <asp:TextBox ID="txtName" runat="server" CssClass="wrapper-create-category__input"
        placeholder="Nhập tên danh mục"></asp:TextBox>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
        runat="server" ErrorMessage="Vui lòng nhập trường này" ForeColor="red" ControlToValidate="txtName"></asp:RequiredFieldValidator>

    <asp:FileUpload ID="fulThumbnailCategory" CssClass="wrapper-create-category__file"
        runat="server" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
        runat="server" ErrorMessage="Vui lòng nhập trường này" ForeColor="red" ControlToValidate="fulThumbnailCategory"></asp:RequiredFieldValidator>

    <asp:Button ID="btnCreateCategory" runat="server" Text="Thêm danh mục"
        CssClass="wrapper-create-category__btn" OnClick="btnCreateCategory_Click" />
</div>
