USE [master]
GO
/****** Object:  Database [databasefloor]    Script Date: 18.03.2025 11:09:53 ******/
CREATE DATABASE [databasefloor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'databasefloor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\databasefloor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'databasefloor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\databasefloor.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [databasefloor] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [databasefloor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [databasefloor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [databasefloor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [databasefloor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [databasefloor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [databasefloor] SET ARITHABORT OFF 
GO
ALTER DATABASE [databasefloor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [databasefloor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [databasefloor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [databasefloor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [databasefloor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [databasefloor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [databasefloor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [databasefloor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [databasefloor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [databasefloor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [databasefloor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [databasefloor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [databasefloor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [databasefloor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [databasefloor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [databasefloor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [databasefloor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [databasefloor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [databasefloor] SET  MULTI_USER 
GO
ALTER DATABASE [databasefloor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [databasefloor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [databasefloor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [databasefloor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [databasefloor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [databasefloor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'databasefloor', N'ON'
GO
ALTER DATABASE [databasefloor] SET QUERY_STORE = OFF
GO
USE [databasefloor]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[IdAdress] [int] NOT NULL,
	[IdIndex] [int] NOT NULL,
	[AreaId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[StreetId] [int] NOT NULL,
	[HouseNumber] [int] NOT NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[IdAdress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[AreaId] [int] NOT NULL,
	[AreaName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[IdDirector] [int] NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Middlename] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[IdDirector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Index]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Index](
	[IdIndex] [int] NOT NULL,
	[IndexName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Index] PRIMARY KEY CLUSTERED 
(
	[IdIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfoPartner]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoPartner](
	[IdInfoPartner] [int] NOT NULL,
	[IdPartnerType] [int] NOT NULL,
	[IdPartner] [int] NOT NULL,
	[IdDirector] [int] NOT NULL,
	[PartnerEmail] [nvarchar](500) NOT NULL,
	[Phone] [nvarchar](500) NOT NULL,
	[IdAdress] [int] NOT NULL,
	[IdINN] [int] NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_InfoPartner] PRIMARY KEY CLUSTERED 
(
	[IdInfoPartner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfoProduct]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoProduct](
	[IdInfoProduct] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[IdPartner] [int] NOT NULL,
	[ProductAmount] [int] NOT NULL,
	[SaleDate] [datetime] NOT NULL,
 CONSTRAINT [PK_InfoProduct] PRIMARY KEY CLUSTERED 
(
	[IdInfoProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INN]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INN](
	[IdINN] [int] NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_INN] PRIMARY KEY CLUSTERED 
(
	[IdINN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[IdMaterial] [int] NOT NULL,
	[MaterialType] [nvarchar](100) NOT NULL,
	[DefectPersentage] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[IdMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[IdPartner] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Partner] PRIMARY KEY CLUSTERED 
(
	[IdPartner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerType]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerType](
	[IdPartnerType] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_PartnerType] PRIMARY KEY CLUSTERED 
(
	[IdPartnerType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[IdProduct] [int] NOT NULL,
	[IdProductType] [int] NOT NULL,
	[Product] [nvarchar](500) NOT NULL,
	[Article] [int] NOT NULL,
	[MinPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[IdProductType] [int] NOT NULL,
	[ProductType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[IdProductType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Streets]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streets](
	[IdStreet] [int] NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Streets] PRIMARY KEY CLUSTERED 
(
	[IdStreet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeProductRate]    Script Date: 18.03.2025 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProductRate](
	[IdTypeProductRate] [int] NOT NULL,
	[IdProductType] [int] NOT NULL,
	[RateProduct] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_TypeProductRate] PRIMARY KEY CLUSTERED 
(
	[IdTypeProductRate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Adress] ([IdAdress], [IdIndex], [AreaId], [CityId], [StreetId], [HouseNumber]) VALUES (1, 5, 3, 5, 1, 15)
INSERT [dbo].[Adress] ([IdAdress], [IdIndex], [AreaId], [CityId], [StreetId], [HouseNumber]) VALUES (2, 2, 1, 3, 5, 18)
INSERT [dbo].[Adress] ([IdAdress], [IdIndex], [AreaId], [CityId], [StreetId], [HouseNumber]) VALUES (3, 3, 4, 1, 2, 21)
INSERT [dbo].[Adress] ([IdAdress], [IdIndex], [AreaId], [CityId], [StreetId], [HouseNumber]) VALUES (4, 1, 5, 2, 4, 51)
INSERT [dbo].[Adress] ([IdAdress], [IdIndex], [AreaId], [CityId], [StreetId], [HouseNumber]) VALUES (5, 4, 2, 4, 3, 122)
GO
INSERT [dbo].[Areas] ([AreaId], [AreaName]) VALUES (1, N'Архангельская область
')
INSERT [dbo].[Areas] ([AreaId], [AreaName]) VALUES (2, N'Белгородская область')
INSERT [dbo].[Areas] ([AreaId], [AreaName]) VALUES (3, N'Кемеровская область')
INSERT [dbo].[Areas] ([AreaId], [AreaName]) VALUES (4, N'Ленинградская область')
INSERT [dbo].[Areas] ([AreaId], [AreaName]) VALUES (5, N'Московская область')
GO
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (1, N' город Приморск')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (2, N' город Реутов')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (3, N' город Северодвинск')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (4, N' город Старый Оскол')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (5, N' город Юрга')
GO
INSERT [dbo].[Directors] ([IdDirector], [LastName], [FirstName], [Middlename]) VALUES (1, N'Воробьева', N'Екатерина', N'Валерьевна')
INSERT [dbo].[Directors] ([IdDirector], [LastName], [FirstName], [Middlename]) VALUES (2, N'Иванова', N'Александра', N'Ивановна')
INSERT [dbo].[Directors] ([IdDirector], [LastName], [FirstName], [Middlename]) VALUES (3, N'Петров', N'Василий', N'Петрович')
INSERT [dbo].[Directors] ([IdDirector], [LastName], [FirstName], [Middlename]) VALUES (4, N'Соловьев', N'Андрей', N'Николаевич')
INSERT [dbo].[Directors] ([IdDirector], [LastName], [FirstName], [Middlename]) VALUES (5, N'Степанов', N'Степан', N'Сергеевич')
GO
INSERT [dbo].[Index] ([IdIndex], [IndexName]) VALUES (1, N'143960')
INSERT [dbo].[Index] ([IdIndex], [IndexName]) VALUES (2, N'164500')
INSERT [dbo].[Index] ([IdIndex], [IndexName]) VALUES (3, N'188910')
INSERT [dbo].[Index] ([IdIndex], [IndexName]) VALUES (4, N'309500')
INSERT [dbo].[Index] ([IdIndex], [IndexName]) VALUES (5, N'652050')
GO
INSERT [dbo].[InfoPartner] ([IdInfoPartner], [IdPartnerType], [IdPartner], [IdDirector], [PartnerEmail], [Phone], [IdAdress], [IdINN], [Rating]) VALUES (1, 1, 1, 2, N'aleksandraivanova@ml.ru', N'+7 493 123 45 67', 1, 2, 7)
INSERT [dbo].[InfoPartner] ([IdInfoPartner], [IdPartnerType], [IdPartner], [IdDirector], [PartnerEmail], [Phone], [IdAdress], [IdINN], [Rating]) VALUES (2, 2, 3, 3, N'vppetrov@vl.ru', N'+7 987 123 56 78', 2, 3, 7)
INSERT [dbo].[InfoPartner] ([IdInfoPartner], [IdPartnerType], [IdPartner], [IdDirector], [PartnerEmail], [Phone], [IdAdress], [IdINN], [Rating]) VALUES (3, 3, 5, 4, N'ansolovev@st.ru', N'+7 812 223 32 00', 3, 4, 7)
INSERT [dbo].[InfoPartner] ([IdInfoPartner], [IdPartnerType], [IdPartner], [IdDirector], [PartnerEmail], [Phone], [IdAdress], [IdINN], [Rating]) VALUES (4, 4, 4, 1, N'ekaterina.vorobeva@ml.ru', N'+7 444 222 33 11', 4, 1, 5)
INSERT [dbo].[InfoPartner] ([IdInfoPartner], [IdPartnerType], [IdPartner], [IdDirector], [PartnerEmail], [Phone], [IdAdress], [IdINN], [Rating]) VALUES (5, 5, 2, 5, N'stepanov@stepan.ru', N'+7 912 888 33 33', 5, 5, 10)
GO
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (1, 4, 1, 15500, CAST(N'2023-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (2, 2, 1, 12350, CAST(N'2023-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (3, 3, 1, 37400, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (4, 1, 3, 35000, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (5, 5, 3, 1250, CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (6, 2, 3, 1000, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (7, 4, 3, 7550, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (8, 4, 5, 7250, CAST(N'2023-01-22T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (9, 1, 5, 2500, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (10, 3, 4, 59050, CAST(N'2023-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (11, 2, 4, 37200, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (13, 2, 2, 50000, CAST(N'2023-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (14, 3, 2, 670000, CAST(N'2023-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (15, 4, 2, 35000, CAST(N'2024-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[InfoProduct] ([IdInfoProduct], [IdProduct], [IdPartner], [ProductAmount], [SaleDate]) VALUES (16, 1, 2, 25000, CAST(N'2024-06-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[INN] ([IdINN], [INN]) VALUES (1, N'1111520857')
INSERT [dbo].[INN] ([IdINN], [INN]) VALUES (2, N'2222455179')
INSERT [dbo].[INN] ([IdINN], [INN]) VALUES (3, N'3333888520')
INSERT [dbo].[INN] ([IdINN], [INN]) VALUES (4, N'4440391035')
INSERT [dbo].[INN] ([IdINN], [INN]) VALUES (5, N'5552431140')
GO
INSERT [dbo].[Material] ([IdMaterial], [MaterialType], [DefectPersentage]) VALUES (1, N'Тип материала 1', CAST(0.1000 AS Decimal(18, 4)))
INSERT [dbo].[Material] ([IdMaterial], [MaterialType], [DefectPersentage]) VALUES (2, N'Тип материала 2', CAST(0.0095 AS Decimal(18, 4)))
INSERT [dbo].[Material] ([IdMaterial], [MaterialType], [DefectPersentage]) VALUES (3, N'Тип материала 3', CAST(0.0028 AS Decimal(18, 4)))
INSERT [dbo].[Material] ([IdMaterial], [MaterialType], [DefectPersentage]) VALUES (4, N'Тип материала 4', CAST(0.0055 AS Decimal(18, 4)))
INSERT [dbo].[Material] ([IdMaterial], [MaterialType], [DefectPersentage]) VALUES (5, N'Тип материала 5', CAST(0.0034 AS Decimal(18, 4)))
GO
INSERT [dbo].[Partner] ([IdPartner], [Name]) VALUES (1, N'База Строитель')
INSERT [dbo].[Partner] ([IdPartner], [Name]) VALUES (2, N'МонтажПро')
INSERT [dbo].[Partner] ([IdPartner], [Name]) VALUES (3, N'Паркет 29')
INSERT [dbo].[Partner] ([IdPartner], [Name]) VALUES (4, N'Ремонт и отделка')
INSERT [dbo].[Partner] ([IdPartner], [Name]) VALUES (5, N'Стройсервис')
GO
INSERT [dbo].[PartnerType] ([IdPartnerType], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnerType] ([IdPartnerType], [Name]) VALUES (2, N'ЗАО')
INSERT [dbo].[PartnerType] ([IdPartnerType], [Name]) VALUES (3, N'ОАО')
INSERT [dbo].[PartnerType] ([IdPartnerType], [Name]) VALUES (4, N'ООО')
INSERT [dbo].[PartnerType] ([IdPartnerType], [Name]) VALUES (5, N'ПАО')
GO
INSERT [dbo].[Products] ([IdProduct], [IdProductType], [Product], [Article], [MinPrice]) VALUES (1, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 8858958, CAST(7330.99 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([IdProduct], [IdProductType], [Product], [Article], [MinPrice]) VALUES (2, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 7750282, CAST(1799.33 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([IdProduct], [IdProductType], [Product], [Article], [MinPrice]) VALUES (3, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 7028748, CAST(3890.41 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([IdProduct], [IdProductType], [Product], [Article], [MinPrice]) VALUES (4, 3, N'Паркетная доска Ясень темный однополосная 14 мм', 8758385, CAST(4456.90 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([IdProduct], [IdProductType], [Product], [Article], [MinPrice]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 5012543, CAST(5450.59 AS Decimal(18, 2)))
GO
INSERT [dbo].[ProductType] ([IdProductType], [ProductType]) VALUES (1, N'Ламинат')
INSERT [dbo].[ProductType] ([IdProductType], [ProductType]) VALUES (2, N'Массивная доска')
INSERT [dbo].[ProductType] ([IdProductType], [ProductType]) VALUES (3, N'Паркетная доска')
INSERT [dbo].[ProductType] ([IdProductType], [ProductType]) VALUES (4, N'Пробковое покрытие')
GO
INSERT [dbo].[Streets] ([IdStreet], [StreetName]) VALUES (1, N' ул. Лесная')
INSERT [dbo].[Streets] ([IdStreet], [StreetName]) VALUES (2, N' ул. Парковая')
INSERT [dbo].[Streets] ([IdStreet], [StreetName]) VALUES (3, N' ул. Рабочая')
INSERT [dbo].[Streets] ([IdStreet], [StreetName]) VALUES (4, N' ул. Свободы')
INSERT [dbo].[Streets] ([IdStreet], [StreetName]) VALUES (5, N' ул. Строителей')
GO
INSERT [dbo].[TypeProductRate] ([IdTypeProductRate], [IdProductType], [RateProduct]) VALUES (1, 1, CAST(2.35 AS Decimal(10, 2)))
INSERT [dbo].[TypeProductRate] ([IdTypeProductRate], [IdProductType], [RateProduct]) VALUES (2, 2, CAST(5.15 AS Decimal(10, 2)))
INSERT [dbo].[TypeProductRate] ([IdTypeProductRate], [IdProductType], [RateProduct]) VALUES (3, 3, CAST(4.34 AS Decimal(10, 2)))
INSERT [dbo].[TypeProductRate] ([IdTypeProductRate], [IdProductType], [RateProduct]) VALUES (4, 4, CAST(1.50 AS Decimal(10, 2)))
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Areas] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Areas] ([AreaId])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Areas]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Cities]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Index] FOREIGN KEY([IdIndex])
REFERENCES [dbo].[Index] ([IdIndex])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Index]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Streets] FOREIGN KEY([StreetId])
REFERENCES [dbo].[Streets] ([IdStreet])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Streets]
GO
ALTER TABLE [dbo].[InfoPartner]  WITH CHECK ADD  CONSTRAINT [FK_InfoPartner_Adress] FOREIGN KEY([IdAdress])
REFERENCES [dbo].[Adress] ([IdAdress])
GO
ALTER TABLE [dbo].[InfoPartner] CHECK CONSTRAINT [FK_InfoPartner_Adress]
GO
ALTER TABLE [dbo].[InfoPartner]  WITH CHECK ADD  CONSTRAINT [FK_InfoPartner_Directors] FOREIGN KEY([IdDirector])
REFERENCES [dbo].[Directors] ([IdDirector])
GO
ALTER TABLE [dbo].[InfoPartner] CHECK CONSTRAINT [FK_InfoPartner_Directors]
GO
ALTER TABLE [dbo].[InfoPartner]  WITH CHECK ADD  CONSTRAINT [FK_InfoPartner_INN] FOREIGN KEY([IdINN])
REFERENCES [dbo].[INN] ([IdINN])
GO
ALTER TABLE [dbo].[InfoPartner] CHECK CONSTRAINT [FK_InfoPartner_INN]
GO
ALTER TABLE [dbo].[InfoPartner]  WITH CHECK ADD  CONSTRAINT [FK_InfoPartner_Partner] FOREIGN KEY([IdPartner])
REFERENCES [dbo].[Partner] ([IdPartner])
GO
ALTER TABLE [dbo].[InfoPartner] CHECK CONSTRAINT [FK_InfoPartner_Partner]
GO
ALTER TABLE [dbo].[InfoPartner]  WITH CHECK ADD  CONSTRAINT [FK_InfoPartner_PartnerType] FOREIGN KEY([IdPartnerType])
REFERENCES [dbo].[PartnerType] ([IdPartnerType])
GO
ALTER TABLE [dbo].[InfoPartner] CHECK CONSTRAINT [FK_InfoPartner_PartnerType]
GO
ALTER TABLE [dbo].[InfoProduct]  WITH CHECK ADD  CONSTRAINT [FK_InfoProduct_Partner] FOREIGN KEY([IdPartner])
REFERENCES [dbo].[Partner] ([IdPartner])
GO
ALTER TABLE [dbo].[InfoProduct] CHECK CONSTRAINT [FK_InfoProduct_Partner]
GO
ALTER TABLE [dbo].[InfoProduct]  WITH CHECK ADD  CONSTRAINT [FK_InfoProduct_Products] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Products] ([IdProduct])
GO
ALTER TABLE [dbo].[InfoProduct] CHECK CONSTRAINT [FK_InfoProduct_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([IdProductType])
REFERENCES [dbo].[ProductType] ([IdProductType])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
ALTER TABLE [dbo].[TypeProductRate]  WITH CHECK ADD  CONSTRAINT [FK_TypeProductRate_ProductType] FOREIGN KEY([IdProductType])
REFERENCES [dbo].[ProductType] ([IdProductType])
GO
ALTER TABLE [dbo].[TypeProductRate] CHECK CONSTRAINT [FK_TypeProductRate_ProductType]
GO
USE [master]
GO
ALTER DATABASE [databasefloor] SET  READ_WRITE 
GO
