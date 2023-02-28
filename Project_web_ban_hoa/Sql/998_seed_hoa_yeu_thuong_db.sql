USE hoa_yeu_thuong_db
GO

--Thêm dữ liệu mẫu PHÂN QUYỀN
INSERT INTO Roles (Name, Seo_Name)
VALUES
(N'Quản trị viên', 'quan-tri-vien'),
(N'Nhân viên bán hàng', 'nhan-vien-ban-hang'),
(N'Khách hàng', 'khach-hang');

-- THÊM DỮ LIỆU MẪU CHO BẢNG NGƯỜI DÙNG
INSERT INTO Users (First_Name, Last_Name, Email, Password, Role_Id)
VALUES
('Admin', 'Admin', 'admin@example.com', '123456', 1),
(N'Nhân', N'Viên', 'nhanvien@example.com', '123456', 2),
(N'Khách', N'Hàng 1', 'khachhang1@example.com', '123456', 3),
(N'Khách', N'Hàng 2', 'khachhang2@example.com', '123456', 3);

-- THÊM DỮ LIỆU MẪU BẢNG DANH MỤC
INSERT INTO Categories (Name, Seo_Name, Thumbnail)
VALUES
(N'Hoa hồng', 'hoa-hong', '/images/category/hoa-hong.jpg'),
(N'Hoa cúc', 'hoa-cuc', '/images/category/hoa-cuc.jpg'),
(N'Hoa hướng dương', 'hoa-huong-duong', '/images/category/hoa-huong-duong.jpg');

-- THÊM DỮ LIỆU MẪU BẢNG SẢN PHẨM
INSERT INTO Products (Name, Seo_Name, Description, View_Count, Old_Price, Current_Price, Quantity, Sold, Thumbnail, Category_Id)
VALUES
(N'Hoa hồng đỏ', 'hoa-hong-do', N'Hoa hồng đỏ thật đẹp và thơm', 0, 100000, 80000, 10, 5, '/images/product/hoa-hong-do.jpg', 1),
(N'Hoa hồng trắng', 'hoa-hong-trang', N'Hoa hồng trắng tinh khôi và đẹp', 0, 120000, 90000, 15, 8, '/images/product/hoa-hong-trang.jpg', 1),
(N'Hoa cúc vàng', 'hoa-cuc-vang', N'Hoa cúc vàng tươi sáng và đẹp mắt', 0, 80000, 60000, 20, 10, '/images/product/hoa-cuc-vang.jpg', 2),
(N'Hoa hướng dương', 'hoa-huong-duong', N'Hoa hướng dương đầy năng lượng và mạnh mẽ', 0, 50000, 40000, 30, 15, '/images/product/hoa-huong-duong.jpg', 3);

--THÊM DỮ LIỆU BẢNG ĐƠN HÀNG
INSERT INTO Orders (User_Id)
VALUES
(3),
(3),
(4);

--THÊM DỮ LIỆU VÀ BẢNG CHI TIẾT ĐƠN HÀNG
INSERT INTO Order_Details (Order_Id, Product_Id, Price, Quantity)
VALUES
(1, 1, 80000, 2),
(1, 2, 90000, 1),
(2, 3, 60000, 3),
(3, 4, 40000, 2);