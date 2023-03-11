﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewCategories.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Category.View.ViewCategories" %>

<div class="wrapper-view-category">

    <div class="row">

        <asp:Repeater ID="rptViewCategories" runat="server"
            OnItemCommand="rptViewCategories_ItemCommand">
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
                                <asp:Button ID="btnUpdate" CssClass="btn btn-success wrapper-card-view-category-footer__btn"
                                    runat="server" Text="Sửa" CommandArgument='<%# Eval("Id") %>' CommandName="update" />
                                <asp:Button ID="btnDelete" CssClass="btn btn-danger wrapper-card-view-category-footer__btn"
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
