<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewProduct.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Product.View.ViewProduct" %>

<div class="wrapper-search-product">
    <div class="wrapper-control-search">
        <asp:DropDownList ID="ddlCategory" EnableViewState="true" AutoPostBack="true" CssClass="wrapper-control-search__dropdown"
            runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
            <asp:ListItem Text="Tất cả" Value="0" />
        </asp:DropDownList>
    </div>
</div>


<div class="wrapper-view-category">
    <asp:Label Text="" ID="lbl404" CssClass="wrapper-view-category__info" runat="server" />

    <div class="row">
        <asp:Repeater ID="rptViewProduct" runat="server" OnItemCommand="rptViewProduct_ItemCommand">
            <ItemTemplate>
                <div class="col-lg-4">
                    <div class="wrapper-card-view-category">
                        <div class="wrapper-card-view-category-heading">
                            <asp:Image ID="imgThumbnail" ImageUrl='<%# Eval("Thumbnail") %>' runat="server" />
                        </div>
                        <div class="wrapper-card-view-category-content">
                            <div class="wrapper-card-view-category-body">
                                <h3 class="wrapper-card-view-category-body__name"><%# Eval("Name") %></h3>
                            </div>
                            <div class="wrapper-card-view-category-footer">
                                <asp:Button ID="btnUpdate" CssClass="wrapper-card-view-category-footer__btn wrapper-card-view-category-footer__btn--success"
                                    runat="server" Text="Sửa" CommandArgument='<%# string.Format("{0}|{1}",Eval("Id"),Eval("Category_Id")) %>'
                                    CommandName="update" />
                                <asp:Button ID="btnDelete" CssClass="wrapper-card-view-category-footer__btn wrapper-card-view-category-footer__btn--destroy"
                                    runat="server" Text="Xóa" CommandArgument='<%#  Eval("Id") %>' CommandName="delete"
                                    OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?');" />
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
