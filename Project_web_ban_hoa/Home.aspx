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
                        <ul class="home-logo-flower-items">
                            <li class="home-logo-flower-items-item">
                                <a href="#">
                                    <img src="Publics/Images/Home/img-home/logo-1.png" alt="Alternate Text" />
                                    <div class="">
                                        HOA TÌNH YÊU
                                    </div>
                                </a>
                            </li>
                            <li class="home-logo-flower-items-item">
                                <a href="#">
                                    <img src="Publics/Images/Home/img-home/logo-2.png" alt="Alternate Text" />
                                    <div>
                                        HOA SINH NHẬT
                                    </div>
                                </a>
                            </li>
                            <li class="home-logo-flower-items-item">
                                <a href="#">
                                    <img src="Publics/Images/Home/img-home/logo-3.png" alt="Alternate Text" />
                                    <div>
                                        HOA MẪU MỚI
                                    </div>
                                </a>
                            </li>
                            <li class="home-logo-flower-items-item">
                                <a href="#">
                                    <img src="Publics/Images/Home/img-home/logo-4.png" alt="Alternate Text" />
                                    <div>
                                        CÂY VĂN PHÒNG

                                    </div>
                                </a>
                            </li>
                            <li class="home-logo-flower-items-item">
                                <a href="#">
                                    <img src="Publics/Images/Home/img-home/logo-5.png" alt="Alternate Text" />
                                    <div>
                                        HOA CHÚC MỪNG
                                    </div>
                                </a>
                            </li>
                            <li class="home-logo-flower-items-item">
                                <a href="#">
                                    <img src="Publics/Images/Home/img-home/logo-6.png" alt="Alternate Text" />
                                    <div>
                                        LÃNG HOA CHIA BUỒN
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="home-product-flower">
                <h2 class="home-product-flower__title">KHUYẾN MÃI</h2>
                <div class="row">
                    <asp:Repeater runat="server" ID="rptProducts">
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
            </div>
        </div>
    </div>
</asp:Content>
