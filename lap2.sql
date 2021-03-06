USE [UserManagerment]
GO
ALTER TABLE [dbo].[tblUsers] DROP CONSTRAINT [FK__tblUsers__RoleID__3B75D760]
GO
ALTER TABLE [dbo].[tblUsers] DROP CONSTRAINT [FK__tblUsers__ProID__3C69FB99]
GO
ALTER TABLE [dbo].[tblDetailPromotion] DROP CONSTRAINT [FK__tblDetail__UserI__3F466844]
GO
ALTER TABLE [dbo].[tblDetailPromotion] DROP CONSTRAINT [FK__tblDetail__ProID__403A8C7D]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 6/23/2021 11:07:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUsers]') AND type in (N'U'))
DROP TABLE [dbo].[tblUsers]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 6/23/2021 11:07:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRoles]') AND type in (N'U'))
DROP TABLE [dbo].[tblRoles]
GO
/****** Object:  Table [dbo].[tblPromotions]    Script Date: 6/23/2021 11:07:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPromotions]') AND type in (N'U'))
DROP TABLE [dbo].[tblPromotions]
GO
/****** Object:  Table [dbo].[tblDetailPromotion]    Script Date: 6/23/2021 11:07:42 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblDetailPromotion]') AND type in (N'U'))
DROP TABLE [dbo].[tblDetailPromotion]
GO
/****** Object:  Table [dbo].[tblDetailPromotion]    Script Date: 6/23/2021 11:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetailPromotion](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[dateJoin] [date] NULL,
	[UserID] [int] NULL,
	[ProID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPromotions]    Script Date: 6/23/2021 11:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPromotions](
	[ProID] [int] IDENTITY(1,1) NOT NULL,
	[ProName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 6/23/2021 11:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[RoleID] [int] NOT NULL,
	[RoleName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 6/23/2021 11:07:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](1000) NOT NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](12) NULL,
	[Photo] [varchar](1000) NOT NULL,
	[Status] [bit] NOT NULL,
	[intRank] [int] NULL,
	[RoleID] [int] NULL,
	[ProID] [int] NULL,
 CONSTRAINT [PK__tblUsers__1788CCAC6D57A309] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblDetailPromotion] ON 

INSERT [dbo].[tblDetailPromotion] ([detailID], [dateJoin], [UserID], [ProID]) VALUES (23, CAST(N'2021-06-23' AS Date), 2, 1)
INSERT [dbo].[tblDetailPromotion] ([detailID], [dateJoin], [UserID], [ProID]) VALUES (24, CAST(N'2021-06-23' AS Date), 7, 1)
INSERT [dbo].[tblDetailPromotion] ([detailID], [dateJoin], [UserID], [ProID]) VALUES (25, CAST(N'2021-06-23' AS Date), 1, 1)
INSERT [dbo].[tblDetailPromotion] ([detailID], [dateJoin], [UserID], [ProID]) VALUES (26, CAST(N'2021-06-23' AS Date), 3, 1)
SET IDENTITY_INSERT [dbo].[tblDetailPromotion] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPromotions] ON 

INSERT [dbo].[tblPromotions] ([ProID], [ProName]) VALUES (1, N'Promotion_List')
SET IDENTITY_INSERT [dbo].[tblPromotions] OFF
GO
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (2, N'user')
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([UserID], [UserName], [PassWord], [Email], [Phone], [Photo], [Status], [intRank], [RoleID], [ProID]) VALUES (1, N'tuan', N'd6a804981ea7ce374acc21c9a8bf82f50b684b0ea4bdf8b26a7a775291aaf7a6', N'tuanvase140819@gmail.com', N'0394705508', N'https://www.chapter3d.com/wp-content/uploads/2020/06/canon-photographer.jpg', 1, 0, 1, NULL)
INSERT [dbo].[tblUsers] ([UserID], [UserName], [PassWord], [Email], [Phone], [Photo], [Status], [intRank], [RoleID], [ProID]) VALUES (2, N'Khanh', N'd6a804981ea7ce374acc21c9a8bf82f50b684b0ea4bdf8b26a7a775291aaf7a6', N'Khaihqkse1234@gmail.com', N'01649691360', N'https://tiemanhsky.com/wp-content/uploads/2020/03/61103071_2361422507447925_6222318223514140672_n_1.jpg', 0, 7, 2, 1)
INSERT [dbo].[tblUsers] ([UserID], [UserName], [PassWord], [Email], [Phone], [Photo], [Status], [intRank], [RoleID], [ProID]) VALUES (3, N'Ta', N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce', N'Trungta@gmail.com', N'9876543210', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXAhqp0cfIN-DDcpCZpj0N_ayo9u9_86sWHw&usqp=CAU', 1, 10, 2, 1)
INSERT [dbo].[tblUsers] ([UserID], [UserName], [PassWord], [Email], [Phone], [Photo], [Status], [intRank], [RoleID], [ProID]) VALUES (4, N'Tu', N'4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a', N'Tusu@gmail.com', N'19001008', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLgSLMRDwMzTUP2zORpBrxEWb6oxweMPr5Yw&usqp=CAU', 1, 6, 2, 1)
INSERT [dbo].[tblUsers] ([UserID], [UserName], [PassWord], [Email], [Phone], [Photo], [Status], [intRank], [RoleID], [ProID]) VALUES (5, N'Chien', N'5', N'Chienka@gmail.com', N'190012348', N'https://scontent-sin6-2.xx.fbcdn.net/v/t1.6435-9/190993655_327342152094189_3042287425771330180_n.jpg?_nc_cat=1&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=xeCAk_UxtXUAX-G-qEg&_nc_ht=scontent-sin6-2.xx&oh=dea52f8c2820b6cb6e627ac02c3fb218&oe=60CCDB94', 1, 5, 2, 1)
INSERT [dbo].[tblUsers] ([UserID], [UserName], [PassWord], [Email], [Phone], [Photo], [Status], [intRank], [RoleID], [ProID]) VALUES (7, N'Dat', N'5', N'Dattienle@gmail.com', N'1900100123', N'https://scontent-sin6-2.xx.fbcdn.net/v/t1.6435-9/149738828_1063059547506140_6116827050470126068_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=xt9fgI5OU4oAX9PgQw5&_nc_ht=scontent-sin6-2.xx&oh=559444a3c20451448204aa617bf38df2&oe=60CC93A1', 1, 1, 2, 1)
INSERT [dbo].[tblUsers] ([UserID], [UserName], [PassWord], [Email], [Phone], [Photo], [Status], [intRank], [RoleID], [ProID]) VALUES (44, N'test1', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'test123@gmail.com', N'1234567890', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXJV-ULeQVyuHfECdG--T7zU1qf4vD4bhw2Q&usqp=CAU', 0, 1, 2, NULL)
INSERT [dbo].[tblUsers] ([UserID], [UserName], [PassWord], [Email], [Phone], [Photo], [Status], [intRank], [RoleID], [ProID]) VALUES (46, N'test212', N'173af653133d964edfc16cafe0aba33c8f500a07f3ba3f81943916910c257705', N'test2@gmail.com', N'01925240386', N'https://i.pinimg.com/564x/dd/0e/86/dd0e86cc6c9ae4bc0473c762e275f9c4.jpg', 0, 2, 2, NULL)
INSERT [dbo].[tblUsers] ([UserID], [UserName], [PassWord], [Email], [Phone], [Photo], [Status], [intRank], [RoleID], [ProID]) VALUES (47, N'test31', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'test31@gmail.com', N'123456789', N'https://i.pinimg.com/564x/dd/0e/86/dd0e86cc6c9ae4bc0473c762e275f9c4.jpg', 0, 4, 2, NULL)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
ALTER TABLE [dbo].[tblDetailPromotion]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[tblPromotions] ([ProID])
GO
ALTER TABLE [dbo].[tblDetailPromotion]  WITH CHECK ADD  CONSTRAINT [FK__tblDetail__UserI__3F466844] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblDetailPromotion] CHECK CONSTRAINT [FK__tblDetail__UserI__3F466844]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK__tblUsers__ProID__3C69FB99] FOREIGN KEY([ProID])
REFERENCES [dbo].[tblPromotions] ([ProID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK__tblUsers__ProID__3C69FB99]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK__tblUsers__RoleID__3B75D760] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRoles] ([RoleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK__tblUsers__RoleID__3B75D760]
GO
