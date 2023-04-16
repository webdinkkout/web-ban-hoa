<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewOrder.ascx.cs" Inherits="Project_web_ban_hoa.Private.Admin.Order.View.ViewOrder" %>
<div class="container mt-5 mb-5">
    <div class="row">
        <asp:Repeater ID="rptCarts" runat="server">
            <ItemTemplate>
                <div class="col-lg-2-5">
                    <div class="card-cart">
                        <div class="card-cart__top">
                            <a href="#">
                                <p class="card-cart__name"><%# Eval("User_Name") %></p>
                                <img src="../../../../Publics/Images/DefaultImg/hoadon.jpg" alt="" class="card-cart__img" />
                            </a>
                        </div>
                        <div class="card-cart__mid">
                            Tổng tiền: <span><%# Eval("Total_price","{0:##,#0 đồng}") %></span>
                        </div>
                        <div class="card-cart__bot">
                            <asp:Button Text="Xem chi tiết" ID="btnDetail" OnClick="btnDetail_Click" runat="server" CssClass="btn btn-solid btn--green btn--min" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
