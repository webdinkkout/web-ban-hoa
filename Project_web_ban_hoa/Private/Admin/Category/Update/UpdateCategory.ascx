<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateCategory.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Category.Update.UpdateCategory" %>
<div class="wrapper-create-category">
    <h2 class="wrapper-create-category__title">Chỉnh sửa danh mục</h2>
    <div class="wrapper-create-category-group">
        <asp:TextBox ID="txtName" runat="server" CssClass="wrapper-create-category-group__input" placeholder="Nhập tên danh mục"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
            runat="server" ErrorMessage="Vui lòng nhập trường này" ForeColor="red" CssClass="wrapper-create-category-group__smg"
            ControlToValidate="txtName"
            SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

    </div>

    <asp:Panel CssClass="wrapper-create-category-panel" runat="server" GroupingText="Danh mục gốc">
        <asp:DropDownList CssClass="wrapper-create-category-panel__control" ID="ddlCategories"
            runat="server">
        </asp:DropDownList>
    </asp:Panel>

    <div class="wrapper-create-category-group">
        <asp:FileUpload ID="fulThumbnailCategory" CssClass="wrapper-create-category-group__file"
            onchange="previewImage()"
            runat="server" accept="image/png, image/jpg, image/gif, image/jpeg" />

    </div>

    <asp:ImageButton CssClass="wrapper-create-category__imgPreview" runat="server" ID="imgPreview1" />

    <asp:Button ID="btnUpdateCategory" runat="server" Text="Lưu" OnClick="btnUpdateCategory_Click" CssClass="btn btn-success wrapper-create-category__btn" />
</div>


<script>
    function previewImage() {
        var fileUpload = document.querySelector(".wrapper-create-category-group__file");
        if (typeof (fileUpload.files) !== "undefined") {
            var reader = new FileReader();
            reader.onload = function () {
                var imgPreview = <%= imgPreview1.ClientID %>;
                imgPreview.src = reader.result;

            }
            reader.readAsDataURL(fileUpload.files[0]);
        }
    }
</script>
