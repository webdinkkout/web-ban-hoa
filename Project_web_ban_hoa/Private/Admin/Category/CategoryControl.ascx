<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryControl.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Category.CategoryControl" %>

<div class="container">
    <div class="row">
        <div class="col-lg-4">
            <section class="side-bar-ctr">
                <div class="side-bar-ctr__item">
                    <h2 class="side-bar-ctr__heading">Trang chủ</h2>
                    <ul class="side-bar-ctr-list">
                        <li class="side-bar-ctr-list__item" runat="server">
                            <asp:HyperLink ID="hplHomeCategory" NavigateUrl="~/Admin.aspx?modul=category"
                                runat="server">Trang chủ</asp:HyperLink>
                        </li>
                        <li class="side-bar-ctr-list__item" runat="server">
                            <asp:HyperLink ID="hplViewCount" NavigateUrl="~/Admin.aspx?modul=category&sub-modul=view-count-category"
                                runat="server">Xem lượt theo dỏi sản phẩm</asp:HyperLink>
                        </li>
                    </ul>
                </div>

                <div class="side-bar-ctr__item">
                    <h2 class="side-bar-ctr__heading">Các điều khiển</h2>
                    <ul class="side-bar-ctr-list">
                        <li class="side-bar-ctr-list__item" runat="server">
                            <asp:HyperLink ID="hplViewCategories" NavigateUrl="~/Admin.aspx?modul=category&sub-modul=view-categories"
                                runat="server">Xem danh sách danh mục</asp:HyperLink></li>
                        <li class="side-bar-ctr-list__item" runat="server">
                            <asp:HyperLink ID="hplCreateCategory" NavigateUrl="~/Admin.aspx?modul=category&sub-modul=create-category"
                                runat="server">Thêm danh mục</asp:HyperLink></li>


                    </ul>
                </div>
            </section>
        </div>
        <div class="col-lg-8">
            <asp:PlaceHolder ID="plhCategoryControl" runat="server"></asp:PlaceHolder>
        </div>
    </div>
</div>
