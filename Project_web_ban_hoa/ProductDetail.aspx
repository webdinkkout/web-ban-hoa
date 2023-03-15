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
                        <img src="https://localhost:44313/Publics/Images/ProductDetail/12490_romance.jpg" />
                    </a>
                    <p class="product-deteil-img__text">
                        THÔNG BÁO: Giá hoa ngày 7-8/3/2023 tăng 20% do giá nguyên liệu tăng.
                    </p>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="product-detail">
                    <h2 class="product-detail__title">Khuyến mãi - Baby flower - 13294</h2>
                    <div class="product-detail-price">
                        <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">260.000</p>
                        <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">200.000</p>
                    </div>
                    <i class="product-detail__note">Giá đã bao gồm 10% VAT</i>
                    <div class="product-detail-desc">
                        <p>Sản phẩm bao gồm:</p>
                        <p>-Baby nhuộm hồng nhạt NK: 3</p>
                        <i style="font-size: 16px">-Sản phẩm thực nhận có thể khác với hình đại diện trên website (đặc điểm thủ công và tính chất tự nhiên của hàng nông nghiệp)</i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
