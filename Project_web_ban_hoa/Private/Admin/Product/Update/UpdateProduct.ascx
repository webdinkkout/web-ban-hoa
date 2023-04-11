<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateProduct.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Product.Update.UpdateProduct" %>
<div class="container">
    <div class="update-product">
        <h2 class="update-product__title">Chỉnh sửa sản phẩm 
            <i class="fa fa-pen"></i>
        </h2>

        <div class="update-product-box-edit">
            <asp:FileUpload runat="server" ID="fulThumbnail" CssClass="fulThumbnail" Style="display: none" onchange="previewImage('.fulThumbnail','preview')" accept="image/png, image/jpg, image/gif, image/jpeg" />
            <div class="update-product-box-edit-top">
                <a href="#" onclick="onClickShowImg('.fulThumbnail')">
                    <img id="preview" src='<%= string.IsNullOrEmpty(productModel.Thumbnail) ? "../../../../Publics/Images/DefaultImg/no-image.jpg" : productModel.Thumbnail %>' alt="Alternate Text" />
                </a>
            </div>
            <div class="update-product-box-edit-body">
                <div class="form-gr">
                    <asp:Label Text="Danh mục sản phẩm: " AssociatedControlID="ddlCategories" CssClass="form-gr__label"
                        runat="server" />
                    <asp:DropDownList runat="server" ID="ddlCategories" CssClass="form-gr__control">
                    </asp:DropDownList>
                </div>
                <div class="form-gr">
                    <asp:Label Text="Tên sản phẩm" AssociatedControlID="txtName" CssClass="form-gr__label"
                        runat="server" />
                    <asp:TextBox runat="server" ID="txtName" CssClass="form-gr__control" />
                </div>
                <div class="form-gr">
                    <asp:Label Text="Mô tả sản phẩm" CssClass="form-gr__label" runat="server" />
                    <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-gr__control" ID="txtDesc" Rows="10" />
                </div>
                <div class="form-gr">
                    <asp:Label Text="Giá khuyễn mãi (nếu có)" CssClass="form-gr__label" runat="server" />
                    <asp:TextBox runat="server" ID="txtOldPrice" CssClass="form-gr__control" />
                </div>
                <div class="form-gr">
                    <asp:Label Text="Giá hiện tại (*)" CssClass="form-gr__label" runat="server" />
                    <asp:TextBox runat="server" ID="txtCurrentPrice" CssClass="form-gr__control" />
                </div>
                <div class="form-gr">
                    <asp:Label Text="Số lượng sản phẩm" CssClass="form-gr__label" runat="server" />
                    <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-gr__control" />
                </div>
                <div class="form-gr">
                    <asp:Label Text="Số lượng sản phẩm đã bán" CssClass="form-gr__label" runat="server" />
                    <asp:TextBox runat="server" ID="txtSold" CssClass="form-gr__control" />
                </div>
                <div class="form-gr">
                    <asp:Button Text="Lưu" runat="server" ID="btnSave" CssClass="btn btn-solid btn--green" OnClick="btnSave_Click" />
                    <asp:Button Text="Trở về" runat="server" ID="btnBack" CssClass="btn btn-solid btn--red" OnClick="btnBack_Click" />
                </div>
            </div>
        </div>
    </div>
</div>
