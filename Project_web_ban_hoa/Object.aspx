<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true"
    CodeBehind="Object.aspx.cs" Inherits="Project_web_ban_hoa.Object" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Object.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="obj-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="side-bar-ob">
                        <ul class="side-bar-ob-list">
                            <li class="side-bar-ob-list__item side-bar-ob-list__item--active"><a href="#">Hoa sinh
                                nhật</a></li>
                            <li class="side-bar-ob-list__item"><a href="#">Hoa Tặng đồng nghiệp</a> </li>
                            <li class="side-bar-ob-list__item"><a href="#">Hoa Tặng sếp</a></li>
                            <li class="side-bar-ob-list__item"><a href="#">Hoa Tặng cho năng</a> </li>
                            <li class="side-bar-ob-list__item"><a href="#">Hoa Tặng cho nữ</a> </li>
                            <li class="side-bar-ob-list__item"><a href="#">Hoa Tặng trẻ em</a> </li>
                            <li class="side-bar-ob-list__item"><a href="#">Hoa Tặng mẹ</a> </li>
                            <li class="side-bar-ob-list__item"><a href="#">Hoa Tặng chồng</a></li>
                            <li class="side-bar-ob-list__item"><a href="#">Hoa Tặng Vợ</a> </li>
                            <li class="side-bar-ob-list__item"><a href="#">Hoa Tặng Bạn bè</a> </li>
                            <li class="side-bar-ob-list__item"><a href="#">Hoa Tặng Người yêu</a> </li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-9">
                    <asp:Repeater ID="rptCategory" runat="server">
                        <ItemTemplate>
                            <div class="content-obj">
                                <%# GetProduct(Convert.ToInt32(Eval("Id"))).Rows.Count > 0 ? $"<h2 class='content-obj__title'>{Eval("Name")}</h2>": "" %>
                                <div class="content-obj-product">
                                    <div class="row">
                                        <asp:Repeater ID="rptProductByCategoryId" DataSource='<%# GetProduct(Convert.ToInt32(Eval("Id"))) %>'
                                            runat="server">
                                            <ItemTemplate>
                                                <div class="col-lg-3">
                                                    <div class="content-obj-product-card">
                                                        <div class="content-obj-product-card-top">
                                                            <a href='ObjectDetail.aspx?cid=<%# Eval("Category_Id") %>&sn=<%# Eval("Seo_Name") %>'>
                                                                <img src='<%# Eval("Thumbnail") %>'
                                                                    alt="Alternate Text" />
                                                            </a>
                                                        </div>
                                                        <div class="content-obj-product-card-bot">
                                                            <a href="#" class="content-obj-product-card-bot__name"><%# Eval("Name") %></a>
                                                            <div class="content-obj-product-card-bot-price">
                                                                <p class="content-obj-product-card-bot-price__price content-obj-product-card-bot-price__price--old">
                                                                    <%# string.Format("{0:#,##0 đ}",Convert.ToDouble(Eval("Old_Price"))) %>
                                                                </p>
                                                                <p class="content-obj-product-card-bot-price__price content-obj-product-card-bot-price__price--current">
                                                                    <%# string.Format("{0:#,##0 đ}",Convert.ToDouble(Eval("Current_Price")))  %>
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
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
