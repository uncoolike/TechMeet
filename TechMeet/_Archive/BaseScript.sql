IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Positions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Locations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
ALTER TABLE [dbo].[Locations] DROP CONSTRAINT IF EXISTS [FK_Locations_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_OpenPositions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_ApplicationStatus]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[Positions]
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[OpenPositions]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[Locations]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[ApplicationStatus]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[Applications]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/3/2021 9:21:39 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[OpenPositionId] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ApplicationDate] [date] NOT NULL,
	[ManagerNotes] [varchar](2000) NULL,
	[ApplicationStatus] [int] NOT NULL,
	[ResumeFilename] [varchar](75) NOT NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationStatus](
	[ApplicationStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[StatusDescription] [varchar](250) NULL,
 CONSTRAINT [PK_ApplicationStatus] PRIMARY KEY CLUSTERED 
(
	[ApplicationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[StoreNumber] [varchar](10) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ManagerId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpenPositions](
	[OpenPositionId] [int] IDENTITY(1,1) NOT NULL,
	[PoisitionId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_OpenPositions] PRIMARY KEY CLUSTERED 
(
	[OpenPositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[PositionId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[JobDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/3/2021 9:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ResumeFilename] [varchar](75) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202101261500430_InitialCreate', N'TechMeet.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4D416CECA9726488DDD14CEDA6E8DC61764EDA06F0157E2AE8548942251AE8DA25FD6877E527FA14389BAF1A2CBAEBCBB2E02042B727866381C92C3E1D0FFFEFDCFF8E747DF331E7014BB01999807A37DD3C0C40E1C972C27664217AFDE9A3FBFFBF69BF199E33F1A9F72BA2346072D493C31EF290D8F2D2BB6EFB18FE291EFDA5110070B3AB203DF424E601DEEEFFF641D1C5818204CC0328CF1C78450D7C7E9077C4E0362E39026C8BB0C1CECC5BC1C6A6629AA71857C1C87C8C613F316DBF79718D3D1DDC5E8F2D37494B5308D13CF4520CD0C7B0BD3408404145190F5F82EC6331A0564390BA10079B74F2106BA05F262CCFB705C9277EDCEFE21EB8E5536CCA1EC24A681DF13F0E088EBC7129BAFA465B3D01F68F00C344D9F58AF532D4ECC0B07A7451F030F1420323C9E7A11239E9897058B9338BC0285E70D4719E47904707F04D197511571CFE8DC6EAFB0A7C3D13EFBB7674C138F26119E109CD008797BC64D32F75CFB37FC741B7CC1647274305F1CBD7DFD0639476F7EC447AFAB3D85BE025DAD008A6EA220C411C8861745FF4DC3AAB7B3C48645B34A9B4C2B604B30354CE3123D7EC06449EF61D21CBE358D73F7113B790937AE3BE2C24C8246344AE0F32AF13C34F770516F35F264FF37703D7CFD6610AE57E8C15DA6432FF0878913C1BCFA88BDB436BE77C36C7AD5C6FB33273B8F029F7DD7ED2BABFD3C0B92C8669D09B424B7285A625A976E6C95C6DBC9A419D4F0669DA3EEBE69334965F35692B20EAD321372169B9E0DB9BCCFCBB7B3C59D84210C5E6A5A4C234D06A7DEB04602C29E91D395B673D0D57608F4E9FFBC149EF9C8F506580B3B70015764E1463E2E7AF93E00CB43A4B7CC37288E6129707E45F17D83E8F07300D167D84E22B0D019457EF8ECDC6EEE0382AF127FCE0C7F73BC061B9ADB3F827364D3203A23ACD5DA781F02FB4B90D033E29C228AEFA89D03B2CF5BD7EF0E30883827B68DE3F81C8C193BD3003CED1CF082D0A3C3DE706C75DAB62F32F590EBAB9D11611DFD9C93960E899A42724A34642AC7A449D40FC1D225DD44CD49F5A26614ADA272B2BEA232B06E92724ABDA02941AB9C19D560AE5E3A42C3FB7A29ECEE3B7BEB6DDEBAB5A0A2C619AC90F8174C7004CB98738328C5112947A0CBBAB10D67211D3EC6F4D9F7A694D327E42543B35A6936A48BC0F0B32185DDFDD9908A09C50FAEC3BC920E27A09C18E03BD1AB0F57ED734E906CD3D3A1D6CD4D33DFCC1AA09B2E27711CD86E3A0B14B12F1EB9A8CB0F3E9CD11EC6C87A238642A06360E82EDBF2A004FA668A46754D4EB18729364EEC2C363845B18D1C598DD021A78760F98EAA10AC0C89D485FB41E209968E23D608B143500C33D525549E162EB1DD1079AD5A125A76DCC258DF0B1E62CD290E31610C5B35D185B93A02C20428F80883D2A6A1B155B1B86643D478ADBA316F7361CB719702131BB1C916DF596397DC7F7B16C36CD6D8068CB359255D04D046F3B661A0FCACD2D500C483CBAE19A87062D2182877A93662A0758D6DC140EB2A7971069A1D51BB8EBF705EDD35F3AC1F9437BFAD37AA6B0BB659D3C78E9966E67B421B0A2D70249BE7E99C55E247AA389C819CFC7C167357573411063EC3B41EB229FD5DA51F6A35838846D404581A5A0B28BF079480A409D543B83C96D7281DF7227AC0E671B74658BEF60BB0151B90B1ABF7A11542FDADA9689C9D4E1F45CF0A6B908CBCD361A182A3300871F1AA77BC835274715959315D7CE13EDE70A5637C301A14D4E2B96A94947766702DE5A6D9AE259543D6C7255B4B4B82FBA4D152DE99C1B5C46DB45D490AA7A0875BB0968AEA5BF840932D8F7414BB4D5137B6B254295E30B6343955E34B14862E595672AC788931CB12ACA6AF66FDB38EFC0CC3B26345F251216DC18906115A62A1165883A4E76E14D35344D11CB138CFD4F12532E5DEAA59FE7396D5ED531EC47C1FC8A9D96F7E57A8BEBDAFEDB7B243C271CEA1973EF36AD250BAC206D4CD0D96F7863C1429A2F7D3C04B7CA277B2F4ADB33BBC6AFBAC4446185B82FC921325694C7275EBEAEF3438F2C41870A00A3F66F5C1D243E8549E7BA155A5EB3C533D4A1EA8AAA2E882575B1B3C9D43D37BC0447FB1FF78B5223CCFFCE2492A55005ED413A392E7208155EABAA3D65351AA98F59AEE8842BE491552A8EA216535ABA42664B562253C8D46D514DD39C879245574B9B63BB222A3A40AADA85E015B21B358D71D5591745205565477C72E3350C48574877730ED2966AD2D2C3BECAEB78769309E67551C660BACDCE957812AC53DB1F8ADBD04C6CB77D2A2B427BEB52C2A8B73AC67511A0CFD0A54BB11AF2F408DD7F87ACCDA35776D916FBAE6D7E3F5B3DB67B50EE9D0279214DC8BC39F70C81BF30357FBEB1AE90496919846AE46D8E09F628AFD112318CDBE7A53CFC56C39CF092E11711738A6596A8779B87F70283CCED99D8732561C3B9EE2C0AA7B2D531FB30D6469910714D9F728927326D6784C52824AE1E80BE2E0C789F967DAEA388D6CB05F69F19E7111DF11F76B0215B751828DBFE41CD06192EB3B3CE72804FDEB45BC93E8AEF28BDF3F674DF78CEB08A6D3B1B12F287A95E1AFBF9EE8254DD6740D69567E53F172675BEDBD821255982DAB3F4F98BB7490A709B994DFF9E8F1FBBEA2299F1FAC85A878623014DE202AD43D2158054BFB7CC0814F9A3E1FE8D759F573825544D33E2570497F30F12141F765286FB9C57D487168DAC49294EAB935117BADACCC6DEF4D52BEF65A135DCEC9EE013768DEF57A2ECA0BCB671E6CEB54A42B0F86BD4DBB7FF61CE55D494B2E9DF6ED66236F3201B9E172E97F9577BC0399728ACC9FED67176FDAD67451E01D4FD1EC9743BC63C6C6B7F9ED670A6FDAD87401E21D37B65EF9C03B666BDBDA3FB76C699DB7D0AD67F7CA894A9ADB1C5514B92D7B370BB9C3F17F1E8011641E65F6E8529D2ED694EADAC2B024D133D5E7A9898CA58923F195289AD9F6EB2BDFF01B3BCB699AD96AB23B9B78F3F5BF9137A769E6ADC999DC46DEB1326B51950BDEB28E35A552BDA43CE35A4F5AD2DADB7CD6C6ABF99794563C88526AB34773BBFC72B2880751C99053A747D6B07C510C7B67E58F35C2FE1DBBCB1282FDE94682EDDAAE59D05C9045906FDE8244398910A1B9C41439B0A59E44D45D209B42350B40A7AFC6D3A01EBB069963E7825C27344C287419FB73AF16F0624E4013FF3435BA2EF3F83A645FF1105D00315D16B8BF26EF13D7730AB9CF1531210D04F32E78B8978D256561DFE553817415908E405C7D8553748BFDD003B0F89ACCD0035E453630BF0F7889ECA73202A803691F88BADAC7A72E5A46C88F3946D91E3EC1861DFFF1DD7FFD41CAC8B3540000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (2, 8, N'821f6544-c6bf-4114-a49a-51a487efc253', CAST(N'2021-02-01' AS Date), N'Keep an eye on this one, seems good.', 1, N'noPDF.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (5, 11, N'821f6544-c6bf-4114-a49a-51a487efc253', CAST(N'2021-02-01' AS Date), NULL, 5, N'noPDF.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (7, 12, N'821f6544-c6bf-4114-a49a-51a487efc253', CAST(N'2021-02-01' AS Date), NULL, 2, N'noPDF.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (8, 8, N'1ac34627-573a-4822-9f8d-8ebc4700da63', CAST(N'2021-02-02' AS Date), NULL, 4, N'703f369d-25c9-4b42-9632-3ae7fe9264e1.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (11, 8, N'821f6544-c6bf-4114-a49a-51a487efc253', CAST(N'2021-02-02' AS Date), NULL, 2, N'noPDF.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (12, 8, N'a93fbaaa-bc24-431c-8a2c-77f7c60f84e9', CAST(N'2021-02-02' AS Date), NULL, 1, N'021dd317-a54e-4dea-befc-94073a89d20b.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (13, 18, N'1ac34627-573a-4822-9f8d-8ebc4700da63', CAST(N'2021-02-02' AS Date), NULL, 2, N'703f369d-25c9-4b42-9632-3ae7fe9264e1.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (14, 14, N'1ac34627-573a-4822-9f8d-8ebc4700da63', CAST(N'2021-02-02' AS Date), NULL, 2, N'703f369d-25c9-4b42-9632-3ae7fe9264e1.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (15, 15, N'1ac34627-573a-4822-9f8d-8ebc4700da63', CAST(N'2021-02-02' AS Date), NULL, 2, N'703f369d-25c9-4b42-9632-3ae7fe9264e1.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (16, 8, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-02' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (17, 27, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-02' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (18, 12, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-02' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (19, 28, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-02' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (20, 23, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-02' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (21, 14, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-02' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (22, 8, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-02' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (23, 8, N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', CAST(N'2021-02-03' AS Date), NULL, 2, N'd0a22711-42c7-4f02-83e9-7e7f69d6a567.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (24, 9, N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', CAST(N'2021-02-03' AS Date), NULL, 2, N'd0a22711-42c7-4f02-83e9-7e7f69d6a567.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (25, 21, N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', CAST(N'2021-02-03' AS Date), NULL, 2, N'd0a22711-42c7-4f02-83e9-7e7f69d6a567.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (26, 22, N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', CAST(N'2021-02-03' AS Date), NULL, 2, N'd0a22711-42c7-4f02-83e9-7e7f69d6a567.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (27, 23, N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', CAST(N'2021-02-03' AS Date), NULL, 2, N'd0a22711-42c7-4f02-83e9-7e7f69d6a567.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (28, 26, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-03' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (29, 27, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-03' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (30, 12, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-03' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (31, 32, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-03' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (32, 34, N'd466dbea-411d-4994-a6c9-227673ea0eb5', CAST(N'2021-02-03' AS Date), NULL, 2, N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (33, 30, N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', CAST(N'2021-02-03' AS Date), NULL, 2, N'd0a22711-42c7-4f02-83e9-7e7f69d6a567.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (34, 33, N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', CAST(N'2021-02-03' AS Date), NULL, 2, N'd0a22711-42c7-4f02-83e9-7e7f69d6a567.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenPositionId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatus], [ResumeFilename]) VALUES (35, 34, N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', CAST(N'2021-02-03' AS Date), NULL, 2, N'd0a22711-42c7-4f02-83e9-7e7f69d6a567.pdf')
SET IDENTITY_INSERT [dbo].[Applications] OFF
GO
SET IDENTITY_INSERT [dbo].[ApplicationStatus] ON 

INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (1, N'Read', N'The employer has, or, is reviewing your application and will respond soon.')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (2, N'Unread', N'The employer has received your application but has yet to review it.')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (3, N'Approved', N'Your application has been reviewed and the employer would like to advance in the hire process.')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (4, N'Refused', N'Your application has been rejected by the employer.')
INSERT [dbo].[ApplicationStatus] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (5, N'Pending', N'The reviewer has some questions pending over your application and would like a chance to speak with you before making their final decision.')
SET IDENTITY_INSERT [dbo].[ApplicationStatus] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b3ee40d7-8334-4c79-874a-984d857d44e4', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fba1f6e4-75c8-4101-a5f2-583c8f370b78', N'Manager')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'433f18f8-05aa-46ff-aecc-0e347c551956', N'b3ee40d7-8334-4c79-874a-984d857d44e4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4d68b7ec-1c22-43be-b12a-15d4494d5fd8', N'b3ee40d7-8334-4c79-874a-984d857d44e4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1ac34627-573a-4822-9f8d-8ebc4700da63', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1b9ff178-0349-4969-b138-d6002a35c34c', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'79c83f57-eff0-4394-ab7c-4ccc26bc91aa', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'821f6544-c6bf-4114-a49a-51a487efc253', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'85154853-53b7-490e-8a6e-10b845eae27a', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'91afde15-8fac-4528-ab50-63970313794e', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a93fbaaa-bc24-431c-8a2c-77f7c60f84e9', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c507a904-bc2d-4ae9-bb65-d1b5d2f25ad6', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c904ce86-9312-4e0a-a907-75c99012babe', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e9d18672-5cb3-4c1b-a8f9-f7f5ec7530b5', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f26a613a-776f-4087-a863-4baf74ded664', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f611de90-3798-4ab4-91f1-19c39b41b379', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', N'c72f3d99-c7a4-4045-81d9-aeeada6ffa5d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0876b6b8-287b-4a7e-82c4-6bfc7a614553', N'fba1f6e4-75c8-4101-a5f2-583c8f370b78')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'17161d90-bb89-4e16-828f-064facd96fa2', N'fba1f6e4-75c8-4101-a5f2-583c8f370b78')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'85b6a194-ff9e-4436-a998-ba1cee211d2e', N'fba1f6e4-75c8-4101-a5f2-583c8f370b78')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd466dbea-411d-4994-a6c9-227673ea0eb5', N'fba1f6e4-75c8-4101-a5f2-583c8f370b78')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0876b6b8-287b-4a7e-82c4-6bfc7a614553', N'manager@techmeet.com', 0, N'AJWxNrGEfA7OXJALFhuM/mU02AYCnjGZIijHbMWbnVi3VnnqCiZsVUzfnfrKEdANHw==', N'dcb92168-8d0e-40ad-b7fc-fcf12df15112', NULL, 0, 0, NULL, 1, 0, N'manager@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'17161d90-bb89-4e16-828f-064facd96fa2', N'chuckwieners@techmeet.com', 0, N'AN/NKbfpZWvE6awh9P2DOAB2ZCPkiu6Cbf6U874VZSw7JLLcKBk2RPp+qa8ts8vNBA==', N'43f7a8d0-e6d1-4cd2-a4ba-b96c6b9b939b', NULL, 0, 0, NULL, 1, 0, N'chuckwieners@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1ac34627-573a-4822-9f8d-8ebc4700da63', N'employee@techmeet.com', 0, N'ACO4zQukIMomD1sFl8Qs1/jGhyPI7UAMkMQbCOv9d9mjOhKooerEFijI56gjZUAKMg==', N'0efed9fc-8809-45ee-b662-1f07198846a9', NULL, 0, 0, NULL, 1, 0, N'employee@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1b9ff178-0349-4969-b138-d6002a35c34c', N'milesdavidson@techmeet.com', 0, N'AD6Yod38Cpd0niYBzaUGfs/K6Wxh23WoU/hyPaV5FLY6H4fmTEKEAbVfqTIlA0P5TA==', N'9045a766-526c-4fd9-9aef-13ebdba295cc', NULL, 0, 0, NULL, 1, 0, N'milesdavidson@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'433f18f8-05aa-46ff-aecc-0e347c551956', N'admin@techmeet.com', 0, N'AEUKP6mU9qYXuG64Vt9rFjVWypLpkGZCo9D/4FNjz7W4pKdMnd0jyCNjDwkkdvp+kQ==', N'9785cfb2-9242-4d28-b4ad-c9337eb0b0b3', NULL, 0, 0, NULL, 1, 0, N'admin@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4d68b7ec-1c22-43be-b12a-15d4494d5fd8', N'testadmin2@techmeet.com', 0, N'AAZdFFB07gj7SjsM3HXeh/SHAUWnEreAp/6V0ig8vmBScmFGHVI92OX10dbwou3ouA==', N'b6487bad-2f77-46db-9101-1121208a51cf', NULL, 0, 0, NULL, 1, 0, N'testadmin2@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'79c83f57-eff0-4394-ab7c-4ccc26bc91aa', N'testuser@email.com', 0, N'AEty6XNp3OqhpO+RN7aiLm+OLDD1hYPklFBey7pQZJCus3ovrXyPonGJQgQ/QK11PA==', N'ce6a5ce3-aa05-4a5f-845d-adf213541dd3', NULL, 0, 0, NULL, 1, 0, N'testuser@email.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'821f6544-c6bf-4114-a49a-51a487efc253', N'donjohnson@techmeet.com', 0, N'AE8wbwCbcrxbZELGz/LafmtJ9s05PW8d00sS8I+3BMHN0mAo0FFRWHVy55h7ChyQWQ==', N'05e777df-2611-4e18-97b3-f3a260459820', NULL, 0, 0, NULL, 1, 0, N'donjohnson@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'85154853-53b7-490e-8a6e-10b845eae27a', N'testemployee@techmeet.com', 0, N'AMa07cq4Z8M0l1cVUwrlpaRO9nIalFPYoxiu8cpYgAAMUomgQNUa2XUhsv6J16Xq3g==', N'a370e8fd-64c8-4420-8b61-1ef6690778f3', NULL, 0, 0, NULL, 1, 0, N'testemployee@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'85b6a194-ff9e-4436-a998-ba1cee211d2e', N'testguy@techmeet.com', 0, N'AP587IwosQn7GfAay0rKOMd9s9WQwsMWdJPR9Wa1wty/GgVzyItIYKZ2pG644SHwEg==', N'a26573b1-b799-45e6-b831-d9e13271f723', NULL, 0, 0, NULL, 1, 0, N'testguy@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'91afde15-8fac-4528-ab50-63970313794e', N'ashleighhughes@techmeet.com', 0, N'ACPA29p+vwSjbIqErNH6kyOFKrG2XP/ngBZbu/d9Nr8ND38V6UynhS71bFPxKvgynQ==', N'd1306ad4-fc62-4090-a58d-2dea51553a39', NULL, 0, 0, NULL, 1, 0, N'ashleighhughes@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a93fbaaa-bc24-431c-8a2c-77f7c60f84e9', N'testguy3@techmeet.com', 0, N'AFTiZnN1CGI4f2C7pAZypsLfFWdvTiU0oC5GlEreij3tzwkkQ7XDFnSrJCY79/QErQ==', N'16b8c68f-53c3-4f38-857e-388fecf0d642', NULL, 0, 0, NULL, 1, 0, N'testguy3@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c507a904-bc2d-4ae9-bb65-d1b5d2f25ad6', N'frankferdinand@techmeet.com', 0, N'ANQX+tGhMcwdpHFRF1apkGuSZhuc8dk4/oxymksgvG1jz/66aAau/PrQ3xauxogNmQ==', N'f2cee577-eb60-4138-ac13-809351d2c9cf', NULL, 0, 0, NULL, 1, 0, N'frankferdinand@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c904ce86-9312-4e0a-a907-75c99012babe', N'tesguy2@techmeet.com', 0, N'AISDCKt8GLqQY2oARj6+v9hFQ1vxEz7m/SImHMFJP7iHjCytELBL8aUqJ83iXBVYgA==', N'290b18fe-dc7f-4247-8637-1e8bbf10009d', NULL, 0, 0, NULL, 1, 0, N'tesguy2@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd466dbea-411d-4994-a6c9-227673ea0eb5', N'testmanager2@techmeet.com', 0, N'ACI4UmUimAk6DfcucSiI2iOkOF4NzvqHutpxOwae/dKIfnYBRuaDO4dbw085JQB63Q==', N'3730cf08-7222-4db2-93ae-85cd1e6de22a', NULL, 0, 0, NULL, 1, 0, N'testmanager2@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e9d18672-5cb3-4c1b-a8f9-f7f5ec7530b5', N'vincentvangogh@techmeet.com', 0, N'ACFBAS7vB1GuAwOkY+b8ClW1pxsoQ0TFDN9y6fB1rUFSAdeWlWtw4gYn18kzZ6SsNw==', N'e5fc81fd-57a6-4235-995e-d97b6e845511', NULL, 0, 0, NULL, 1, 0, N'vincentvangogh@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f26a613a-776f-4087-a863-4baf74ded664', N'guillermolopez@techmeet.com', 0, N'AE7qb+jyorrp/lRB8zfL2H7w/LGUKalhHEusRgCuYtPOlHT3Q4T8NMZ/lkr9xGWNtw==', N'323835cb-f310-43d7-8966-907e45e4d6d5', NULL, 0, 0, NULL, 1, 0, N'guillermolopez@techmeet.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f611de90-3798-4ab4-91f1-19c39b41b379', N'testuser2@email.com', 0, N'AJxMTIIt5SBi1nFT28l69RQsvY2Aecs/X03uPG7ZI/mCdnqDUZf0Bb7dxJ2IgQVuHQ==', N'92769871-96f0-4402-94e1-df3556153c68', NULL, 0, 0, NULL, 1, 0, N'testuser2@email.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', N'testemployee2@techmeet.com', 0, N'AMVBT1QpulvnpAKtUSjBYfRmivp/TlZp+aUxzPWH/Y4iSPmNDf4eW7MtC2kZLWDG3A==', N'36ddeb6d-e13b-4069-9dc6-49dc290c54a4', NULL, 0, 0, NULL, 1, 0, N'testemployee2@techmeet.com')
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (6, N'1225', N'Kansas City', N'MO', N'0876b6b8-287b-4a7e-82c4-6bfc7a614553')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (7, N'4301', N'Wichita', N'KS', N'17161d90-bb89-4e16-828f-064facd96fa2')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (8, N'1226', N'Topeka', N'KS', N'85b6a194-ff9e-4436-a998-ba1cee211d2e')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (9, N'2238', N'Kansas City', N'KS', N'd466dbea-411d-4994-a6c9-227673ea0eb5')
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[OpenPositions] ON 

INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (8, 1, 6)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (9, 1, 7)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (10, 2, 6)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (11, 5, 7)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (12, 9, 8)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (13, 7, 8)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (14, 8, 7)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (15, 4, 8)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (16, 4, 7)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (17, 6, 8)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (18, 4, 6)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (21, 1, 7)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (22, 1, 8)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (23, 1, 8)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (24, 2, 7)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (25, 7, 8)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (26, 9, 6)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (27, 9, 6)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (28, 1, 8)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (30, 9, 9)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (31, 5, 6)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (32, 6, 9)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (33, 8, 9)
INSERT [dbo].[OpenPositions] ([OpenPositionId], [PoisitionId], [LocationId]) VALUES (34, 8, 9)
SET IDENTITY_INSERT [dbo].[OpenPositions] OFF
GO
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (1, N'Computer and Information Research Scientist', N'Computer and information research scientists invent and design new approaches to computing technology and find innovative uses for existing technology.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (2, N'Computer Network Architect', N'Computer network architects design and build data communication networks, including local area networks (LANs), wide area networks (WANs), and Intranets.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (3, N'Computer Support Specialist', N'Computer support specialists provide help and advice to computer users and organizations.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (4, N'Computer Systems Analyst', N'Computer systems analysts study an organization’s current computer systems and find a solution that is more efficient and effective.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (5, N'Database Administrator', N'Database administrators (DBAs) use specialized software to store and organize data.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (6, N'Information Security Analyst', N'Information security analysts plan and carry out security measures to protect an organization’s computer networks and systems.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (7, N'Network and Computer Systems Administrator', N'Network and computer systems administrators are responsible for the day-to-day operation of computer networks.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (8, N'Software Developer', N'Software developers create the applications or systems that run on a computer or another device.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (9, N'Web Developer', N'Web developers create and maintain websites. Digital designers develop, create, and test website or interface layout, functions, and navigation for usability.')
SET IDENTITY_INSERT [dbo].[Positions] OFF
GO
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'0876b6b8-287b-4a7e-82c4-6bfc7a614553', N'John', N'Johnson', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'17161d90-bb89-4e16-828f-064facd96fa2', N'Chuck', N'Wieners', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'1ac34627-573a-4822-9f8d-8ebc4700da63', N'Michael', N'Benelli', N'703f369d-25c9-4b42-9632-3ae7fe9264e1.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'433f18f8-05aa-46ff-aecc-0e347c551956', N'Marissa', N'Martell', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'4d68b7ec-1c22-43be-b12a-15d4494d5fd8', N'Benjamin', N'Test', N'b5b84661-8c80-4676-ab28-9d47c247ad57.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'821f6544-c6bf-4114-a49a-51a487efc253', N'don', N'johnson', N'noPDF.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'85154853-53b7-490e-8a6e-10b845eae27a', N'Test', N'Employee', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'85b6a194-ff9e-4436-a998-ba1cee211d2e', N'TheTestingGuy', N'Test', N'9e1202af-2cdf-40f9-888f-8134dc76b785.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'91afde15-8fac-4528-ab50-63970313794e', N'Ashleigh', N'Hughes', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'a93fbaaa-bc24-431c-8a2c-77f7c60f84e9', N'tesg', N'guy', N'021dd317-a54e-4dea-befc-94073a89d20b.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'c507a904-bc2d-4ae9-bb65-d1b5d2f25ad6', N'Frank', N'Ferdinand', N'noPDF.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'd466dbea-411d-4994-a6c9-227673ea0eb5', N'Johnny', N'Test', N'f94b515d-117f-4307-bbcf-18d7bf7b0717.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'e9d18672-5cb3-4c1b-a8f9-f7f5ec7530b5', N'Vincent', N'VanGogh', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'f26a613a-776f-4087-a863-4baf74ded664', N'Guillermo', N'Lopez', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'fbe964c4-1534-46d0-9c4c-9b57a33fc468', N'Jenny', N'Test', N'd0a22711-42c7-4f02-83e9-7e7f69d6a567.pdf')
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_ApplicationStatus] FOREIGN KEY([ApplicationStatus])
REFERENCES [dbo].[ApplicationStatus] ([ApplicationStatusId])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_ApplicationStatus]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_OpenPositions] FOREIGN KEY([OpenPositionId])
REFERENCES [dbo].[OpenPositions] ([OpenPositionId])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_OpenPositions]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_UserDetails]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_UserDetails] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_UserDetails]
GO
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Locations]
GO
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Positions] FOREIGN KEY([PoisitionId])
REFERENCES [dbo].[Positions] ([PositionId])
GO
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Positions]
GO
