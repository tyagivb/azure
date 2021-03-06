USE [master]
GO
/****** Object:  Database [SocietyAutomation]    Script Date: 4/26/2020 5:46:13 PM ******/
CREATE DATABASE [SocietyAutomation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocietyAutomation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SocietyAutomation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocietyAutomation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SocietyAutomation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SocietyAutomation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocietyAutomation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocietyAutomation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocietyAutomation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocietyAutomation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocietyAutomation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocietyAutomation] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocietyAutomation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocietyAutomation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocietyAutomation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocietyAutomation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocietyAutomation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocietyAutomation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocietyAutomation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocietyAutomation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocietyAutomation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocietyAutomation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SocietyAutomation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocietyAutomation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocietyAutomation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocietyAutomation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocietyAutomation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocietyAutomation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocietyAutomation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocietyAutomation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SocietyAutomation] SET  MULTI_USER 
GO
ALTER DATABASE [SocietyAutomation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocietyAutomation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocietyAutomation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocietyAutomation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocietyAutomation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SocietyAutomation] SET QUERY_STORE = OFF
GO
USE [SocietyAutomation]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/26/2020 5:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedOn] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplaintActionRegister]    Script Date: 4/26/2020 5:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintActionRegister](
	[ID] [int] NOT NULL,
	[ComplaintID] [int] NULL,
	[AssignToEmployeeId] [int] NULL,
	[CloseStatusByUser] [int] NULL,
	[CloseStatusByAdmin] [int] NULL,
	[ResolveImageURL] [nvarchar](max) NULL,
	[CloseCommentByUser] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedOn] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_ComplaintActionRegister] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplaintPriority]    Script Date: 4/26/2020 5:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintPriority](
	[ID] [int] NOT NULL,
	[ComplaintPriority] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedOn] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplaintRegister]    Script Date: 4/26/2020 5:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintRegister](
	[ID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[SubCategoryName] [nvarchar](max) NOT NULL,
	[RequesterPriorityID] [int] NULL,
	[AdminPriorityID] [int] NULL,
	[ComplaintDetail] [nvarchar](max) NULL,
	[ImageURL] [nvarchar](max) NULL,
	[CurrentStatusID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedOn] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_ComplaintRegister] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrentStatus]    Script Date: 4/26/2020 5:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrentStatus](
	[ID] [int] NOT NULL,
	[CurrentStatus] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedOn] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlatRegistration]    Script Date: 4/26/2020 5:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlatRegistration](
	[ID] [int] NOT NULL,
	[FlatID] [varchar](10) NULL,
	[OwnerName] [nvarchar](max) NULL,
	[ResidentType] [int] NULL,
	[CurrentResidentName] [nchar](10) NULL,
	[ContactNumber] [varchar](15) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [varchar](10) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedOn] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_FlatRegistration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 4/26/2020 5:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[ID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedOn] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUsers]    Script Date: 4/26/2020 5:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUsers](
	[ID] [int] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Contact] [varchar](15) NULL,
	[Password] [varchar](10) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedOn] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_SystemUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [SocietyAutomation] SET  READ_WRITE 
GO
