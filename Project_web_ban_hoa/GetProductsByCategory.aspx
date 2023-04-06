<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetProductsByCategory.aspx.cs" Inherits="Project_web_ban_hoa.GetProductsByCategory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="rptProducts" ClientIDMode="Static" runat="server">
                <ItemTemplate>
                    <div class="col-lg-3">
                        <div class="content-wrapper-card-product">
                            <div class="content-wrapper-card-product-card-product-top">
                                <a href='ProductDetail.aspx?product-id=<%# Eval("id") %>'>
                                    <img src='<%# Eval("Thumbnail") %>' />
                                </a>
                            </div>
                            <div class="content-wrapper-card-product-card-product-bottom">
                                <a href='ProductDetail.aspx?product-id=<%# Eval("id") %>' class="content-wrapper-card-product-card-product-bottom__link">ProductName</a>
                                <div class="content-wrapper-card-product-card-product-price">
                                    <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                        <%# Eval("Old_Price","{0:#,##0} đ") %>
                                    </p>
                                    <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                        <%# Eval("Current_Price","{0:#,##0} đ") %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
