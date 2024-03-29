CREATE DATABASE [Product_Perfume]
GO
USE [Product_Perfume]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 08/11/2021 13:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[adminID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NULL,
	[password] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 08/11/2021 13:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[oID] [varchar](32) NOT NULL,
	[dateCreate] [datetime] NULL,
	[cname] [nvarchar](30) NOT NULL,
	[cphone] [varchar](30) NULL,
	[cAddress] [nvarchar](100) NULL,
	[total] [money] NULL,
	[status] [int] NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[oID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 08/11/2021 13:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[pid] [varchar](30) NOT NULL,
	[oID] [varchar](32) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC,
	[oID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 08/11/2021 13:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [nvarchar](50) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 08/11/2021 13:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[className] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 08/11/2021 13:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](30) NOT NULL,
	[cphone] [varchar](30) NULL,
	[cAddress] [nvarchar](100) NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08/11/2021 13:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pid] [varchar](30) NOT NULL,
	[pname] [nvarchar](100) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[image] [varchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[cateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 08/11/2021 13:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stuID] [varchar](20) NOT NULL,
	[name] [nvarchar](30) NULL,
	[birthday] [datetime] NULL,
	[deleted] [bit] NULL,
	[classID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[stuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([adminID], [username], [password]) VALUES (14, N'Tuan', N'Tuan999999')
INSERT [dbo].[admin] ([adminID], [username], [password]) VALUES (16, N'Hai', N'Hai098123')
INSERT [dbo].[admin] ([adminID], [username], [password]) VALUES (19, N'Hanh', N'12345678')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'0UG', CAST(N'2021-11-07T23:21:00.293' AS DateTime), N'Sao Hoa', N'12345678', N'Ca Mau', 72.9400, 1, 13)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'IWB', CAST(N'2021-11-03T21:17:01.400' AS DateTime), N'Sao Hoa', N'12345678', N'Ca Mau', 447.5500, 0, 13)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'XTB', CAST(N'2021-11-07T23:15:45.363' AS DateTime), N'Sao Hoa', N'12345678', N'Ca Mau', 74.9500, 2, 13)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'ZDD', CAST(N'2021-11-07T23:16:51.983' AS DateTime), N'Sao Hoa', N'12345678', N'Ca Mau', 133.8900, 1, 13)
GO
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'BS1', N'IWB', 8, 49.0000, 399.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'BS2', N'IWB', 1, 47.0000, 47.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'BS2', N'ZDD', 1, 47.0000, 47.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'BS3', N'ZDD', 1, 24.0000, 24.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'CA1', N'ZDD', 1, 49.0000, 49.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'EA2', N'ZDD', 1, 16.0000, 16.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'GA2', N'ZDD', 1, 66.0000, 66.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'GA3', N'XTB', 1, 74.0000, 74.0000)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (43, N'GUCCI', 1)
INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (44, N'ELIZABETH TAYLOR', 1)
INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (45, N'GIVENCHY', 1)
INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (46, N'BOSS', 1)
INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (47, N'CALVIN KLEIN', 1)
INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (48, N'DAVIDOFF', 1)
INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (49, N'LACOSTE', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([classID], [className]) VALUES (1, N'Database')
INSERT [dbo].[Class] ([classID], [className]) VALUES (2, N'Java')
INSERT [dbo].[Class] ([classID], [className]) VALUES (3, N'.Net')
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (5, N'Hai', N'19001988', N'Quy Nhon', N'HaiBia', N'12345678A', 0)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (6, N'Tuan', N'19001006', N'Ha Noi', N'Tuan247', N'24720001', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (8, N'Hanh', N'0123435345', N'Lao Cai', N'Hanh123', N'hanh123456', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (13, N'Sao Hoa', N'12345678', N'Ca Mau', N'SaoHoa123', N'12345678', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (26, N'Tham', N'12345678', N'My', N'Hoa987', N'12345678', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'BS1', N'Boss Bottled Night For Men By Hugo Boss Eau De Toilette Spray', 31, 49.9500, N'img/BS1.jpg', N'Looking for a fragrance that is masculine, sensual and seductive? The Bottled Night Eau de Toilette by Hugo Boss is worth a try then. It combines spicy and woody tones with an aroma that is as intense as it is subtle. The fragrance is perfect for warm summer evenings with that special someone.', 1, 46)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'BS2', N'Hugo Just Different Eau De Toilette Spray For Men By Hugo Boss', 30, 47.9500, N'img/BS2.jpg', N'Hugo Boss released Just Different, a new vibrant fragrance for men in 2011. It has a fresh and modern aroma, with woody undertones and a hint of cashmeran. It is a newer edition of an older fragrance called Hugo by the brand. It inspires you to achieve and be whatever you wish.', 1, 46)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'BS3', N'Femme Eau De Parfum Spray For Women By Hugo Boss', 30, 24.9900, N'img/BS3.jpg', N'Femme Eau de Parfume is a very romantic and subtle fragrance for women by Hugo Boss. It is a cheerful, vibrant and casual aroma that blends fruity and woody notes for a dreamy and delicate fragrance that reminds you of a beautiful bride on a bright sunny summer day.', 1, 46)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'BS4', N'BOSS BOTTLED UNLIMITED BY HUGO BOSS FOR MEN - Eau De Toilette SPRAY', 30, 45.9900, N'img/BS4.jpg', N'Launched by the design house of Hugo Boss in the year 2014. This aromatic, fougere fragrance has a blend of mint, violet leaf, grapefruit, pineapple, cinnamon, rose, labdanum, sandalwood, and musk.', 1, 46)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'CA1', N'Eternity For Men By Calvin Klein Eau De Toilette Spray', 10, 49.9500, N'img/CA1.jpg', N'Eternity for men is an aromatic and refreshing scent released by Calvin Klein in 1990. Ã?Â? Perfect to wear any time, this classic fragrance features notes of sandalwood, vetiver, lemon and lavender.', 1, 47)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'CA2', N'Obsession For Men By Calvin Klein Eau De Toilette Spray', 10, 39.9900, N'img/CA2.jpg', N'OBSESSION cologne was launched by CALVIN KLEIN in 1986. This intensely provocative cologne is the result of the following notes: mandarin, bergamot, lavender, myrrh, clove, nutmeg and amber. When using Obsession cologne also try Obsession aftershave balm for an even deeper fragrance experience. Obsession cologne is packaged in a clear round bottle with a brown cap and is enclosed in a clean cream colored box. Other fragrances for men from Calvin Klein include Eternity and Crave.', 1, 47)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'CA3', N'Eternity Aqua Eau De Toilette Spray For Men By Calvin Klein', 10, 29.9500, N'img/CA3.jpg', N'CK Eternity Aqua is an eau de toilette for men by Calvin Klein. It is a fresh masculine fragrance with aquatic and green notes that are perfect for a warm sunny day. It has fresh citrusy notes with warm woody undertones and a hint of cool fruity berries.', 1, 47)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'CA4', N'In2U Eau De Toilette Spray For Women By Calvin Klein', 10, 39.9900, N'img/CA4.jpg', N'IN2U was launched by Calvin Klein for the young generation as a whole. Through this fragrance Calvin Klein shows that he still knows what the younger generation needs. This generation that Klein nicknamed the Ã¢Â?Â?techno-sexual generationÃ¢Â?Â is offered this interesting perfume duo in a simple yet attractive packaging. The fragrance demonstrates the freedom and possibilities that lie ahead of this generation and to express that the perfume has the youthful and lively accords of citrus, fresh spicy, and the warm hint of vanilla to it.', 1, 47)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'DD1', N'Cool Water For Women By Davidoff Eau De Toilette Spray', 25, 34.9500, N'img/DD1.jpg', N'DAVIDOFF created COOL WATER in 1996. It is the result of the following top fragrance Notes: citrus, black currant and pineapple. The middle notes are: honeydew, muguet and water lily and the base of the fragrance is: vetiver amber and mulberry. COOL WATER is a trendy fragrance.', 1, 48)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'DD2', N'Cool Water For Men By Davidoff Eau De Toilette Spray', 25, 59.9500, N'img/DD2.jpg', N'Cool Water is a fresh and simple fragrance for men. Ã?Â? Its clean and invigorating notes will awaken the senses. A classic masculine scent, Cool Water for men features notes of mint, green nuances, lavender, coriander, rosemary, geranium, neroli, jasmine, sandalwood, cedarwood, musk, amber and tobacco.', 1, 48)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'DD3', N'Zino Davidoff By Zino Davidoff For Men - Eau De Toilette', 25, 40.0000, N'img/DD3.jpg', N'Launched by the design house of Davidoff in the year of 1988. This oriental woody fragrance has a blend of lavender, palisander, clary sage, geranium, rose, lily-of-the-valley, jasmine, patchouli, cedar wood, sandalwood, and vanilla notes.', 1, 48)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'DD4', N'THE GAME BY DAVIDOFF FOR MEN - Eau De Toilette SPRAY', 25, 39.9900, N'img/DD4.jpg', N'Launched by the design house of Davidoff in the year 2013. This aromatic woody fragrance possesses a blend of iris, gin fizz, and blackwood. Idel for all.', 1, 48)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'EA1', N'Passion For Women By Elizabeth Taylor Dusting Powder', 18, 15.9900, N'img/EA1.jpg', N'PASSION, created by ELIZABETH TAYLOR, wasintroduced in 1987. This fine fragrance contains jasmine, bergamot, rose and is accented with tuberose, vanilla and musk making PASSION perfect forformal use.', 1, 44)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'EA2', N'Diamonds And Emeralds By Elizabeth Taylor For Women - Eau De Toilette', 18, 16.9900, N'img/EA2.jpg', N'Introduced by the design house of Elizabeth Taylor in the year 1993. This sharp floral fragrance has a blend of green floral, white rose, water lily, gardenia, carnation, and jasmine.', 1, 44)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'EA3', N'Diamonds And Rubies By Elizabeth Taylor For Women - Eau De Toilette', 18, 16.9900, N'img/EA3.jpg', N'Launched by the design house of Elizabeth Taylor in the year 1993. This oriental floral fragrance has a blend of peach, red rose, cyclamen, almond, heliotrope, ylang-ylang, benzoin, powdery vanilla, amber, musk, sandalwood, and lily.', 1, 44)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'EA4', N'Diamonds And Sapphires By Elizabeth Taylor For Women - Eau De Toilette', 18, 16.9900, N'img/EA4.jpg', N'Introduced in the year 1993, by the design house of Elizabeth Taylor. This fruity floral fragrance with a blend of rose, jasmine, rhubrum lily, ylang-ylang spices, freesia, lily of the valley, peach, sandalwood, and galbanum.', 1, 44)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'GA1', N'Gucci Bloom For Women By Gucci Eau De Parfum Spray', 20, 112.9500, N'img/GA1.jpg', N'Gucci Bloom for women was released by Gucci in 2017. This feminine floral fragrance features notes of Tuberose blended with Jasmine capturing the essence of walking through a spring garden. Rangoon Creeper, an exotic plant from India, adds a powdery finish to this contemporary and diverse fragrance.', 1, 43)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'GA2', N'Gucci Guilty Black For Women By Gucci Eau De Toilette Spray', 20, 66.9500, N'img/GA2.jpg', N'The Guilty Black lovers bring out the most scandalous sides of each other: alone they are magnificent, together irrepressible. Fearless in their passion, they are brazen, shameless, unpredictable ready for each and every explosive encounter. Their attraction is instinctive: they go where they scent danger and each other.  Too much is never enough for our young hedonists, who drive each other to stray ever darker. Life is thrilling and meant to be lived to the fullest. Again and again, they give in to pleasure and the excitement of breaking the rules.  Gucci Guilty Black is a sensual oriental floral, inviting you to indulge in your burning desires.', 1, 43)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'GA3', N'Memoire DUne Odeur By Gucci For Unisex - Eau De Parfum Spray', 20, 74.9500, N'img/GA3.jpg', N'Launched by the design house of Gucci. This floral fragrance has a blend of jasmine, sandalwood, musk, cedar, vanilla, almond, and chamomile notes. It is recommended for casual wear.', 1, 43)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'GA4', N'Gucci Bamboo By Gucci For Women - Eau De Toilette', 20, 88.9500, N'img/GA4.jpg', N'Launched by the design house of Gucci in the year 2016. This floral fragrance has a blend of sandalwood, sahitian vanilla, amber, casablanca lily, orange blossom, and ylang-ylang.', 1, 43)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'GI1', N'Pour Homme Eau De Toilette Spray For Men By Givenchy', 12, 55.9900, N'img/GI1.jpg', N'Givenchy introduced the world to Givenchy Pour Homme for men in 2002, a scent that expertly combined the exotic with the fresh to produce a unique, and masculine, scent. Essential for the toilette of any true gentleman, this scent is both warm and citrusy. The scent is packaged in a bottle designed by sculptor Pablo Reinoso, with clean lines and a strong silhouette.', 1, 45)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'GI2', N'Hot Couture For Women By Givenchy Eau De Parfum Spray', 12, 67.6500, N'img/GI2.jpg', N'Hot Couture women''s fragrance by Givenchy is elegant and glamorous as its name suggests. This perfume comes straight off the runway and into your senses with captivating notes like Raspberry Dew and Jasmine. ', 1, 45)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'GI3', N'Xeryus By Givenchy For Men - Eau De Toilette', 12, 44.5200, N'img/GI3.jpg', N'Launched by the design house of Givenchy in the year of 1986. This aromatic fragrance has a blend of citrus, spices, floral, cypress, sandalwood, juniper berries, leather, amber, musk, oakmoss, balsam fir, vetiver, incense, and cedar notes.', 1, 45)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'GI4', N'Xeryus Rouge For Men By Givenchy Eau De Toilette Spray', 12, 49.9900, N'img/GI4.jpg', N'GIVENCHY created XERYUS ROUGE in 1995. It is the result of the following top fragrance Notes: bergamot, fougere and lemon. The middle notes are: amber, melon and orange and the base of the fragrance is: kumquat, pimento and cedar. XERYUS ROUGE is recommended for casual use.', 1, 45)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'LC1', N'LACOSTE EAU DE LACOSTE FEMME BY LACOSTE FOR WOMEN - Eau De Parfum SPRAY', 50, 33.3800, N'img/LC1.jpg', N'Launched by the design house of Lacoste in the year 2013. This floral fruity fragrance has a blend of pineapple, mandarine orange, bergamot, jasmine, orange, vanilla, sandalwood, peru balsam, and vetiver notes', 1, 49)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'LC2', N'LHomme Intense By Lacoste For Men - Eau De Toilette Spray', 50, 40.9500, N'img/LC2.jpg', N'Launched by the design house of LHomme in the year 2018. This woody spicy fragarnce has a blend of rhubarb, quince, mandarin, orange, ginger, pepper, jasmine, almond, vetiver, cedar, AkigalawoodÃ?Â®, amber, musk and vanilla.', 1, 49)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'LC3', N'LHomme By Lacoste For Men - Eau De Toilette Spray', 50, 39.9500, N'img/LC3.jpg', N'Launched by the design house of Lacoste in the year 2017. This woody spicy fragrance has a blend of mandarian orange, sweet orange, quince, rhubarb, black pepper, ginger, jasmine, almond, cedar, amber, vanilla, and musk', 1, 49)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'LC4', N'Eau De Lacoste L.12.12 Noir For Men By Lacoste Eau De Toilette Spray', 50, 61.9500, N'img/LC4.jpg', N'EAU DE LACOSTE L.12.12 NOIR men''s cologne was launched by the designer house of LACOSTE in 2013. This new edition to the L.12.12 line of Lacoste fragrances is a very masculine scent and features notes of watermelon, basil, lavender, verbena, magnolia, absinthe, dark chocolate accord, cashmeran, coumarin and patchouli.', 1, 49)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__admin__F3DBC572B04A7493]    Script Date: 08/11/2021 13:26:34 ******/
ALTER TABLE [dbo].[admin] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__F3DBC5728805F4DF]    Script Date: 08/11/2021 13:26:34 ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [dateCreate]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Customer] ([cid])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([oID])
REFERENCES [dbo].[Bill] ([oID])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cateID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[admin]  WITH CHECK ADD CHECK  ((len([password])>=(8)))
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  ((len([password])>=(8)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([quantity]>=(0)))
GO
