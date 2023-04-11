<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewCategories.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Category.View.ViewCategories" %>

<div class="wrapper-view-category">
    <asp:Panel Width="300" GroupingText="Danh mục gốc" CssClass="grouping-text"
        runat="server">
        <asp:DropDownList CssClass="grouping-text-dropdown" ID="ddlCategories" runat="server"
            AutoPostBack="True"
            OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged">
        </asp:DropDownList>
    </asp:Panel>
    <div class="row">
        <asp:Repeater ID="rptViewCategories" runat="server"
            OnItemCommand="rptViewCategories_ItemCommand">
            <ItemTemplate>
                <div class="col-lg-4">
                    <div class="wrapper-card-view-category">
                        <div class="wrapper-card-view-category-heading">
                            <a href="#">
                                <asp:Image ID="imgThumbnail" ImageUrl='<%# Eval("Thumbnail") == null ? "~/Publics/Images/DefaultImg/null-image.png" : Eval("Thumbnail") %>'
                                    runat="server" />
                            </a>
                        </div>
                        <div class="wrapper-card-view-category-content">
                            <div class="wrapper-card-view-category-body">
                                <a href="#">

                                    <h3 class="wrapper-card-view-category-body__name"><%# Eval("Name") %></h3>
                                </a>
                            </div>
                            <div class="wrapper-card-view-category-footer">
                                <asp:Button ID="btnUpdate" CssClass="wrapper-card-view-category-footer__btn wrapper-card-view-category-footer__btn--success"
                                    runat="server" Text="Sửa" CommandArgument='<%# Eval("Id") %>' CommandName="update" />
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
