<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewUser.ascx.cs" Inherits="Project_web_ban_hoa.Private.Admin.User.View.ViewControl" %>
<style>
    .mt-4 {
        margin-top: 16px;
    }

    .grvImg {
        width: 50px;
        height: 50px;
        object-fit: cover;
        border-radius: 50%;
        margin: 5px 0;
        text-align: center;
    }

    .grv.grv-border {
        border-radius: 10px !important;
        overflow: hidden;
    }

    .row-style {
        height: 60px;
        text-align: center;
    }

    .wrapper-control-grv {
        display: flex;
        gap: 8px;
        align-items: center;
        justify-content: center;
        height: 60px;
    }

    .user.form-gr > .form-gr__label {
        width: unset;
    }
</style>
<div class="container mt-4">
    <div class="row">
        <div class="col-lg-4">
            <div class="user form-gr">
                <asp:Label Text="Chức vụ: " runat="server" CssClass="form-gr__label" />
                <asp:DropDownList CssClass="form-gr__control" ID="ddlRoles" runat="server">
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="user form-gr">
                <asp:Label Text="Tìm kiếm: " runat="server" CssClass="form-gr__label" />
                <asp:TextBox runat="server" placeholder="Nhập tên người dùng" CssClass="form-gr__control" />
                <asp:Button Text="Tìm kiếm" CssClass="btn  btn-solid btn--orange btn--min" runat="server" />
            </div>
        </div>
    </div>


    <asp:GridView Width="100%" CssClass="grv grv-border" runat="server" ID="grvUsers" AllowPaging="true" PageSize="10" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="Id" ItemStyle-Width="30" />
            <asp:ImageField HeaderText="Ảnh đại diện" DataImageUrlField="Avatar" ControlStyle-CssClass="grvImg"></asp:ImageField>
            <asp:BoundField HeaderText="Họ và tên lót" DataField="First_Name" />
            <asp:BoundField HeaderText="Tên" DataField="Last_Name" />
            <asp:BoundField HeaderText="Địa chỉ" DataField="Address" />
            <asp:BoundField HeaderText="Email" DataField="Email" />

            <asp:TemplateField ItemStyle-CssClass="wrapper-control-grv" HeaderText="Chức năng">
                <ItemTemplate>
                    <asp:Button Text="Sửa" CommandName="Edit" CssClass="btn btn-solid btn--green btn--min" runat="server" />
                    <asp:Button Text="Xóa" CommandName="Delete" CssClass="btn btn-solid btn--red btn--min" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle CssClass="row-style" BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</div>
