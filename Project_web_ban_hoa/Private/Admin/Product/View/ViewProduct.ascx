<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewProduct.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Product.View.ViewProduct" %>

<div class="wrapper-control d-flex align-items-center justify-content-between">
    <asp:Panel Width="300" GroupingText="Danh mục" CssClass="grouping-text"
        runat="server">
        <asp:DropDownList ID="ddlCategory" EnableViewState="true" AutoPostBack="true" CssClass="grouping-text-dropdown"
            runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
            <asp:ListItem Text="Tất cả" Value="0" />
        </asp:DropDownList>
    </asp:Panel>
    <asp:Panel Width="300" GroupingText="Tìm kiếm" CssClass="grouping-text"
        runat="server">
        <div class="form-gr">
            <asp:TextBox runat="server" placeholder="Nhập tên bạn muốn tìm" CssClass="form-gr__control" ID="txtSearch" />
            <asp:Button Text="Tìm" ID="btnSearch" CssClass="btn btn-solid btn--green btn--min" runat="server" OnClick="btnSearch_Click" />
        </div>
        <script>
            var txtSearch = document.getElementById("<%= txtSearch.ClientID %>");
            var btnSearch = document.getElementById("<%= btnSearch.ClientID %>");

            var timeout = null;
            txtSearch.addEventListener("input", function () {
                clearTimeout(timeout);
                timeout = setTimeout(function () {
                    btnSearch.click();
                }, 700);
            });
        </script>
    </asp:Panel>
</div>


<div class="wrapper-view-category">
    <asp:Label Text="" ID="lbl404" CssClass="wrapper-view-category__info" runat="server" />

    <div class="row">
        <asp:Repeater ID="rptViewProduct" runat="server" OnItemCommand="rptViewProduct_ItemCommand">
            <ItemTemplate>
                <div class="col-lg-4">
                    <div class="wrapper-card-view-category">
                        <div class="wrapper-card-view-category-heading">
                            <a href='Admin.aspx?modul=product&sub-modul=update-product&pi=<%# Eval("Id") %>&ci=<%# Eval("Category_id") %>'>
                                <asp:Image ID="imgThumbnail" ImageUrl='<%# Eval("Thumbnail") %>' runat="server" />
                            </a>
                        </div>
                        <div class="wrapper-card-view-category-content">
                            <div class="wrapper-card-view-category-body">
                                <a href='Admin.aspx?modul=product&sub-modul=update-product&pi=<%# Eval("Id") %>&ci=<%# Eval("Category_id") %>'>
                                    <h3 class="wrapper-card-view-category-body__name"><%# Eval("Name") %></h3>
                                </a>
                            </div>
                            <div class="wrapper-card-view-category-footer">
                                <asp:Button ID="btnUpdate" CssClass="wrapper-card-view-category-footer__btn wrapper-card-view-category-footer__btn--success"
                                    runat="server" Text="Sửa" CommandArgument='<%# string.Format("{0}|{1}",Eval("Id"),Eval("Category_Id")) %>'
                                    CommandName="update" />
                                <asp:Button ID="btnDelete" CssClass="wrapper-card-view-category-footer__btn wrapper-card-view-category-footer__btn--destroy"
                                    runat="server" Text="Xóa" CommandArgument='<%#  Eval("Id") %>' CommandName="delete"
                                    OnClientClick="return sweetAlertConfirm(this,'Bạn chắc chắn muốn xóa?','Sản phẩm này sẽ bị xóa vĩnh viễn');" />
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
