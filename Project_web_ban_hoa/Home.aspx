<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="Project_web_ban_hoa.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home">
        <div class="home-top">
            <div class="container">
                <div class="row">
                    <div class="home-logo-flower">
                        <h2 class="home-logo-flower__title">MẪU HOA MỚI NĂM 2023</h2>
                        <div class="row">
                            <asp:Repeater runat="server" ID="rptCaterogies">
                                <ItemTemplate>
                                    <div class="col-lg-2 home-logo-flower-item">
                                        <a href="#">
                                            <img src="<%# Eval("Thumbnail") %>" alt="Alternate Text" />
                                            <span class="">
                                                <%# Eval("Name") %>
                                            </span>
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <asp:Repeater runat="server" ID="rptTitles">
                <ItemTemplate>
                    <div class="home-product-flower">
                        <h2 class="home-product-flower__title"><%# Eval("Name") %></h2>
                        <% if (GetAllProdutsbyCategoryId(Convert.ToInt32(rptTitles.)))
                            { %>
                        <div class="row">
                            <asp:Repeater runat="server" ID="rptProducts" DataSource='<%# GetAllProdutsbyCategoryId(Convert.ToInt32(Eval("id"))) %>'>
                                <ItemTemplate>
                                    <div class="col-2-5">
                                        <div class="home-product-flower-card">
                                            <div class="home-product-flower-card-top">
                                                <img src='<%# Eval("Thumbnail") %>' alt="Alternate Text" />
                                            </div>
                                            <div class="home-product-flower-card-bottom">
                                                <a href="#" title='<%# Eval("Name") %>'><%# Eval("Name") %></a>
                                                <div class="home-product-flower-card-bottom-items">
                                                    <p class="home-product-flower-card-bottom-items__price home-product-flower-card-bottom-items__price--old">
                                                        <%# string.Format("{0:##,# đ}", Eval("old_price")) %>
                                                    </p>
                                                    <p class="home-product-flower-card-bottom-items__price home-product-flower-card-bottom-items__price--current">
                                                        <%# string.Format("{0:##,# đ}", Eval("current_price")) %>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <% } %>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
