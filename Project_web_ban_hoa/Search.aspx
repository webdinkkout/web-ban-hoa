<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Project_web_ban_hoa.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Topic.css" rel="stylesheet" />
    <link href="Publics/Css/Search.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="search">
        <div class="container">
            <div class="search-inner">
                <asp:Label ID="lblCountResult" CssClass="search-inner__title" runat="server" />
                <div class="search-inner-controls">
                    <a href='<%= string.Format("Search.aspx?key={0}",Session["VALUE_SEARCH"]) %>' class="search-inner-controls__control <%= Request.QueryString["ns"] == null ? "search-inner-controls__control--active" : "" %>">Mặc định</a>
                    <a href='<%= string.Format("Search.aspx?key={0}&ns=0",Session["VALUE_SEARCH"]) %>' class="search-inner-controls__control <%= Request.QueryString["ns"] == "0" ? "search-inner-controls__control--active" : "" %>">Giá từ cao tới thấp</a>
                    <a href='<%= string.Format("Search.aspx?key={0}&ns=1",Session["VALUE_SEARCH"]) %>' class="search-inner-controls__control <%= Request.QueryString["ns"] == "1" ? "search-inner-controls__control--active" : "" %>">Giá từ thấp tới cao</a>
                    <a href='<%= string.Format("Search.aspx?key={0}&ns=2",Session["VALUE_SEARCH"]) %>' class="search-inner-controls__control <%= Request.QueryString["ns"] == "2" ? "search-inner-controls__control--active" : "" %>">Tên a - z</a>
                    <a href='<%= string.Format("Search.aspx?key={0}&ns=3",Session["VALUE_SEARCH"]) %>' class="search-inner-controls__control <%= Request.QueryString["ns"] == "3" ? "search-inner-controls__control--active" : "" %>">Tên z - a</a>
                </div>

                <div class="search-inner-products">
                    <div class="row">

                        <asp:Repeater ID="rptSearchProducts" runat="server">
                            <ItemTemplate>
                                <%-- Item --%>
                                <div class="col-lg-2-5">
                                    <div class="content-wrapper-card-product">
                                        <div class="content-wrapper-card-product-card-product-top">
                                            <a href='ProductDetail.aspx?product-id=<%# Eval("id") %>'>
                                                <img src='<%# Eval("Thumbnail") %>' />
                                            </a>
                                        </div>
                                        <div class="content-wrapper-card-product-card-product-bottom">
                                            <a href='ProductDetail.aspx?product-id=<%# Eval("id") %>' class="content-wrapper-card-product-card-product-bottom__link"><%# Eval("Name") %></a>
                                            <div class="content-wrapper-card-product-card-product-price">
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                                    <%# Eval("Old_Price","{0:##,#0 đ}") %>
                                                </p>
                                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                                    <%# Eval("Current_Price","{0:##,#0 đ}") %>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- End Item --%>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
