<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Project_web_ban_hoa.Product1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Topic.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="sidebar">
                    <asp:Repeater runat="server" ID="rptCategoriesSideBarHeading">
                        <ItemTemplate>
                            <a class="active" href="#home"><%# Eval("name") %></a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Repeater runat="server" ID="rptCategoriesSideBar">
                        <ItemTemplate>
                            <a href='<%# Eval("Id", "Fillter.aspx?ci={0}") %>'><%# Eval("Name")%></a>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="content">
                    <asp:Repeater runat="server" ID="rptCategories">
                        <ItemTemplate>
                            <%# GetProductsByCategoryId(Convert.ToInt32(Eval("Id"))).Rows.Count > 0 ? $"<h2><a href='#'>{Eval("Name")}</a></h2>" : "" %>
                            <%# GetProductsByCategoryId(Convert.ToInt32(Eval("Id"))).Rows.Count > 0 ? $"<div class='row'>" : "" %>
                            <asp:Repeater ID="rptRenderCard" runat="server" DataSource='<%# GetProductsByCategoryId(Convert.ToInt32(Eval("Id"))) %>'>
                                <ItemTemplate>
                                    <div class="col-lg-3">
                                        <div class="content-wrapper-card-product">
                                            <div class="content-wrapper-card-product-card-product-top">
                                                <a href='ProductDetail.aspx?Seo-name=<%# Eval("Seo_Name") %>'>
                                                    <img src='<%# Eval("Thumbnail") %>' />
                                                </a>
                                            </div>
                                            <div class="content-wrapper-card-product-card-product-bottom">
                                                <a class="content-wrapper-card-product-card-product-bottom__link" href="#"><%# Eval("Name") %> </a>
                                                <div class="content-wrapper-card-product-card-product-price">
                                                    <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old"><%# Eval("Old_Price","{0:##,#0} đ") %></p>
                                                    <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current"><%# Eval("Current_Price","{0:##,#0} đ") %></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <%# GetProductsByCategoryId(Convert.ToInt32(Eval("Id"))).Rows.Count > 0 ? $"</div>" : "" %>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
