<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Main.Master" AutoEventWireup="true"
    CodeBehind="ObjectDetail.aspx.cs" Inherits="Project_web_ban_hoa.ObjectDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Publics/Css/ObjectDetail.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="obj-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <img class="img-item" src='<%= productModel.Thumbnail %>' alt="Alternate Text" />
                </div>
                <div class="col-lg-9">
                    <div class="detail">
                        <div class="detail-heading">
                            <h2 class="detail-heading__title">Khuyễn mãi - <%= productModel.Name %> - 13212
                            </h2>
                            <div class="detail-heading-price">
                                <p class="detail-heading-price__price detail-heading-price__price--old">
                                    <%= string.Format("{0:##,#0đ}", productModel.OldPrice) %>
                                </p>
                                <p class="detail-heading-price__price detail-heading-price__price--current">
                                    <%= string.Format("{0:##,#0đ}", productModel.CurrentPrice) %>
                                </p>
                            </div>
                            <span class="detail-heading__note">Giá đã bao gồm 10% VAT</span>
                        </div>

                        <div class="detail-body">
                            <p class="detail-body__desc">
                                <%= productModel.Desc %>
                            </p>
                            <p class="detail-body__sub-desc">
                                Hoa giao nhanh 60 phút Hồ Chí Minh
                            </p>

                            <div class="detail-body-panel">
                                <span class="detail-body-panel__note">Lưu ý</span>
                                <div class="detail-body-panel-content">
                                    <p class="detail-body-panel-content__text">
                                        Sản phẩm bạn đang chọn là sản phẩm được thiết
                                    kế đặc biệt!
                                    </p>
                                    <p class="detail-body-panel-content__text">
                                        Hiện nay, Hoayeuthuong.com chỉ thử nghiệm
                                    cung cấp cho thị trường Tp. Hồ Chí Minh và Hà Nội
                                    </p>
                                </div>
                            </div>
                            <div class="detail-body-controls">
                                <div class="detail-body-controls-feature">
                                    <button class="btn btn-regular btn--orange">Thêm vào giỏ hàng</button>
                                    <button class="btn btn-solid btn--red">Mua ngay</button>
                                </div>
                                <button class="btn btn-regular btn--green detail-body-controls__btn">
                                    Gọi ngay: 1800
                                    6353</button>
                            </div>
                            <div class="detail-body-panel">
                                <span class="detail-body-panel__note">Ưu Đãi đặc biệt</span>
                                <div class="detail-body-panel-content">
                                    <p class="detail-body-panel-content__text">
                                        Tặng Banner Hoặc Thiệp (Trị Giá 20.000đ - 50.000đ) Miễn Phí
                                    <span class="detail-body-panel-content__text--tag">1</span>
                                    </p>
                                    <p class="detail-body-panel-content__text">
                                        Giảm Tiếp 3% Cho Đơn Hàng Bạn Tạo ONLINE Lần Thứ 2, 5% Cho Đơn Hàng Bạn Tạo ONLINE
                                        Lần Thứ 6 Và 10% Cho Đơn Hàng Bạn Tạo ONLINE Lần Thứ 12.
                                    <span class="detail-body-panel-content__text--tag">2</span>
                                    </p>
                                    <p class="detail-body-panel-content__text">
                                        Giao Miễn Phí Trong Nội Thành 63/63 Tỉnh
                                    <span class="detail-body-panel-content__text--tag">1</span>
                                    </p>
                                    <p class="detail-body-panel-content__text">
                                        Giao Gấp Trong Vòng 2 Giờ
                                    <span class="detail-body-panel-content__text--tag">1</span>
                                    </p>
                                    <p class="detail-body-panel-content__text">
                                        Cam Kết 100% Hoàn Lại Tiền Nếu Bạn Không Hài Lòng
                                    <span class="detail-body-panel-content__text--tag">1</span>
                                    </p>
                                    <p class="detail-body-panel-content__text">
                                        Cam Kết Hoa Tươi Trên 3 Ngày
                                    <span class="detail-body-panel-content__text--tag">1</span>
                                    </p>
                                </div>
                            </div>

                            <div class="detail-body-group-fl">
                                <h2 class="detail-body-group-fl__heading">Các nhóm hoa</h2>
                                <div class="detail-body-group-fl-tags">
                                    <a href="#" class="detail-body-group-fl-tag">Hoa khai trương</a>
                                    <a href="#" class="detail-body-group-fl-tag">Hoa khai trương</a>
                                    <a href="#" class="detail-body-group-fl-tag">Hoa khai trương</a>
                                    <a href="#" class="detail-body-group-fl-tag">Hoa khai trương</a>
                                    <a href="#" class="detail-body-group-fl-tag">Hoa khai trương</a>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
