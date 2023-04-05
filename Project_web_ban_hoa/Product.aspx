<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Project_web_ban_hoa.Product1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Topic.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="sidebar">
                    <a class="active" href="#home"><%= GetNameCategory() %></a>
                    <asp:Repeater ID="rptMenuSubCategories" runat="server">
                        <ItemTemplate>
                            <%# GetProductID(Convert.ToInt32(Eval("id"))).Rows.Count > 0 ? $"<a href='#news'>{Eval("Name")}</a>" : "" %>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <div class="col-lg-9">

                <div class="content">
                    <asp:Repeater runat="server" ID="rptCategories">
                        <ItemTemplate>
                            <h2>
                                <%# GetProductID(Convert.ToInt32(Eval("id"))).Rows.Count > 0 ? $"<a href='#news'>{Eval("Name")}</a>" : "" %>
                            </h2>

                            <div class="row">
                                <asp:Repeater ID="rptRenderCard" runat="server" DataSource='<%# GetProductID(Convert.ToInt32(Eval("ID")))%>'>
                                    <ItemTemplate>
                                        <div class="col-lg-3">
                                            <div class="content-wrapper-card-product">
                                                <div class="content-wrapper-card-product-card-product-top">
                                                    <a href='ProductDetail.aspx'>
                                                        <img src='<%# Eval("Thumbnail") %>' />
                                                    </a>
                                                </div>
                                                <div class="content-wrapper-card-product-card-product-bottom">
                                                    <a class="content-wrapper-card-product-card-product-bottom__link"><%# Eval("Name") %></a>
                                                    <div class="content-wrapper-card-product-card-product-price">
                                                        <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                                            <%# string.Format("{0:##,#đ}", Eval("Old_Price")) %>
                                                        </p>
                                                        <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                                            <%# string.Format ("{0:##,#đ}", Eval("Current_Price")) %>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>

    </div>
</asp:Content>
