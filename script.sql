USE [master]
GO
/****** Object:  Database [RestaurantDB]    Script Date: 3/18/2018 10:17:42 PM ******/
CREATE DATABASE [RestaurantDB]

GO
USE [RestaurantDB]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 3/18/2018 10:17:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemNo] [int] NOT NULL,
	[ItemName] [varchar](20) NULL,
	[ItemPrice] [int] NOT NULL,
	[ItemPhotoUrl] [varchar](50) NULL,
	[TypeNo] [int] NOT NULL,
 CONSTRAINT [PK_Item_No1] PRIMARY KEY CLUSTERED 
(
	[ItemNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 3/18/2018 10:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[ItemTypeNo] [int] NOT NULL,
	[TypeName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Item_Type_No1] PRIMARY KEY CLUSTERED 
(
	[ItemTypeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/18/2018 10:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderNo] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Subtotal] [int] NOT NULL,
	[Tax] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
	[CustomerNo] [int] NOT NULL,
	[TableNo] [int] NULL,
 CONSTRAINT [PK_OrderNo] PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/18/2018 10:17:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailNo] [int] NOT NULL,
	[OrderNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetailNo] PRIMARY KEY CLUSTERED 
(
	[OrderDetailNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Item] ([ItemNo], [ItemName], [ItemPrice], [ItemPhotoUrl], [TypeNo]) VALUES (1, N'Chicken Filet', 8, N'/Content/Images/1.jpg', 2)
INSERT [dbo].[Item] ([ItemNo], [ItemName], [ItemPrice], [ItemPhotoUrl], [TypeNo]) VALUES (2, N'Fish Taco', 7, N'/Content/Images/2.jpg', 2)
INSERT [dbo].[Item] ([ItemNo], [ItemName], [ItemPrice], [ItemPhotoUrl], [TypeNo]) VALUES (3, N'Crab Soup', 8, N'/Content/Images/3.jpg', 1)
INSERT [dbo].[Item] ([ItemNo], [ItemName], [ItemPrice], [ItemPhotoUrl], [TypeNo]) VALUES (4, N'Fried Shrimp', 5, N'/Content/Images/4.jpg', 1)
INSERT [dbo].[Item] ([ItemNo], [ItemName], [ItemPrice], [ItemPhotoUrl], [TypeNo]) VALUES (5, N'Cheese Burger', 7, N'/Content/Images/5.jpg', 2)
INSERT [dbo].[ItemType] ([ItemTypeNo], [TypeName]) VALUES (1, N'Appetizer')
INSERT [dbo].[ItemType] ([ItemTypeNo], [TypeName]) VALUES (2, N'Main Course')
INSERT [dbo].[ItemType] ([ItemTypeNo], [TypeName]) VALUES (3, N'Dessert')
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_Item_No] FOREIGN KEY([ItemNo])
REFERENCES [dbo].[Item] ([ItemNo])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_Item_No]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderNo] FOREIGN KEY([OrderNo])
REFERENCES [dbo].[Order] ([OrderNo])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderNo]
GO
USE [master]
GO
ALTER DATABASE [RestaurantDB] SET  READ_WRITE 
GO
