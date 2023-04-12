﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Project_web_ban_hoa.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Cart.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="cart">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="list-product">
                        <asp:Repeater ID="rptCarts" runat="server" OnItemCommand="rptCarts_ItemCommand">
                            <ItemTemplate>
                                <div class="list-product__item">
                                    <asp:Button Text="x" ID="btnDelete" CssClass="list-product__delete" runat="server" />
                                    <div class="list-product__left">
                                        <img src='<%# Eval("Thumbnail") %>' alt="Alternate Text" />
                                    </div>
                                    <div class="list-product__right">
                                        <a href='ProductDetail.aspx?product-id=<%# Eval("Product_Id") %>&ci=<%# Eval("category_id") %>' class="list-product__title"><%# Eval("Product_Name") %></a>
                                        <h4 class="list-product__price"><%# Eval("Price","{0:#,##0} đ") %></h4>
                                        <div class="list-product__controls">
                                            <asp:Button Text="-" runat="server" CssClass="list-product__control " ID="btnAddCart" CommandName="decreaseQuantity" CommandArgument='<%# Eval("Product_Id") %>' />
                                            <input type="text" value='<%# Eval("Total_Quantity") %>' class="list-product__control list-product__control--count" />
                                            <asp:Button Text="+" runat="server" CssClass="list-product__control " ID="btnRemove" CommandName="increaseQuantity" CommandArgument='<%# Eval("Product_Id") %>' />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
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
