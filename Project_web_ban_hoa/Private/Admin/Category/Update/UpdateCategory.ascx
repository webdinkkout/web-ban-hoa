<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateCategory.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Category.Update.UpdateCategory" %>
<asp:Repeater ID="rptUpdateCategory" runat="server"
    OnItemCommand="rptUpdateCategory_ItemCommand">
    <ItemTemplate>
        <div class="wrapper-create-category">
            <h2 class="wrapper-create-category__title">Chỉnh sửa danh mục</h2>
            <div class="wrapper-create-category-group">
                <asp:TextBox ID="txtName" runat="server" CssClass="wrapper-create-category-group__input"
                    placeholder="Nhập tên danh mục" Text='<%# Eval("Name") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ErrorMessage="Vui lòng nhập trường này" ForeColor="red" CssClass="wrapper-create-category-group__smg"
                    ControlToValidate="txtName"
                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

            </div>

            <div class="wrapper-create-category-group">
                <asp:FileUpload ID="fulThumbnailCategory" CssClass="wrapper-create-category-group__file"
                    onchange="previewImage()"
                    runat="server" accept="image/png, image/jpg, image/gif, image/jpeg" />

            </div>
            <img id="imgPreview" class="wrapper-create-category__imgPreview" src='<%# Eval("Thumbnail") %>'
                alt="Alternate Text"
                runat="server" />

            <asp:Button ID="btnUpdateCategory" runat="server" Text="Lưu"
                CssClass="btn btn-success wrapper-create-category__btn"
                CommandName="btnUpdate" />
        </div>

    </ItemTemplate>
</asp:Repeater>

<script>
    function previewImage() {
        var fileUpload = document.querySelector(".wrapper-create-category-group__file");
        if (typeof (fileUpload.files) !== "undefined") {
            var reader = new FileReader();
            reader.onload = function () {
                var imgPreview = document.querySelector(".wrapper-create-category__imgPreview");
                imgPreview.src = reader.result;
            }
            reader.readAsDataURL(fileUpload.files[0]);
        }
    }
</script>
