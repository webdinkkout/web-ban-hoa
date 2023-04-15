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

    .label_empty {
        display: block;
        text-align: center;
        min-height: 150px;
        line-height: 150px;
        font-size: 3rem;
        color: #555;
    }
</style>
<div class="container mt-4">
    <div class="row">
        <div class="col-lg-4">
            <div class="user form-gr">
                <asp:Label Text="Chức vụ: " runat="server" CssClass="form-gr__label" />
                <asp:DropDownList CssClass="form-gr__control" ID="ddlRoles" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="user form-gr">
                <asp:Label Text="Tìm kiếm: " runat="server" CssClass="form-gr__label" />
                <asp:TextBox runat="server" placeholder="Nhập tên người dùng" CssClass="form-gr__control" ID="txtSearch" />
                <asp:Button Text="Tìm kiếm" CssClass="btn  btn-solid btn--orange btn--min" runat="server" ID="btnSearch" OnClick="btnSearch_Click" />
            </div>
        </div>
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

    <asp:GridView OnPageIndexChanging="grvUsers_PageIndexChanging" OnRowCancelingEdit="grvUsers_RowCancelingEdit" OnRowUpdating="grvUsers_RowUpdating" OnRowEditing="grvUsers_RowEditing" OnRowDataBound="grvUsers_RowDataBound" OnDataBound="grvUsers_DataBound" OnRowDeleting="grvUsers_RowDeleting" Width="100%" DataKeyNames="id" CssClass="grv grv-border" runat="server" ID="grvUsers" AllowPaging="true" PageSize="10" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="Id" ReadOnly="true" DataField="Id" ItemStyle-Width="30" />
            <asp:ImageField HeaderText="Ảnh đại diện" ReadOnly="true" DataImageUrlField="Avatar" ControlStyle-CssClass="grvImg"></asp:ImageField>
            <asp:BoundField HeaderText="Họ và tên lót" ReadOnly="true" DataField="First_Name" />
            <asp:BoundField HeaderText="Tên" DataField="Last_Name" ReadOnly="true" />
            <asp:TemplateField HeaderText="Chức vụ">
                <ItemTemplate>
                    <asp:Label ID="lbMakh" runat="server" Text='<%# Eval("Role_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlRole" runat="server"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Địa chỉ" DataField="Address" ReadOnly="true" />
            <asp:BoundField HeaderText="Email" DataField="Email" ReadOnly="true" />

            <asp:TemplateField ItemStyle-CssClass="wrapper-control-grv" HeaderText="Chức năng">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" Text="Sửa" CommandName="Edit" CssClass="btn btn-solid btn--green btn--min" runat="server" />
                    <asp:Button ID="DeleteButton" Text="Xóa" CommandName="Delete" CssClass="btn btn-solid btn--red btn--min" runat="server" OnClientClick="return sweetAlertConfirm(this,'Bạn chắc chắn muốn xóa?','Người dùng sẽ bị xóa vĩnh viễn');" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="btnEdit" Text="Lưu" CommandName="Update" CssClass="btn btn-solid btn--green btn--min" runat="server" />
                    <asp:Button ID="DeleteButton" Text="Thoát" CommandName="Cancel" CssClass="btn btn-solid btn--orange btn--min" runat="server" OnClientClick="return sweetAlertConfirm(this,'Bạn có chắc muốn thoát?','Bạn chưa lưu chỉnh sửa');" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>

        <EmptyDataTemplate>
            <asp:Label CssClass="label_empty" Text="Danh sách người dùng rỗng" runat="server" />
        </EmptyDataTemplate>

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

