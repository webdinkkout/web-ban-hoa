USE [master]
GO
/****** Object:  Database [hoa_yeu_thuong_db]    Script Date: 15/04/2023 2:54:26 CH ******/
CREATE DATABASE [hoa_yeu_thuong_db]
GO

ALTER DATABASE [hoa_yeu_thuong_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hoa_yeu_thuong_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET RECOVERY FULL 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET  MULTI_USER 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'hoa_yeu_thuong_db', N'ON'
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [hoa_yeu_thuong_db]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](12, 2) NOT NULL,
	[ToTal_Price] [decimal](12, 2) NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Seo_Name] [varchar](100) NOT NULL,
	[Thumbnail] [nvarchar](255) NULL,
	[Parent_Id] [int] NULL,
	[Level] [int] NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VAT] [decimal](12, 2) NULL,
	[User_Id] [int] NOT NULL,
	[Status] [bit] NULL,
	[Total_Price] [decimal](12, 2) NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDeTails]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDeTails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Cart_Id] [int] NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Seo_Name] [varchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[View_Count] [int] NOT NULL,
	[Old_Price] [decimal](12, 2) NOT NULL,
	[Current_Price] [decimal](12, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Sold] [int] NOT NULL,
	[Thumbnail] [nvarchar](255) NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
	[Category_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SLIDE]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLIDE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Thumbnail] [nvarchar](255) NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](50) NOT NULL,
	[Last_Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Role_Id] [int] NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (1, N'Ý nghĩa hoa', N'1-y-nghia-hoa', NULL, NULL, 0, CAST(N'2023-04-15T12:01:12.9133333' AS DateTime2), CAST(N'2023-04-15T12:01:12.9133333' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (2, N'Hoa cưới', N'2-hoa-cuoi', NULL, NULL, 0, CAST(N'2023-04-15T12:01:12.9433333' AS DateTime2), CAST(N'2023-04-15T12:01:12.9433333' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (3, N'Quà tặng kèm', N'3-qua-tang-kem', NULL, NULL, 0, CAST(N'2023-04-15T12:01:12.9533333' AS DateTime2), CAST(N'2023-04-15T12:01:12.9533333' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (4, N'Bộ sưu tập', N'4-bo-suu-tap', NULL, NULL, 0, CAST(N'2023-04-15T12:01:12.9600000' AS DateTime2), CAST(N'2023-04-15T12:01:12.9600000' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (5, N'Màu sắc', N'5-mau-sac', NULL, NULL, 0, CAST(N'2023-04-15T12:01:12.9633333' AS DateTime2), CAST(N'2023-04-15T12:01:12.9633333' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (6, N'Hoa tươi', N'6-hoa-tuoi', NULL, NULL, 0, CAST(N'2023-04-15T12:01:12.9733333' AS DateTime2), CAST(N'2023-04-15T12:01:12.9733333' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (7, N'Kiểu dáng', N'7-kieu-dang', NULL, NULL, 0, CAST(N'2023-04-15T12:01:12.9800000' AS DateTime2), CAST(N'2023-04-15T12:01:12.9800000' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (8, N'Đối tượng', N'8-doi-tuong', NULL, NULL, 0, CAST(N'2023-04-15T12:01:12.9900000' AS DateTime2), CAST(N'2023-04-15T12:01:12.9900000' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (9, N'Chủ đề', N'9-chu-de', NULL, NULL, 0, CAST(N'2023-04-15T12:01:13.0066667' AS DateTime2), CAST(N'2023-04-15T12:01:13.0066667' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (10, N'Hoa Sinh Nhật', N'10-hoa-sinh-nhat', N'https://hoayeuthuong.com/images/icon-hoa-sinh-nhat.png', 9, 1, CAST(N'2023-04-15T12:01:13.0166667' AS DateTime2), CAST(N'2023-04-15T12:01:13.0166667' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (11, N'Hoa Tình Yêu', N'11-hoa-tinh-yeu', N'https://hoayeuthuong.com/images/icon-hoa-tinh-yeu.png', 9, 1, CAST(N'2023-04-15T12:01:13.0200000' AS DateTime2), CAST(N'2023-04-15T12:01:13.0200000' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (12, N'Hoa Mới', N'12-hoa-moi', N'https://hoayeuthuong.com/images/icon-mau-hoa-moi.png', 9, 1, CAST(N'2023-04-15T12:01:13.0266667' AS DateTime2), CAST(N'2023-04-15T12:01:13.0266667' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (13, N'Cây Văn Phòng', N'13-cay-van-phong', N'https://hoayeuthuong.com/images/icon-cay-vp.png', 9, 1, CAST(N'2023-04-15T12:01:13.0333333' AS DateTime2), CAST(N'2023-04-15T12:01:13.0333333' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (14, N'Hoa Chúc Mừng', N'14-hoa-chuc-mung', N'https://hoayeuthuong.com/images/icon-hoa-chuc-mung.png', 9, 1, CAST(N'2023-04-15T12:01:13.0366667' AS DateTime2), CAST(N'2023-04-15T12:01:13.0366667' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (15, N'Lãng hoa chia buồn', N'15-lang-hoa-chia-buon', N'https://hoayeuthuong.com/images/icon-hoa-tang-le.png', 9, 1, CAST(N'2023-04-15T12:01:13.0433333' AS DateTime2), CAST(N'2023-04-15T12:01:13.0433333' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [Seo_Name], [Thumbnail], [Parent_Id], [Level], [Created_At], [Updated_At]) VALUES (19, N'Hoa khai trương', N'19-hoa-khai-truong', N'https://localhost:44313/Publics/Uploads/Category/1681535674_4048_tuoi-sang-3.png', 9, 1, CAST(N'2023-04-15T12:14:34.1966667' AS DateTime2), CAST(N'2023-04-15T12:14:34.1966667' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Seo_Name], [Description], [View_Count], [Old_Price], [Current_Price], [Quantity], [Sold], [Thumbnail], [Created_At], [Updated_At], [Category_Id]) VALUES (6, N'Tình đầu ngay thơ', N'6-tinh-dau-ngay-tho', N'', 0, CAST(350000.00 AS Decimal(12, 2)), CAST(230000.00 AS Decimal(12, 2)), 1, 0, N'https://localhost:44313/Publics/Uploads/Product/1681535065_13262_tinh-dau-tho-ngay.jpg', CAST(N'2023-04-15T12:04:25.3700000' AS DateTime2), CAST(N'2023-04-15T14:03:57.9466667' AS DateTime2), 10)
INSERT [dbo].[Products] ([Id], [Name], [Seo_Name], [Description], [View_Count], [Old_Price], [Current_Price], [Quantity], [Sold], [Thumbnail], [Created_At], [Updated_At], [Category_Id]) VALUES (7, N'Romance', N'7-romance', N'Romance', 0, CAST(500000.00 AS Decimal(12, 2)), CAST(275000.00 AS Decimal(12, 2)), 1, 0, N'https://localhost:44313/Publics/Uploads/Product/1681535103_12490_romance-3.jpg', CAST(N'2023-04-15T12:05:03.3966667' AS DateTime2), CAST(N'2023-04-15T12:05:03.3966667' AS DateTime2), 10)
INSERT [dbo].[Products] ([Id], [Name], [Seo_Name], [Description], [View_Count], [Old_Price], [Current_Price], [Quantity], [Sold], [Thumbnail], [Created_At], [Updated_At], [Category_Id]) VALUES (8, N'Chuyện yêu', N'8-chuyen-yeu', N'', 0, CAST(150000.00 AS Decimal(12, 2)), CAST(75000.00 AS Decimal(12, 2)), 1, 0, N'https://localhost:44313/Publics/Uploads/Product/1681535173_13376_chuyen-yeu.jpg', CAST(N'2023-04-15T12:06:13.4833333' AS DateTime2), CAST(N'2023-04-15T12:06:13.4833333' AS DateTime2), 10)
INSERT [dbo].[Products] ([Id], [Name], [Seo_Name], [Description], [View_Count], [Old_Price], [Current_Price], [Quantity], [Sold], [Thumbnail], [Created_At], [Updated_At], [Category_Id]) VALUES (9, N'Chuyện của nắng', N'9-chuyen-cua-nang', N'Chuyện của nắng', 0, CAST(2690000.00 AS Decimal(12, 2)), CAST(1000000.00 AS Decimal(12, 2)), 1, 0, N'https://localhost:44313/Publics/Uploads/Product/1681535204_13258_chuyen-cua-nang.jpg', CAST(N'2023-04-15T12:06:44.6433333' AS DateTime2), CAST(N'2023-04-15T14:31:33.3100000' AS DateTime2), 10)
INSERT [dbo].[Products] ([Id], [Name], [Seo_Name], [Description], [View_Count], [Old_Price], [Current_Price], [Quantity], [Sold], [Thumbnail], [Created_At], [Updated_At], [Category_Id]) VALUES (10, N'Người thương', N'10-nguoi-thuong', N'Người thương', 0, CAST(99999999.00 AS Decimal(12, 2)), CAST(15000.00 AS Decimal(12, 2)), 1, 0, N'https://localhost:44313/Publics/Uploads/Product/1681535234_13372_nguoi-thuong.jpg', CAST(N'2023-04-15T12:07:14.1866667' AS DateTime2), CAST(N'2023-04-15T12:07:33.2200000' AS DateTime2), 10)
INSERT [dbo].[Products] ([Id], [Name], [Seo_Name], [Description], [View_Count], [Old_Price], [Current_Price], [Quantity], [Sold], [Thumbnail], [Created_At], [Updated_At], [Category_Id]) VALUES (11, N'Tươi sáng 3', N'11-tuoi-sang-3', N'', 0, CAST(760000.00 AS Decimal(12, 2)), CAST(320000.00 AS Decimal(12, 2)), 15000, 0, N'https://localhost:44313/Publics/Uploads/Product/1681535645_4048_tuoi-sang-3.png', CAST(N'2023-04-15T12:14:05.2400000' AS DateTime2), CAST(N'2023-04-15T14:02:59.1600000' AS DateTime2), 19)
INSERT [dbo].[Products] ([Id], [Name], [Seo_Name], [Description], [View_Count], [Old_Price], [Current_Price], [Quantity], [Sold], [Thumbnail], [Created_At], [Updated_At], [Category_Id]) VALUES (12, N'Kệ chức mừng 07', N'12-ke-chuc-mung-07', N'Kệ chức mừng 07', 0, CAST(123000.00 AS Decimal(12, 2)), CAST(90000.00 AS Decimal(12, 2)), 1, 0, N'https://localhost:44313/Publics/Uploads/Product/1681535710_13155_ke-chuc-mung-07.jpg', CAST(N'2023-04-15T12:15:10.1266667' AS DateTime2), CAST(N'2023-04-15T12:15:10.1266667' AS DateTime2), 19)
INSERT [dbo].[Products] ([Id], [Name], [Seo_Name], [Description], [View_Count], [Old_Price], [Current_Price], [Quantity], [Sold], [Thumbnail], [Created_At], [Updated_At], [Category_Id]) VALUES (13, N'Luxury vese 22', N'13-luxury-vese-22', N'', 1, CAST(500000000.00 AS Decimal(12, 2)), CAST(30000000.00 AS Decimal(12, 2)), 1, 0, N'https://localhost:44313/Publics/Uploads/Product/1681535737_13312_luxury-vase-22.jpg', CAST(N'2023-04-15T12:15:37.1733333' AS DateTime2), CAST(N'2023-04-15T12:15:37.1733333' AS DateTime2), 19)
INSERT [dbo].[Products] ([Id], [Name], [Seo_Name], [Description], [View_Count], [Old_Price], [Current_Price], [Quantity], [Sold], [Thumbnail], [Created_At], [Updated_At], [Category_Id]) VALUES (14, N'Luxury vese 11', N'14-luxury-vese-11', N'', 0, CAST(40000000.00 AS Decimal(12, 2)), CAST(1000000.00 AS Decimal(12, 2)), 1, 0, N'https://localhost:44313/Publics/Uploads/Product/1681535762_11595_luxury-vase-11.jpg', CAST(N'2023-04-15T12:16:02.4300000' AS DateTime2), CAST(N'2023-04-15T12:16:02.4300000' AS DateTime2), 19)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [Created_At], [Updated_At]) VALUES (1, N'Quản trị viên', CAST(N'2023-04-15T12:01:12.9033333' AS DateTime2), CAST(N'2023-04-15T12:01:12.9033333' AS DateTime2))
INSERT [dbo].[Roles] ([Id], [Name], [Created_At], [Updated_At]) VALUES (2, N'Khách hàng', CAST(N'2023-04-15T12:01:12.9033333' AS DateTime2), CAST(N'2023-04-15T12:01:12.9033333' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [First_Name], [Last_Name], [Address], [Email], [Password], [Role_Id], [Avatar], [Created_At], [Updated_At]) VALUES (1, N'Quản trị', N'viên', N'Bình Chánh', N'admin@gmail.com', N'$2a$10$fiwZgjvURHHOSWfTbNUhLeXceYft9LWoLufP59dNHQWN65UbdoKVm', 1, N'https://luv.vn/wp-content/uploads/2021/11/avatar-gai-xinh-41.jpg', CAST(N'2023-04-15T12:01:12.9033333' AS DateTime2), CAST(N'2023-04-15T14:51:18.3766667' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__42C10B6F876191BD]    Script Date: 15/04/2023 2:54:26 CH ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[Seo_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Products__42C10B6F1863D5E1]    Script Date: 15/04/2023 2:54:26 CH ******/
ALTER TABLE [dbo].[Products] ADD UNIQUE NONCLUSTERED 
(
	[Seo_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534F7DF3872]    Script Date: 15/04/2023 2:54:26 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT ((0)) FOR [ToTal_Price]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Total_Price]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[OrdersDeTails] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[OrdersDeTails] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [View_Count]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Old_Price]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Current_Price]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Sold]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[SLIDE] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[SLIDE] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((2)) FOR [Role_Id]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Avatar]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD FOREIGN KEY([Parent_Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[OrdersDeTails]  WITH CHECK ADD FOREIGN KEY([Cart_Id])
REFERENCES [dbo].[Carts] ([Id])
GO
ALTER TABLE [dbo].[OrdersDeTails]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[proc_add_cart]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CART
create PROC [dbo].[proc_add_cart]
	@user_id int,
	@product_id int,
	@quantity int = 1,
	@price decimal(12,2)
as
begin
	IF EXISTS (SELECT * FROM carts WHERE User_Id = @user_id AND Product_Id = @product_id)
	BEGIN
		UPDATE Carts
		SET Quantity = Quantity + @quantity, ToTal_Price = (Quantity + @quantity) * Price
		WHERE User_Id = @user_id and Product_Id = @product_id;
	END
	ELSE
	BEGIN
		INSERT INTO Carts (User_Id,Product_Id,Quantity,Price,ToTal_Price) VALUES (@user_id,@product_id,@quantity,@price,@quantity * @price)
	END
end
GO
/****** Object:  StoredProcedure [dbo].[proc_count_product_by_category_parent_id]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[proc_count_product_by_category_parent_id]
@parent_id int
as
begin
	select count(products.id) as 'Product_count' from Products inner join Categories on Products.Category_Id = Categories.Id where Categories.Parent_Id = @parent_id
end
GO
/****** Object:  StoredProcedure [dbo].[proc_delete_cart]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[proc_delete_cart]
@user_id int
as
begin
	IF EXISTS (SELECT * FROM Carts WHERE User_Id = @user_id)
	BEGIN
		DELETE FROM Carts WHERE User_Id = @user_id
	END
end
GO
/****** Object:  StoredProcedure [dbo].[proc_delete_category]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[proc_delete_category] 
	@id int
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM dbo.Products WHERE Category_Id = @id) AND NOT EXISTS (SELECT * FROM dbo.Products WHERE Category_Id = @id) 
    	DELETE FROM dbo.Categories WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[proc_delete_product]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[proc_delete_product]
	@id int
as
BEGIN
        IF EXISTS (SELECT * FROM dbo.Products WHERE Id = @id)
	        DELETE from dbo.Products where Id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[proc_delete_product_on_cart]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[proc_delete_product_on_cart]
@user_id int,
@product_id int
as
begin
	IF EXISTS (SELECT * FROM Carts WHERE User_Id = @user_id and Product_Id = @product_id)
	BEGIN
		DELETE FROM Carts WHERE User_Id = @user_id and Product_Id = @product_id
	END
end
GO
/****** Object:  StoredProcedure [dbo].[proc_delete_user_admin]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CHỨC NĂNG ADMIN
CREATE PROC [dbo].[proc_delete_user_admin]
@id INT
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Users WHERE Id = @id)
		DELETE dbo.Users WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_all_roles]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ROLES

CREATE PROC [dbo].[proc_get_all_roles]
as
begin
	select * from Roles
end
GO
/****** Object:  StoredProcedure [dbo].[proc_get_all_users]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_get_all_users]
as
begin
	select * from Users
end
GO
/****** Object:  StoredProcedure [dbo].[proc_get_cart_by_id_user]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Có phân trang
CREATE PROC [dbo].[proc_get_cart_by_id_user]
@user_id int,
@page_number int = 1,
@page_size int = 10
AS
BEGIN
	SELECT c.Id, p.Id AS 'Product_Id', p.Category_Id AS 'Product_Category_Id',
	p.Name AS 'Product_Name', p.Thumbnail AS 'Product_Thumbnail',
	c.Price, c.ToTal_Price, c.Quantity
	FROM Carts c
	INNER JOIN Products p ON p.id = c.Product_Id
	WHERE c.User_Id = @user_id
	ORDER BY c.Id
	OFFSET (@page_number - 1) * @page_size ROWS
	FETCH NEXT @page_size ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_categories_by_level]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Có phân trang
Create PROC [dbo].[proc_get_categories_by_level]
@level INT,
@page_number INT = 1,
@page_size INT = 10
AS
BEGIN
	DECLARE @offset INT = (@page_number - 1) * @page_size

		SELECT *
		FROM (
		SELECT ROW_NUMBER() OVER (ORDER BY Created_At DESC) AS row_num, *
		FROM Categories
		WHERE Level = @level
		) AS t
		WHERE t.row_num > @offset AND t.row_num <= (@offset + @page_size)
		ORDER BY t.Created_At DESC
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_category_by_parent_id_and_level]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Có phân trang
CREATE PROC [dbo].[proc_get_category_by_parent_id_and_level]
@parent_id INT,
@level INT = 1,
@page_number INT = 1,
@page_size INT = 10
AS
BEGIN
	DECLARE @offset INT = (@page_number - 1) * @page_size

		SELECT *
		FROM (
		SELECT ROW_NUMBER() OVER (ORDER BY Created_At DESC) AS row_num, *
		FROM Categories
		WHERE Parent_Id = @parent_id AND Level = @level
		) AS t
		WHERE t.row_num > @offset AND t.row_num <= (@offset + @page_size)
		ORDER BY t.Created_At DESC
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_one_category]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_get_one_category] 
	@id int
AS
BEGIN
	SELECT *
	FROM dbo.Categories
	WHERE Id = @id

END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_one_product_by_id]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_get_one_product_by_id]
@id int
as
begin
select *
	from dbo.Products
	where Id= @id
    UPDATE dbo.Products SET View_Count = View_Count + 1 WHERE id= @id
end
GO
/****** Object:  StoredProcedure [dbo].[proc_get_one_product_by_id_admin]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_get_one_product_by_id_admin]
@id INT
AS
BEGIN
    SELECT * FROM dbo.Products WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_one_product_by_seo_name]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_get_one_product_by_seo_name]
	@seo_name VARCHAR(50)
as
begin
	select *
	from dbo.Products
	where Seo_Name = @seo_name
    UPDATE dbo.Products SET View_Count = View_Count + 1 WHERE Seo_Name = @seo_name
end
GO
/****** Object:  StoredProcedure [dbo].[proc_get_one_user_by_id]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[proc_get_one_user_by_id]
@id int
as
begin
	select * from Users where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[proc_get_products_by_array_category_id]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Có phân trang
CREATE PROCEDURE [dbo].[proc_get_products_by_array_category_id]
@category_ids nvarchar(max) = NULL,
@page_number INT = 1,
@page_size INT = 10
AS
BEGIN
    DECLARE @Sql nvarchar(max);
	DECLARE @Offset INT = (@Page_Number - 1) * @Page_Size;

		IF @category_ids = ''
		BEGIN
			SET @Sql = 'SELECT * FROM Products ORDER BY Created_At DESC';
		END
		ELSE
		BEGIN
			SET @Sql = 'SELECT * FROM Products WHERE Category_Id IN (' + @category_ids + ') ORDER BY Created_At DESC';
		END

		SET @Sql += ' OFFSET ' + CAST(@Offset AS NVARCHAR(10)) + ' ROWS FETCH NEXT ' + CAST(@Page_Size AS NVARCHAR(10)) + ' ROWS ONLY';

		EXECUTE sp_executesql @Sql;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_products_with_category_id]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Có phân trang
CREATE PROC [dbo].[proc_get_products_with_category_id]
@category_id int,
@page_number int = 1,
@page_size int = 10
AS
BEGIN
select *
from dbo.Products
where Category_Id = @category_id
order by Created_at desc
OFFSET (@page_number - 1) * @page_size ROWS
FETCH NEXT @page_size ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_reletionship_pruduct]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Có phân Trang
CREATE PROC [dbo].[proc_get_reletionship_pruduct]
@category_id INT,
@id INT,
@page_number INT = 1,
@page_size INT = 10
AS
BEGIN
    SELECT * FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY Updated_at DESC) AS RowNum, *
        FROM Products
        WHERE Category_Id = @category_id AND Id != @id
    ) AS ProductsWithRowNumbers
    WHERE RowNum >= (@page_number - 1) * @page_size + 1 AND RowNum <= @page_number * @page_size
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_role_by_id]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[proc_get_role_by_id]
@id int
as
begin
	select * from Roles where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[proc_get_user]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- NGƯỜI DÙNG
CREATE PROC [dbo].[proc_get_user]
@gmail VARCHAR(255)
AS
BEGIN
	SELECT * FROM Users WHERE Email= @gmail
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_users_by_role_id]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_get_users_by_role_id]
@role_id int
as
begin
	select * from Users where Role_Id = @role_id
end
GO
/****** Object:  StoredProcedure [dbo].[proc_insert_category_level_1]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[proc_insert_category_level_1] 
	@name nvarchar(50),
	@seo_name varchar(50),
	@thumbnail nvarchar(255),
	@parent_id int
AS
BEGIN
	INSERT INTO	dbo.Categories
		(Name,Seo_Name,Thumbnail, Parent_Id,Level)
	values
		(@name, @seo_name, @thumbnail,@parent_id,1)
END
GO
/****** Object:  StoredProcedure [dbo].[proc_insert_product]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_insert_product]
@name NVARCHAR(50),
@seo_name NVARCHAR(50),
@desc NVARCHAR(MAX),
@old_price FLOAT,
@current_price FLOAT,
@quantity INT,
@thumbnail NVARCHAR(255),
@category_id INT
AS
BEGIN
		INSERT INTO dbo.Products
		(
		    Name,
		    Seo_Name,
		    Description,
		    View_Count,
		    Old_Price,
		    Current_Price,
		    Quantity,
		    Thumbnail,
		    Category_Id
		)
		VALUES
		(  @name,     -- Name - nvarchar(100)
		    @seo_name,      -- Seo_Name - varchar(50)
		    @desc,     -- Description - nvarchar(500)
		    DEFAULT, -- View_Count - int
		    @old_price,    -- Old_Price - decimal(12, 2)
		    @current_price,    -- Current_Price - decimal(12, 2)
		    @quantity, -- Quantity - int
		    @thumbnail,     -- Thumbnail - nvarchar(255)
		    @category_id       -- Category_Id - int
		    )
END
GO
/****** Object:  StoredProcedure [dbo].[proc_pagination_category]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROC CATEGORIES

--Có phân trang
CREATE PROCEDURE [dbo].[proc_pagination_category]
@page_number INT,
@page_size INT,
@level INT = 1
AS
BEGIN

    DECLARE @start_row int, @end_row int
    SET @start_row = (@page_number - 1) * @page_size + 1
    SET @end_row = @start_row + @page_size - 1

	SELECT * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY Created_At DESC) as rownum, * FROM  Categories where Level = @level) as rows
    WHERE rownum BETWEEN CAST(@start_row AS nvarchar(10)) AND  CAST(@end_row AS nvarchar(10))
END
GO
/****** Object:  StoredProcedure [dbo].[proc_pagination_product]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROC PRODUCTS

--Có phân trang
CREATE PROCEDURE [dbo].[proc_pagination_product]
@page_number INT,
@page_size INT
AS
BEGIN
    DECLARE @start_row int, @end_row int
    SET @start_row = (@page_number - 1) * @page_size + 1
    SET @end_row = @start_row + @page_size - 1

    SELECT * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY Created_At DESC) as rownum, * FROM Products ) as rows
    WHERE rownum BETWEEN  CAST(@start_row AS nvarchar(10))  AND  CAST(@end_row AS nvarchar(10))
END
GO
/****** Object:  StoredProcedure [dbo].[proc_register]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_register]
@first_name NVARCHAR(50),
@last_name NVARCHAR(50),
@email VARCHAR(255),
@address NVARCHAR(255),
@password VARCHAR(255)
AS
BEGIN
	INSERT INTO dbo.Users
	(
	    First_Name,
	    Last_Name,
		Address,
	    Email,
	    Password,
	    Role_Id,
	    Created_at,
	    updated_at
	)
	VALUES
	(  @first_name,     -- First_Name - nvarchar(50)
	    @last_name,     -- Last_Name - nvarchar(50)
		@address,
	    @email,      -- Email - varchar(100)
	    @password,      -- Password - varchar(255)
		2,       -- Role_Id - int
	    DEFAULT, -- Created_at - datetime2(7)
	    DEFAULT  -- updated_at - datetime2(7)
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[proc_remove_count_product]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[proc_remove_count_product]
@user_id INT,
@product_id INT,
@quantity INT
AS
BEGIN
	IF EXISTS (SELECT * FROM carts WHERE user_id = @user_id AND product_id = @product_id)
    BEGIN
		DECLARE @current_quantity INT
		SET @current_quantity = (SELECT quantity FROM carts WHERE user_id = @user_id AND product_id = @product_id)
		IF @current_quantity > @quantity
		BEGIN
			UPDATE Carts
			SET Quantity = Quantity - @quantity, ToTal_Price = (Quantity - @quantity) * Price
			WHERE user_id = @user_id AND product_id = @product_id;
		END
		ELSE
        BEGIN
            DELETE FROM carts WHERE user_id = @user_id AND product_id = @product_id;
        END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_search]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- CHUNG

--Có phân trang
CREATE PROC [dbo].[proc_search]
@table_name VARCHAR(50),
@result NVARCHAR(255),
@num_sort Int = 999,
@page_number INT = 1,
@page_size INT = 10
AS
BEGIN
	declare @sort varchar(50)
	If (@num_sort = 0)
	begin
		SET @sort = 'ORDER BY current_price DESC' --giá từ cao tới thấp
	end
	else if(@num_sort = 1)
	begin
		SET @sort = 'ORDER BY current_price'
	end	
	else if(@num_sort = 2)
	begin
		SET @sort = 'ORDER BY Name DESC'
	end	
	else if(@num_sort = 3)
	begin
		SET @sort = 'ORDER BY Name'
	end	
	else 
	begin
		set	 @sort = 'ORDER BY Created_At desc'
	end

	DECLARE @sql NVARCHAR(MAX)
	DECLARE @offset INT

		SET @offset = (@page_number - 1) * @page_size
		SET @sql = 'SELECT * FROM ' + QUOTENAME(@table_name) + ' WHERE Name LIKE N''%' + @result + '%'' ' + @sort + ' OFFSET ' + CAST(@offset AS NVARCHAR) + ' ROWS FETCH NEXT ' + CAST(@page_size AS NVARCHAR) + ' ROWS ONLY;'
		EXEC sp_executesql @sql
END 
GO
/****** Object:  StoredProcedure [dbo].[proc_search_categories_by_id]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Có phân trang
CREATE PROC [dbo].[proc_search_categories_by_id]
@result NVARCHAR(255),
@parent_id int = 0,
@level int = 1,
@num_sort Int = 0,
@page_number INT = 1,
@page_size INT = 10
as
begin
declare @sort varchar(50)
	If (@num_sort = 0)
	begin
		SET @sort = 'ORDER BY Updated_At DESC' --giá từ cao tới thấp
	end
	else 
	begin
		SET @sort = 'ORDER BY Updated_At'
	end	

	DECLARE @sql NVARCHAR(MAX)
	DECLARE @offset INT

		SET @offset = (@page_number - 1) * @page_size
		IF(@parent_id = 0)
		BEGIN
			SET @sql = 'SELECT * FROM Categories WHERE Level = '+ CAST(@level as nvarchar) +' AND Name LIKE N''%' + @result + '%'' ' + @sort + ' OFFSET ' + CAST(@offset AS NVARCHAR) + ' ROWS FETCH NEXT ' + CAST(@page_size AS NVARCHAR) + ' ROWS ONLY;'
		END
		ELSE
		BEGIN
			SET @sql = 'SELECT * FROM Categories WHERE Level = '+ CAST(@level as nvarchar) +' AND Parent_id = ' + CAST(@parent_id as nvarchar) + ' AND Name LIKE N''%' + @result + '%'' ' + @sort + ' OFFSET ' + CAST(@offset AS NVARCHAR) + ' ROWS FETCH NEXT ' + CAST(@page_size AS NVARCHAR) + ' ROWS ONLY;'
		END
		EXEC sp_executesql @sql
end
GO
/****** Object:  StoredProcedure [dbo].[proc_search_product_by_min_max_price]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Có phân trang
CREATE PROC [dbo].[proc_search_product_by_min_max_price]
@min int,
@max int,
@category_ids nvarchar(max) = '',
@page_number int = 1,
@page_size int = 10
AS
BEGIN
	DECLARE @Sql nvarchar(max);
    DECLARE @Offset int = (@page_number - 1) * @page_size;

    IF @category_ids = ''
    BEGIN
        SET @Sql = 'SELECT * FROM Products WHERE Current_Price >= ' + CAST(@min as varchar(20)) + ' AND Current_Price <= ' + CAST(@max as varchar(20)) + ' ORDER BY Id OFFSET ' + CAST(@Offset as varchar(20)) + ' ROWS FETCH NEXT ' + CAST(@page_size as varchar(20)) + ' ROWS ONLY;';
    END
    ELSE
    BEGIN
        SET @Sql = 'SELECT * FROM Products WHERE Category_Id IN (' + @category_ids + ') AND Current_Price >= ' + CAST(@min as varchar(20)) + ' AND Current_Price <= ' + CAST(@max as varchar(20)) + ' ORDER BY Id OFFSET ' + CAST(@Offset as varchar(20)) + ' ROWS FETCH NEXT ' + CAST(@page_size as varchar(20)) + ' ROWS ONLY;';
    END

    EXECUTE sp_executesql @Sql;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_search_products_by_category_id]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Có phân trang
CREATE PROC [dbo].[proc_search_products_by_category_id]
@result NVARCHAR(255),
@category_id INT = 0,
@num_sort Int = 999,
@page_number INT = 1,
@page_size INT = 10
AS
BEGIN
	declare @sort varchar(50)
	If (@num_sort = 0)
	begin
		SET @sort = 'ORDER BY current_price DESC' --giá từ cao tới thấp
	end
	else if(@num_sort = 1)
	begin
		SET @sort = 'ORDER BY current_price'
	end	
	else if(@num_sort = 2)
	begin
		SET @sort = 'ORDER BY Name DESC'
	end	
	else if(@num_sort = 3)
	begin
		SET @sort = 'ORDER BY Name'
	end	
	else 
	begin
		set	 @sort = 'ORDER BY Updated_at desc'
	end

	DECLARE @sql NVARCHAR(MAX)
	DECLARE @offset INT
		SET @offset = (@page_number - 1) * @page_size

		IF(@category_id = 0)
		BEGIN
			SET @sql = 'SELECT * FROM Products WHERE Name LIKE N''%' + @result + '%'' ' + @sort + ' OFFSET ' + CAST(@offset AS NVARCHAR) + ' ROWS FETCH NEXT ' + CAST(@page_size AS NVARCHAR) + ' ROWS ONLY;'
		END
		ELSE
		BEGIN
			SET @sql = 'SELECT * FROM Products WHERE Category_Id = '+ CAST(@category_id as nvarchar) +' AND Name LIKE N''%' + @result + '%'' ' + @sort + ' OFFSET ' + CAST(@offset AS NVARCHAR) + ' ROWS FETCH NEXT ' + CAST(@page_size AS NVARCHAR) + ' ROWS ONLY;'
		END
		EXEC sp_executesql @sql
END
GO
/****** Object:  StoredProcedure [dbo].[proc_search_users]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_search_users]
@result Nvarchar(255),
@role_id int
AS
BEGIN
	DECLARE @Sql nvarchar(max);

	IF(@role_id = 0)
	BEGIN
		SET @Sql = 'SELECT * FROM Users WHERE CONCAT(First_Name, '' '', Last_Name) LIKE N''%' + @result + '%'' Order by Updated_At desc'
	END
	ELSE
	BEGIN
		SET @Sql = 'SELECT * FROM Users WHERE Role_Id = '+ CAST(@role_id as nvarchar) +' AND CONCAT(First_Name, '' '', Last_Name) LIKE N''%' + @result + '%'' Order by Updated_At desc'
	END
	EXECUTE sp_executesql @Sql;

END
GO
/****** Object:  StoredProcedure [dbo].[proc_sort_by_category_id]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Có phân trang
CREATE PROC [dbo].[proc_sort_by_category_id]
@table_name VARCHAR(50),
@category_ids varchar(max) = '',
@num_sort Int = 999,
@page_number int = 1,
@page_size int = 10
AS
BEGIN
	declare @sort varchar(50)
	If (@num_sort = 0)
	begin
		SET @sort = 'ORDER BY current_price DESC' --giá từ cao tới thấp
	end
	else if(@num_sort = 1)
	begin
		SET @sort = 'ORDER BY current_price'
	end	
	else if(@num_sort = 2)
	begin
		SET @sort = 'ORDER BY Name DESC'
	end	
	else if(@num_sort = 3)
	begin
		SET @sort = 'ORDER BY Name'
	end	
	else 
	begin
		set	 @sort = 'ORDER BY created_at desc'
	end

	DECLARE @sql NVARCHAR(MAX)
	DECLARE @params NVARCHAR(MAX)
	DECLARE @offset INT
	DECLARE @fetch INT

	SET @offset = (@page_number - 1) * @page_size
	SET @fetch = @page_size

		IF @category_ids = ''
		BEGIN
			SET @Sql = 'SELECT * FROM ' + QUOTENAME(@table_name) + ' ' + @sort + ' OFFSET @offset ROWS FETCH NEXT @fetch ROWS ONLY;'
		END
		ELSE
		BEGIN
			SET @Sql = 'SELECT * FROM ' + QUOTENAME(@table_name) + ' WHERE Category_Id IN (' + @category_ids + ') ' + @sort + ' OFFSET @offset ROWS FETCH NEXT @fetch ROWS ONLY;'
		END

		SET @params = N'@offset INT, @fetch INT';
		EXECUTE sp_executesql @Sql, @params, @offset = @offset, @fetch = @fetch;
END 
GO
/****** Object:  StoredProcedure [dbo].[proc_update_category]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_update_category] 
	@id int,
	@name nvarchar(50) = null,
	@seo_name varchar(50) = null,
	@thumbnail nvarchar(255) = NULL,
	@parent_id int = null
AS
BEGIN
	UPDATE dbo.Categories
		SET
			Name = ISNULL(@name, Name),
			Seo_Name = ISNULL(@seo_name, Seo_Name),
			Thumbnail = ISNULL(@thumbnail, Thumbnail),
			Parent_Id = ISNULL(@parent_id, Parent_Id),
			updated_at = GETDATE()
		WHERE
			Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[proc_update_produt]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_update_produt]
@id INT,
@name NVARCHAR(50) = NULL,
@seo_name NVARCHAR(50) = NULL,
@desc NVARCHAR(MAX) = NULL,
@view_count INT = NULL,
@old_price FLOAT = NULL,
@current_price FLOAT = NULL,
@quantity INT = NULL,
@sold INT = NULL,
@thumbnail NVARCHAR(MAX) = NULL,
@category_id INT = NULL
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Products WHERE Id = @id)
		UPDATE
			dbo.Products
		SET
			Name = ISNULL(@name,Name),
			Seo_Name = ISNULL(@seo_name,Seo_Name),
			Description = ISNULL(@desc, Description),
			View_Count = ISNULL(@view_count, View_Count),
			Old_Price = ISNULL(@old_price,Old_Price),
			Current_Price = ISNULL(@current_price,Current_Price),
			Quantity = ISNULL(@quantity, Quantity),
			Sold = ISNULL(@sold, Sold),
			Thumbnail = ISNULL(@thumbnail,Thumbnail),
			Category_Id = ISNULL(@category_id, Category_Id),
			updated_at = GETDATE()
		WHERE
			Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[proc_update_user]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[proc_update_user]
@id INT,
@first_name NVARCHAR(50) = NULL,
@last_name NVARCHAR(20) = NULL
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Users WHERE Id = @id)
	BEGIN
		UPDATE dbo.Users
		SET
			First_Name = ISNULL(@first_name,
			First_Name), Last_Name=ISNULL(@last_name,Last_Name)
		WHERE Id = @id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_update_user_admin]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[proc_update_user_admin]
@id INT,
@first_name NVARCHAR(50) = NULL,
@last_name NVARCHAR(50) = NULL,
@email VARCHAR(255) = NULL,
@avatar Nvarchar(255) = null,
@address nvarchar(255) = null,
@role_id INT = NULL
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.Users WHERE Id = @id)
		UPDATE dbo.Users 
			SET
				First_Name = ISNULL(@first_name, First_Name),
				Last_Name = ISNULL(@last_name, Last_Name),
				Email = ISNULL(@email, Email),
				Role_Id = ISNULL(@role_id, Role_Id),
				Avatar = ISNULL(@avatar, Avatar),
				Address = ISNULL(@address,Address),
				updated_at = GETDATE()
			WHERE Id = @id
END
GO
/****** Object:  Trigger [dbo].[trig_add_id_in_seo_name_category]    Script Date: 15/04/2023 2:54:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trig_add_id_in_seo_name_category]
ON [dbo].[Categories]
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @id INT
    DECLARE @name NVARCHAR(255)
    DECLARE @seo_name NVARCHAR(255)
    DECLARE @update_flag BIT
    DECLARE @new_seo_name NVARCHAR(255);

    SELECT @id = Id, @name = Name, @seo_name = Seo_Name FROM inserted
    SET @update_flag = 0

    IF UPDATE(Name)
    BEGIN
        SET @update_flag = 1
		SET @new_seo_name = CONCAT(@id, '-', @seo_name)
		UPDATE Categories
		SET Seo_Name = @new_seo_name
		WHERE Id = @id;
		RETURN
    END

    IF @update_flag = 0
    BEGIN
		SET @new_seo_name = CONCAT(@id, '-', @seo_name)
		UPDATE Categories
		SET Seo_Name = @new_seo_name
		WHERE Id = @id;
		RETURN
    END
END
GO
ALTER TABLE [dbo].[Categories] ENABLE TRIGGER [trig_add_id_in_seo_name_category]
GO
/****** Object:  Trigger [dbo].[trig_add_id_in_seo_name_product]    Script Date: 15/04/2023 2:54:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- PRODUCT --
CREATE TRIGGER [dbo].[trig_add_id_in_seo_name_product]
ON [dbo].[Products]
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @id INT
    DECLARE @name NVARCHAR(255)
    DECLARE @seo_name NVARCHAR(255)
    DECLARE @update_flag BIT
    DECLARE @new_seo_name NVARCHAR(255);

    SELECT @id = Id, @name = Name, @seo_name = Seo_Name FROM inserted
    SET @update_flag = 0

    IF UPDATE(Name)
    BEGIN
        SET @update_flag = 1
		SET @new_seo_name = CONCAT(@id, '-', @seo_name)
		UPDATE Products
		SET Seo_Name = @new_seo_name
		WHERE Id = @id;
    END

	IF UPDATE(View_Count)
	BEGIN
        SET @update_flag = 1
		RETURN
	END

    IF @update_flag = 0 
    BEGIN
		SET @new_seo_name = CONCAT(@id, '-', @seo_name)
		UPDATE Products
		SET Seo_Name = @new_seo_name
		WHERE Id = @id;
		RETURN
    END
END
GO
ALTER TABLE [dbo].[Products] ENABLE TRIGGER [trig_add_id_in_seo_name_product]
GO
USE [master]
GO
ALTER DATABASE [hoa_yeu_thuong_db] SET  READ_WRITE 
GO
