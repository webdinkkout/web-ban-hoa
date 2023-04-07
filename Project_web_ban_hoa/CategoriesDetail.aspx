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
                                <asp:Repeater ID="rptCheckedCategory" runat="server">
                                    <ItemTemplate>
                                        <div class='search-inner-side-bar__control-item'>
                                            <input id='<%# Eval("Id","filed-{0}") %>' type="checkbox" value='<%# Convert.ToInt32(Eval("Id")) %>' <%# Convert.ToInt32(Eval("Id")) == Convert.ToInt32(Request.QueryString["ci"]) ? "checked" : "" %> onchange="onCategoryCheckboxChanged(this)" />
                                            <label for='<%# Eval("Id","filed-{0}") %>'><%# Eval("name") %></label>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="search-inner-controls">
                            <a data-ns="999" id="sort-default" href="#" class="search-inner-controls__control search-inner-controls__control--active">Mặc định</a>
                            <a data-ns="0" id="sort-price-desc" href="#" class="search-inner-controls__control">Giá từ cao tới thấp</a>
                            <a data-ns="1" id="sort-price" href="#" class="search-inner-controls__control">Giá từ thấp tới cao</a>
                            <a data-ns="2" id="sort-name-desc" href="#" class="search-inner-controls__control">Tên a - z</a>
                            <a data-ns="3" id="sort-name" href="#" class="search-inner-controls__control">Tên z - a</a>
                        </div>
                        <div class="search-inner-products">
                            <div class="row" id="ajaxProducts">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="Publics/Js/CategoryDetail.js"></script>
</asp:Content>
