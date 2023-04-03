<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Project_web_ban_hoa.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Cart.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="cart">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="list-product">
                        <div class="list-product__item">
                            <asp:Button Text="x" ID="btnDelete" CssClass="list-product__delete" runat="server" />
                            <div class="list-product__left">
                                <img src="Publics/Images/DefaultImg/no-image.jpg" alt="Alternate Text" />
                            </div>
                            <div class="list-product__right">
                                <a href="#" class="list-product__title">Product 1</a>
                                <h4 class="list-product__price">900.000 đ</h4>
                                <div class="list-product__controls">
                                    <button class="list-product__control list-product__control--min"><i class="fa fa-minus"></i></button>
                                    <input type="text" value="1" class="list-product__control list-product__control--count" />
                                    <button class="list-product__control list-product__control--plus"><i class="fa fa-plus"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="list-product__item">
                            <asp:Button Text="x" ID="Button1" CssClass="list-product__delete" runat="server" />
                            <div class="list-product__left">
                                <img src="Publics/Images/DefaultImg/no-image.jpg" alt="Alternate Text" />
                            </div>
                            <div class="list-product__right">
                                <a href="#" class="list-product__title">Product 1</a>
                                <h4 class="list-product__price">900.000 đ</h4>
                                <div class="list-product__controls">
                                    <button class="list-product__control list-product__control--min"><i class="fa fa-minus"></i></button>
                                    <input type="text" value="1" class="list-product__control list-product__control--count" />
                                    <button class="list-product__control list-product__control--plus"><i class="fa fa-plus"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="cart-total">
                        <div class="cart-total__field">
                            <p>Tạm tính:</p>
                            <span>772.700 đ</span>
                        </div>
                        <div class="cart-total__field">
                            <p>Phụ phí:</p>
                            <span>-</span>
                        </div>
                        <div class="cart-total__field">
                            <p>Giảm giá:</p>
                            <span>-</span>
                        </div>
                        <div class="cart-total__field">
                            <p>Hóa đơn VAT:</p>
                            <span>77.200 đ</span>
                        </div>
                        <div class="cart-total__field cart-total__field--sp-top">
                            <p>Tổng cộng:</p>
                            <span>800.000 đ</span>
                        </div>

                        <asp:Button Text="Đặt Hàng" CssClass="btn btn-solid btn--red" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
