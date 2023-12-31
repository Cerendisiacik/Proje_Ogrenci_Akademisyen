USE [master]
GO
/****** Object:  Database [OgrenciSinav]    Script Date: 24.12.2023 15:24:50 ******/
CREATE DATABASE [OgrenciSinav]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OgrenciSinav', FILENAME = N'C:\Users\ceren\OgrenciSinav.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OgrenciSinav_log', FILENAME = N'C:\Users\ceren\OgrenciSinav_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OgrenciSinav] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OgrenciSinav].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OgrenciSinav] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OgrenciSinav] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OgrenciSinav] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OgrenciSinav] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OgrenciSinav] SET ARITHABORT OFF 
GO
ALTER DATABASE [OgrenciSinav] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OgrenciSinav] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OgrenciSinav] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OgrenciSinav] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OgrenciSinav] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OgrenciSinav] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OgrenciSinav] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OgrenciSinav] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OgrenciSinav] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OgrenciSinav] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OgrenciSinav] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OgrenciSinav] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OgrenciSinav] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OgrenciSinav] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OgrenciSinav] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OgrenciSinav] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OgrenciSinav] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OgrenciSinav] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OgrenciSinav] SET  MULTI_USER 
GO
ALTER DATABASE [OgrenciSinav] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OgrenciSinav] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OgrenciSinav] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OgrenciSinav] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OgrenciSinav] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OgrenciSinav] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OgrenciSinav] SET QUERY_STORE = OFF
GO
USE [OgrenciSinav]
GO
/****** Object:  Table [dbo].[TblDersler]    Script Date: 24.12.2023 15:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDersler](
	[DersID] [int] IDENTITY(1,1) NOT NULL,
	[DersAd] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblDersler] PRIMARY KEY CLUSTERED 
(
	[DersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblOgrenci]    Script Date: 24.12.2023 15:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOgrenci](
	[OgrID] [int] IDENTITY(1,1) NOT NULL,
	[OgrAd] [nvarchar](20) NULL,
	[OgrSoyad] [nvarchar](25) NULL,
	[OgrNumara] [char](5) NULL,
	[OgrSifre] [nvarchar](10) NULL,
	[OgrMail] [nvarchar](50) NULL,
	[OgrResim] [nvarchar](100) NULL,
	[OgrBolum] [int] NULL,
	[OgrDurum] [bit] NULL,
 CONSTRAINT [PK_TblOgrenci] PRIMARY KEY CLUSTERED 
(
	[OgrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblNotlar]    Script Date: 24.12.2023 15:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblNotlar](
	[NotID] [int] IDENTITY(1,1) NOT NULL,
	[Sinav1] [int] NULL,
	[Sinav2] [int] NULL,
	[Sinav3] [int] NULL,
	[Quiz1] [int] NULL,
	[Quiz2] [int] NULL,
	[Proje] [int] NULL,
	[Ortalama] [decimal](5, 2) NULL,
	[Ders] [int] NULL,
	[Ogrenci] [int] NULL,
 CONSTRAINT [PK_TblNotlar] PRIMARY KEY CLUSTERED 
(
	[NotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 24.12.2023 15:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT dbo.TblNotlar.NotID, dbo.TblOgrenci.OgrAd, dbo.TblOgrenci.OgrSoyad, dbo.TblDersler.DersAd, dbo.TblNotlar.Sinav1, dbo.TblNotlar.Sinav2, dbo.TblNotlar.Sinav3, dbo.TblNotlar.Quiz1, dbo.TblNotlar.Quiz2, dbo.TblNotlar.Proje, 
                  dbo.TblNotlar.Ortalama
FROM     dbo.TblNotlar INNER JOIN
                  dbo.TblDersler ON dbo.TblNotlar.Ders = dbo.TblDersler.DersID INNER JOIN
                  dbo.TblOgrenci ON dbo.TblNotlar.Ogrenci = dbo.TblOgrenci.OgrID
GO
/****** Object:  Table [dbo].[TblAkademisyen]    Script Date: 24.12.2023 15:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblAkademisyen](
	[AkademisyenID] [int] IDENTITY(1,1) NOT NULL,
	[AkademisyenAd] [nvarchar](30) NULL,
	[AkademisyenSoyad] [nvarchar](30) NULL,
	[Unvan] [nvarchar](20) NULL,
	[AkademisyenNumara] [char](5) NULL,
	[AkademisyenSifre] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[AkademisyenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblBolum]    Script Date: 24.12.2023 15:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblBolum](
	[BolumID] [int] IDENTITY(1,1) NOT NULL,
	[BolumAd] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[BolumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblBolum] ON 

INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (1, N'Yazılım Mühendisliği')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (2, N'Endüstri Mühendisliği')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (3, N'Makine Mühendisliği')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (4, N'Otomotiv Mühendisliği')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (5, N'Yapay Zeka MÜhendisliği')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (6, N'Mekatronik Mühendisliği')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (7, N'İnşaat Mühendisliği')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (8, N'Genetik Mühendisliği')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (1002, N'Moleküler Biyoloji')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (1003, N'Uçak Bakım ve Onarım')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (1004, N'Veri Madenciliği ve Analizi')
INSERT [dbo].[TblBolum] ([BolumID], [BolumAd]) VALUES (1005, N'Matematik Mühendisliği')
SET IDENTITY_INSERT [dbo].[TblBolum] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDersler] ON 

INSERT [dbo].[TblDersler] ([DersID], [DersAd]) VALUES (1, N'Algoritma ve Programlama')
INSERT [dbo].[TblDersler] ([DersID], [DersAd]) VALUES (2, N'Veri Analizi')
INSERT [dbo].[TblDersler] ([DersID], [DersAd]) VALUES (3, N'C# ile Nesne Tabanlı Programlama')
INSERT [dbo].[TblDersler] ([DersID], [DersAd]) VALUES (4, N'Veri Yapıları')
INSERT [dbo].[TblDersler] ([DersID], [DersAd]) VALUES (5, N'Optimizasyon Teknikleri')
INSERT [dbo].[TblDersler] ([DersID], [DersAd]) VALUES (6, N'Sayısal Tasarım')
SET IDENTITY_INSERT [dbo].[TblDersler] OFF
GO
SET IDENTITY_INSERT [dbo].[TblNotlar] ON 

INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (1, 70, 85, 80, 65, 74, 100, CAST(79.00 AS Decimal(5, 2)), 2, 1)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (2, 45, 35, 85, 65, 15, 95, CAST(56.00 AS Decimal(5, 2)), 2, 2)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (3, 50, 44, 77, 98, 63, 100, CAST(72.00 AS Decimal(5, 2)), 2, 3)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (4, 60, 50, 40, 70, 80, 90, CAST(65.00 AS Decimal(5, 2)), 2, 4)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (5, 70, 60, 95, 35, 33, 100, CAST(65.00 AS Decimal(5, 2)), 2, 5)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (6, 80, 80, 80, 80, 80, 80, CAST(80.00 AS Decimal(5, 2)), 2, 6)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (7, 58, 100, 47, 44, 28, 90, CAST(61.00 AS Decimal(5, 2)), 2, 7)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (8, 90, 100, 85, 95, 90, 100, CAST(93.00 AS Decimal(5, 2)), 2, 8)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (9, 74, 85, 74, 74, 85, 100, CAST(82.00 AS Decimal(5, 2)), 3, 1)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (10, 34, 84, 100, 64, 17, 95, CAST(65.00 AS Decimal(5, 2)), 3, 2)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (11, 85, 83, 96, 66, 16, 95, CAST(73.00 AS Decimal(5, 2)), 3, 3)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (12, 96, 80, 95, 63, 91, 95, CAST(86.00 AS Decimal(5, 2)), 3, 4)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (13, 88, 36, 90, 68, 81, 90, CAST(75.00 AS Decimal(5, 2)), 3, 5)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (14, 14, 75, 84, 22, 23, 100, CAST(53.00 AS Decimal(5, 2)), 3, 6)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (15, 75, 41, 47, 80, 25, 85, CAST(58.00 AS Decimal(5, 2)), 3, 7)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (16, 100, 90, 85, 86, 90, 100, CAST(91.00 AS Decimal(5, 2)), 3, 8)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (18, 78, 88, 76, 44, 44, 100, CAST(71.00 AS Decimal(5, 2)), 5, 1)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (19, 87, 36, 60, 11, 63, 100, CAST(59.00 AS Decimal(5, 2)), 5, 2)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (20, 47, 44, 30, 16, 81, 100, CAST(53.00 AS Decimal(5, 2)), 5, 3)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (21, 95, 17, 28, 82, 46, 90, CAST(59.00 AS Decimal(5, 2)), 5, 4)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (22, 36, 25, 91, 90, 55, 96, CAST(65.00 AS Decimal(5, 2)), 5, 5)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (23, 41, 95, 77, 7, 20, 90, CAST(55.00 AS Decimal(5, 2)), 5, 6)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (24, 20, 100, 65, 36, 30, 85, CAST(56.00 AS Decimal(5, 2)), 5, 7)
INSERT [dbo].[TblNotlar] ([NotID], [Sinav1], [Sinav2], [Sinav3], [Quiz1], [Quiz2], [Proje], [Ortalama], [Ders], [Ogrenci]) VALUES (25, 78, 90, 80, 83, 89, 100, CAST(86.00 AS Decimal(5, 2)), 5, 8)
SET IDENTITY_INSERT [dbo].[TblNotlar] OFF
GO
SET IDENTITY_INSERT [dbo].[TblOgrenci] ON 

INSERT [dbo].[TblOgrenci] ([OgrID], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (1, N'Ceren', N'Dişiaçık', N'22334', N'12', N'ceren@hotmail.com', N'C:\Users\ceren\OneDrive\Masaüstü\Resimler\indir.jpg', 1, 1)
INSERT [dbo].[TblOgrenci] ([OgrID], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (2, N'Yağmur ', N'Doğan', N'55448', N'a', N'yagmur@gmail.com', N'C:\Users\ceren\OneDrive\Masaüstü\Resimler\indir (3).jpg', 2, 1)
INSERT [dbo].[TblOgrenci] ([OgrID], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (3, N'Rumeysa ', N'Taşdemir', N'76578', N'm', N'rumeysa@gmail.com', N'test', 2, 1)
INSERT [dbo].[TblOgrenci] ([OgrID], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (4, N'Ali', N'Kaya', N'98109', N'a', N'ali@outlook.com', N'test', 1, 1)
INSERT [dbo].[TblOgrenci] ([OgrID], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (5, N'Sude Dilara', N'Karadaş', N'44227', N'e', N'sude@yahoo.com', N'test', 3, 0)
INSERT [dbo].[TblOgrenci] ([OgrID], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (6, N'Emre', N'Yılmaz', N'32145', N'123', N'emre@gmail.com', N'test', 5, 1)
INSERT [dbo].[TblOgrenci] ([OgrID], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (7, N'Eylül', N'Yılmaz', N'12245', N'124', N'eylül@gmail.com', N'C:\Users\ceren\OneDrive\Masaüstü\Resimler\indir (2).jpg', 7, 1)
INSERT [dbo].[TblOgrenci] ([OgrID], [OgrAd], [OgrSoyad], [OgrNumara], [OgrSifre], [OgrMail], [OgrResim], [OgrBolum], [OgrDurum]) VALUES (8, N'Hakan ', N'Yıldız', N'54672', N'hy', N'hakan@hotmail.com', N'0', 2, 1)
SET IDENTITY_INSERT [dbo].[TblOgrenci] OFF
GO
ALTER TABLE [dbo].[TblNotlar]  WITH CHECK ADD  CONSTRAINT [FK_TblNotlar_TblDersler] FOREIGN KEY([Ders])
REFERENCES [dbo].[TblDersler] ([DersID])
GO
ALTER TABLE [dbo].[TblNotlar] CHECK CONSTRAINT [FK_TblNotlar_TblDersler]
GO
ALTER TABLE [dbo].[TblNotlar]  WITH CHECK ADD  CONSTRAINT [FK_TblNotlar_TblOgrenci] FOREIGN KEY([Ogrenci])
REFERENCES [dbo].[TblOgrenci] ([OgrID])
GO
ALTER TABLE [dbo].[TblNotlar] CHECK CONSTRAINT [FK_TblNotlar_TblOgrenci]
GO
ALTER TABLE [dbo].[TblOgrenci]  WITH CHECK ADD  CONSTRAINT [FK_TblOgrenci_TblBolum] FOREIGN KEY([OgrBolum])
REFERENCES [dbo].[TblBolum] ([BolumID])
GO
ALTER TABLE [dbo].[TblOgrenci] CHECK CONSTRAINT [FK_TblOgrenci_TblBolum]
GO
/****** Object:  StoredProcedure [dbo].[Notlar]    Script Date: 24.12.2023 15:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Notlar]
AS 
Select NotID as 'Not ID',DersAd as 'Ders Adı',OgrAd+ ' ' +OgrSoyad as 'Öğrenci',
Sinav1,Sinav2,Sinav3,Quiz1,Quiz2,Ortalama From TblNotlar
inner join TblDersler
on TblNotlar.Ders=TblDersler.DersID
inner join TblOgrenci
on TblNotlar.Ogrenci=TblOgrenci.OgrID
GO
/****** Object:  StoredProcedure [dbo].[Notlar2]    Script Date: 24.12.2023 15:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Notlar2]
AS
Select NotID as 'Not ID',DersAd as 'Ders Adı',OgrAd+ ' ' +OgrSoyad as 'Öğrenci',
Sinav1,Sinav2,Sinav3,Quiz1,Quiz2,Ortalama From TblNotlar
inner join TblDersler
on TblNotlar.Ders=TblDersler.DersID
inner join TblOgrenci
on TblNotlar.Ogrenci=TblOgrenci.OgrID
GO
/****** Object:  StoredProcedure [dbo].[Notlar3]    Script Date: 24.12.2023 15:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Notlar3]
AS
Select NotID as 'Not ID',DersAd as 'Ders Adı',OgrAd+ ' ' +OgrSoyad as 'Öğrenci',
Sinav1,Sinav2,Sinav3,Quiz1,Quiz2,Proje,Ortalama From TblNotlar
inner join TblDersler
on TblNotlar.Ders=TblDersler.DersID
inner join TblOgrenci
on TblNotlar.Ogrenci=TblOgrenci.OgrID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TblOgrenci"
            Begin Extent = 
               Top = 30
               Left = 704
               Bottom = 193
               Right = 898
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TblDersler"
            Begin Extent = 
               Top = 8
               Left = 84
               Bottom = 157
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TblNotlar"
            Begin Extent = 
               Top = 7
               Left = 384
               Bottom = 170
               Right = 578
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [OgrenciSinav] SET  READ_WRITE 
GO
