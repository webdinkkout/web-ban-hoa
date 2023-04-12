<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Project_web_ban_hoa.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Topic.css" rel="stylesheet" />
    <link href="Publics/Css/ProductDetail.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    <div class="container">
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
                    <div class="product-detail-note">
                        <span>LƯU Ý</span>
                        <p class="product-detail-note__text">Sản phẩm bạn đang chọn là sản phẩm được thiết kế đặc biệt!</p>
                        <p class="product-detail-note__text">Hiện nay, Hoayeuthuong.com chỉ thử nghiệm cung cấp cho thị trường </p>
                    </div>
                    <div class="product-detail-control">
                        <div>
                            <asp:Button ID="btnAddCart" Text="Thêm vào giỏ" CssClass="btn-control btn-control--solid btn-control--orange" runat="server" />
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
            <h2>Sản phẩm liên quan</h2>
            <div class="row">
                <div class="col-lg-2-5">
                    <div class="content-wrapper-card-product">
                        <div class="content-wrapper-card-product-card-product-top">
                            <a href='#'>
                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                            </a>
                        </div>
                        <div class="content-wrapper-card-product-card-product-bottom">
                            <a class="content-wrapper-card-product-card-product-bottom__link" href="#">Product 1</a>
                            <div class="content-wrapper-card-product-card-product-price">
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">200.000 đ</p>
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">200.000 đ</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2-5">
                    <div class="content-wrapper-card-product">
                        <div class="content-wrapper-card-product-card-product-top">
                            <a href='#'>
                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                            </a>
                        </div>
                        <div class="content-wrapper-card-product-card-product-bottom">
                            <a class="content-wrapper-card-product-card-product-bottom__link" href="#">Product 1</a>
                            <div class="content-wrapper-card-product-card-product-price">
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">200.000 đ</p>
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">200.000 đ</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2-5">
                    <div class="content-wrapper-card-product">
                        <div class="content-wrapper-card-product-card-product-top">
                            <a href='#'>
                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                            </a>
                        </div>
                        <div class="content-wrapper-card-product-card-product-bottom">
                            <a class="content-wrapper-card-product-card-product-bottom__link" href="#">Product 1</a>
                            <div class="content-wrapper-card-product-card-product-price">
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">200.000 đ</p>
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">200.000 đ</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2-5">
                    <div class="content-wrapper-card-product">
                        <div class="content-wrapper-card-product-card-product-top">
                            <a href='#'>
                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                            </a>
                        </div>
                        <div class="content-wrapper-card-product-card-product-bottom">
                            <a class="content-wrapper-card-product-card-product-bottom__link" href="#">Product 1</a>
                            <div class="content-wrapper-card-product-card-product-price">
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">200.000 đ</p>
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">200.000 đ</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2-5">
                    <div class="content-wrapper-card-product">
                        <div class="content-wrapper-card-product-card-product-top">
                            <a href='#'>
                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                            </a>
                        </div>
                        <div class="content-wrapper-card-product-card-product-bottom">
                            <a class="content-wrapper-card-product-card-product-bottom__link" href="#">Product 1</a>
                            <div class="content-wrapper-card-product-card-product-price">
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">200.000 đ</p>
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">200.000 đ</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
