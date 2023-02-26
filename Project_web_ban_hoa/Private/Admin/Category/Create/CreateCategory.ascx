<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateCategory.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Category.Create.CreateCategory" %>
<div class="wrapper-create-category">
    <h2 class="wrapper-create-category__title">Thêm danh mục</h2>

    <div class="wrapper-create-category-group">
        <asp:TextBox ID="txtName" runat="server" CssClass="wrapper-create-category-group__input"
            placeholder="Nhập tên danh mục"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
            runat="server" ErrorMessage="Vui lòng nhập trường này" ForeColor="red" CssClass="wrapper-create-category-group__smg"
            ControlToValidate="txtName"
            SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

    </div>

    <div class="wrapper-create-category-group">

        <asp:FileUpload ID="fulThumbnailCategory" CssClass="wrapper-create-category-group__file"
            runat="server" accept="image/png, image/jpg, image/gif, image/jpeg" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="wrapper-create-category-group__smg"
            runat="server" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Vui lòng nhập trường này"
            ForeColor="red" ControlToValidate="fulThumbnailCategory"></asp:RequiredFieldValidator>
    </div>

    <asp:Button ID="btnCreateCategory" runat="server" Text="Thêm danh mục"
        CssClass="btn btn-success wrapper-create-category__btn" OnClick="btnCreateCategory_Click" />
</div>

<script type="text/javascript">
    document.onload = () => {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(showToast);
    }
</script>
