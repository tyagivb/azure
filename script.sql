USE [master]
GO
/****** Object:  Database [AdminERP]    Script Date: 1/9/2019 12:13:24 AM ******/
CREATE DATABASE [AdminERP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdminERP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AdminERP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdminERP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AdminERP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AdminERP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdminERP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdminERP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdminERP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdminERP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdminERP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdminERP] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdminERP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdminERP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdminERP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdminERP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdminERP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdminERP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdminERP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdminERP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdminERP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdminERP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdminERP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdminERP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdminERP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdminERP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdminERP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdminERP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdminERP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdminERP] SET RECOVERY FULL 
GO
ALTER DATABASE [AdminERP] SET  MULTI_USER 
GO
ALTER DATABASE [AdminERP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdminERP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdminERP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdminERP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdminERP] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdminERP', N'ON'
GO
ALTER DATABASE [AdminERP] SET QUERY_STORE = OFF
GO
USE [AdminERP]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 1/9/2019 12:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetTagID] [varchar](100) NOT NULL,
	[AssetName] [varchar](300) NOT NULL,
	[AssetCategoryID] [int] NOT NULL,
	[AssetDescription] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Asset] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetCategory]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AssetCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetDetail]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetID] [bigint] NOT NULL,
	[PurchaseDate] [date] NULL,
	[VendorID] [int] NULL,
	[Cost] [decimal](18, 2) NULL,
	[WarrantyExpireDate] [date] NULL,
	[WarrantyDocumentId] [nvarchar](50) NULL,
	[AssetImageId] [nvarchar](100) NULL,
	[BrandName] [nvarchar](100) NULL,
	[ModelNumber] [nvarchar](100) NULL,
	[SerialNumber] [nvarchar](100) NULL,
 CONSTRAINT [PK_AssetDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetGatePass]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetGatePass](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GatePassNo] [varchar](100) NOT NULL,
	[GatePassDate] [datetime] NOT NULL,
	[IsReturnable] [bit] NULL,
	[GatePassStatusID] [int] NOT NULL,
	[ReceivedBy] [int] NULL,
	[Remarks] [varchar](800) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AssetGatePass] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetGatePassDetail]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetGatePassDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetGatePassID] [bigint] NULL,
	[AssetID] [bigint] NULL,
	[SendQty] [decimal](18, 3) NULL,
	[SendQtyUnitID] [int] NULL,
	[ReceivedQty] [decimal](18, 3) NULL,
	[ReceivedQtyUnitID] [int] NULL,
	[IsReturnable] [bit] NULL,
 CONSTRAINT [PK_AssetGatePassDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetGatePassSenderDetail]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetGatePassSenderDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetGatePassID] [bigint] NOT NULL,
	[Name] [varchar](100) NULL,
	[CompanyName] [varchar](100) NULL,
	[Address] [varchar](500) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK_AssetGatePassSenderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
	[Address1] [varchar](500) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Country] [varchar](50) NULL,
	[WebSiteURL] [varchar](100) NULL,
	[CompanyLogoId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Function]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Function](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FunctionCode] [varchar](500) NOT NULL,
	[FunctionName] [varchar](500) NOT NULL,
	[FunctionDescription] [varchar](500) NULL,
 CONSTRAINT [PK_Function] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GatePassStatus]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GatePassStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GatePassStatus] [varchar](50) NULL,
 CONSTRAINT [PK_GatePassStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[MenuTitle] [varchar](100) NULL,
	[ParentMenuId] [smallint] NULL,
	[MenuLink] [nvarchar](255) NULL,
	[TemplateUrl] [nvarchar](150) NULL,
	[Controller] [nvarchar](150) NULL,
	[ControllerAs] [nvarchar](50) NULL,
	[IsDisabled] [bit] NOT NULL,
	[IsStateRequired] [bit] NOT NULL,
	[DisplayOrder] [smallint] NOT NULL,
	[Tag] [nvarchar](20) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuantityUnit]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuantityUnit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Unit] [varchar](50) NOT NULL,
 CONSTRAINT [PK_QuantityUnit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](250) NOT NULL,
	[RoleDescription] [nvarchar](250) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFunction]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFunction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[FunctionID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_RoleFunction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMenu]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMenu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[MenuID] [smallint] NOT NULL,
 CONSTRAINT [PK_RoleMenu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityQuestion]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityQuestion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](300) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_SecurityQuestion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/9/2019 12:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](15) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NULL,
	[EmpId] [varchar](100) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[DeptId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCredential]    Script Date: 1/9/2019 12:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCredential](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[PasswordKey] [varchar](500) NOT NULL,
	[Attempted] [int] NULL,
 CONSTRAINT [PK_UserCredential] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 1/9/2019 12:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSecurityAnswer]    Script Date: 1/9/2019 12:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSecurityAnswer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SecurityQuestionID] [int] NOT NULL,
	[Answer] [varchar](100) NOT NULL,
 CONSTRAINT [PK_UserSecurityAnswer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 1/9/2019 12:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](200) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asset] ON 

INSERT [dbo].[Asset] ([ID], [AssetTagID], [AssetName], [AssetCategoryID], [AssetDescription], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Tag123', N'Laptop', 4, N'Laptop Computer', 1, 1, CAST(N'2018-12-25T20:50:02.100' AS DateTime), 1, CAST(N'2018-12-25T20:50:02.100' AS DateTime))
INSERT [dbo].[Asset] ([ID], [AssetTagID], [AssetName], [AssetCategoryID], [AssetDescription], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'A101', N'Dell Inspiron M001', 4, N'Dell Inspiron laptop', 1, 1, CAST(N'2018-12-29T21:13:20.847' AS DateTime), 1, CAST(N'2018-12-29T21:13:20.857' AS DateTime))
INSERT [dbo].[Asset] ([ID], [AssetTagID], [AssetName], [AssetCategoryID], [AssetDescription], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'A901', N'Desktop', 4, N'Desktop computer', 1, 1, CAST(N'2019-01-02T22:20:52.997' AS DateTime), 1, CAST(N'2019-01-02T22:20:52.997' AS DateTime))
INSERT [dbo].[Asset] ([ID], [AssetTagID], [AssetName], [AssetCategoryID], [AssetDescription], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'A902', N'Desktop', 4, N'Desktop computer', 1, 1, CAST(N'2019-01-02T22:22:32.193' AS DateTime), 1, CAST(N'2019-01-02T22:22:32.193' AS DateTime))
INSERT [dbo].[Asset] ([ID], [AssetTagID], [AssetName], [AssetCategoryID], [AssetDescription], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'A210', N'Desktop', 4, N'Desktop computer', 1, 1, CAST(N'2019-01-02T22:24:13.830' AS DateTime), 1, CAST(N'2019-01-02T22:24:13.830' AS DateTime))
SET IDENTITY_INSERT [dbo].[Asset] OFF
SET IDENTITY_INSERT [dbo].[AssetCategory] ON 

INSERT [dbo].[AssetCategory] ([ID], [CategoryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Computer', 1, 1, CAST(N'2018-12-25T20:49:41.870' AS DateTime), 1, CAST(N'2018-12-25T20:49:41.870' AS DateTime))
INSERT [dbo].[AssetCategory] ([ID], [CategoryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Printer', 1, 1, CAST(N'2019-01-08T22:56:34.223' AS DateTime), 1, CAST(N'2019-01-08T22:56:34.223' AS DateTime))
INSERT [dbo].[AssetCategory] ([ID], [CategoryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'Chair', 1, 1, CAST(N'2019-01-08T22:57:38.070' AS DateTime), 1, CAST(N'2019-01-08T22:57:38.070' AS DateTime))
INSERT [dbo].[AssetCategory] ([ID], [CategoryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Base Phone', 1, 1, CAST(N'2019-01-08T22:57:38.077' AS DateTime), 1, CAST(N'2019-01-08T22:57:38.077' AS DateTime))
INSERT [dbo].[AssetCategory] ([ID], [CategoryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Internet', 1, 1, CAST(N'2019-01-08T22:57:38.090' AS DateTime), 1, CAST(N'2019-01-08T22:57:38.090' AS DateTime))
SET IDENTITY_INSERT [dbo].[AssetCategory] OFF
SET IDENTITY_INSERT [dbo].[AssetDetail] ON 

INSERT [dbo].[AssetDetail] ([ID], [AssetID], [PurchaseDate], [VendorID], [Cost], [WarrantyExpireDate], [WarrantyDocumentId], [AssetImageId], [BrandName], [ModelNumber], [SerialNumber]) VALUES (1, 4, CAST(N'2018-04-03' AS Date), 1, CAST(35000.00 AS Decimal(18, 2)), CAST(N'2022-05-03' AS Date), NULL, NULL, N'Dell', N'M2323232', N'SR232323')
INSERT [dbo].[AssetDetail] ([ID], [AssetID], [PurchaseDate], [VendorID], [Cost], [WarrantyExpireDate], [WarrantyDocumentId], [AssetImageId], [BrandName], [ModelNumber], [SerialNumber]) VALUES (2, 5, CAST(N'2018-10-31' AS Date), 1, CAST(37000.00 AS Decimal(18, 2)), CAST(N'2019-12-30' AS Date), NULL, NULL, N'Dell', N'Z101', N'SR1001')
INSERT [dbo].[AssetDetail] ([ID], [AssetID], [PurchaseDate], [VendorID], [Cost], [WarrantyExpireDate], [WarrantyDocumentId], [AssetImageId], [BrandName], [ModelNumber], [SerialNumber]) VALUES (3, 6, CAST(N'2019-11-30' AS Date), 1, CAST(40000.00 AS Decimal(18, 2)), CAST(N'2019-12-31' AS Date), N'c64a4b24-5b80-4d33-9d7b-e855f8e277ea', N'264c186c-5277-4cd1-b436-97d7115823c0', N'Dell', N'M0123', N'S901901')
INSERT [dbo].[AssetDetail] ([ID], [AssetID], [PurchaseDate], [VendorID], [Cost], [WarrantyExpireDate], [WarrantyDocumentId], [AssetImageId], [BrandName], [ModelNumber], [SerialNumber]) VALUES (4, 7, CAST(N'2019-11-30' AS Date), 1, CAST(40000.00 AS Decimal(18, 2)), CAST(N'2019-12-31' AS Date), N'71f6a4ac-10ed-4b37-81b4-1f218cf47094', N'54bc0a87-a0ad-46e3-ac7c-30f4daaf98bc', N'Dell', N'M01232', N'S9019012')
INSERT [dbo].[AssetDetail] ([ID], [AssetID], [PurchaseDate], [VendorID], [Cost], [WarrantyExpireDate], [WarrantyDocumentId], [AssetImageId], [BrandName], [ModelNumber], [SerialNumber]) VALUES (5, 8, CAST(N'2019-11-30' AS Date), 1, CAST(40000.00 AS Decimal(18, 2)), CAST(N'2019-12-31' AS Date), N'b85546e0-f3e1-4c0e-b770-55fd552070bd', N'0214ae84-a0ee-47b0-bef0-12edbb71549c', N'Dell', N'M09012', N'S210210')
SET IDENTITY_INSERT [dbo].[AssetDetail] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [DepartmentName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Finance', 1, NULL, CAST(N'2018-12-25T20:46:14.327' AS DateTime), NULL, CAST(N'2018-12-25T20:46:14.327' AS DateTime))
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Function] ON 

INSERT [dbo].[Function] ([ID], [FunctionCode], [FunctionName], [FunctionDescription]) VALUES (1, N'ADDASSET', N'AddAsset', NULL)
SET IDENTITY_INSERT [dbo].[Function] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [MenuTitle], [ParentMenuId], [MenuLink], [TemplateUrl], [Controller], [ControllerAs], [IsDisabled], [IsStateRequired], [DisplayOrder], [Tag]) VALUES (3, N'AssetManagment', 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [RoleName], [RoleDescription], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Admin', N'Admin', NULL, CAST(N'2018-12-25T20:43:43.507' AS DateTime), NULL, CAST(N'2018-12-25T20:43:43.507' AS DateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[RoleFunction] ON 

INSERT [dbo].[RoleFunction] ([ID], [RoleID], [FunctionID], [IsActive]) VALUES (1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[RoleFunction] OFF
SET IDENTITY_INSERT [dbo].[RoleMenu] ON 

INSERT [dbo].[RoleMenu] ([ID], [RoleID], [MenuID]) VALUES (1, 1, 3)
SET IDENTITY_INSERT [dbo].[RoleMenu] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Title], [FirstName], [LastName], [EmpId], [Phone], [Email], [DeptId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Mr', N'Vishal', N'Tyagi', N'123456', N'99999999', N'vishal@abc.com', 1, 1, NULL, CAST(N'2018-12-25T20:47:11.140' AS DateTime), NULL, CAST(N'2018-12-25T20:47:11.140' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserCredential] ON 

INSERT [dbo].[UserCredential] ([ID], [UserID], [Password], [PasswordKey], [Attempted]) VALUES (2, 1, N'Password', N'Password1', 1)
SET IDENTITY_INSERT [dbo].[UserCredential] OFF
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([ID], [VendorName], [IsActive]) VALUES (1, N'Dell Computer', 1)
INSERT [dbo].[Vendor] ([ID], [VendorName], [IsActive]) VALUES (2, N'HP', 1)
INSERT [dbo].[Vendor] ([ID], [VendorName], [IsActive]) VALUES (3, N'HCL', 1)
INSERT [dbo].[Vendor] ([ID], [VendorName], [IsActive]) VALUES (4, N'EPSON', 1)
INSERT [dbo].[Vendor] ([ID], [VendorName], [IsActive]) VALUES (5, N'Moto Associates', 1)
INSERT [dbo].[Vendor] ([ID], [VendorName], [IsActive]) VALUES (6, N'Vodaphone', 1)
INSERT [dbo].[Vendor] ([ID], [VendorName], [IsActive]) VALUES (7, N'Airtel Broadband', 1)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
ALTER TABLE [dbo].[Asset] ADD  CONSTRAINT [DF_Asset_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Asset] ADD  CONSTRAINT [DF_Asset_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[AssetCategory] ADD  CONSTRAINT [DF_AssetCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AssetCategory] ADD  CONSTRAINT [DF_AssetCategory_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IsStateRequired]  DEFAULT ((0)) FOR [IsStateRequired]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_AssetCategory] FOREIGN KEY([AssetCategoryID])
REFERENCES [dbo].[AssetCategory] ([ID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_AssetCategory]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_User]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_User1]
GO
ALTER TABLE [dbo].[AssetCategory]  WITH CHECK ADD  CONSTRAINT [FK_AssetCategory_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AssetCategory] CHECK CONSTRAINT [FK_AssetCategory_User]
GO
ALTER TABLE [dbo].[AssetCategory]  WITH CHECK ADD  CONSTRAINT [FK_AssetCategory_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AssetCategory] CHECK CONSTRAINT [FK_AssetCategory_User1]
GO
ALTER TABLE [dbo].[AssetDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssetDetail_Asset] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Asset] ([ID])
GO
ALTER TABLE [dbo].[AssetDetail] CHECK CONSTRAINT [FK_AssetDetail_Asset]
GO
ALTER TABLE [dbo].[AssetDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssetDetail_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([ID])
GO
ALTER TABLE [dbo].[AssetDetail] CHECK CONSTRAINT [FK_AssetDetail_Vendor]
GO
ALTER TABLE [dbo].[AssetGatePass]  WITH CHECK ADD  CONSTRAINT [FK_AssetGatePass_GatePassStatus] FOREIGN KEY([GatePassStatusID])
REFERENCES [dbo].[GatePassStatus] ([ID])
GO
ALTER TABLE [dbo].[AssetGatePass] CHECK CONSTRAINT [FK_AssetGatePass_GatePassStatus]
GO
ALTER TABLE [dbo].[AssetGatePass]  WITH CHECK ADD  CONSTRAINT [FK_AssetGatePass_User] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AssetGatePass] CHECK CONSTRAINT [FK_AssetGatePass_User]
GO
ALTER TABLE [dbo].[AssetGatePass]  WITH CHECK ADD  CONSTRAINT [FK_AssetGatePass_User1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AssetGatePass] CHECK CONSTRAINT [FK_AssetGatePass_User1]
GO
ALTER TABLE [dbo].[AssetGatePass]  WITH CHECK ADD  CONSTRAINT [FK_AssetGatePass_User2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AssetGatePass] CHECK CONSTRAINT [FK_AssetGatePass_User2]
GO
ALTER TABLE [dbo].[AssetGatePassDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssetGatePassDetail_Asset] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Asset] ([ID])
GO
ALTER TABLE [dbo].[AssetGatePassDetail] CHECK CONSTRAINT [FK_AssetGatePassDetail_Asset]
GO
ALTER TABLE [dbo].[AssetGatePassDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssetGatePassDetail_AssetGatePass] FOREIGN KEY([AssetGatePassID])
REFERENCES [dbo].[AssetGatePass] ([ID])
GO
ALTER TABLE [dbo].[AssetGatePassDetail] CHECK CONSTRAINT [FK_AssetGatePassDetail_AssetGatePass]
GO
ALTER TABLE [dbo].[AssetGatePassDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssetGatePassDetail_QuantityUnit] FOREIGN KEY([SendQtyUnitID])
REFERENCES [dbo].[QuantityUnit] ([ID])
GO
ALTER TABLE [dbo].[AssetGatePassDetail] CHECK CONSTRAINT [FK_AssetGatePassDetail_QuantityUnit]
GO
ALTER TABLE [dbo].[AssetGatePassDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssetGatePassDetail_QuantityUnit1] FOREIGN KEY([ReceivedQtyUnitID])
REFERENCES [dbo].[QuantityUnit] ([ID])
GO
ALTER TABLE [dbo].[AssetGatePassDetail] CHECK CONSTRAINT [FK_AssetGatePassDetail_QuantityUnit1]
GO
ALTER TABLE [dbo].[AssetGatePassSenderDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssetGatePassSenderDetail_AssetGatePass] FOREIGN KEY([AssetGatePassID])
REFERENCES [dbo].[AssetGatePass] ([ID])
GO
ALTER TABLE [dbo].[AssetGatePassSenderDetail] CHECK CONSTRAINT [FK_AssetGatePassSenderDetail_AssetGatePass]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_User]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_User1]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_User]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_User1]
GO
ALTER TABLE [dbo].[RoleFunction]  WITH CHECK ADD  CONSTRAINT [FK_RoleFunction_Function] FOREIGN KEY([FunctionID])
REFERENCES [dbo].[Function] ([ID])
GO
ALTER TABLE [dbo].[RoleFunction] CHECK CONSTRAINT [FK_RoleFunction_Function]
GO
ALTER TABLE [dbo].[RoleFunction]  WITH CHECK ADD  CONSTRAINT [FK_RoleFunction_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[RoleFunction] CHECK CONSTRAINT [FK_RoleFunction_Role]
GO
ALTER TABLE [dbo].[RoleMenu]  WITH CHECK ADD  CONSTRAINT [FK_RoleMenu_Menu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([ID])
GO
ALTER TABLE [dbo].[RoleMenu] CHECK CONSTRAINT [FK_RoleMenu_Menu]
GO
ALTER TABLE [dbo].[RoleMenu]  WITH CHECK ADD  CONSTRAINT [FK_RoleMenu_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[RoleMenu] CHECK CONSTRAINT [FK_RoleMenu_Roles]
GO
ALTER TABLE [dbo].[UserCredential]  WITH CHECK ADD  CONSTRAINT [FK_UserCredential_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserCredential] CHECK CONSTRAINT [FK_UserCredential_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User1]
GO
ALTER TABLE [dbo].[UserSecurityAnswer]  WITH CHECK ADD  CONSTRAINT [FK_UserSecurityAnswer_SecurityQuestion] FOREIGN KEY([SecurityQuestionID])
REFERENCES [dbo].[SecurityQuestion] ([ID])
GO
ALTER TABLE [dbo].[UserSecurityAnswer] CHECK CONSTRAINT [FK_UserSecurityAnswer_SecurityQuestion]
GO
ALTER TABLE [dbo].[UserSecurityAnswer]  WITH CHECK ADD  CONSTRAINT [FK_UserSecurityAnswer_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserSecurityAnswer] CHECK CONSTRAINT [FK_UserSecurityAnswer_User]
GO
USE [master]
GO
ALTER DATABASE [AdminERP] SET  READ_WRITE 
GO
