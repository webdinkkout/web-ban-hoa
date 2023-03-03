﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="Topic.aspx.cs" Inherits="Project_web_ban_hoa.Topic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Topic.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="sidebar">
                    <a href="#home">CHỦ ĐỀ</a>
                    <a class="active" href="#news">Hoa Sinh Nhật</a>
                    <a href="#contact">Hoa Khai Trương</a>
                    <a href="#about">Hoa Chúc Mừng</a>
                    <a href="#about">Hoa Chia Buồn</a>
                    <a href="#about">Hoa chúc sức khỏe</a>
                    <a href="#about">Hoa Cảm ơn</a>
                    <a href="#about">Hoa Mừng tốt nghiệp</a>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="content">
                    <a href="#">HOA SINH NHẬT</a>
                    <div class="row">
                        <asp:Repeater ID="rptRenderCard" runat="server">
                            <ItemTemplate>
                                <div class="col-lg-3">
                                    <div class="wrapper-card-product">
                                        <div class="card-product-top">
                                            <a href="#">
                                                <img src='<%# Eval("Thumbnail") %>' />
                                            </a>
                                        </div>
                                        <div class="card-product-bottom">
                                            <a href="#"><%# Eval("Name") %> </a>
                                            <div class="card-product-price">
                                                <p class="price-product price-product--old"><%# Eval("Old_Price") %></p>
                                                <p class="price-product price-product--current"><%# Eval("Current_Price") %></p>
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
    </div>
</asp:Content>
