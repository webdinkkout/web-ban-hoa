<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateProduct.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Product.Create.CreateProduct" %>
<section class="create-product">
    <div class="row">
        <div class="col-lg-6">
            <div class="wrapper-control-admin">
                <asp:Label Text="Danh mục sản phẩm" runat="server" AssociatedControlID="ddlCategory"
                    CssClass="wrapper-control-admin-control-group__label" />

                <asp:DropDownList ID="ddlCategory" CssClass="wrapper-control-admin__dropdown" EnableViewState="true"
                    AutoPostBack="true" runat="server">
                </asp:DropDownList>

                <div class="wrapper-control-admin-control-group">
                    <asp:Label Text="Tên sản phẩm (*)" runat="server" AssociatedControlID="txtName" CssClass="wrapper-control-admin-control-group__label" />
                    <asp:TextBox runat="server" ID="txtName" placeholder="Vui lòng nhập tên sản phẩm"
                        CssClass="wrapper-control-admin-control-group__control" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" CssClass="wrapper-control-admin-control-group__err-msg"
                        runat="server" ErrorMessage="Vui lòng nhập trường này"
                        ControlToValidate="txtName" ViewStateMode="Inherit"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="wrapper-control-admin-control-group">
                    <asp:Label Text="Mô tả sản phẩm" runat="server" AssociatedControlID="txtDesc"
                        CssClass="wrapper-control-admin-control-group__label" />
                    <asp:TextBox runat="server" ID="txtDesc" TextMode="multiline" Columns="50" Rows="3"
                        placeholder="Nhập mô tả sản phẩm"
                        CssClass="wrapper-control-admin-control-group__control" />
                </div>

                <div class="wrapper-control-admin-control-group">
                    <asp:Label Text="Giá tiền (*)" runat="server" AssociatedControlID="txtOldPrice" CssClass="wrapper-control-admin-control-group__label" />
                    <asp:TextBox runat="server" ID="txtOldPrice" placeholder="Vui lòng nhập tên sản phẩm"
                        CssClass="wrapper-control-admin-control-group__control" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" CssClass="wrapper-control-admin-control-group__err-msg"
                        runat="server" ErrorMessage="Vui lòng nhập trường này"
                        ControlToValidate="txtOldPrice" ViewStateMode="Inherit"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                        CssClass="wrapper-control-admin-control-group__err-msg"
                        ControlToValidate="txtOldPrice"
                        Display="Dynamic"
                        runat="server"
                        ErrorMessage="Trường này phải là số và lớn hơn 0"
                        ValidationExpression="^[1-9]{0,10}$"></asp:RegularExpressionValidator>
                </div>
                <div class="wrapper-control-admin-control-group">
                    <asp:Label Text="Giá tiền khuyến mãi (nếu có)" runat="server" AssociatedControlID="txtCurrentPrice"
                        CssClass="wrapper-control-admin-control-group__label" />
                    <asp:TextBox runat="server" ID="txtCurrentPrice" placeholder="Vui lòng nhập tên sản phẩm"
                        CssClass="wrapper-control-admin-control-group__control" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3" CssClass="wrapper-control-admin-control-group__err-msg"
                        runat="server" ErrorMessage="Vui lòng nhập trường này"
                        ControlToValidate="txtCurrentPrice" ViewStateMode="Inherit"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                        CssClass="wrapper-control-admin-control-group__err-msg"
                        ControlToValidate="txtCurrentPrice"
                        Display="Dynamic"
                        runat="server"
                        ErrorMessage="Trường này phải là số và lớn hơn 0"
                        ValidationExpression="^[1-9]{0,10}$"></asp:RegularExpressionValidator>
                </div>
                <div class="wrapper-control-admin-control-group">
                    <asp:Label Text="Số lượng (*)" runat="server" AssociatedControlID="txtQuantiry"
                        CssClass="wrapper-control-admin-control-group__label" />
                    <asp:TextBox runat="server" ID="txtQuantiry" placeholder="Vui lòng nhập tên sản phẩm"
                        CssClass="wrapper-control-admin-control-group__control" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4" CssClass="wrapper-control-admin-control-group__err-msg"
                        runat="server" ErrorMessage="Vui lòng nhập trường này"
                        ControlToValidate="txtQuantiry" ViewStateMode="Inherit"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                        CssClass="wrapper-control-admin-control-group__err-msg"
                        ControlToValidate="txtQuantiry"
                        Display="Dynamic"
                        runat="server"
                        ErrorMessage="Trường này phải là số và lớn hơn 0"
                        ValidationExpression="^[1-9]{0,10}$"></asp:RegularExpressionValidator>
                </div>
                <div class="wrapper-control-admin-control-group">
                    <asp:Label Text="Ảnh sản phẩm (*)" runat="server" AssociatedControlID="fulThumbnail"
                        CssClass="wrapper-control-admin-control-group__label" />

                    <asp:FileUpload ID="fulThumbnail" runat="server" CssClass="wrapper-control-admin-control-group__file" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator5" CssClass="wrapper-control-admin-control-group__err-msg"
                        runat="server" ErrorMessage="Vui lòng nhập trường này"
                        ControlToValidate="fulThumbnail" ViewStateMode="Inherit"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <asp:Button Text="Tạo" CssClass="btn btn-success wrapper-control-admin__btn" runat="server" />
            </div>
        </div>
        <div class="col-lg-6">
            <h2 class="preview-admin-title">Xem trước sản phẩm</h2>
            <div class="wrapper-card-product-admin">
                <div class="wrapper-card-product-admin-top">
                    <div class="wrapper-card-product-admin-top-wrapper-img">
                        <img src="../../../../Publics/Uploads/Category/97177053-93eb-478b-8f83-30d8a5125b59-icon-hoa-tinh-yeu.png" />
                    </div>
                    <div class="wrapper-card-product-admin-top-content">
                        <h2 data-name="name"></h2>
                        <div class="wrapper-card-product-admin-top-content-top">
                            <div class="wrapper-card-product-admin-top-content-wrapper-price">
                                <span class="wrapper-card-product-admin-top-content-wrapper-price__price wrapper-card-product-admin-top-content-wrapper-price__price--old">
                                    25000 đ
                                </span>
                                <span class="wrapper-card-product-admin-top-content-wrapper-price__price wrapper-card-product-admin-top-content-wrapper-price__price--current">
                                    3000 đ
                                </span>
                            </div>
                            <span class="wrapper-card-product-admin-top-content__sub-title">Đã bao gồm thuế VAT
                                10%</span>
                        </div>
                        <div class="wrapper-card-product-admin-top-content-quantity">
                            <span class="wrapper-card-product-admin-top-content-quantity__quantity">Số lượng: 12000</span>
                            <span class="wrapper-card-product-admin-top-content-quantity__sold">Đã bán: 0</span>
                        </div>

                    </div>
                </div>
                <div class="wrapper-card-product-admin-bot">
                    <p class="wrapper-card-product-admin-bot__title">Mô tả : </p>
                    <p class="wrapper-card-product-admin-bot__desc">
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    const inputNameElement = document.querySelectorAll(".wrapper-control-admin-control-group__control");
    const h2NamePreviewElement = document.querySelector("h2[data-name=name]");
    const descElement = document.querySelector(".wrapper-card-product-admin-bot__desc");

    inputNameElement[0].addEventListener("input", (e) => {
        h2NamePreviewElement.innerHTML = e.target.value;
    })


</script>
