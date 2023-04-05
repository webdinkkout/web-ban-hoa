<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="CategoriesDetail.aspx.cs" Inherits="Project_web_ban_hoa.CategoriesDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Topic.css" rel="stylesheet" />
    <link href="Publics/Css/Search.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="categories-detail">
        <div class="container">
            <div class="categories-detail-inner">


                <div class="row">
                    <div class="col-lg-3">
                        <div class="search-inner-side-bar">
                            <asp:Label Text="Chủ đề - Topic" CssClass="search-inner-side-bar__title" runat="server" />
                            <div class="search-inner-side-bar__controls">
                                <div class="search-inner-side-bar__control-item">
                                    <asp:CheckBox CssClass="search-inner-side-bar__control" runat="server" />
                                    <asp:Label Text="Hoa sinh nhật" runat="server" />
                                </div>
                                <div class="search-inner-side-bar__control-item">
                                    <asp:CheckBox CssClass="search-inner-side-bar__control" runat="server" />
                                    <asp:Label Text="Hoa sinh nhật" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <asp:Label Text='436 kết quả tìm kiếm cho "hoa hồng"' CssClass="search-inner__title" runat="server" />
                        <div class="search-inner-controls">
                            <a href="#" class="search-inner-controls__control search-inner-controls__control--active">Mặc định</a>
                            <a href="#" class="search-inner-controls__control">Giá từ cao tới thấp</a>
                            <a href="#" class="search-inner-controls__control">Giá từ thấp tới cao</a>
                            <a href="#" class="search-inner-controls__control">Tên a - z</a>
                            <a href="#" class="search-inner-controls__control">Tên z - a</a>
                        </div>
                        <div class="search-inner-products">
                            <div class="row">
                                <%-- Item --%>
                                <div class="col-lg-3">
                                    <div class="content-wrapper-card-product">
                                        <div class="content-wrapper-card-product-card-product-top">
                                            <a href='ProductDetail.aspx'>
                                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                                            </a>
                                        </div>
                                        <div class="content-wrapper-card-product-card-product-bottom">
                                            <a class="content-wrapper-card-product-card-product-bottom__link">Product 1</a>
                                            <div class="content-wrapper-card-product-card-product-price">
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                                    20.000 đ
                                                </p>
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                                    15.000 đ
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- End Item --%>

                                <%-- Item --%>
                                <div class="col-lg-3">
                                    <div class="content-wrapper-card-product">
                                        <div class="content-wrapper-card-product-card-product-top">
                                            <a href='ProductDetail.aspx'>
                                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                                            </a>
                                        </div>
                                        <div class="content-wrapper-card-product-card-product-bottom">
                                            <a class="content-wrapper-card-product-card-product-bottom__link">Product 1</a>
                                            <div class="content-wrapper-card-product-card-product-price">
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                                    20.000 đ
                                                </p>
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                                    15.000 đ
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- End Item --%>


                                <%-- Item --%>
                                <div class="col-lg-3">
                                    <div class="content-wrapper-card-product">
                                        <div class="content-wrapper-card-product-card-product-top">
                                            <a href='ProductDetail.aspx'>
                                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                                            </a>
                                        </div>
                                        <div class="content-wrapper-card-product-card-product-bottom">
                                            <a class="content-wrapper-card-product-card-product-bottom__link">Product 1</a>
                                            <div class="content-wrapper-card-product-card-product-price">
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                                    20.000 đ
                                                </p>
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                                    15.000 đ
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- End Item --%>


                                <%-- Item --%>
                                <div class="col-lg-3">
                                    <div class="content-wrapper-card-product">
                                        <div class="content-wrapper-card-product-card-product-top">
                                            <a href='ProductDetail.aspx'>
                                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                                            </a>
                                        </div>
                                        <div class="content-wrapper-card-product-card-product-bottom">
                                            <a class="content-wrapper-card-product-card-product-bottom__link">Product 1</a>
                                            <div class="content-wrapper-card-product-card-product-price">
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                                    20.000 đ
                                                </p>
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                                    15.000 đ
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- End Item --%>


                                <%-- Item --%>
                                <div class="col-lg-3">
                                    <div class="content-wrapper-card-product">
                                        <div class="content-wrapper-card-product-card-product-top">
                                            <a href='ProductDetail.aspx'>
                                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                                            </a>
                                        </div>
                                        <div class="content-wrapper-card-product-card-product-bottom">
                                            <a class="content-wrapper-card-product-card-product-bottom__link">Product 1</a>
                                            <div class="content-wrapper-card-product-card-product-price">
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                                    20.000 đ
                                                </p>
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                                    15.000 đ
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- End Item --%>


                                <%-- Item --%>
                                <div class="col-lg-3">
                                    <div class="content-wrapper-card-product">
                                        <div class="content-wrapper-card-product-card-product-top">
                                            <a href='ProductDetail.aspx'>
                                                <img src="Publics/Images/DefaultImg/no-image.jpg" />
                                            </a>
                                        </div>
                                        <div class="content-wrapper-card-product-card-product-bottom">
                                            <a class="content-wrapper-card-product-card-product-bottom__link">Product 1</a>
                                            <div class="content-wrapper-card-product-card-product-price">
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                                    20.000 đ
                                                </p>
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                                    15.000 đ
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- End Item --%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
