<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateProduct.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Product.Update.UpdateProduct" %>
<div class="container">
    <div class="update-product">
        <h2 class="update-product__title">Chỉnh sửa sản phẩm 
            <i class="fa fa-pen"></i>
        </h2>

        <div class="update-product-box-edit">
            <div class="update-product-box-edit-top">
                <img src="../../../../Publics/Images/DefaultImg/no-image.jpg" alt="Alternate Text" />
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
                    <textarea runat="server" class="form-gr__control" />
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
                    <asp:Button Text="Lưu" runat="server" ID="btnSave" CssClass="btn btn-solid btn--green" />
                </div>
            </div>
        </div>
    </div>
</div>
