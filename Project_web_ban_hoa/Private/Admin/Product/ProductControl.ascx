<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductControl.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Product.ProductControl" %>

<div class="container">
    <h2 class="tag">Quản lý sản phẩm</h2>

    <div class="row">
        <div class="col-lg-4">
            <section class="side-bar-ctr">
                <div class="side-bar-ctr__item">
                    <h2 class="side-bar-ctr__heading">Trang chủ</h2>
                    <ul class="side-bar-ctr-list">
                        <li class="side-bar-ctr-list__item" runat="server">
                            <asp:HyperLink ID="hplHome" NavigateUrl="~/Admin.aspx?modul=product"
                                runat="server">Trang chủ</asp:HyperLink></li>
                    </ul>
                </div>
                <div class="side-bar-ctr__item">
                    <h2 class="side-bar-ctr__heading">Các điều khiển</h2>
                    <ul class="side-bar-ctr-list">
                        <li class="side-bar-ctr-list__item" runat="server">
                            <asp:HyperLink ID="hplViewProduct" NavigateUrl="~/Admin.aspx?modul=product&sub-modul=view-products"
                                runat="server">Xem danh sách sản phẩm</asp:HyperLink></li>
                        <li class="side-bar-ctr-list__item" runat="server">
                            <asp:HyperLink ID="hplCreateProduct" NavigateUrl="~/Admin.aspx?modul=product&sub-modul=create-product"
                                runat="server">Thêm sản phẩm</asp:HyperLink></li>
                    </ul>
                </div>
            </section>
        </div>
        <div class="col-lg-8">
            <asp:PlaceHolder ID="plhProductControl" runat="server"></asp:PlaceHolder>
        </div>
    </div>
</div>

