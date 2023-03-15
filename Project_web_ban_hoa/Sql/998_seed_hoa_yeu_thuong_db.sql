USE hoa_yeu_thuong_db
GO

--Thêm dữ liệu mẫu PHÂN QUYỀN
INSERT INTO Roles (Name, Seo_Name)
VALUES
(N'Quản trị viên', 'quan-tri-vien'),
(N'Khách hàng', 'khach-hang');

-- THÊM DỮ LIỆU MẪU CHO BẢNG NGƯỜI DÙNG
INSERT INTO Users (First_Name, Last_Name, Email, Password, Role_Id)
VALUES
('Admin', 'Admin', 'admin@gmail.com', '123456', 1)

SELECT   * FROM dbo.Users

-- THÊM DỮ LIỆU MẪU BẢNG DANH MỤC
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Created_At,Updated_At)
VALUES
( N'Hoa Sinh Nhật', 'hoa-sinh-nhat', N'https://hoayeuthuong.com/images/icon-hoa-sinh-nhat.png', DEFAULT, DEFAULT ),
( N'Hoa Tình Yêu', 'hoa-tinh-yeu', N'https://hoayeuthuong.com/images/icon-hoa-tinh-yeu.png', DEFAULT, DEFAULT ),
( N'Hoa Mới', 'hoa-moi', N'https://hoayeuthuong.com/images/icon-mau-hoa-moi.png', DEFAULT, DEFAULT ),
( N'Cây Văn Phòng', 'cay-van-phong', N'https://hoayeuthuong.com/images/icon-cay-vp.png', DEFAULT, DEFAULT ),
( N'Hoa Chúc Mừng', 'hoa-chuc-mung', N'https://hoayeuthuong.com/images/icon-hoa-chuc-mung.png', DEFAULT, DEFAULT ),
( N'Lãng hoa chia buồn', 'lang-hoa-chia-buon', N'https://hoayeuthuong.com/images/icon-hoa-tang-le.png', DEFAULT, DEFAULT )

-- THÊM DỮ LIỆU MẪU BẢNG SẢN PHẨM
INSERT INTO dbo.Products
(
    Name,
    Seo_Name,
    Description,
    View_Count,
    Old_Price,
    Current_Price,
    Quantity,
    Sold,
    Thumbnail,
    Created_At,
    Updated_At,
    Category_Id
)
VALUES
(   N'Người thương',     -- Name - nvarchar(100)
    'nguoi-thuong',      -- Seo_Name - varchar(50)
   NULL,    -- Description - nvarchar(max)
    DEFAULT, -- View_Count - int
    407.407, -- Old_Price - decimal(12, 2)
    35000, -- Current_Price - decimal(12, 2)
    DEFAULT, -- Quantity - int
    DEFAULT, -- Sold - int
    N'https://hoayeuthuong.com/hinh-hoa-tuoi/hoa-tinh-yeu/13372_nguoi-thuong.jpg',    -- Thumbnail - nvarchar(255)
    DEFAULT, -- Created_At - datetime2(7)
    DEFAULT, -- Updated_At - datetime2(7)
    2        -- Category_Id - int
    ),
    (   N'Gửi ngàn lời yêu',     -- Name - nvarchar(100)
    'gui-ngan-loi-yeu',      -- Seo_Name - varchar(50)
    N'Giỏ hoa được thiết kế từ hồng đỏ , cẩm chường đỏ...chứa đựng những thông điệp yêu thương mà người gửi dành cho người nhận.',    -- Description - nvarchar(max)
    DEFAULT, -- View_Count - int
    407.407, -- Old_Price - decimal(12, 2)
    35000, -- Current_Price - decimal(12, 2)
    DEFAULT, -- Quantity - int
    DEFAULT, -- Sold - int
     N'https://hoayeuthuong.com/hinh-hoa-tuoi/hoa-tinh-yeu/13116_gui-ngan-loi-yeu.jpg',    -- Thumbnail - nvarchar(255)
    DEFAULT, -- Created_At - datetime2(7)
    DEFAULT, -- Updated_At - datetime2(7)
    2        -- Category_Id - int
    ),
    
(   N'Gấm hoa',     -- Name - nvarchar(100)
    'gam-hoa',      -- Seo_Name - varchar(50)
    NULL,    -- Description - nvarchar(max)
    DEFAULT, -- View_Count - int
    407.407, -- Old_Price - decimal(12, 2)
    35000, -- Current_Price - decimal(12, 2)
    DEFAULT, -- Quantity - int
    DEFAULT, -- Sold - int
     N'https://hoayeuthuong.com/hinh-hoa-tuoi/hoa-tinh-yeu/13302_gam-hoa.jpg',    -- Thumbnail - nvarchar(255)
    DEFAULT, -- Created_At - datetime2(7)
    DEFAULT, -- Updated_At - datetime2(7)
    2        -- Category_Id - int
    )

--THÊM DỮ LIỆU BẢNG ĐƠN HÀNG

--THÊM DỮ LIỆU VÀ BẢNG CHI TIẾT ĐƠN HÀNG

