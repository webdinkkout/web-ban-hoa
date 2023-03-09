<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotFound.aspx.cs" Inherits="Project_web_ban_hoa._404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error: Not Found</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
        integrity="sha512-6MXa8B6uaO18Hid6blRMetEIoPqHf7Ux1tnyIQdpt9qI5OACx7C+O3IVTr98vwGnlcg0LOLa02i9Y1HpVhlfiw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="Publics/Css/Reset.css" rel="stylesheet" />
    <link href="Publics/Css/NotFound.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="page-404">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="col-sm-10 col-sm-offset-1 text-center">
                                <div class="four-zero-four-bg">
                                    <h1 class="title text-center">404</h1>
                                </div>
                                <div class="content-box-404">
                                    <h3 class="h2">Không tìm thấy trang bạn muốn đến
                                    </h3>
                                    <p>Trang này không tồn tại</p>
                                    <asp:HyperLink NavigateUrl="~/Home.aspx" CssClass="content-box-404__link" Text="Go to home"
                                        runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
