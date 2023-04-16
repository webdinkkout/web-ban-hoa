<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Project_web_ban_hoa.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Topic.css" rel="stylesheet" />
    <link href="Publics/Css/ProductDetail.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mb-4">
        <div class="row">
            <div class="col-lg-3">
                <div class="product-deteil-img">
                    <a href="#">
                        <img src='<%= GetThumbnail() %>' />
                    </a>
                    <p class="product-deteil-img__text">
                        THÔNG BÁO: Giá hoa ngày 7-8/3/2023 tăng 20% do giá nguyên liệu tăng.
                    </p>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="product-detail">
                    <h2 class="product-detail__title"><%= GetNameProduct() + " - " + GetSeoNameProduct()  %></h2>
                    <div class="product-detail-price">
                        <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old"><%= string.Format("{0:##,#0 đ}", GetOldPrice()) %></p>
                        <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current"><%= string.Format("{0:##,#0 đ}", GetCurrentPrice()) %></p>
                    </div>
                    <i class="product-detail__note">Giá đã bao gồm 10% VAT</i>
                    <p style="font-weight: 600"><%= GetDesc() %></p>
                    <div class="product-detail-note mb-4">
                        <span>LƯU Ý</span>
                        <p class="product-detail-note__text">Sản phẩm bạn đang chọn là sản phẩm được thiết kế đặc biệt!</p>
                        <p class="product-detail-note__text">Hiện nay, Hoayeuthuong.com chỉ thử nghiệm cung cấp cho thị trường </p>
                    </div>
                    <div class="product-detail-control">
                        <div>
                            <a id="btnAddProduct" data-userid='<%= string.IsNullOrEmpty(GetUserId()) ? "" : GetUserId() %>' data-currentprice='<%= GetCurrentPrice() %>' data-productid='<%= string.IsNullOrEmpty(GetProductId()) ? "" : GetProductId() %>' class="btn-control btn-control--solid btn-control--orange">Thêm vào giỏ</a>
                            <asp:Button ID="btnBuy" OnClick="btnBuy_Click" Text="Mua ngay" CssClass="btn-control btn-control--fill btn-control--text-white btn-control--fill-red " runat="server" />
                        </div>
                        <a class="btn-control btn-control--solid btn-control--green btn-control--w415 " href="#">Gọi ngay:0399999999</a>
                    </div>

                    <div class="product-detail-note">
                        <span>Uư đãi đặc biệt</span>
                        <p class="product-detail-note__text"><span class="tag-circel">1</span>Sản phẩm bạn đang chọn là sản phẩm được thiết kế đặc biệt!</p>
                        <p class="product-detail-note__text"><span class="tag-circel">2</span>Giảm tiếp 3% cho đơn hàng Bạn tạo ONLINE lần thứ 2, 5% cho đơn hàng Bạn tạo ONLINE lần thứ 6 và 10% cho đơn hàng Bạn tạo ONLINE lần thứ 12.</p>
                        <p class="product-detail-note__text"><span class="tag-circel">3</span>Miễn phí giao khu vực nội thành (</p>
                        <p class="product-detail-note__text"><span class="tag-circel">4</span>Giao gấp trong vòng 2 giờ</p>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <section class="product-list">
        <div class="container">
            <% if (rptReletionShips.Items.Count > 0)
                { %>
            <h2>Sản phẩm liên quan</h2>
            <%} %>
            <div class="row">
                <asp:Repeater ID="rptReletionShips" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-2-5">
                            <div class="content-wrapper-card-product">
                                <div class="content-wrapper-card-product-card-product-top">
                                    <a href='ProductDetail.aspx?product-id=<%# Eval("id") %>&ci=<%# Eval("category_id") %>'>
                                        <img src='<%# Eval("Thumbnail") %>' />
                                    </a>
                                </div>
                                <div class="content-wrapper-card-product-card-product-bottom">
                                    <a href='ProductDetail.aspx?product-id=<%# Eval("id") %>&ci=<%# Eval("category_id") %>' class="content-wrapper-card-product-card-product-bottom__link"><%# Eval("Name") %></a>
                                    <div class="content-wrapper-card-product-card-product-price">
                                        <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                            <%# Eval("Old_Price","{0:#,##0} đ") %>
                                        </p>
                                        <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                            <%# Eval("Current_Price","{0:#,##0} đ") %>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
    <script>
        $(document).ready(function () {
        <% if (Session["CURRENT_USER"] != null)
        { %>
            $("#btnAddProduct").click(function () {
                $(this).removeClass("btn-control--solid btn-control--orange");
                $(this).addClass("btn-control--fill btn-control--text-white btn-control--fill-green");
                $(this).html("Đã thêm vào giỏ hàng");
                const userId = $(this).attr("data-userId");
                const productId = $(this).attr("data-productId");
                const currentPrice = $(this).attr("data-currentPrice");
                console.log($("#btnAddProduct").attr("data-isClick") !== "true");
                if ($(this).attr("data-isClick") !== "true") {
                    $.ajax({
                        url: `AddProductToCard.aspx?ui=${userId}&pri=${productId}&crp=${currentPrice}`,
                        success: function (data) {
                            console.log("Thành công")
                            $("#btnAddProduct").attr("data-isClick", "true");
                            $("#btnAddProduct").attr("href", "Cart.aspx");
                            $("#btnCart").val(`Giỏ hàng (${data})`);
                        }
                    })
                }
            })
        <% }
        else
        { %>
            $("#btnAddProduct").click(function () {
                window.location.href = `Login.aspx?url=${window.location.href}`;
            });
        <% } %>
        });
    </script>

</asp:Content>
