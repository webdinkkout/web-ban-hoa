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
                                            <input type="checkbox" value='<%# Convert.ToInt32(Eval("Id")) %>' <%# Convert.ToInt32(Eval("Id")) == Convert.ToInt32(Request.QueryString["ci"]) ? "checked" : "" %> onchange="onCategoryCheckboxChanged(this)" />
                                            <p><%# Eval("name") %></p>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="search-inner-controls">
                            <a href="#" class="search-inner-controls__control search-inner-controls__control--active">Mặc định</a>
                            <a href="#" class="search-inner-controls__control">Giá từ cao tới thấp</a>
                            <a href="#" class="search-inner-controls__control">Giá từ thấp tới cao</a>
                            <a href="#" class="search-inner-controls__control">Tên a - z</a>
                            <a href="#" class="search-inner-controls__control">Tên z - a</a>
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

    <script>
        var selectedCategories = [];

        $(document).ready(function () {
            $("input[type=checkbox]").each(function () {
                if (this.checked) {
                    selectedCategories.push(this.value);
                }
            });

            // Gọi Ajax với các giá trị category được lưu trữ trong mảng selectedCategories
            var url = "/GetProductsByCategory.aspx?categoryIds=" + selectedCategories.join(",");
            console.log(url);
            $.ajax({
                url: url,
                type: "GET",
                success: function (data) {
                    $("#ajaxProducts").html(data);
                },
                error: function () {
                    alert("Lỗi khi tải sản phẩm!");
                }
            });
        });

        function onCategoryCheckboxChanged(checkbox) {
            var categoryId = checkbox.value;
            var isChecked = checkbox.checked;
            if (isChecked) {
                // Thêm giá trị category mới vào mảng selectedCategories
                selectedCategories.push(categoryId);
            } else {
                // Xóa giá trị category khỏi mảng selectedCategories
                var index = selectedCategories.indexOf(categoryId);
                if (index > -1) {
                    selectedCategories.splice(index, 1);
                }
            }

            console.log(selectedCategories);
            // Gọi Ajax với các giá trị category được lưu trữ trong mảng selectedCategories
            var url = "/GetProductsByCategory.aspx?categoryIds=" + selectedCategories.join(",");
            console.log(url);
            $.ajax({
                url: url,
                type: "GET",
                success: function (data) {
                    $("#ajaxProducts").html(data);
                },
                error: function () {
                    alert("Lỗi khi tải sản phẩm!");
                }
            });
        }

    </script>
</asp:Content>
