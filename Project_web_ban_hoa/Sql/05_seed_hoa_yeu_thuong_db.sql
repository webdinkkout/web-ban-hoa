USE hoa_yeu_thuong_db
GO

--Thêm dữ liệu mẫu PHÂN QUYỀN
INSERT INTO Roles (Name)
VALUES
(N'Quản trị viên'),
(N'Khách hàng');

-- THÊM DỮ LIỆU MẪU CHO BẢNG NGƯỜI DÙNG
INSERT INTO Users (First_Name, Last_Name, Email, Password, Role_Id)
VALUES
(N'Quản trị', 'viên', 'admin@gmail.com', '123456', 1),
(N'Lê Trần Tấn', 'Tài', 'taic21a.th1@gmail.com', '123456', 2),
(N'Nguyễn Tấn ', 'Tài', 'tantai@gmail.com', '123456', 2),
(N'Trần Nguyễn Nhật', 'Dũng', 'dung@gmail.com', '123456', 2)

-- THÊM DỮ LIỆU MẪU BẢNG DANH MỤC
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Chủ đề','chu-de',null,null,0,DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Đối tượng','doi-tuong',null,null,0,DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Kiểu dáng','kieu-dang',null,null,0,DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Hoa tươi','hoa-tuoi',null,null,0,DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Màu sắc','mau-sac',null,null,0,DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Bộ sưu tập','bo-suu-tap',null,null,0,DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Quà tặng kèm','qua-tang-kem',null,null,0,DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Hoa cưới','hoa-cuoi',null,null,0,DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Ý nghĩa hoa','y-nghia-hoa',null,null,0,DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Hoa Sinh Nhật', 'hoa-sinh-nhat', N'https://hoayeuthuong.com/images/icon-hoa-sinh-nhat.png',1,1, DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Hoa Tình Yêu', 'hoa-tinh-yeu', N'https://hoayeuthuong.com/images/icon-hoa-tinh-yeu.png',1,1, DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Hoa Mới', 'hoa-moi', N'https://hoayeuthuong.com/images/icon-mau-hoa-moi.png',1,1, DEFAULT,DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Cây Văn Phòng', 'cay-van-phong', N'https://hoayeuthuong.com/images/icon-cay-vp.png',1,1, DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
( N'Hoa Chúc Mừng', 'hoa-chuc-mung', N'https://hoayeuthuong.com/images/icon-hoa-chuc-mung.png',1,1, DEFAULT, DEFAULT)
GO
INSERT INTO dbo.Categories (Name,Seo_Name,Thumbnail,Parent_Id,Level,Created_At,Updated_At)
VALUES
(N'Lãng hoa chia buồn', 'lang-hoa-chia-buon', N'https://hoayeuthuong.com/images/icon-hoa-tang-le.png',1,1, DEFAULT, DEFAULT)
GO

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
    10        -- Category_Id - int
)
GO

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
    10       -- Category_Id - int
)
GO

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
    10       -- Category_Id - int
    )
GO

-- THÊM DỮ LIỆU PAYMENT
INSERT INTO Payment_Methods 
VALUES
( N'Chuyển khoản' ),
( N'Cod' )
GO

--THÊM DỮ LIỆU BẢNG ĐƠN ĐẶT HÀNG

--THÊM DỮ LIỆU VÀ BẢNG CHI TIẾT ĐƠN HÀNG
