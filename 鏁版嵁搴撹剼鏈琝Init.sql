USE [InternalApp]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/01/2013 14:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[ShortName] [varchar](20) NOT NULL,
	[ProviderName] [nvarchar](50) NOT NULL,
	[FoodName] [nvarchar](200) NOT NULL,
	[Count] [int] NOT NULL,
	[SumMoney] [money] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[FoodId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuFoods]    Script Date: 07/01/2013 14:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuFoods](
	[FoodId] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](200) NOT NULL,
	[ProviderName] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[WeekDay] [varchar](20) NOT NULL,
	[PicName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MenuFoods] PRIMARY KEY CLUSTERED 
(
	[FoodId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
