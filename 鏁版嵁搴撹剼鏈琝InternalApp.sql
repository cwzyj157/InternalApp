/****** Object:  Table [dbo].[MenuFoods]    Script Date: 07/01/2013 14:50:48 ******/
DELETE FROM [dbo].[MenuFoods]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/01/2013 14:50:48 ******/
DELETE FROM [dbo].[Orders]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/01/2013 14:50:48 ******/
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([OrderID], [UserName], [ShortName], [ProviderName], [FoodName], [Count], [SumMoney], [OrderDate], [FoodId]) VALUES (34, N'陈伟', N'chenw03', N'时尚轩', N'【海带豆腐汤】 ', 4, 400.0000, CAST(0x0000A1ED00F1B5B9 AS DateTime), 2)
INSERT [dbo].[Orders] ([OrderID], [UserName], [ShortName], [ProviderName], [FoodName], [Count], [SumMoney], [OrderDate], [FoodId]) VALUES (35, N'陈伟', N'chenw03', N'时尚轩', N'【海带豆腐汤】 【海带豆腐汤】 ', 2, 100.0000, CAST(0x0000A1ED00F1B93D AS DateTime), 3)
INSERT [dbo].[Orders] ([OrderID], [UserName], [ShortName], [ProviderName], [FoodName], [Count], [SumMoney], [OrderDate], [FoodId]) VALUES (36, N'陈伟', N'chenw03', N'时尚轩', N'【海带豆腐汤】 【海带豆腐汤】 ', 2, 100.0000, CAST(0x0000A1ED00F1BCA0 AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Orders] OFF
/****** Object:  Table [dbo].[MenuFoods]    Script Date: 07/01/2013 14:50:48 ******/
SET IDENTITY_INSERT [dbo].[MenuFoods] ON
INSERT [dbo].[MenuFoods] ([FoodId], [FoodName], [ProviderName], [Price], [WeekDay], [PicName]) VALUES (2, N'【海带豆腐汤】 ', N'时尚轩', 100.0000, N'7', N'1868_Cm809.jpg')
INSERT [dbo].[MenuFoods] ([FoodId], [FoodName], [ProviderName], [Price], [WeekDay], [PicName]) VALUES (3, N'【海带豆腐汤】 【海带豆腐汤】 ', N'时尚轩', 50.0000, N'7', N'1868_Cm810.jpg')
INSERT [dbo].[MenuFoods] ([FoodId], [FoodName], [ProviderName], [Price], [WeekDay], [PicName]) VALUES (4, N'【海带豆腐汤】 【海带豆腐汤】 ', N'时尚轩', 50.0000, N'7', N'1868_Cm811.jpg')
INSERT [dbo].[MenuFoods] ([FoodId], [FoodName], [ProviderName], [Price], [WeekDay], [PicName]) VALUES (5, N'【海带豆腐汤】 【海带豆腐汤】 ', N'时尚轩', 50.0000, N'7', N'1868_Cm812.jpg')
INSERT [dbo].[MenuFoods] ([FoodId], [FoodName], [ProviderName], [Price], [WeekDay], [PicName]) VALUES (6, N'【海带豆腐汤】 【海带豆腐汤】 ', N'时尚轩', 50.0000, N'7', N'1868_Cm813.jpg')
INSERT [dbo].[MenuFoods] ([FoodId], [FoodName], [ProviderName], [Price], [WeekDay], [PicName]) VALUES (7, N'【海带豆腐汤】 【海带豆腐汤】 ', N'时尚轩', 50.0000, N'7', N'1868_Cm814.jpg')
INSERT [dbo].[MenuFoods] ([FoodId], [FoodName], [ProviderName], [Price], [WeekDay], [PicName]) VALUES (10, N'红烧肉', N'优谷', 20.0000, N'1,7', N'1868_Cm814.jpg')
SET IDENTITY_INSERT [dbo].[MenuFoods] OFF
