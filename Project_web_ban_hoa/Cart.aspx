<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Project_web_ban_hoa.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/Cart.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="cart">
        <div class="container">
            <% if (rptCarts.Items.Count > 0)
                { %>
            <div class="row">
                <div class="col-lg-9">
                    <div class="list-product">
                        <asp:Repeater ID="rptCarts" runat="server" OnItemCommand="rptCarts_ItemCommand">
                            <ItemTemplate>
                                <div class="list-product__item">
                                    <asp:Button Text="x" ID="btnDelete" CssClass="list-product__delete" CommandArgument='<%# Eval("Product_Id") %>' CommandName="deleteProduct" runat="server" />
                                    <div class="list-product__left">
                                        <img src='<%# Eval("Product_Thumbnail") %>' alt="" />
                                    </div>
                                    <div class="list-product__right">
                                        <a href='ProductDetail.aspx?product-id=<%# Eval("Product_Id") %>&ci=<%# Eval("product_category_id") %>' class="list-product__title"><%# Eval("Product_Name") %></a>
                                        <h4 class="list-product__price"><%# Eval("Price","{0:#,##0} đ") %></h4>
                                        <div class="list-product__controls">
                                            <asp:Button Text="-" runat="server" CssClass="list-product__control " ID="btnAddCart" CommandName="decreaseQuantity" CommandArgument='<%# Eval("Product_Id") %>' />
                                            <asp:TextBox runat="server" CssClass="list-product__control list-product__control--count" ID="txtQuantity" ReadOnly="true" Text='<%# Eval("Quantity") %>' />
                                            <asp:Button Text="+" runat="server" CssClass="list-product__control " ID="btnRemove" CommandName="increaseQuantity" CommandArgument='<%# Eval("Product_Id") %>' />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="cart-total">
                        <div class="cart-total__field">
                            <p>Tạm tính:</p>
                            <span><%= string.Format("{0:#,##0} đ",GetToTalPrice()) %> </span>
                        </div>
                        <div class="cart-total__field">
                            <p>Phụ phí:</p>
                            <span>-</span>
                        </div>
                        <div class="cart-total__field">
                            <p>Giảm giá:</p>
                            <span>-</span>
                        </div>
                        <div class="cart-total__field">
                            <p>Hóa đơn VAT:</p>
                            <span><%= string.Format("{0:#,##0} đ",GetVAT()) %> </span>
                        </div>
                        <div class="cart-total__field cart-total__field--sp-top">
                            <p>Tổng cộng:</p>
                            <span><%= string.Format("{0:#,##0} đ",GetUtilPrice()) %> </span>
                        </div>

                        <asp:Button Text="Đặt Hàng" CssClass="btn btn-solid btn--red" ID="btnBuy" OnClick="btnBuy_Click" runat="server" />
                    </div>
                </div>
            </div>
            <% }
                else
                { %>
            <div style="min-height: 200px; width: 100%; display: flex; justify-content: center; align-items: center; text-align: center;">
                <h1>
                    <p style="color: #333" class="m-4">Bạn hiện không có sản phẩm nào trong giỏ cả</p>
                    <a href="Home.aspx" style="color: #ff6a00"><i class="fa fa-cart-arrow-down"></i>Mua sắm ngay nào</a>
                </h1>
            </div>
            <%} %>
        </div>
    </section>
    <script>

</script>
</asp:Content>

