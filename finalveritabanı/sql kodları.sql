USE [kutuphane]
GO
/****** Object:  Table [dbo].[Emanetler]    Script Date: 3.06.2022 22:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emanetler](
	[EmanetNo] [int] IDENTITY(1,1) NOT NULL,
	[UyeNo] [int] NULL,
	[KitapNo] [int] NULL,
	[EmanetVermeTarih] [date] NULL,
	[EmanetGeriAlmaTarih] [date] NULL,
	[EmanetIslemTarih] [datetime] NULL,
	[EmanetNot] [nvarchar](255) NULL,
 CONSTRAINT [PK_Emanetler] PRIMARY KEY CLUSTERED 
(
	[EmanetNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 3.06.2022 22:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[KitapNo] [int] IDENTITY(1,1) NOT NULL,
	[KitapAd] [nvarchar](150) NULL,
	[KitapYazari] [nvarchar](100) NULL,
	[KitapBaskiYil] [int] NULL,
	[KitapSayfaSayi] [int] NULL,
	[KitapDil] [nvarchar](20) NULL,
	[KitapYayinEvi] [nvarchar](100) NULL,
	[KitapAciklama] [text] NULL,
 CONSTRAINT [PK_Kitaplar] PRIMARY KEY CLUSTERED 
(
	[KitapNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 3.06.2022 22:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[UyeNo] [int] IDENTITY(1,1) NOT NULL,
	[UyeAd] [nvarchar](50) NULL,
	[UyeSoyad] [nvarchar](50) NULL,
	[UyeTelefon] [nvarchar](20) NULL,
	[UyeEposta] [nvarchar](100) NULL,
	[UyeAdres] [nvarchar](255) NULL,
 CONSTRAINT [PK_Uyeler] PRIMARY KEY CLUSTERED 
(
	[UyeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Emanetler] ON 

INSERT [dbo].[Emanetler] ([EmanetNo], [UyeNo], [KitapNo], [EmanetVermeTarih], [EmanetGeriAlmaTarih], [EmanetIslemTarih], [EmanetNot]) VALUES (16, 2, 15, CAST(N'2022-06-03' AS Date), CAST(N'2022-06-04' AS Date), CAST(N'2022-06-03T22:44:06.730' AS DateTime), N'aaaaa')
SET IDENTITY_INSERT [dbo].[Emanetler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kitaplar] ON 

INSERT [dbo].[Kitaplar] ([KitapNo], [KitapAd], [KitapYazari], [KitapBaskiYil], [KitapSayfaSayi], [KitapDil], [KitapYayinEvi], [KitapAciklama]) VALUES (15, N'deneme', N'ali', 2015, 222, N'Türkçe', N'deneme yayınları', N'aaaaa')
SET IDENTITY_INSERT [dbo].[Kitaplar] OFF
GO
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([UyeNo], [UyeAd], [UyeSoyad], [UyeTelefon], [UyeEposta], [UyeAdres]) VALUES (1, N'Test', N'Kullanıcı 1', N'(538) 111-1111', N'iletisim@programlamadersleri.com', N'İstanbul')
INSERT [dbo].[Uyeler] ([UyeNo], [UyeAd], [UyeSoyad], [UyeTelefon], [UyeEposta], [UyeAdres]) VALUES (2, N'Test 2 ', N'Kullanıcı 2', N'(212) 212-1212', N'iletisim@programlamadersleri.com', N'İstanbul')
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
GO
ALTER TABLE [dbo].[Emanetler]  WITH CHECK ADD  CONSTRAINT [FK_Emanetler_Kitaplar] FOREIGN KEY([KitapNo])
REFERENCES [dbo].[Kitaplar] ([KitapNo])
GO
ALTER TABLE [dbo].[Emanetler] CHECK CONSTRAINT [FK_Emanetler_Kitaplar]
GO
ALTER TABLE [dbo].[Emanetler]  WITH CHECK ADD  CONSTRAINT [FK_Emanetler_Uyeler] FOREIGN KEY([UyeNo])
REFERENCES [dbo].[Uyeler] ([UyeNo])
GO
ALTER TABLE [dbo].[Emanetler] CHECK CONSTRAINT [FK_Emanetler_Uyeler]
GO
/****** Object:  StoredProcedure [dbo].[Ekle]    Script Date: 3.06.2022 22:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Ekle]
(
@KitapAd nvarchar(150),
@KitapYazari nvarchar(100),
@KitapBaskiYil int,
@KitapSayfaSayi int,
@KitapDil nvarchar(20),
@KitapYayinEvi nvarchar(100),
@KitapAciklama text
)
as
insert into Kitaplar values(@KitapAd,@KitapYazari,@KitapBaskiYil,@KitapSayfaSayi,@KitapDil,@KitapYayinEvi,@KitapAciklama)
GO
/****** Object:  StoredProcedure [dbo].[Emanetekle]    Script Date: 3.06.2022 22:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Emanetekle]
(
@UyeNo int,
@KitapNo int,
@EmanetVermeTarih date,
@EmanetGeriAlmaTarih date,
@EmanetIslemTarih datetime,
@EmanetNot nvarchar(255)
)
as
insert into Emanetler values(@UyeNo,@KitapNo,@EmanetVermeTarih,@EmanetGeriAlmaTarih,@EmanetIslemTarih,@EmanetNot)
GO
/****** Object:  StoredProcedure [dbo].[emanetliste]    Script Date: 3.06.2022 22:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[emanetliste]
As
begin
SELECT EmanetNo, UyeAd,UyeSoyad,UyeTelefon,KitapAd,EmanetVermeTarih,EmanetGeriAlmaTarih,EmanetNot FROM Emanetler INNER JOIN Uyeler ON Emanetler.UyeNo = Uyeler.UyeNo INNER JOIN Kitaplar ON Kitaplar.KitapNo=Emanetler.KitapNo 
end 
GO
/****** Object:  StoredProcedure [dbo].[kitapliste]    Script Date: 3.06.2022 22:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[kitapliste]
As
begin
SELECT *  FROM kitaplar
end
GO
/****** Object:  StoredProcedure [dbo].[uyeekle]    Script Date: 3.06.2022 22:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[uyeekle]
(
@UyeAd nvarchar(50),
@UyeSoyad nvarchar(50),
@UyeTelefon nvarchar(20),
@UyeEposta nvarchar(100),
@UyeAdres nvarchar(255)
)
as
insert into Uyeler VALUES (@UyeAd,@UyeSoyad,@UyeTelefon,@UyeEposta,@UyeAdres)
GO
/****** Object:  StoredProcedure [dbo].[uyelerliste]    Script Date: 3.06.2022 22:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uyelerliste]
As
begin
SELECT *  FROM Uyeler
end
GO
