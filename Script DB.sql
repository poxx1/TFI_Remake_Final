USE [master]
GO
/****** Object:  Database [tfi]    Script Date: 18/12/2023 22:51:09 ******/
CREATE DATABASE [tfi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tfi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tfi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tfi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tfi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tfi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tfi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tfi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tfi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tfi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tfi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tfi] SET ARITHABORT OFF 
GO
ALTER DATABASE [tfi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tfi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tfi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tfi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tfi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tfi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tfi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tfi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tfi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tfi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tfi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tfi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tfi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tfi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tfi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tfi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tfi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tfi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tfi] SET  MULTI_USER 
GO
ALTER DATABASE [tfi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tfi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tfi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tfi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tfi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tfi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tfi', N'ON'
GO
ALTER DATABASE [tfi] SET QUERY_STORE = ON
GO
ALTER DATABASE [tfi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tfi]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 18/12/2023 22:51:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[Time] [nvarchar](50) NOT NULL,
	[Info] [nvarchar](50) NOT NULL,
	[Priority] [nvarchar](50) NOT NULL,
	[Activity] [nvarchar](50) NOT NULL,
	[dvh] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 18/12/2023 22:51:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Precio] [nchar](10) NOT NULL,
	[dvh] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dvv]    Script Date: 18/12/2023 22:51:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvv](
	[dvv] [nvarchar](max) NOT NULL,
	[tablename] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interpretaciones]    Script Date: 18/12/2023 22:51:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interpretaciones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[ID_user] [int] NOT NULL,
	[Aprobada] [bit] NOT NULL,
	[Fecha] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 18/12/2023 22:51:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Name] [nvarchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Permission] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[dvh] [nvarchar](200) NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission_Permission]    Script Date: 18/12/2023 22:51:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission_Permission](
	[ID_Permission_Father] [int] NOT NULL,
	[ID_Permission_Child] [int] NOT NULL,
	[dvh] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Permission]    Script Date: 18/12/2023 22:51:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Permission](
	[ID_User] [int] NOT NULL,
	[ID_Permission] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/12/2023 22:51:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Dni] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Nickname] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[dvh] [nvarchar](max) NOT NULL,
	[Language_Id] [int] NOT NULL,
	[Tries] [int] NOT NULL,
	[Blocked] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1013, N'admin', N'10/02/23', N'21:53:42', N'El usuario  se logueo.', N'Baja', N'Login', N'ef3c7f8a44402c5e9570035b2c713014ecd8270f1285ddc1e75e488e5110e5b7')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1014, N'admin', N'10/02/23', N'21:54:17', N'El usuario  se logueo.', N'Baja', N'Login', N'f37ab98fba7a41d704e8b4cd21084e70dd12a8598b0519084b59b3cdc128d7ba')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1015, N'admin', N'10/02/23', N'21:54:18', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'8c16b9d83f39f4f01a76164958f0969737f922eddf0b166d7e568dff607232e2')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1016, N'julian', N'10/02/23', N'21:57:41', N'El usuario  se logueo.', N'Baja', N'Login', N'ddf4e624512b93ce2e7dac30aa9b2a7703ddec38746b930cfe2d564dc71aa8b6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1017, N'julian', N'10/02/23', N'21:57:44', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'61ba84c412c6b2c6096de21d2ba57fbdb53e5b7d454c67481c94d36a1b96f25c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1020, N'admin', N'10/02/23', N'23:23:48', N'El usuario  se logueo.', N'Baja', N'Login', N'6a0f868542b5e897ec51eb8fbac303b6eb08d2303d5c73c9d9b7d2d958fe0a84')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1021, N'admin', N'10/02/23', N'23:24:27', N'El usuario  se logueo.', N'Baja', N'Login', N'ec1c917bd5457b7f2010a6a0090ee97c361f3ef7c4138e3f4025e5f829a8cfed')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1022, N'julian', N'10/02/23', N'23:25:27', N'El usuario  se logueo.', N'Baja', N'Login', N'650725ebdf7191ffcb1131dfc1257ad032d91d9c7f50df6dc45a01eb3de2e062')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1023, N'julian', N'10/02/23', N'23:25:31', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'da26e09eda5c7a2268c80ec8649e8ae761795b62b09f38f821692795504b90f9')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1024, N'admin', N'10/02/23', N'23:35:05', N'El usuario  se logueo.', N'Baja', N'Login', N'370259b4e500192e558c7041d318b1e20935ab40b3ee47545309a61fb6da188e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1025, N'admin', N'10/02/23', N'23:35:07', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'fe8b013712fb3d779bf762edbec3e5b9cea3489b02e3ac698d573aa3f6370a30')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1028, N'admin', N'10/02/23', N'23:49:20', N'El usuario  se logueo.', N'Baja', N'Login', N'ebf96961c7441e187daaf02c0cebd9deb38d289db518a7e250be88471cf786f5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1030, N'admin', N'10/03/23', N'01:22:56', N'El usuario  se logueo.', N'Baja', N'Login', N'1045d872bd2a432983a467cbf94ab836b8e08a2a3b5d51e993c1ffbacc8e0885')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1031, N'admin', N'10/03/23', N'01:24:13', N'El usuario  se logueo.', N'Baja', N'Login', N'5f81fda804aaeeca532c0861e4548a92af1900947f4e9329e4da103d695b72d5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1032, N'admin', N'10/03/23', N'01:26:19', N'El usuario  se logueo.', N'Baja', N'Login', N'b6a2abed76dde0940be7c50d27fc363f9880c56038f299d5f096bdea74023818')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1033, N'admin', N'10/03/23', N'01:27:29', N'El usuario  se logueo.', N'Baja', N'Login', N'e25f0813805adf55ea3dbbf6717fd4b1c5348f294309dc8b06ac6c6025ba6647')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1034, N'admin', N'10/03/23', N'01:28:04', N'El usuario  se logueo.', N'Baja', N'Login', N'65ae43c03a7f0a78575e398d761333c091f99557e1a0144ae4f693672b0c1d10')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1035, N'davidg', N'10/03/23', N'01:28:38', N'El usuario  se logueo.', N'Baja', N'Login', N'33488d464d18afd93ff94b61da044c695eb49f5230a2904caa6a1f4c0afe8aaa')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1036, N'admin', N'10/03/23', N'01:29:07', N'El usuario  se logueo.', N'Baja', N'Login', N'f7b1d6257fb3967cf457b1db35dcdc3abcbffbc31446b9ea352797ab65b00396')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1038, N'admin', N'10/03/23', N'01:40:48', N'El usuario  se logueo.', N'Baja', N'Login', N'2d202e24508bb37a00dee6fcacd0a5e3e48046be6f9d40cc0e018a41afde7035')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1039, N'admin', N'10/03/23', N'01:48:39', N'El usuario  se logueo.', N'Baja', N'Login', N'bcd43c571cf3ae8c4d885d8d2c807da31e1786e8a01a3fea0b620a668580031a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1040, N'admin', N'10/03/23', N'01:52:26', N'El usuario  se logueo.', N'Baja', N'Login', N'98e0362d617227c4b176cdc0bddd0a656a9ea16b5e3e18f6f2371b92e49593e7')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1041, N'admin', N'10/03/23', N'01:52:31', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'fb2f529edaa9f085615f98bdb849f6f88b78e1125764f99b03f7dcecb9e22ee3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1049, N'admin', N'10/03/23', N'02:10:09', N'El usuario  se logueo.', N'Baja', N'Login', N'23e9f26bd37b028601b7747300767950e02ce9f03113712ee78d96ca1d33122e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1054, N'admin', N'10/03/23', N'02:18:57', N'El usuario  se logueo.', N'Baja', N'Login', N'a99fe2b5c7bde715b0f6949eb95f0345b3a447178e0e27ea3c46046c67e14beb')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1058, N'admin', N'10/03/23', N'02:29:46', N'El usuario  se logueo.', N'Baja', N'Login', N'5d39b743df98238dfb21ae446ace747300dae2c062886fbdc371edc59a2e3eb6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1064, N'admin', N'10/03/23', N'02:44:06', N'El usuario  se logueo.', N'Baja', N'Login', N'cc8d27b63811c21265bafbce015914dffe8ca97c558934b92a65360428c57077')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2013, N'admin', N'10/03/23', N'11:34:26', N'El usuario  se logueo.', N'Baja', N'Login', N'2a8fcc198d6badec6b7192294ea02b5b3d01624ed7991f7e0d1dee419190ef42')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2014, N'admin', N'10/03/23', N'11:38:08', N'El usuario  se logueo.', N'Baja', N'Login', N'db7b030d6df8a5cb41d89a4ceff7cbf5feb8e638660ab12adcb30e7119ca1016')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2015, N'admin', N'10/03/23', N'11:41:44', N'El usuario  se logueo.', N'Baja', N'Login', N'25b3c5f1d6ceffafbb9c7aec237c4043c556db628dbf52c93693c6be420e6b7f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2016, N'admin', N'10/03/23', N'11:43:45', N'El usuario  se logueo.', N'Baja', N'Login', N'f65ee6e416ce8e2c34ab25b7009bcd207ae5bcec7e1c3248833ee711f4d7aa88')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2018, N'admin', N'10/03/23', N'11:53:05', N'El usuario  se logueo.', N'Baja', N'Login', N'0545bf604fd172a44079c31da1feaa8cf151a29654efb582956a998028d40210')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1018, N'julian', N'10/02/23', N'23:07:14', N'El usuario  se logueo.', N'Baja', N'Login', N'5b5d96f01e8d27273db57b19f586c7393e09379da2570278dc33c0e8e178cbc5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1019, N'julian', N'10/02/23', N'23:07:16', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'f0eca5d21e206f76ce6126cdc2fd09a4bc92f41f9573ec1bc8b5873c64b53e41')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1026, N'admin', N'10/02/23', N'23:45:59', N'El usuario  se logueo.', N'Baja', N'Login', N'cb58b886c7c528f1fa25163086fdd33571155d064d539bbd2c810604cf759406')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1027, N'admin', N'10/02/23', N'23:46:05', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'882db586e1b71078214f6363af827d5180908363e7db3da5bee8213f6847aeac')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1029, N'davidg', N'10/02/23', N'23:51:45', N'El usuario  se logueo.', N'Baja', N'Login', N'77e517ef8a7bcf936517b89a51920342730d54750e9b7c24c9ae8a02cd766be5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1037, N'admin', N'10/03/23', N'01:31:35', N'El usuario  se logueo.', N'Baja', N'Login', N'303a61b8bfc5a69b43177e446a2e39f2a55021087a2e12cbba809a94c91f8bc6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1042, N'julian', N'10/03/23', N'01:53:23', N'El usuario  se logueo.', N'Baja', N'Login', N'f7289037f25490c2a0694a42c281b325fb5df1b4d325f606087e72b3cbc3b0ec')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1043, N'julian', N'10/03/23', N'01:53:26', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'15f05ccc1cefd3327109a2a290d04174c9c92be47dc8563b07bf734f1e09db8f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1044, N'admin', N'10/03/23', N'01:54:15', N'El usuario  se logueo.', N'Baja', N'Login', N'799dfc078e60b89127ff7c699b546c83f3e54dbe40d8f75b1426764b1d1824a7')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1045, N'admin', N'10/03/23', N'01:55:52', N'El usuario  se logueo.', N'Baja', N'Login', N'92cfcc3ebd1abe7f1cd95ba623c6ff942d2bbfb35da093b1b6de0e7fadf51573')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1046, N'admin', N'10/03/23', N'01:59:57', N'El usuario  se logueo.', N'Baja', N'Login', N'd6ca4347879b1b4b430e67f14864dbb178f3fda6ae9816d1836bfe2b9578fcef')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1047, N'julian', N'10/03/23', N'02:01:08', N'El usuario  se logueo.', N'Baja', N'Login', N'0e50d20f02e74857ff73f180c4bef8e6e05eaa6a6aec10224372e87c3dd5a082')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1048, N'admin', N'10/03/23', N'02:07:18', N'El usuario  se logueo.', N'Baja', N'Login', N'e45519b8ddc0becb80d35a923af02122c252e5ed6e053a9bb428b5039a00cfab')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1050, N'admin', N'10/03/23', N'02:11:29', N'El usuario  se logueo.', N'Baja', N'Login', N'3b9ae7fc59d3165749bb04687106062b31b7a96bd62b5c30452eabbfd38777dc')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1051, N'admin', N'10/03/23', N'02:14:39', N'El usuario  se logueo.', N'Baja', N'Login', N'646695ae88e77cf9d299ea6bfcf443c430db685bac67b029ac73dea18262e0cc')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1052, N'admin', N'10/03/23', N'02:15:54', N'El usuario  se logueo.', N'Baja', N'Login', N'f0cf5f2905425993f7857f81f086dbdb9e73f67459f0f5e03f38d97773e03ce4')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1053, N'admin', N'10/03/23', N'02:17:01', N'El usuario  se logueo.', N'Baja', N'Login', N'2aa244bbc86b70ffc49317f46be2d6d59814c30466f911b5e54acd1698652bce')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1055, N'admin', N'10/03/23', N'02:21:12', N'El usuario  se logueo.', N'Baja', N'Login', N'006738f6b3a8c4142c8f1b6ce0ca6148e74b8f8e96f724e43d0f276824f824c1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1056, N'admin', N'10/03/23', N'02:21:44', N'El usuario  se logueo.', N'Baja', N'Login', N'bda6dc8e6a17fb3b54c9e9663bce3645ea9ba6d3a8977b0e4f3633b8e9afc0fa')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1057, N'admin', N'10/03/23', N'02:22:37', N'El usuario  se logueo.', N'Baja', N'Login', N'77ac5ddcd9f3f879609b4cb68ec4ada90968e701b5f79afd8af05f73b7b42c2a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1059, N'admin', N'10/03/23', N'02:31:04', N'El usuario  se logueo.', N'Baja', N'Login', N'2375329551a65279522df0446ac8708d672ef0f8835eb254d462cc4a9c422e71')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1060, N'admin', N'10/03/23', N'02:34:09', N'El usuario  se logueo.', N'Baja', N'Login', N'40df81a32ca8e43b42b2505b8346d9c2c1df2dca89189b4ff7cf54683e07d315')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1061, N'admin', N'10/03/23', N'02:37:24', N'El usuario  se logueo.', N'Baja', N'Login', N'e36e057b60b0092d119c781789fca0bf7ef8435f0be7d05737b69539655bef31')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1062, N'admin', N'10/03/23', N'02:39:38', N'El usuario  se logueo.', N'Baja', N'Login', N'6db58f1d57ca979be02f539a2af711bc9c74271cd6dbb59130b63d881bbb15f6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1063, N'admin', N'10/03/23', N'02:43:29', N'El usuario  se logueo.', N'Baja', N'Login', N'e437fe2554955a463578a31bdff5e024a8e5fed23545d755b9fd96facd1cc34c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (1065, N'admin', N'10/03/23', N'03:02:42', N'El usuario  se logueo.', N'Baja', N'Login', N'736817b7164869d7ab251e2b5b175c3782fc5827a0adba432dff35d54ae1d2e8')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2017, N'admin', N'10/03/23', N'11:50:04', N'El usuario  se logueo.', N'Baja', N'Login', N'12194b2cd292e2a8b73b58e13a68772372bdef1636ec375d971754889fa3a6e6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2019, N'admin', N'10/03/23', N'22:00:14', N'El usuario  se logueo.', N'Baja', N'Login', N'd86b32efe2f088965f0dca49b8b82473056c21d1ea85ff4fcf7fed9db4ed303b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2020, N'admin', N'10/03/23', N'22:34:59', N'El usuario  se logueo.', N'Baja', N'Login', N'3874894d54490218457ad437c40225692eef60c59b14dba89d151e321518ea32')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2021, N'admin', N'10/03/23', N'22:35:56', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'b249f4f389d0fdd8d4533ff678efbb289ec6485ae79cd92737f6fb8863e9a09e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2022, N'julian', N'10/03/23', N'23:05:49', N'El usuario  se logueo.', N'Baja', N'Login', N'5ade53c6eb1dc3d3e8f76e34fcf9b1a696a7ad70e885b6f667da01e046d768db')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2023, N'admin', N'10/03/23', N'23:15:43', N'El usuario  se logueo.', N'Baja', N'Login', N'60425cd93e2cc12d709ff75fd294cdc8f0e0af2f1b8b1056c9900a874fcd42b3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2027, N'admin', N'10/03/23', N'23:50:35', N'El usuario  se logueo.', N'Baja', N'Login', N'8f0ef268c3087105cb9e64ed72d49d783e55d48d3960c5444813d6fb91d8eaa7')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2028, N'admin', N'10/03/23', N'23:57:59', N'El usuario  se logueo.', N'Baja', N'Login', N'ac5c776ed14df4933ce6181f38755246f7c40bc12e819ced6f84e9baeee121b7')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2029, N'admin', N'10/04/23', N'00:00:13', N'El usuario  se logueo.', N'Baja', N'Login', N'27b02c538b87d9b10ac6297be67c20d3fceee1fb04c271fe7ae4398ba674c2ee')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2030, N'admin', N'10/04/23', N'00:11:14', N'El usuario  se logueo.', N'Baja', N'Login', N'1a48a96c780266ab620be3f381bc9212b74acaf348b71e5c35ae84857f7c7831')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2031, N'admin', N'10/04/23', N'00:12:46', N'El usuario  se logueo.', N'Baja', N'Login', N'2273070e83767b7275347d601676fdd154e132612010ea3babb1350f4fec5f5e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2032, N'admin', N'10/04/23', N'00:13:50', N'El usuario  se logueo.', N'Baja', N'Login', N'3759ccf5d5249e903d70b434f7493b5b4ee2613faa8d06d543e4bbead7c731a6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2034, N'admin', N'10/04/23', N'00:56:20', N'El usuario  se logueo.', N'Baja', N'Login', N'2e259e7617ac220b4ddc4fd62161411bdad0cc6070e3417e2a6cba111075774b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2035, N'admin', N'10/04/23', N'00:58:37', N'El usuario  se logueo.', N'Baja', N'Login', N'2f25b8695722c15ad50f8759e234b180244d768c9e7b12f2263ed0628bf4ba03')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2036, N'admin', N'10/04/23', N'00:58:37', N'El usuario  se logueo.', N'Baja', N'Login', N'2f25b8695722c15ad50f8759e234b180244d768c9e7b12f2263ed0628bf4ba03')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2037, N'admin', N'10/04/23', N'00:58:38', N'El usuario  se logueo.', N'Baja', N'Login', N'47fd2aef3ad9e18387225e32bba26931449f8be1f6bf68847075cd1d0878b069')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2038, N'admin', N'10/04/23', N'00:58:38', N'El usuario  se logueo.', N'Baja', N'Login', N'47fd2aef3ad9e18387225e32bba26931449f8be1f6bf68847075cd1d0878b069')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2040, N'admin', N'10/04/23', N'01:42:15', N'El usuario  se logueo.', N'Baja', N'Login', N'0bbc3d4cf5621106a62314e207a81d20771852bcb50556557f7c65f55b27a8a9')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2042, N'admin', N'10/04/23', N'01:54:30', N'El usuario  se logueo.', N'Baja', N'Login', N'6c433bfaef5bfce77d82bd7029d9c6d051a4acc190833e81e0c8510d70c38787')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2043, N'admin', N'10/04/23', N'01:57:28', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'7b91cab1d855746ba115d23917182cca19d15726473ec0c69e94e4c706a917cc')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2046, N'admin', N'10/04/23', N'03:52:20', N'El usuario  se logueo.', N'Baja', N'Login', N'61df9c776510cf400b2532ce514f0c4e3389c0a8ac7825a5b00a3ae7725a3dae')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2047, N'admin', N'10/04/23', N'03:56:37', N'El usuario  se logueo.', N'Baja', N'Login', N'0f0617191a553d3c25b11966143f30ede765814da2782e3285621f972a7e7509')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2048, N'admin', N'10/04/23', N'04:01:20', N'El usuario  se logueo.', N'Baja', N'Login', N'253fe944bfadbb8d702b919e53edbf64f13af8ce17765a9f09198054b17539c3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2049, N'admin', N'10/04/23', N'04:08:39', N'El usuario  se logueo.', N'Baja', N'Login', N'2db4fadd339c80a6e45dc8702366dd15e2f9cc97cf9d9709365e5d4097bfa42b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2050, N'admin', N'10/04/23', N'04:12:52', N'El usuario  se logueo.', N'Baja', N'Login', N'b1e18e4f18896153e8fd07f27d6aa46f3ebcee592ab89f5a03c047e6aa1e29de')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2052, N'admin', N'10/04/23', N'04:21:44', N'El usuario  se logueo.', N'Baja', N'Login', N'd498459b9ff246ec5960fd54a77f5b74190b5c21c537d704a28d304554b92a73')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2054, N'admin', N'10/04/23', N'04:27:25', N'El usuario  se logueo.', N'Baja', N'Login', N'f62cbcf1c1a6e32490a4579acd315f9d31d8fa81ba8673c6a2aeb046b53a0b2e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2055, N'admin', N'10/04/23', N'04:32:36', N'El usuario  se logueo.', N'Baja', N'Login', N'd102b4b5a284f18b726c5dd5d27b478dae80181db93f23efed46032624b0d55d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2056, N'admin', N'10/04/23', N'04:34:45', N'El usuario  se logueo.', N'Baja', N'Login', N'5d3d79a28b247ff926f983801df5b93097c54449d8b7fb11bddaf7e13c4760d9')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2057, N'admin', N'10/04/23', N'04:37:12', N'El usuario  se logueo.', N'Baja', N'Login', N'd6e41e53c9005efdc1f5cdfa0912057b878d44300e97c8499caa7f1d6ddc561f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2058, N'admin', N'10/04/23', N'04:38:34', N'El usuario  se logueo.', N'Baja', N'Login', N'1d87ddd6a8ddc7e99d8035ad2d79a2e592359cb6f4bd449aa815487e4a865097')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2059, N'admin', N'10/04/23', N'04:40:48', N'El usuario  se logueo.', N'Baja', N'Login', N'0aac456dd17923dacfd48236ec56b40647850aaafbcb16b64025f1618d7364c1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2060, N'admin', N'10/04/23', N'04:42:29', N'El usuario  se logueo.', N'Baja', N'Login', N'd3dd97033dc6b1c1c57740688c1f7854ec823752618f2301e51b004173e96ea9')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2061, N'admin', N'10/04/23', N'04:42:31', N'El usuario  se logueo.', N'Baja', N'Login', N'd21190aa0290909cb946660ebea5a4574923ba4e85b8e48daae647ae03bef358')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2062, N'admin', N'10/04/23', N'05:08:10', N'El usuario  se logueo.', N'Baja', N'Login', N'6849b8da31b2f2797c5d39ad9ff8b527a796f2cd77a404b7cfb330d3153c0a9d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2063, N'admin', N'10/04/23', N'05:10:56', N'El usuario  se logueo.', N'Baja', N'Login', N'c7f076d8500a91452284414937224c1b1dbf80aa34932577a4ce13b00e0cb832')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2064, N'admin', N'10/04/23', N'05:13:10', N'El usuario  se logueo.', N'Baja', N'Login', N'2f67499e5bc3c2bad7c3adf9b70a0af3c1ef2815dd4bb0a14e0618ed12393ad6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2065, N'davidg', N'10/04/23', N'05:15:09', N'El usuario  se logueo.', N'Baja', N'Login', N'edf74a28556de648d6894db6d316ac1e0dd5541ef1467b3660fcfa15bef58492')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2066, N'davidg', N'10/04/23', N'05:20:23', N'El usuario  se logueo.', N'Baja', N'Login', N'ad6a61fff1e026773dea167c6525dfaeb2869135b37f234e91c907f5ffc6ade6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2083, N'admin', N'10/04/23', N'07:26:26', N'El usuario  se logueo.', N'Baja', N'Login', N'9a56ebf371e241d68ce7afd7f63fd9df8712e4e0cecc9bbd9856a2c98a1e4f1d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2084, N'admin', N'10/04/23', N'07:31:04', N'El usuario  se logueo.', N'Baja', N'Login', N'8eddd9763049ad37c63718a30c12019bb038072753d747f69603d976c2097a58')
GO
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2085, N'admin', N'10/04/23', N'07:32:47', N'El usuario  se logueo.', N'Baja', N'Login', N'2959c1a524a54370fb1bc38ff00ffb80eae8bdd757e44fca26a344c448b7364d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2086, N'admin', N'10/04/23', N'07:33:20', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'e6acbfe7306afe2e5f648ab659e71b16fcdc87e1f4a5ce58126bd1f5e495ff50')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2087, N'admin', N'10/04/23', N'07:33:25', N'El usuario  se logueo.', N'Baja', N'Login', N'45808f1ffd823041e3487569750115a7bf90bb5b54496996af12b3fce2884de1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2090, N'admin', N'10/04/23', N'14:47:14', N'El usuario  se logueo.', N'Baja', N'Login', N'27fec2bcd07c1209ff57161507c12fe442699d1b817bf898386b00ab5d472685')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2091, N'admin', N'10/04/23', N'14:49:17', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'99f6b18734136ea2751d734efffe63006bbac75cd417a8fa9979acf33404231a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2092, N'davidg', N'10/04/23', N'14:49:21', N'El usuario  se logueo.', N'Baja', N'Login', N'043a40882a77f4aa264d83318789b17e3e9ac99a2428f07c08ad9f2a21c24849')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2094, N'admin', N'10/04/23', N'15:03:55', N'El usuario  se logueo.', N'Baja', N'Login', N'704e1595a9299cec7f2534a1a48542cfe1d6ff9fc344de2282e243b491d5de5f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2095, N'admin', N'10/04/23', N'15:13:53', N'El usuario  se logueo.', N'Baja', N'Login', N'8cbe30495423052a0adcc97a2eba69233df8390cc677f4b09840e30da076a3e6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2096, N'admin', N'10/04/23', N'15:14:51', N'El usuario  se logueo.', N'Baja', N'Login', N'1445b191e247ea64f4edee29f6d7ed1396a70945ac80e279a269049af365408a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2101, N'admin', N'10/04/23', N'15:32:26', N'El usuario  se logueo.', N'Baja', N'Login', N'9c37e14fe7d062133daf77e14413bda92915a0d8a64a138bb265f32f8b6705d5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2102, N'admin', N'10/04/23', N'15:33:02', N'El usuario  se logueo.', N'Baja', N'Login', N'423143d8d124cb559e3aaefc883e8bfe23e4a914c41ecb893deecd2529e6d08a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2103, N'admin', N'10/04/23', N'15:39:02', N'El usuario  se logueo.', N'Baja', N'Login', N'4aa1e5f76eb9637583e583092986ca30f9f4bce6c2bf8473b027d3febdabf8e1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2104, N'admin', N'10/04/23', N'15:39:55', N'El usuario  se logueo.', N'Baja', N'Login', N'76f76fec27f0855a47499d08d4cf6c5d156230a7027aa1086e6ed313089bfe7b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2105, N'admin', N'10/04/23', N'15:42:32', N'El usuario  se logueo.', N'Baja', N'Login', N'e9af3fead8bca3ef3fb9648ff267990dc849d9acc44a1685b4ce903cce39e141')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2106, N'admin', N'10/04/23', N'15:43:06', N'El usuario  se logueo.', N'Baja', N'Login', N'557cc6f22ccf59a7d367ae41feb7fb3be03ab610d2432e34b63605944ec8ddae')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2107, N'admin', N'10/04/23', N'15:43:44', N'El usuario  se logueo.', N'Baja', N'Login', N'3294544ed64abc3aebefe5904f010dad43a4fa213acede66c2d60fd6bb14b266')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2108, N'admin', N'10/04/23', N'15:45:40', N'El usuario  se logueo.', N'Baja', N'Login', N'f2449efbd2633de55aba8185707eecbe39bb5175cdf9a8a7cacba5ee98fdf263')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2110, N'admin', N'10/04/23', N'16:03:41', N'El usuario  se logueo.', N'Baja', N'Login', N'42d7ba7089d25ceaa90c5ab54a5e397e47a25f1bdf39c8133b2165481ed7f433')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2111, N'admin', N'10/04/23', N'16:05:54', N'El usuario  se logueo.', N'Baja', N'Login', N'3fadfa62ecf33beacf286dff627a1f6875c193098039ef5e47c00293dbe89f72')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2024, N'admin', N'10/03/23', N'23:44:29', N'El usuario  se logueo.', N'Baja', N'Login', N'd76a6fbd3865b1d4e37f3e5b9f059fe4b9c605e1c9e6ece2531439bc2075d179')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2033, N'admin', N'10/04/23', N'00:38:46', N'El usuario  se logueo.', N'Baja', N'Login', N'd0f0d756b0858f7360cc1cbf81b305c25bace89723e7c6f27342e8191d236b44')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2039, N'admin', N'10/04/23', N'01:39:45', N'El usuario  se logueo.', N'Baja', N'Login', N'57268467efc1289556a6525dcde84cecbca1fc724cef338619e13e0931bf2ff3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2041, N'admin', N'10/04/23', N'01:43:45', N'El usuario  se logueo.', N'Baja', N'Login', N'd23d3c566ce3ba61aad2d6a351b0e161d82d45da540a4431693847ceb143de7f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2044, N'admin', N'10/04/23', N'03:24:21', N'El usuario  se logueo.', N'Baja', N'Login', N'072893c55df7c06808b16d2c8d611f16cbb1241987bf1b0e1df52c755eea2b5a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2067, N'davidg', N'10/04/23', N'06:51:50', N'El usuario  se logueo.', N'Baja', N'Login', N'6e0c65058f61a68b2170bd294db8c7ec8fb25bc72f70c8a1544e71456961aab5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2068, N'admin', N'10/04/23', N'07:02:24', N'El usuario  se logueo.', N'Baja', N'Login', N'acb45518806c20d22fe16e11ab3429f437f4bdeeb428322f24e6fc1e876c729d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2069, N'admin', N'10/04/23', N'07:04:32', N'El usuario  se logueo.', N'Baja', N'Login', N'3e5a39882ca24c8c313eefe6ac8301832f0b8fab4265c6a6e4f691a71aac57ea')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2070, N'davidg', N'10/04/23', N'07:05:02', N'El usuario  se logueo.', N'Baja', N'Login', N'cb2c0ae1103e2b903ab996aabf30c8f448e571d8207e4f16a22a63e0f0a3bc6b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2071, N'davidg', N'10/04/23', N'07:05:12', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'8931060eec010244019eaa356f603c0b1d2b1755ea30e324d837a49dfd53527b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2072, N'admin', N'10/04/23', N'07:05:17', N'El usuario  se logueo.', N'Baja', N'Login', N'34cffb64916893c9af1076f8e4dcff37bc04acab4017fa20418fae9fa33a55e1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2073, N'admin', N'10/04/23', N'07:06:59', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'77bcc0e6d815bae5d9728dc00b138c157ff7df10e0d3ca264085ebc5aaf4560f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2074, N'davidg', N'10/04/23', N'07:10:45', N'El usuario  se logueo.', N'Baja', N'Login', N'20d09629a2eef406c6029845810fa6888ccbdb2764a6bfded836c346f888fff4')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2075, N'davidg', N'10/04/23', N'07:11:00', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'f9b4d1321c6376517c79046a58bfdb2fe20a5fc4060565e219f05fc130001059')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2077, N'admin', N'10/04/23', N'07:22:32', N'El usuario  se logueo.', N'Baja', N'Login', N'c756dd20bc99c2ac372d6ee2b384d26122235582d0f8dbeeee45d95fd75c46df')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2078, N'admin', N'10/04/23', N'07:23:58', N'El usuario  se logueo.', N'Baja', N'Login', N'0d6a9d029c4d8c1997d00f9ca13c11e0a0235aad783ba322ee622bc926718411')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2079, N'admin', N'10/04/23', N'07:24:44', N'El usuario  se logueo.', N'Baja', N'Login', N'd54ee62db6c10cac965f7da1d49844ff89cd553c99baeee464e0acf020f9e3af')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2080, N'admin', N'10/04/23', N'07:25:22', N'El usuario  se logueo.', N'Baja', N'Login', N'8ab8874e57ef95ac44f85de16bc89e0cf2b187eb444cc1a05ee6e5fedd883530')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2081, N'admin', N'10/04/23', N'07:25:28', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'1c6471a06de754f882178efb547f7066e87cf8440ec9a4250f0646007698a6b2')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2082, N'davidg', N'10/04/23', N'07:25:31', N'El usuario  se logueo.', N'Baja', N'Login', N'd7d4e2871edf6187f1f6bfb36817e4aa41b40907417dc46b1ea22f1a51e49cfa')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2088, N'admin', N'10/04/23', N'14:30:01', N'El usuario  se logueo.', N'Baja', N'Login', N'03f4c55c884f14e8c8b9bffbec1f561b90f2b25989fbe47fb6b1ae6da25a1e21')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2093, N'admin', N'10/04/23', N'14:55:22', N'El usuario  se logueo.', N'Baja', N'Login', N'87422cf9c850c71602a732be877203789daafc33f39f985d60d1d7f6ca4a6b9b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2112, N'admin', N'10/04/23', N'16:14:14', N'El usuario  se logueo.', N'Baja', N'Login', N'a3174f8672e9a1517bd9bc9a42f8ff13284c260d1d0fa106fd2bf3b7fcbaa948')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2114, N'admin', N'10/04/23', N'18:40:34', N'El usuario  se logueo.', N'Baja', N'Login', N'ddce3636e3ce047c44b3b744d419456f9fa4ea389f2d2ffca84920f5dd592904')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2115, N'admin', N'10/04/23', N'19:17:10', N'El usuario  se logueo.', N'Baja', N'Login', N'f615a77c2ab8b0768e7f3888b65694e5dfa4af7a83b03ef9d085033a89fade07')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2116, N'admin', N'10/04/23', N'19:18:34', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'8c5838d59bf54d0a1f8a22f2b4621741e3bbde8327811ac85a1d166bdd46c8c1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2117, N'admin', N'10/04/23', N'19:18:39', N'El usuario  se logueo.', N'Baja', N'Login', N'a87654187a18b670eaa11a67a5833fe015e8a32b2b2b109b2e4c7fffae31a04b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2118, N'admin', N'10/04/23', N'19:31:55', N'El usuario  se logueo.', N'Baja', N'Login', N'70421ae4e80aae86d33c21306490864669b176a25b0756329f62d7279eebbb33')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2119, N'admin', N'10/04/23', N'19:34:30', N'El usuario  se logueo.', N'Baja', N'Login', N'18ac95fa21c14fce51bbc4d4a7dbd5770430f6f177034c7eae2b55ba55c7b175')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2120, N'admin', N'10/04/23', N'19:36:07', N'El usuario  se logueo.', N'Baja', N'Login', N'a41652d3a39cd46a18dff9618539f1481bce9b6e376fcec6b80465ae3deb8ee5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2121, N'admin', N'10/04/23', N'19:37:57', N'El usuario  se logueo.', N'Baja', N'Login', N'99cbebc9a19da898a0c99a3b33fa7a4048207db89132e630031d9bff0fa11e03')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2122, N'admin', N'10/04/23', N'19:39:11', N'El usuario  se logueo.', N'Baja', N'Login', N'197946092f74d55c74c7e5da8053c9e4f85e7cea6d80918d8c56d97895dded78')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2123, N'admin', N'10/04/23', N'19:40:10', N'El usuario  se logueo.', N'Baja', N'Login', N'74b6606a8d18a312509e2b41636a624b0fd16b7b800b2c1fc45538772c0f1d16')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2128, N'admin', N'10/04/23', N'19:51:30', N'El usuario  se logueo.', N'Baja', N'Login', N'b695899c2b612cb4e88ad1bddfffe0258ead8e20e2b3bf24683a0b5961c6b836')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2129, N'admin', N'10/04/23', N'19:53:49', N'El usuario  se logueo.', N'Baja', N'Login', N'00625b31083fc393503ed4a30bb544ef6ec2510a9f722791f2f32581ca3565f1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2130, N'admin', N'10/04/23', N'19:56:23', N'El usuario  se logueo.', N'Baja', N'Login', N'7c8428d68bc6ab29dac4420c930863bf040ee594da986ae24a47372cf46125e5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2131, N'admin', N'10/04/23', N'19:57:17', N'El usuario  se logueo.', N'Baja', N'Login', N'e62d7cc1c5b36b016f8e5b0eb9410220cf31556df003f0e585df810ac9e10840')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2132, N'admin', N'10/04/23', N'19:58:24', N'El usuario  se logueo.', N'Baja', N'Login', N'69d8c12dbecf8b4c7dc92d7ad70ba9e331d37c29518219c25c0ffbb8ec87303a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2135, N'admin', N'10/04/23', N'20:12:28', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'25d828e7af8d2decf852ab0d837dd7ccf7b510a1b6d2b8ffd2b9e45cd36b6e3a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2136, N'davidg', N'10/04/23', N'20:12:41', N'El usuario  se logueo.', N'Baja', N'Login', N'fc894afe85a41fd232d090b0eb59df1ebed71264c39c3edbe48bef56ef90ad91')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2137, N'davidg', N'10/04/23', N'20:12:57', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'7ca4c66fe34f7b82e58c2596fd5747e1577b8315c4d2ece3551b6c728c5e808d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2138, N'admin', N'10/04/23', N'20:13:00', N'El usuario  se logueo.', N'Baja', N'Login', N'e2bead04a970c57294038650c29dac06af37654538b9c9ddc195e8ea2344d340')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2139, N'admin', N'10/08/23', N'00:34:22', N'El usuario  se logueo.', N'Baja', N'Login', N'295782ae32b75a803312724a0d1c3693bd7c0efb1d85b8246578256f07536665')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2143, N'admin', N'10/08/23', N'00:53:57', N'El usuario  se logueo.', N'Baja', N'Login', N'7b63e851952364a1db5ec832b387f30706296e75ec9a8e9273a5b91e75e6456a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2144, N'admin', N'10/08/23', N'00:56:58', N'El usuario  se logueo.', N'Baja', N'Login', N'f27f3937d7c2f4570f203c5cf6962edf44401105063487eb3912f418128135ca')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2145, N'admin', N'10/08/23', N'00:58:36', N'El usuario  se logueo.', N'Baja', N'Login', N'cf6d01599c6d1c92d87bca4c45caf4c0d05223a0d86cf183bad10d8c634e3cf6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2146, N'admin', N'10/08/23', N'01:02:15', N'El usuario  se logueo.', N'Baja', N'Login', N'4ad24b6d625f1efd9626f516cf727838a75b23c882a869e1717987e222b7c1f3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2147, N'admin', N'10/08/23', N'01:11:50', N'El usuario  se logueo.', N'Baja', N'Login', N'b04dfbe4aeab3bb37033dc31d14b26e2397247ebae17058da7644ba7b4378a2f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2148, N'admin', N'10/08/23', N'01:15:44', N'El usuario  se logueo.', N'Baja', N'Login', N'ab42b73536aef2b0f991b8e00d805f517a79cdb26e4d34a5c4745728275b60cb')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2153, N'admin', N'10/13/23', N'00:05:00', N'El usuario  se logueo.', N'Baja', N'Login', N'903c5d37aa141714d5c3fbc7e5550c9c4be520c1c42b560ab05b0a1aba99b34f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2154, N'admin', N'10/13/23', N'00:07:37', N'El usuario  se logueo.', N'Baja', N'Login', N'4fde5ed3e76718b5e268af37a31b626b44489b8c311ca737e59594928cffcc1f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2155, N'admin', N'10/13/23', N'00:20:47', N'El usuario  se logueo.', N'Baja', N'Login', N'9f1b57c4b8ff2546c3a4b2c15dc5169ca3441e25802f952e027d385fd0ebfb1e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2156, N'admin', N'10/13/23', N'00:48:46', N'El usuario  se logueo.', N'Baja', N'Login', N'2ce77a7f4ba3634383cc4daf00671de250cf8c805c3438648e54e80e89702bd4')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2157, N'admin', N'10/18/23', N'19:18:17', N'El usuario  se logueo.', N'Baja', N'Login', N'2581de56d81aeaa0f046060e645fd3670b8568a0d0e209059fa66842027e3e66')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2160, N'admin', N'11/14/23', N'20:16:02', N'El usuario  se logueo.', N'Baja', N'Login', N'defe2e5abc1fb61a8f1e874756a1546219abc2b84546891b11bd0404159e247b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2163, N'admin', N'11/14/23', N'21:32:41', N'El usuario  se logueo.', N'Baja', N'Login', N'1aecc1ecd89135d848a4c2da3017f69cc65a069ff44331c12fc2a12cf04bc6f8')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2167, N'admin', N'11/14/23', N'22:27:37', N'El usuario  se logueo.', N'Baja', N'Login', N'fe51f84c1f3f2d064cb4a040f18123d0d1e41e807c89842f3141eb8316885aa7')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2168, N'admin', N'11/14/23', N'22:27:43', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'd92a386eb1f3bc7651915bb3daccb792c2d3438753fc4a7b072672a8c3459319')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2173, N'admin', N'11/14/23', N'23:34:47', N'El usuario  se logueo.', N'Baja', N'Login', N'5c63adb0c863b1268b27b2e754442597e840e358fdc05e81e63dbb5dadae6068')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2025, N'admin', N'10/03/23', N'23:47:26', N'El usuario  se logueo.', N'Baja', N'Login', N'5245fc9d878b2ca36af52cead9321560af35f3ad8c394144dd0b50c10d39de0a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2026, N'admin', N'10/03/23', N'23:50:13', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'7a7b2842f3009d7b93981e63ef8b04e1c17b7b057e8c57b53820bcff4fc33dfa')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2045, N'admin', N'10/04/23', N'03:50:07', N'El usuario  se logueo.', N'Baja', N'Login', N'def5c6686efe574d51c49d53bf9701d2a4d4e2aa2ef1e270de378194afa2b0ad')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2051, N'admin', N'10/04/23', N'04:17:48', N'El usuario  se logueo.', N'Baja', N'Login', N'd4c8d3adb61f6ae4c2de76a8c59787d6f626e25d9d8ac7e7896727abf097e078')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2053, N'admin', N'10/04/23', N'04:24:58', N'El usuario  se logueo.', N'Baja', N'Login', N'e23c4b0222e1eb398276a0e47d1a440e5715660fd1a6a9a69802fe86d806a930')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2076, N'admin', N'10/04/23', N'07:19:50', N'El usuario  se logueo.', N'Baja', N'Login', N'c9d1d2d2766d54713fe33eeb948d4c43c354374a167ec45e16d2e7bf130b4e44')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2089, N'admin', N'10/04/23', N'14:43:23', N'El usuario  se logueo.', N'Baja', N'Login', N'2e560d91beb091c3663c374745a4a3c20e5578d57b4447758229d79f37e939d3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2097, N'julian', N'10/04/23', N'15:19:08', N'El usuario  se logueo.', N'Baja', N'Login', N'6f009446092cf6d0f99334d49b7a565062097233a0ecf8e0fa65b9eebd9a869f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2098, N'admin', N'10/04/23', N'15:20:10', N'El usuario  se logueo.', N'Baja', N'Login', N'ee3debfa835a5eb1b1c491f820f8c3d522c28897b532d4c308ba2ba76e061fe7')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2099, N'admin', N'10/04/23', N'15:23:33', N'El usuario  se logueo.', N'Baja', N'Login', N'93013d12344dc30ef957f8766ad6810ead8593b79fbc3202f7087faf7d6e04c1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2100, N'admin', N'10/04/23', N'15:29:53', N'El usuario  se logueo.', N'Baja', N'Login', N'5e8881f689ed64d7a4522d7a6fdd45ecc6b4adfa09a19edacf2407de3d88a340')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2109, N'admin', N'10/04/23', N'16:01:22', N'El usuario  se logueo.', N'Baja', N'Login', N'ef644c68ebd5aa9f1f1e6b43f3a93128d74178d0f2233c5e91d7bf4c0f1472ef')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2124, N'admin', N'10/04/23', N'19:41:24', N'El usuario  se logueo.', N'Baja', N'Login', N'687449ee827bb851061dc726acb8c6e97117a3278f84c341d671b065a8d78d54')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2125, N'admin', N'10/04/23', N'19:43:40', N'El usuario  se logueo.', N'Baja', N'Login', N'c289e9c65f11e615ab77cae20edbf28b6e496aa39cddad2e023ca10f839ecccb')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2140, N'admin', N'10/08/23', N'00:39:51', N'El usuario  se logueo.', N'Baja', N'Login', N'8ec4c15db14baae7f4fadafc73e140c5d0e970327f70749c3e25228014e6fe2d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2141, N'admin', N'10/08/23', N'00:49:01', N'El usuario  se logueo.', N'Baja', N'Login', N'501f4993cc9ceb8bd25b7301328f85edf3b5e570a0df713ef51ab60a5a2a3649')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2142, N'admin', N'10/08/23', N'00:49:01', N'El usuario  se logueo.', N'Baja', N'Login', N'501f4993cc9ceb8bd25b7301328f85edf3b5e570a0df713ef51ab60a5a2a3649')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2149, N'admin', N'10/08/23', N'01:18:19', N'El usuario  se logueo.', N'Baja', N'Login', N'475463e6a5248a8598fc8e942d401db5140f14f700cafdbebd192a1fe690bd4a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2150, N'admin', N'10/08/23', N'01:23:34', N'El usuario  se logueo.', N'Baja', N'Login', N'e5ebe1d6f55917802892620688fdb28c993690f378eacc6c7ccd72fc7b3c6b72')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2161, N'admin', N'11/14/23', N'21:30:07', N'El usuario  se logueo.', N'Baja', N'Login', N'a7f0d0c6d72642eaeb8991956d1352f653db438d025ae1e1f1501cbc7eb9c1e2')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2162, N'admin', N'11/14/23', N'21:30:09', N'El usuario  se logueo.', N'Baja', N'Login', N'93bed7bdf47cdcb11d8e36bea0bd9505e99ca1bec0949f94d5bb031da37929c7')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2164, N'admin', N'11/14/23', N'21:38:53', N'El usuario  se logueo.', N'Baja', N'Login', N'ba351982b6791293401ff83fa1e16d662b84ec7a4f5c216ffa487295cd69b08a')
GO
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2174, N'admin', N'11/14/23', N'23:36:16', N'El usuario  se logueo.', N'Baja', N'Login', N'21fba73e4706eb74b55354597611474809b3da7ca0918d094fb85fe220dce8fa')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2175, N'admin', N'11/14/23', N'23:37:02', N'El usuario  se logueo.', N'Baja', N'Login', N'7fa747a00764dc67f5ee6acfb57d3caf47431bfe44c8c2f53b7deddec7fbf115')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2176, N'admin', N'11/14/23', N'23:37:35', N'El usuario  se logueo.', N'Baja', N'Login', N'9b6bb827b022b20b4ef92a54b4b81718f08fb8079d07ddad91a24beef85b8621')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2177, N'admin', N'11/14/23', N'23:37:35', N'El usuario  se logueo.', N'Baja', N'Login', N'9b6bb827b022b20b4ef92a54b4b81718f08fb8079d07ddad91a24beef85b8621')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2178, N'admin', N'11/14/23', N'23:39:44', N'El usuario  se logueo.', N'Baja', N'Login', N'a4b420256e1791a729dc0890269318d748cb1be20b825693c0033bfa2a82e42d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2179, N'admin', N'11/14/23', N'23:40:47', N'El usuario  se logueo.', N'Baja', N'Login', N'cec752ac704daf7c7292c94605befd65770554d86f4fad9dc181ff97bde1b29b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2180, N'admin', N'11/14/23', N'23:44:12', N'El usuario  se logueo.', N'Baja', N'Login', N'73461b0c6ffe29609051fc86ff0865107150c4d6088c8b458ad50b235a980607')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2181, N'admin', N'11/14/23', N'23:45:42', N'El usuario  se logueo.', N'Baja', N'Login', N'e1f25a324e10a939c15163edfaf4f7079a1e44328d4afefc257c06d6eeed1f3e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2182, N'admin', N'11/15/23', N'00:22:20', N'El usuario  se logueo.', N'Baja', N'Login', N'9bc32cb18908ce073ec0478c17ee1b5c6eefc832ebea916b7c3378a5d65b2ce2')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2183, N'admin', N'11/15/23', N'00:22:21', N'El usuario  se logueo.', N'Baja', N'Login', N'0141d5800775c4c37a5bb5a4dfeb6455bd3e11a05413e56a2761a1ef346a529e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2186, N'admin', N'11/15/23', N'00:50:47', N'El usuario  se logueo.', N'Baja', N'Login', N'6e177168240fa35feb834e6960c3af0125f949bb0448c9695f52276b40fe1fcb')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2188, N'admin', N'11/15/23', N'00:52:24', N'El usuario  se logueo.', N'Baja', N'Login', N'a373fea5a742eaf35520b5312af82a75ea409e04bcb67514fa37c7800b3a1c28')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2191, N'admin', N'11/15/23', N'11:07:30', N'El usuario  se logueo.', N'Baja', N'Login', N'7c02ffdfd11d33197404e0f0974d9e2e9ef13dc2b604ed4b81af0002fb5f945e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2192, N'admin', N'11/15/23', N'16:48:24', N'El usuario  se logueo.', N'Baja', N'Login', N'faee6d03f07f4cefcf0d00d177cd256d21586ff3484b179d7d08793e94a4dafe')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2194, N'julian', N'11/15/23', N'17:11:27', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'89000a7d89d1c7b25beda676f8dfc5ee07bcc83258ef3d7ec9cb1edc01f984e1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2195, N'julian', N'11/15/23', N'17:11:35', N'El usuario  se logueo.', N'Baja', N'Login', N'9283b1cfef2e075507be4d7095acb4db04be1925217d3e6bf6e00a82e9acf2fc')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2196, N'julian', N'11/15/23', N'17:11:42', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'dd2883304ea86c5f6e075df97637a81e99840995d9babf2bd498e594d1a76295')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2197, N'julian', N'11/15/23', N'17:27:15', N'El usuario  se logueo.', N'Baja', N'Login', N'ea09342ae7b6dd702a9ca6f3a7085974ab8f9c9f608167c648521626304eea07')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2206, N'julian', N'11/15/23', N'19:29:31', N'El usuario  se logueo.', N'Baja', N'Login', N'cc85fb1b5916d3726c46ec2f0ce1ac6f0ed4f8257a44d5472b4d64533af90d69')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2208, N'julian', N'11/26/23', N'13:49:28', N'El usuario  se logueo.', N'Baja', N'Login', N'89da5209de9b0aef20ba3aee51f7a2b1739863b4a4afa1ff684144a264ca1ac8')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2209, N'julian', N'11/26/23', N'13:49:34', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'208ac67f5d2646e40254f68cdbcb0088a7902778cae26a8c63c0e72989d64551')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2210, N'julian', N'11/26/23', N'13:49:41', N'El usuario  se logueo.', N'Baja', N'Login', N'008267c54de6dc78c01edccd7c800a7cdd2e27e4cc48e41e2524fb196a0acc84')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2211, N'julian', N'11/26/23', N'13:49:45', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'645ebed780b8854da61f47c26379e3799f0df24523320ab1b3141505c57bda35')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2212, N'julian', N'11/26/23', N'13:51:09', N'El usuario  se logueo.', N'Baja', N'Login', N'9a4a401caa51982400e6451a71acef0f3c6a9fde834ca53753af295b3e5d6730')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2213, N'julian', N'11/26/23', N'13:51:48', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'a2a57c2fc186b8185860da95df18e2bdccaaa43b69acda6bf3be962d6ca67a23')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2214, N'julian', N'11/26/23', N'13:51:51', N'El usuario  se logueo.', N'Baja', N'Login', N'0291126c51d947f5e2ce127b857a84f9ca544a70d7b2f271c27f22f698b9bdf2')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2215, N'julian', N'11/26/23', N'13:52:12', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'b9df988643ee85ed41f0f937a375af1595f5d46bc595fce2ae8fd71e6456a147')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2216, N'julian', N'11/26/23', N'13:52:23', N'El usuario  se logueo.', N'Baja', N'Login', N'7942f0fa87353d218b08f6821c3a12dc039783ef99d169e239132933f03ee319')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2217, N'julian', N'11/26/23', N'13:52:33', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'2229af3a1e637552702929aec1727094b5ef096004fb8f097cca65f494b375d0')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2219, N'admin', N'11/26/23', N'20:39:03', N'El usuario  se logueo.', N'Baja', N'Login', N'fd0d50a8c2547e9b32536061c2d09619bb0a07a82561fb39bb23dd77b32905c4')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2222, N'admin', N'11/26/23', N'20:46:35', N'El usuario  se logueo.', N'Baja', N'Login', N'6ac8a62c1c4927fbef43e1dad8e4f8f4462b2bdcb495f77f67d5ae150227521a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2223, N'admin', N'11/26/23', N'21:10:53', N'El usuario  se logueo.', N'Baja', N'Login', N'a31155d07bafe24d701c50ab13e85777cb479405daae4046ef00da3d6e88831d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2231, N'admin', N'11/27/23', N'00:54:40', N'El usuario  se logueo.', N'Baja', N'Login', N'ba12fb7fe6b0383b75b27719d66116ae702590e9b1c1a6894dbb3b50f12c0b1a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2232, N'admin', N'11/27/23', N'01:21:56', N'El usuario  se logueo.', N'Baja', N'Login', N'36d5c950e79c1dd0771bd08bb96b8c45be941873719019cee03498deb88b4831')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2233, N'admin', N'11/27/23', N'01:26:03', N'El usuario  se logueo.', N'Baja', N'Login', N'c822b7c21e04be0518acf4d855e737607d6b969f9a731177a9eabdcc8d9d34cb')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2234, N'admin', N'11/27/23', N'01:28:02', N'El usuario  se logueo.', N'Baja', N'Login', N'8d519173d845aa2756cd5a24cd213c00f533f5fea88873ad9a0984386de476aa')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2113, N'admin', N'10/04/23', N'18:35:42', N'El usuario  se logueo.', N'Baja', N'Login', N'd352445421fdde30fd428f2c204cd748edd1b2b8bf342e000b0c36bb43d2ca5b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2126, N'admin', N'10/04/23', N'19:48:12', N'El usuario  se logueo.', N'Baja', N'Login', N'03fe811367c1efab63bc2f810e3dc8c64f6993dc7482df031a841441201ec3d5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2127, N'admin', N'10/04/23', N'19:49:20', N'El usuario  se logueo.', N'Baja', N'Login', N'07e7611640d4a8e635ce79a835dbd859e4253edacee318086bc08bac46ce277e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2133, N'admin', N'10/04/23', N'20:01:05', N'El usuario  se logueo.', N'Baja', N'Login', N'4ae213f71ab183d407e985bd82e9f4e536f698e453d2a3c6d8de9a8fbbae429f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2134, N'admin', N'10/04/23', N'20:03:16', N'El usuario  se logueo.', N'Baja', N'Login', N'6cd2039e5c63730484dacb873505f1e7e69a7a5670b4c786b93137691a976362')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2151, N'admin', N'10/12/23', N'23:41:53', N'El usuario  se logueo.', N'Baja', N'Login', N'4f277e74e59baba41fbdd81086c87fd6d9c0f815bc1ede882a4ed077a4587675')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2152, N'admin', N'10/13/23', N'00:02:39', N'El usuario  se logueo.', N'Baja', N'Login', N'b09b47493cfae26faf0b2fa36f9e2f22bddbb17dadb5e9e1e15cdad3d4e88f32')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2158, N'admin', N'10/18/23', N'19:37:24', N'El usuario  se logueo.', N'Baja', N'Login', N'a8595bb440be9ac8662b176bf3a60e0532b1bc85c1055082517a2da8008e97c1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2159, N'admin', N'10/18/23', N'19:39:43', N'El usuario  se logueo.', N'Baja', N'Login', N'dfa0db844b32baa36cf33613e6ca42df338314fc47fdad38a37e11a2f33e1630')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2169, N'admin', N'11/14/23', N'22:38:08', N'El usuario  se logueo.', N'Baja', N'Login', N'69684354aa45b735766825ce961e6f21d57c47f02bc5d172bcd9a3facd4a84a3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2170, N'admin', N'11/14/23', N'22:38:14', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'acd5f31b8c22bb5204cdd599c32158d23bb378b473f2f9c4c5bb7392616d41ce')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2187, N'admin', N'11/15/23', N'00:51:33', N'El usuario  se logueo.', N'Baja', N'Login', N'bea4ba6ba7223fff7b06b1ad2dec92204a9762e039da0e657928d37155fca3ae')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2198, N'julian', N'11/15/23', N'17:29:59', N'El usuario  se logueo.', N'Baja', N'Login', N'cd0ba5a040ba86fa821dee8f10e68d8e625b5bf17e16f633c43ec8b3ccfa4a9f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2220, N'admin', N'11/26/23', N'20:42:48', N'El usuario  se logueo.', N'Baja', N'Login', N'9c47ea9a4830031618d4455776218d181aa1185a29d610f4f7c5b05025154e5e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2221, N'julian', N'11/26/23', N'20:44:52', N'El usuario  se logueo.', N'Baja', N'Login', N'5a9bcd102e2ac8c939818ef592eb48adf1f0673f37edd1aedf89204223f6988c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2226, N'admin', N'11/26/23', N'23:00:46', N'El usuario  se logueo.', N'Baja', N'Login', N'50c76e99912628f395bb8e92629d5630ab13ddf5ef41de9348d4ae1ec6f9789b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2235, N'admin', N'11/27/23', N'01:30:09', N'El usuario  se logueo.', N'Baja', N'Login', N'3851b87e8e04ff3111fc69b4ea6e65b754f644dd84326f826989528012e5b36c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2236, N'admin', N'11/27/23', N'01:32:31', N'El usuario  se logueo.', N'Baja', N'Login', N'9ce96013f2a314be69a21602b993dd6acf39526e6b4e294fe1e018971798eefd')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2239, N'admin', N'11/27/23', N'09:32:33', N'El usuario  se logueo.', N'Baja', N'Login', N'5cb8ddb1fdb34a4ac4baedeafcb3510664412adccfebaa7578db25fc4f9e4630')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2241, N'admin', N'11/27/23', N'10:13:22', N'El usuario  se logueo.', N'Baja', N'Login', N'fcbb97896bff25df771c8740cdeabb582b0140b907d4cfd88a09d0d4fcafd070')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2242, N'admin', N'11/27/23', N'10:17:17', N'El usuario  se logueo.', N'Baja', N'Login', N'436615c1e9f0da3062dc1c578abb5709f943d716e12ed9fb740342d626114323')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2243, N'admin', N'11/27/23', N'10:21:48', N'El usuario  se logueo.', N'Baja', N'Login', N'96ad701984872147086459fe4df2a94bb5a97181e22c15d97caf543cf295686a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2244, N'admin', N'11/27/23', N'10:33:20', N'El usuario  se logueo.', N'Baja', N'Login', N'd69dfe79a35c754cc00abbc1e12b1ca6b311b4f5996b970f2e8b24343ff96f22')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2246, N'admin', N'11/27/23', N'10:35:39', N'El usuario  se logueo.', N'Baja', N'Login', N'360ee9b8b18e1c27b82a1d07051d0c2ef724e10bf4df31a7a3e556f9296febe0')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2247, N'admin', N'11/27/23', N'10:38:00', N'El usuario  se logueo.', N'Baja', N'Login', N'6c20c398fdab62cb929402474ee4e0732d237b5de1f45e742d6903898b069c6d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2249, N'admin', N'11/27/23', N'10:47:16', N'El usuario  se logueo.', N'Baja', N'Login', N'de97b6fde8588b06f4ac7d1b373a8622cb6d7a5debac95ccc877cf5a33867f49')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2253, N'admin', N'11/27/23', N'11:02:11', N'El usuario  se logueo.', N'Baja', N'Login', N'1a51f19095bfb5ab69e2b4881ae56286e584ec3cdd0b5a6f6bd73f5d7b8a295b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2254, N'admin', N'11/27/23', N'11:03:22', N'El usuario  se logueo.', N'Baja', N'Login', N'1c2e9f0e20e279ef4b4c377cb2a5da0b422161fa363b8f50907d901b6ebde4ee')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2257, N'admin', N'11/27/23', N'11:10:45', N'El usuario  se logueo.', N'Baja', N'Login', N'32823c9972144e8d4b407337c31327e6f7c2043870a0258937c7ce0d6cd49194')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2258, N'admin', N'11/27/23', N'11:18:29', N'El usuario  se logueo.', N'Baja', N'Login', N'32570a344f38e06ae460b4cabc7bc2e7f3647e21cccd22d6b8f913b503d9463d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2262, N'admin', N'11/27/23', N'11:50:20', N'El usuario  se logueo.', N'Baja', N'Login', N'93d86ad40e846f6e5c5b2bbd8a7e053001780b4d7d3855d35b6b7f30f3d9bd68')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2264, N'admin', N'11/27/23', N'12:09:28', N'El usuario  se logueo.', N'Baja', N'Login', N'eb83c88c3627e1bcdc6e6f8e8b60aa3297897d9468e8f74038d168269a199588')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2269, N'admin', N'11/27/23', N'12:33:23', N'El usuario  se logueo.', N'Baja', N'Login', N'047f1b777b543dff13ca17503efb8c8a92ac3a9855c5f195db02fa4987751cbe')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2271, N'admin', N'11/27/23', N'12:41:55', N'El usuario  se logueo.', N'Baja', N'Login', N'a9eab9da4c43cf040400d3f9b31176550617f2d9825da1aec6403722b71a2813')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2272, N'admin', N'11/27/23', N'12:43:35', N'El usuario  se logueo.', N'Baja', N'Login', N'848b9360bb66938cabfdbfb45ee44878e3ff810fcac335fdcfe04f73203b70e4')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2273, N'admin', N'11/27/23', N'13:22:19', N'El usuario  se logueo.', N'Baja', N'Login', N'fc25993b3cbe53f7135f955fa5d8a8c5586dc61ce671fa7ea627a308764e3735')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2281, N'admin', N'11/27/23', N'13:56:22', N'El usuario  se logueo.', N'Baja', N'Login', N'85ae12d54553f8ed19dd3794d957939cdd6a877e1f489662f78520b5f93c22d5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2284, N'admin', N'11/27/23', N'14:11:40', N'El usuario  se logueo.', N'Baja', N'Login', N'56ef9c0f169aea38f39a52aabd59c0ce53ba347f8e3e2ae9401089f270965db8')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2292, N'admin', N'11/27/23', N'14:37:04', N'El usuario  se logueo.', N'Baja', N'Login', N'0b5dfcc87d59f03748298e86a53b1c49434522c6f611f0eb27e5408ffdd02c04')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2294, N'admin', N'11/27/23', N'17:15:40', N'El usuario  se logueo.', N'Baja', N'Login', N'1691b2a5374e857159a7e3e7941d3f008deb6aa6cc5e97adc2a08f165d1e7b44')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2295, N'admin', N'11/27/23', N'17:21:51', N'El usuario  se logueo.', N'Baja', N'Login', N'3947ec16ea635d5dc8b15da9ed7c87586a22a227d87f97ab4ab84d15d6893ea6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2296, N'admin', N'11/27/23', N'17:23:52', N'El usuario  se logueo.', N'Baja', N'Login', N'3117324a97fec1aaa958f4ee1a78bbe6fe82b525cc1cb960469f626acd5ba614')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2299, N'admin', N'11/27/23', N'19:20:36', N'El usuario  se logueo.', N'Baja', N'Login', N'1ae90cba29e32a907297fba85c3dab5e8c80624a8c1efaa11c8de71643991e93')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2300, N'admin', N'11/27/23', N'19:39:42', N'El usuario  se logueo.', N'Baja', N'Login', N'e032b57fdbef09073ff167d1ea0c47c9f71c7e8357a06994fb382334bc7597bf')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2301, N'admin', N'11/27/23', N'19:46:06', N'El usuario  se logueo.', N'Baja', N'Login', N'54379f3b69a28032903411c1035940225a08121c85b71d74543ecf2ba5524b1b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2302, N'julian', N'11/27/23', N'22:48:47', N'El usuario  se logueo.', N'Baja', N'Login', N'01dbd13fd9d955a2778a398ac597b3fe7b8394ca9b87f1c8fbfa00517c708a15')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2303, N'julian', N'11/27/23', N'22:49:45', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'989b87cd1df1287a72ae6c3c7333f01830f20fd709b37a94c2ad3c3eb381d7c8')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2304, N'admin', N'11/27/23', N'22:49:50', N'El usuario  se logueo.', N'Baja', N'Login', N'477c58769652c61590707b6f97f0a6d4441aa2e3d0f38768f547bfdd59d17498')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2305, N'admin', N'11/27/23', N'22:50:06', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'5beb3bb73fc8f23390d1179f54c879c8b3a6bd1e67d77e6c28aeb97ae50191fc')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2306, N'julian', N'11/27/23', N'22:50:11', N'El usuario  se logueo.', N'Baja', N'Login', N'15132bc6584ab1bf4822a4f580992ef2783f4f5d52a71920bd3c135fcc4335fc')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2315, N'admin', N'11/27/23', N'23:51:55', N'El usuario  se logueo.', N'Baja', N'Login', N'cea5a3fd623c57a67c5528a7098a7688543896ce11f6e9cc93089a056cf56691')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2316, N'admin', N'11/28/23', N'00:05:47', N'El usuario  se logueo.', N'Baja', N'Login', N'6e993ad6b8b08381c80157be7f395a4e727e9d21010d2385e6e5bf05c4bfdf5d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2320, N'admin', N'11/28/23', N'01:21:59', N'El usuario  se logueo.', N'Baja', N'Login', N'455ddd97ebf6470ab646d609e973a99b0b54e684361d32aa7c392452464ee665')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2322, N'admin', N'11/28/23', N'16:23:58', N'El usuario  se logueo.', N'Baja', N'Login', N'66744f1e4440ca7a8a997a5854fa21cb797dfdf454ac636cf0bddfaeb952b108')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2323, N'admin', N'11/28/23', N'16:29:06', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'70542f771dcde9f1a04ff3c22f79b24a91204cee20e973ff710036f93d7c5502')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2327, N'julian', N'11/29/23', N'03:35:41', N'El usuario  se logueo.', N'Baja', N'Login', N'67f4a5471f26305daff69536eb9d85d492200ef7de17ff2a27f20fbd7ce9e764')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2328, N'admin', N'11/29/23', N'03:38:29', N'El usuario  se logueo.', N'Baja', N'Login', N'11c8f45a9cb8f9d56da27cfa5b03724b8fdb08ed108e6bd1face156dd26b82ea')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2331, N'admin', N'11/29/23', N'03:56:31', N'El usuario  se logueo.', N'Baja', N'Login', N'354ce0667a4e880bb521dc89a40682436448de9935f40e3aee4badff1e3418bf')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2332, N'admin', N'11/29/23', N'03:56:37', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'218fdb88cd4069b764592fc2d78111214086903f617d19c2a087e0db152608cf')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2165, N'admin', N'11/14/23', N'22:12:27', N'El usuario  se logueo.', N'Baja', N'Login', N'05a3c7101edf6b0f0e0ed762ed5793b59f1cad32d5b9bcb7d84bd57363dc001b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2166, N'admin', N'11/14/23', N'22:13:15', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'3be76bf7417646158a1bbaaff2489a6918bd262b8f47dd0b290617bc57773085')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2171, N'admin', N'11/14/23', N'23:25:12', N'El usuario  se logueo.', N'Baja', N'Login', N'8ea0ce45d152d4f82171bdc4295369f7c5466a336cedab123f2593992ca5b77a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2172, N'admin', N'11/14/23', N'23:31:17', N'El usuario  se logueo.', N'Baja', N'Login', N'76b51a17b8efe0936b13d472a9c27d3e8edcc31a45f180667c0c5c96cad709d6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2184, N'admin', N'11/15/23', N'00:49:27', N'El usuario  se logueo.', N'Baja', N'Login', N'2805898c8ce323eaf11511536e7350e8c2ca9dea52604a14ca8a5a8c71ca7960')
GO
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2185, N'admin', N'11/15/23', N'00:49:28', N'El usuario  se logueo.', N'Baja', N'Login', N'6a9f7fc86179bf44af26e760cd23c6977b8aa0093d3ac625c2ce73886322b00d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2224, N'admin', N'11/26/23', N'22:56:19', N'El usuario  se logueo.', N'Baja', N'Login', N'b289a0305d22a407de43f7b5244aa1eff3bb5f3ce0df0a2275a9ec50f51d5197')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2225, N'admin', N'11/26/23', N'22:57:55', N'El usuario  se logueo.', N'Baja', N'Login', N'20bff05cb163b32110afcf52b3fdd15befa26087eda313bc0bc1f51f2536d1e3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2227, N'admin', N'11/26/23', N'23:02:42', N'El usuario  se logueo.', N'Baja', N'Login', N'fed807b9af2351ad41d5502c661ee7926300e557928d83dccb51b7e1933530be')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2228, N'admin', N'11/26/23', N'23:09:17', N'El usuario  se logueo.', N'Baja', N'Login', N'14a45480d4e2198809c1256b1559f1aa5194a07be6c4afde868dc25f5f37578e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2240, N'admin', N'11/27/23', N'09:36:54', N'El usuario  se logueo.', N'Baja', N'Login', N'28c27ede2b6787e53a5d135c6d48e5dafa0b05fcb72e719896b8a659abc28747')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2250, N'admin', N'11/27/23', N'10:54:02', N'El usuario  se logueo.', N'Baja', N'Login', N'52871f1577ee6a2c1b31e6d123319d03d60e746d1a857fd4cea4fc7cdc2bf0b5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2251, N'admin', N'11/27/23', N'10:56:15', N'El usuario  se logueo.', N'Baja', N'Login', N'c7d43dd4b2f3c6bb309633d3e7c09cc66e49a7ac064356683af18e390b777ddc')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2288, N'admin', N'11/27/23', N'14:22:09', N'El usuario  se logueo.', N'Baja', N'Login', N'379468076d5d90225c36c1ef4d63229f7e0eed5dbe07b2104ac2c4b462b50379')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2289, N'admin', N'11/27/23', N'14:24:29', N'El usuario  se logueo.', N'Baja', N'Login', N'f4ff00b8d10b39af219914539ef49625cc925052fc9061e1f01d3c719853185f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2290, N'admin', N'11/27/23', N'14:30:17', N'El usuario  se logueo.', N'Baja', N'Login', N'ccf356e3a48a6bc5374475821470ce77297b4e9284e1d1a2ec64f178544e9438')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2329, N'admin', N'11/29/23', N'03:55:56', N'El usuario  se logueo.', N'Baja', N'Login', N'3425e4bd58fdfe64ee0eddb20902197eb4a056ad3e11eabcf22ffba8377d0514')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2330, N'admin', N'11/29/23', N'03:56:27', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'22a484a6ba52681d542ed9a4a2256e7a50671e1e5a33a87729070daa5df9f1d4')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2333, N'julian', N'11/29/23', N'03:56:41', N'El usuario  se logueo.', N'Baja', N'Login', N'c6b0a622baabd37bb42d912eb348556bb3ff276fb6f33a3450b594cea54858fd')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2334, N'admin', N'11/29/23', N'04:03:00', N'El usuario  se logueo.', N'Baja', N'Login', N'477b2c72710e1d5fc91f78ad4aeb9e95f2d1c4a1688efa39e877ae7ed6150bf0')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2335, N'admin', N'11/29/23', N'04:06:10', N'El usuario  se logueo.', N'Baja', N'Login', N'12f8ed1d024b9c878688d3d1edaee6eba03a18145a34d19ed033cd3b95ec4c22')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2337, N'admin', N'11/29/23', N'04:12:57', N'El usuario  se logueo.', N'Baja', N'Login', N'd3faae8040649d6f9f1d08a02f129646e0561c140da5c4cdba10caa29f309c35')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2338, N'admin', N'11/29/23', N'04:13:50', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'db0ae18aba3fc4b5390bcf6fa6090b484349765a9eac964dfe7f695013b95b28')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2339, N'davidg', N'11/29/23', N'04:13:54', N'El usuario  se logueo.', N'Baja', N'Login', N'749359b8ad6d3744fea515ad4ce73c90bbfd69e504c0416da204ad57ee51be63')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2340, N'davidg', N'11/29/23', N'04:14:23', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'be512a86550f933ab531cc27fa668a1435b3b403d4c3d0cc9469d5ebfca33e1b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2341, N'admin', N'11/29/23', N'04:14:30', N'El usuario  se logueo.', N'Baja', N'Login', N'bafa1b1342d998c41818ade3078c180eaf3e29ff1ad84ffce5ddb431e8e2f128')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2342, N'admin', N'11/29/23', N'04:20:04', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'3829901c24eff1ac2d062a1f74bace2ccef495a87c56fc875d1ce7a160245f04')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2343, N'admin', N'11/29/23', N'04:37:09', N'El usuario  se logueo.', N'Baja', N'Login', N'b7a6f11a2b338bb6f1be6413425ad993eade8fd628a7307d1cf4ef4d69a02251')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2347, N'admin', N'11/29/23', N'04:45:40', N'El usuario  se logueo.', N'Baja', N'Login', N'5e12d99d68ded57b7d73ce482738736fd55dcd166f189d0704c5509f7e878415')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2348, N'admin', N'11/29/23', N'04:47:53', N'El usuario  se logueo.', N'Baja', N'Login', N'5c9e183ed25222478bf0301a40fa88f09cbf458eb947f89e925850efaba4aba8')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2349, N'admin', N'11/29/23', N'04:49:10', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'7eeb7742bca44e0e4cc7b280a3a62378614b622d5e4f7b3c90909d981eb9df94')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2350, N'admin', N'11/29/23', N'05:13:49', N'El usuario  se logueo.', N'Baja', N'Login', N'1d6224e16911706f51e2d3a9c97eec6790f1a51fda0dcce50aa9ab255270ba03')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2351, N'admin', N'11/29/23', N'05:13:55', N'El usuario  agrego un item al carrito.', N'Media', N'Login', N'1f7d9b7d92e2b63e08e22b8d8c1ffbf28667edc5cf611af903584100315a1f81')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2352, N'admin', N'11/29/23', N'05:14:01', N'El usuario  agrego un item al carrito.', N'Media', N'Login', N'1b4b7ae0211d7688d4250ab590c904738a4168f13d22051917b59a94dcfe7197')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2353, N'admin', N'11/29/23', N'05:30:34', N'El usuario  se logueo.', N'Baja', N'Login', N'ba7a1c390e537df37dcb502cba72520b74e4debb8b1aa52acb14bdb1f3120cac')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2354, N'admin', N'11/29/23', N'05:32:40', N'El usuario  se logueo.', N'Baja', N'Login', N'ff7185f775c831326ad732ac7268d193378619ad72e87ea8fee00347dbd63626')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2355, N'admin', N'11/29/23', N'05:34:43', N'El usuario  se logueo.', N'Baja', N'Login', N'67ab0bf0af30fc768a0073b52029af1978f41d7c465fb271bc07a6d39896cc32')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2356, N'admin', N'11/29/23', N'05:35:24', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'04a66697ba46a075a97048ffcd65730a7660febc91aae32f17b17fde10ac061a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2357, N'admin', N'11/29/23', N'05:40:32', N'El usuario  se logueo.', N'Baja', N'Login', N'8abbe1a5d562b98088987e002780a999c631f2b1306b06abbaf757361e178cc3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2358, N'admin', N'11/29/23', N'05:47:40', N'El usuario  se logueo.', N'Baja', N'Login', N'57b83b73f88d3133ddb22d43f70362550b019dd69e6b6738c6381bb047eff69f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2359, N'admin', N'11/29/23', N'05:50:30', N'El usuario  se logueo.', N'Baja', N'Login', N'6f4d6cfb3f2251edd2e345b4e284343da0b66b5f879283edd0e4c084f7ed1e37')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2360, N'admin', N'11/29/23', N'05:50:30', N'El usuario  se logueo.', N'Baja', N'Login', N'6f4d6cfb3f2251edd2e345b4e284343da0b66b5f879283edd0e4c084f7ed1e37')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2361, N'admin', N'11/29/23', N'05:55:02', N'El usuario  se logueo.', N'Baja', N'Login', N'd45871b9f08b30194dfee612ba05cd2757b77bbccc08248f4dc64d0f1c20da8e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2362, N'admin', N'11/29/23', N'05:56:24', N'El usuario  se logueo.', N'Baja', N'Login', N'f10532e6962b1e8e5e23d09d4ded0e28eefd1bbb975c5fd88a5947d4d4b3b33e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2363, N'admin', N'11/29/23', N'05:58:58', N'El usuario  se logueo.', N'Baja', N'Login', N'5534398be8ce3ccc7638daa935d2bdb0b17e35d34819fd96aa967289597a729a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2364, N'admin', N'11/29/23', N'06:04:35', N'El usuario  se logueo.', N'Baja', N'Login', N'c2d917640160778d5ae618668f43de681c317f510ab5cba62ed6790cc9ba65b3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2365, N'admin', N'11/29/23', N'06:06:41', N'El usuario  se logueo.', N'Baja', N'Login', N'e1c00d65b1bff8f7480a59caf2c2568328027cabd300515476e1c89cd9cd7e69')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2366, N'admin', N'11/29/23', N'06:09:13', N'El usuario  se logueo.', N'Baja', N'Login', N'366f341f52e594c95d05344a856f6a8ef9436d31af88ccddf258e356afd78b15')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2367, N'admin', N'11/29/23', N'06:10:32', N'El usuario  se logueo.', N'Baja', N'Login', N'3da835e190504770ee668bfe83b0de99e64ba2196581f5e0c10aaf3fe6fe9a0d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2368, N'admin', N'11/29/23', N'06:11:59', N'El usuario  se logueo.', N'Baja', N'Login', N'a9164319b82dd0e2b8e0782610ca6f631b778589493b6d9d3bbdb95b6860ea3b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2369, N'admin', N'11/29/23', N'06:14:45', N'El usuario  se logueo.', N'Baja', N'Login', N'76240afe0baa17845eae72d874289d6af57e854c7e34ca35d4ad48f8c0101c67')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2370, N'admin', N'11/29/23', N'06:16:00', N'El usuario  se logueo.', N'Baja', N'Login', N'2a99a0af10a2156d7af2500ee6cfba769add2634a5ba20b38bcefd48eb895579')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2371, N'admin', N'11/29/23', N'06:16:47', N'El usuario  se logueo.', N'Baja', N'Login', N'eab4b0e789128b22777108ca9f07a4d7dd268412b28635328853a21bd995363a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2372, N'admin', N'11/29/23', N'06:17:44', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'7d2633667b5c09590a8044c822701c3ade53b17d87c95c5b5d9ceff38f22f31b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2374, N'admin', N'11/29/23', N'06:28:43', N'El usuario  se logueo.', N'Baja', N'Login', N'bd1e91195d835791bff59e452ed069e6d59e416b9158a6163d4cfde036c0118e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2375, N'admin', N'11/29/23', N'06:32:01', N'El usuario  se logueo.', N'Baja', N'Login', N'8eec8b386336cffb92ea8539e9a0cbf16f9b2634d988276646afa8b46592f9ef')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2376, N'admin', N'11/29/23', N'06:32:54', N'El usuario  modifico una familia.', N'Media', N'Login', N'f73ffb2d29705214a4d858734c21e026831e5d07b8249595305531f989de7004')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2377, N'admin', N'11/29/23', N'06:49:50', N'El usuario  se logueo.', N'Baja', N'Login', N'361b00164dae62f867e717b4cd858b41d70725ce80e3380b5433434a50caeb2f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2189, N'admin', N'11/15/23', N'11:01:40', N'El usuario  se logueo.', N'Baja', N'Login', N'20e8049b72976f8e8fb5b52f335e526f6be86bf655f1b7760f6ba2e8c1a6550b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2190, N'admin', N'11/15/23', N'11:03:27', N'El usuario  se logueo.', N'Baja', N'Login', N'debc27e470a528f23db88e89cf6870981c71816ece098391fac9687147606e16')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2378, N'admin', N'11/29/23', N'06:55:18', N'El usuario  se logueo.', N'Baja', N'Login', N'08e98ead9711fdeeaf0f886951129c12fd6a6b163fe569ccadbc144620ad5311')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2379, N'admin', N'11/29/23', N'06:55:33', N'El usuario  modifico una familia.', N'Media', N'Login', N'b712c9875420a7d4c749012d1041003cf323758e066be83ae424cda0d84cf249')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2380, N'admin', N'11/29/23', N'06:55:47', N'El usuario  modifico una familia.', N'Media', N'Login', N'c4d1f8beb0358aaba2ca4983ca4681a0ea898171b786ac36664513bf6142699b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2381, N'admin', N'11/29/23', N'06:58:39', N'El usuario  se logueo.', N'Baja', N'Login', N'6e4fbdb5513b1b2bd7ab8f993d228220a8ecc349074e3370913c7b42c9bd4e1e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2382, N'admin', N'11/29/23', N'06:58:53', N'El usuario  modifico una familia.', N'Media', N'Login', N'0c00209440cea20821db273605121aecd7438b50e36b73f9e915fcbe140fec46')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2383, N'admin', N'11/29/23', N'06:59:04', N'El usuario  modifico una familia.', N'Media', N'Login', N'ae0ba71168846c2ace257e1d3dd2f3f7f04c6f3c715e737c449ea8be7d7ef8ee')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2384, N'admin', N'11/29/23', N'06:59:10', N'El usuario  modifico una familia.', N'Media', N'Login', N'2a03d536968b2bb4cb418e3a007bef308cd0bf0258429357d6eb43b6ea44404c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2385, N'admin', N'11/29/23', N'07:01:52', N'El usuario  se logueo.', N'Baja', N'Login', N'5ebb21f81211381b6a2aec3923e97bc766f02d6c97f6822a8c3128184c425022')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2388, N'admin', N'11/29/23', N'07:08:16', N'El usuario  se logueo.', N'Baja', N'Login', N'70000a1369abecd922c180f164936ae7a1613a89e4cdafa34ebedcf26fecb1c1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2389, N'admin', N'11/29/23', N'07:08:36', N'El usuario  modifico una familia.', N'Media', N'Login', N'aae808b5ce8efb6f502e05376b2f6ea630550e6e080a36cf242b203f050d0b7b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2390, N'admin', N'11/29/23', N'07:17:20', N'El usuario  se logueo.', N'Baja', N'Login', N'33f4953e13d52ed9f1a39ea955c142cd29f7f1093cb2a9a4d999e934d07b1c4c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2391, N'admin', N'11/29/23', N'07:21:19', N'El usuario  se logueo.', N'Baja', N'Login', N'0a246d610a5c91ed48c976b591ef29ebd3f3358dbf8ecec1e33bcd538101738f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2392, N'admin', N'11/29/23', N'07:24:46', N'El usuario  se logueo.', N'Baja', N'Login', N'b227f9c6e87bcb364f2fc029df61ea8dbe705fcdf437aec5dbc50cbc03b7d1fd')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2393, N'admin', N'11/29/23', N'07:26:44', N'El usuario  se logueo.', N'Baja', N'Login', N'ac550898525c91e54533b5bbe55e87e1fbbbf19060b38e27531b8c3aa70e599f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2394, N'admin', N'11/29/23', N'07:29:51', N'El usuario  se logueo.', N'Baja', N'Login', N'a481aa62f36739deea6afa5bdad3ff0a400b8204baeaade9a3cb40b7a899e280')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2395, N'admin', N'11/29/23', N'07:30:26', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'becda4962ed7f0c6447a995ede1c98c1df944e31b5027742a1a4cdd23b20f8b3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2396, N'admin', N'11/29/23', N'07:33:19', N'El usuario  se logueo.', N'Baja', N'Login', N'9a59c49d38568c0e32a52b43379db1885e8a13390bd13762901af3d327a317eb')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2397, N'admin', N'11/29/23', N'07:33:30', N'El usuario  agrego un item al carrito.', N'Media', N'Login', N'c717c4ed11bcf2621e00d5973c8d6d1b3fdddfd42b2458f4e0457908d1b2c5aa')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2398, N'admin', N'11/29/23', N'07:33:34', N'El usuario  agrego un item al carrito.', N'Media', N'Login', N'1bbc03a63cb1b589734505aa7972402d3b03aac55a26492a661995afc93386d5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2404, N'admin', N'11/29/23', N'07:38:27', N'El usuario  se logueo.', N'Baja', N'Login', N'ab880c07705853bfee09ee868e196da245d0c492874cbc7df7d0009b57589fce')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2405, N'admin', N'11/29/23', N'07:56:34', N'El usuario  se logueo.', N'Baja', N'Login', N'2df93557aa81b11b593b73a958870e143e120a500f6847d137f028c6ea6599ff')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2406, N'admin', N'11/29/23', N'08:04:30', N'El usuario  se logueo.', N'Baja', N'Login', N'cabbf5feb59ffd25f5c783f232bbd6f1e18b8ab5c4060c3d486874690e191b88')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2407, N'admin', N'11/29/23', N'08:09:04', N'El usuario  se logueo.', N'Baja', N'Login', N'7726d4a6cc0839c584ab45c79394a41d29b635c8280b75b34b07658704c62925')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2408, N'admin', N'11/29/23', N'08:12:55', N'El usuario  se logueo.', N'Baja', N'Login', N'801d2627bb02f3240e1a13ac0d477ab6bb485735f9af19d04451badf18433159')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2412, N'admin', N'11/29/23', N'19:00:27', N'El usuario  se logueo.', N'Baja', N'Login', N'9abd828cbf41dd262ba27744a3e8c13e7c4af24e34e998d848e6e912171be3a0')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2422, N'admin', N'12/05/23', N'15:19:56', N'El usuario  se logueo.', N'Baja', N'Login', N'220a59feff169baccc6f9fcfc7ccedc01f498adf030354b5b0f92ccadba17801')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2423, N'admin', N'12/05/23', N'15:19:59', N'El usuario  se logueo.', N'Baja', N'Login', N'af2358696d8a5f3721c421360c7a7520578bfcf3992f05f494def70fdaac0511')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2424, N'admin', N'12/05/23', N'15:27:42', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'af19e8a0712e3f9c481a2f99190b0d14a1af64c1a6790c843951989e2f80440b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2193, N'julian', N'11/15/23', N'17:09:51', N'El usuario  se logueo.', N'Baja', N'Login', N'5e7f4c260b40725ea4b7f60b7c5b71feb4d0d8fe53b4f9cc3522f67444684792')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2199, N'julian', N'11/15/23', N'17:30:15', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'9494ca20173092a0491f55c853d0808e1ebab55db730f6c3879680c651b7552d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2200, N'admin', N'11/15/23', N'17:32:15', N'El usuario  se logueo.', N'Baja', N'Login', N'31535f77cb8b30f3ca8d4f33c4ebd83e4257cfbef7acf9119d552fd424df7400')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2205, N'julian', N'11/15/23', N'19:13:33', N'El usuario  se logueo.', N'Baja', N'Login', N'6244ff6323ea269e0831573b8607a6cac3f69f75936f51e366729bb7c8e5056e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2207, N'julian', N'11/15/23', N'19:43:28', N'El usuario  se logueo.', N'Baja', N'Login', N'666ab3270276948760083fb92eb2264010d32d83ad23e3d89212e9f0057fc1a9')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2218, N'admin', N'11/26/23', N'14:20:41', N'El usuario  se logueo.', N'Baja', N'Login', N'cf8d9b42a6b05fa2ae73397d6d0743aa3ca24bd3284a026b490ab9abb8f94d7a')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2255, N'admin', N'11/27/23', N'11:05:33', N'El usuario  se logueo.', N'Baja', N'Login', N'5cd21135b34ab810edab87c67de1e8d9834be1aa98646e1a33876f61b448d9c3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2256, N'admin', N'11/27/23', N'11:07:37', N'El usuario  se logueo.', N'Baja', N'Login', N'8f4f99dd26cbfe4bc37838852a3f864bb0239020346fd8c926ddeaa54f957d7f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2263, N'admin', N'11/27/23', N'12:06:23', N'El usuario  se logueo.', N'Baja', N'Login', N'1729128eb0544fa765cd46ac53812e876260b02116606e81fd7eb53e92cd9dd9')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2373, N'admin', N'11/29/23', N'06:26:26', N'El usuario  se logueo.', N'Baja', N'Login', N'5cb021486aa939d0e8c55c5cc20826002781089f4df089f0dd562291501a140d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2201, N'admin', N'11/15/23', N'18:34:14', N'El usuario  se logueo.', N'Baja', N'Login', N'a67e3ce7072eacb9a16c18d41493262238cf96f5b1e233643e2c55b98fc2e97c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2202, N'admin', N'11/15/23', N'18:35:17', N'El usuario  se logueo.', N'Baja', N'Login', N'7c779bfaf1e79f9201a7ab2321907a7bd44a951ee7d08f4f7f0f45156f6842bb')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2203, N'admin', N'11/15/23', N'18:35:45', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'ae41ca1712db0ef5ab8292555c9bb7f75b5228935025f609728d61631d4187d8')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2204, N'julian', N'11/15/23', N'18:35:49', N'El usuario  se logueo.', N'Baja', N'Login', N'645067c3986b47e847bf07c96d3e93f719954e602b0c6e54a6fd757f3eccfd57')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2230, N'admin', N'11/27/23', N'00:50:04', N'El usuario  se logueo.', N'Baja', N'Login', N'63b07f14efbd84942c33699b6ab1cb078b40d9ace4523150a206a7aed5fdab04')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2280, N'admin', N'11/27/23', N'13:53:13', N'El usuario  se logueo.', N'Baja', N'Login', N'289df8f5e4af104cab4011b93a0285bfc607f438742e5e15a4c421e3c7190bd5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2297, N'admin', N'11/27/23', N'17:51:39', N'El usuario  se logueo.', N'Baja', N'Login', N'c1bbfdaa46391b78be15837a6a037adc8fe7e3bc88164d9bd3810596a3a8519b')
GO
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2416, N'admin', N'12/05/23', N'11:18:26', N'El usuario  se logueo.', N'Baja', N'Login', N'e424276ab1baed867333eb907e1f2bb15fde8338aee1a05e735f1fe5714968bc')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2421, N'admin', N'12/05/23', N'11:34:23', N'El usuario  se logueo.', N'Baja', N'Login', N'f3e53ac22b662c8479c5e4afa5b494f26d28eae69d4b1947ccaa0ec831db56c8')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2229, N'admin', N'11/27/23', N'00:47:02', N'El usuario  se logueo.', N'Baja', N'Login', N'aa1b0d66450e73501a3e6e38f8623c4ad0b5b15f701a47b04816bd8652744cd4')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2248, N'admin', N'11/27/23', N'10:41:39', N'El usuario  se logueo.', N'Baja', N'Login', N'7ee5d093b24080509d151af4a94fb7c7757e4e25d60bbb01d7c146cd9a6a4129')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2270, N'admin', N'11/27/23', N'12:34:38', N'El usuario  se logueo.', N'Baja', N'Login', N'76da0a80d5124addd7c15fad8efc1809029501b341c0493b4f545b23cb076a3e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2278, N'admin', N'11/27/23', N'13:43:49', N'El usuario  se logueo.', N'Baja', N'Login', N'f4631649b4d0b0aa45f979bdd52b5d7c09e33eb0387284732e1d7f96ee050e29')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2283, N'admin', N'11/27/23', N'14:08:13', N'El usuario  se logueo.', N'Baja', N'Login', N'32cae57757e23feb57bd4bf1fe11203faa472cc5a5676d463b58ac7096418a78')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2298, N'admin', N'11/27/23', N'19:17:15', N'El usuario  se logueo.', N'Baja', N'Login', N'ebda514b959ac1b53c01607b3313029d935f09d0552a1af376d28c6c75eb5e08')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2317, N'admin', N'11/28/23', N'00:57:44', N'El usuario  se logueo.', N'Baja', N'Login', N'794ea03b8bb79bd1ad2e0d914e6dd4986e13d2d457e3f3aee00e2982e62e2793')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2414, N'admin', N'12/05/23', N'11:09:44', N'El usuario  se logueo.', N'Baja', N'Login', N'ae9cc31b380e5c4f13736fafc50dfe490b22c05282442e4e845f973ef22dff9f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2237, N'admin', N'11/27/23', N'02:39:19', N'El usuario  se logueo.', N'Baja', N'Login', N'7dd8aaa84332e50b86233de6183a3f43221a4d9eee39e423e8f361d3472d4d76')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2238, N'admin', N'11/27/23', N'02:41:02', N'El usuario  se logueo.', N'Baja', N'Login', N'798a2db395c77cbb3b77d0deed2e56dfb32b64a22040f24a6eb2cd5b9b70bd9e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2245, N'admin', N'11/27/23', N'10:35:16', N'El usuario  se logueo.', N'Baja', N'Login', N'070c4c6844bf7f9a61b887e323ff5d24b98cc68eda2957077dfa6e2bd9d79bd3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2252, N'admin', N'11/27/23', N'10:59:32', N'El usuario  se logueo.', N'Baja', N'Login', N'04c4e4f1bba95672202e6abf97f9c9f0fd31291323e3b57a02725f63009bdbab')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2259, N'admin', N'11/27/23', N'11:29:32', N'El usuario  se logueo.', N'Baja', N'Login', N'e6c37e07204e270671d61acd3fd4aeb319d6a8ea0c5f1e78a6f63db037e4c8aa')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2260, N'admin', N'11/27/23', N'11:40:27', N'El usuario  se logueo.', N'Baja', N'Login', N'8897ae0de7700afd957ad5fe63a30e799880ef6317f8f3e8b263968a4c9c3da2')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2261, N'admin', N'11/27/23', N'11:43:30', N'El usuario  se logueo.', N'Baja', N'Login', N'a1315b109425fba18b6f633b8fb76eafe542db2964b3e03c8372e41c9cc2e730')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2265, N'admin', N'11/27/23', N'12:13:31', N'El usuario  se logueo.', N'Baja', N'Login', N'3e35c63e09d318e5d9c5ff8325ddbb1cc8749abb604e8c9835e02f30da4eb540')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2266, N'admin', N'11/27/23', N'12:15:35', N'El usuario  se logueo.', N'Baja', N'Login', N'61960747da04ca79f415e756425bd0279f4499ded39b93a44a8c05e25a443b35')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2267, N'admin', N'11/27/23', N'12:25:55', N'El usuario  se logueo.', N'Baja', N'Login', N'6eb280b2a298deffa03675105d98e7d4b96ab41c518af0110194e23b2606fe5f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2268, N'admin', N'11/27/23', N'12:27:26', N'El usuario  se logueo.', N'Baja', N'Login', N'7d23b17ed9545277a9753013199e29e49660526dcf3398da77a9a88f1a73c018')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2274, N'admin', N'11/27/23', N'13:23:50', N'El usuario  se logueo.', N'Baja', N'Login', N'dddaf7b4e9fd4c44dc43c93be4c35ccf85924b53b9e16add0327934aa2e4f605')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2275, N'admin', N'11/27/23', N'13:26:57', N'El usuario  se logueo.', N'Baja', N'Login', N'eef95097f60b830dc438b6d92a10a242984487f3b88cfff79e5f932bcc1bc6be')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2276, N'admin', N'11/27/23', N'13:29:54', N'El usuario  se logueo.', N'Baja', N'Login', N'c0f287348e3fe6729f90cd45e130aaae8753b317348e3b37e7c34c7605d596a2')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2277, N'admin', N'11/27/23', N'13:32:04', N'El usuario  se logueo.', N'Baja', N'Login', N'74dc3630aa0c7eed08bd809fea7754cf5c7bee1a5a3b11736808b8a9957712b0')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2279, N'admin', N'11/27/23', N'13:48:46', N'El usuario  se logueo.', N'Baja', N'Login', N'9a7a0bce0604c359ab86e23c271c53430ec04402c9cd0759a45c07b39c23f649')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2282, N'admin', N'11/27/23', N'14:00:30', N'El usuario  se logueo.', N'Baja', N'Login', N'cc371963c767ce7580208d5dac93e26f0e21f08d8105a2ee85f870577740d5ba')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2285, N'admin', N'11/27/23', N'14:15:04', N'El usuario  se logueo.', N'Baja', N'Login', N'6f162108a5df042580ade7750b2969b6ae27d72ef483b5e0d331aef6848adc19')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2286, N'admin', N'11/27/23', N'14:18:32', N'El usuario  se logueo.', N'Baja', N'Login', N'b2da426df5ada6a4e308e31bfe53796c92fb16f73f5e3cc58f89396a91e059c8')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2287, N'admin', N'11/27/23', N'14:20:26', N'El usuario  se logueo.', N'Baja', N'Login', N'29cfff15f14f586dcbc4ee7674dc3d3ceb710965dffa785e393822f25b57d307')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2291, N'admin', N'11/27/23', N'14:33:30', N'El usuario  se logueo.', N'Baja', N'Login', N'4ed5ccde90694f22797a3797b3584931927ac77d84376b90c30aee46098d91ee')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2293, N'admin', N'11/27/23', N'16:58:33', N'El usuario  se logueo.', N'Baja', N'Login', N'e96108ec56dce15cdbef33e607db543c3d31e659be6564e4bb05b231537b9acc')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2307, N'julian', N'11/27/23', N'22:51:05', N'El usuario  se logueo.', N'Baja', N'Login', N'9dcba97b835b8b37b0a7ab255d33c436eee2ce3066681644ecfb72daee1b2171')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2308, N'admin', N'11/27/23', N'22:53:36', N'El usuario  se logueo.', N'Baja', N'Login', N'1bdfd8239a89197a9e9e0fefd2861810cbede0d79044656417996d45de293692')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2309, N'admin', N'11/27/23', N'22:55:08', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'1a1889e61446c824a8210593d279c53968231481406995162e5369e79b44627f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2310, N'julian', N'11/27/23', N'22:55:21', N'El usuario  se logueo.', N'Baja', N'Login', N'1ab307af48e8b03c88a2cfaebccb055085e6c524be6f27805ecc0ebebb0affba')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2311, N'admin', N'11/27/23', N'23:34:49', N'El usuario  se logueo.', N'Baja', N'Login', N'd11e45b23a1be2b5891481245591ff7b4e69d24b590e2663580fcfe3c0226ab9')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2312, N'admin', N'11/27/23', N'23:38:24', N'El usuario  se logueo.', N'Baja', N'Login', N'6eebffd48952bb1dd277f99921f614a0069fbb914870608aba177351411d7f71')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2313, N'admin', N'11/27/23', N'23:41:09', N'El usuario  se logueo.', N'Baja', N'Login', N'90058df9ed1942f0e90b9991e96f083f62491c53b0673cdbcf9b634fe96f72ae')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2314, N'julian', N'11/27/23', N'23:44:33', N'El usuario  se logueo.', N'Baja', N'Login', N'915ec3989978cdafc62a24c842253a217662ebf430eab316598c46c74dc330ed')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2318, N'admin', N'11/28/23', N'01:15:17', N'El usuario  se logueo.', N'Baja', N'Login', N'7b391841814bc651f97a5b31bfe129f17f57ee3cc544981f7c2968d13943edc7')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2319, N'admin', N'11/28/23', N'01:18:44', N'El usuario  se logueo.', N'Baja', N'Login', N'ab6bc81844d095ec0ed808b6a3d9421d8ea27a0da006000fcfb123d51c2edbf1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2321, N'admin', N'11/28/23', N'14:51:33', N'El usuario  se logueo.', N'Baja', N'Login', N'96f9151d447e8d95f780b88fa0e416f8d7a9577cd07adf2f7c7f6e5247b99bbd')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2324, N'julian', N'11/29/23', N'03:29:20', N'El usuario  se logueo.', N'Baja', N'Login', N'604e27ff594ca705ae77a8679fb0007a9f5d2f180706dcfc2473fe15e42b18c1')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2325, N'julian', N'11/29/23', N'03:31:10', N'El usuario  se logueo.', N'Baja', N'Login', N'f45e4ed70246dfa1d134c17d3da15a7d156da25d53dc426d0b478896131919e9')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2326, N'julian', N'11/29/23', N'03:31:14', N'El usuario  se logueo.', N'Baja', N'Login', N'e54975c52bca22077af72a8bca6f9a15a1951238c0de6d923fb60d0efbf45ea2')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2336, N'admin', N'11/29/23', N'04:07:53', N'El usuario  se logueo.', N'Baja', N'Login', N'd06ba331e870bde6e9f36527afccab68d2c5859fc2d193c66d0b293c829ccf1c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2344, N'admin', N'11/29/23', N'04:37:56', N'El usuario  se logueo.', N'Baja', N'Login', N'af016137ebb452227e5aeb5ec37bbfd118910af1a08fdc892dff7083b9294525')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2345, N'admin', N'11/29/23', N'04:39:17', N'El usuario  se logueo.', N'Baja', N'Login', N'ea55e0d63e7cb47f4e1699505b257e8445b4c3d760c38e160837eb4bf1bfe025')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2346, N'admin', N'11/29/23', N'04:41:00', N'El usuario  se logueo.', N'Baja', N'Login', N'2f293db00bf8d0a5e8fc382e7641407fa7c819a8d89cbb98b09c8c473ca2e860')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2409, N'admin', N'11/29/23', N'15:40:14', N'El usuario  se logueo.', N'Baja', N'Login', N'9d7bb7acfe87521069885d3f9d21738c68dc3808a34013b87ee937d76f73eb7d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2415, N'admin', N'12/05/23', N'11:13:09', N'El usuario  se logueo.', N'Baja', N'Login', N'61ea3c31e7a57c62c71753ece77a2f2d9b95e5c0e897720058cf648b06e09ad4')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2386, N'admin', N'11/29/23', N'07:05:07', N'El usuario  se logueo.', N'Baja', N'Login', N'58adbd363792b5dbdee292c854759de668b328ce436b9a4639cfc64b72721983')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2387, N'admin', N'11/29/23', N'07:06:29', N'El usuario  se logueo.', N'Baja', N'Login', N'293260454b7e3e63708cca2cba395530c29fbbc06af995aa0f109e7f8b0f9d58')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2399, N'admin', N'11/29/23', N'07:35:19', N'El usuario  se logueo.', N'Baja', N'Login', N'd81b2b877abf23af54ae6eb0b5d36039589bb916a993a98adbea9da797206d75')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2400, N'admin', N'11/29/23', N'07:35:31', N'El usuario  agrego un item al carrito.', N'Media', N'Login', N'fd32e53d084d97588cce2cef7897f57171b1ab6c1000da56e4a21f39aef260e2')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2401, N'admin', N'11/29/23', N'07:35:34', N'El usuario  agrego un item al carrito.', N'Media', N'Login', N'b1028f9bc53addc5fb005016cf10f526a2fb16eea47685374edf48fd416c2095')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2402, N'admin', N'11/29/23', N'07:35:46', N'El usuario  realizo una compra.', N'Media', N'Login', N'fac96f36be6df5cb33e40c5fb69ccef3c63bf9ba8c8ac467aa5ca23bfb9e76d0')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2403, N'admin', N'11/29/23', N'07:35:51', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'dcca33853a77cceea08dd04540dc84ac3f0d90ac9acfe030b22c89860e400972')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2410, N'admin', N'11/29/23', N'16:47:50', N'El usuario  se logueo.', N'Baja', N'Login', N'06fd2885cb4ec3e4fcc5c20ba8110658de3b52064f755399a4565637b6a7a0e5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2411, N'admin', N'11/29/23', N'16:53:21', N'El usuario  realizo un backup.', N'Media', N'Login', N'bd7456d44055b68d3fc2ec8b92acd4d768fdfc8d42bcddb2c1b56c8da8e3a965')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2413, N'admin', N'12/05/23', N'11:00:35', N'El usuario  se logueo.', N'Baja', N'Login', N'514e2eef37b219c5312a7887ccea0f5de2e6b82d54b3505694ad20b8767e1d38')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2417, N'admin', N'12/05/23', N'11:31:05', N'El usuario  se logueo.', N'Baja', N'Login', N'f8fa0c1d54047dc021e67dc83dde4c25534e82bbbd15c7cf05169cd6548336f0')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2418, N'admin', N'12/05/23', N'11:32:06', N'El usuario  listo el XML.', N'Media', N'Login', N'69c40f482138b4490d0412eb6ace4bb601148dfb5b1831ace937ad86ba64bbba')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2419, N'admin', N'12/05/23', N'11:32:09', N'El usuario  listo el XML.', N'Media', N'Login', N'e723adba2a9e8cc5f05aa2e0e51e9c2459cb6516f51e191bb9740cd273f8b043')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2420, N'admin', N'12/05/23', N'11:32:11', N'El usuario  listo el XML.', N'Media', N'Login', N'dac6cbfd83ca92de2484ae6e85191456690d3d99699f75baf5c44210c2ad5ebf')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2425, N'admin', N'12/05/23', N'15:38:53', N'El usuario  se logueo.', N'Baja', N'Login', N'6c18d688d3f25b3435b99bb3714b2fc5efbd6cb75ccc2f0ba68dfffff5ccd1b9')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2426, N'admin', N'12/18/23', N'18:39:27', N'El usuario  se logueo.', N'Baja', N'Login', N'13017f509f45a6a42aa19280e1c90fd8ef4328e7d9c2b6eeedae9723a8adbf58')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2427, N'admin', N'12/18/23', N'19:22:16', N'El usuario  se logueo.', N'Baja', N'Login', N'82e16a9a924c811b379af16e2372a2a8613196fa71ce72263a2f9a948ecbb5fd')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2428, N'admin', N'12/18/23', N'19:22:24', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'6aeefe28987b7b0db44d0bf90beb04089495e93a83973e72f65c291a27d4a3f6')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2429, N'admin', N'12/18/23', N'19:22:25', N'El usuario  se logueo.', N'Baja', N'Login', N'13c68a32728e1cb8a01f6d38cf9f9ec70a4c590826eed01104c36fe653cf1c30')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2430, N'admin', N'12/18/23', N'19:22:49', N'El usuario  se logueo.', N'Baja', N'Login', N'3881840ca4066ef7f4316aeb1440190cacda12298d16489983881934256312a3')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2431, N'admin', N'12/18/23', N'19:23:22', N'El usuario  agrego un curso.', N'Media', N'Login', N'9d513b15eed4d3846e38f3c6edf9a01f00e29136c5b9dcbcf5169e7319f2cab5')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2432, N'admin', N'12/18/23', N'19:23:37', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'dc0381160a5684016942cdfc9544a4eadd95987cb4972d7e10e5787d351dcc2f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2433, N'admin', N'12/18/23', N'19:28:17', N'El usuario  se logueo.', N'Baja', N'Login', N'344afc773736d9ee7a6821480929d05cf5bd99048ae161bfe5f4ae4b44fb3d7c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2434, N'admin', N'12/18/23', N'19:28:25', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'c3b15247a07679d1f4344844e5677ff062c8fff567b33c31675eed3a4ff5d5ef')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2435, N'admin', N'12/18/23', N'19:28:27', N'El usuario  se logueo.', N'Baja', N'Login', N'a4c57637558bfbdce13fe088f5816558e35d8d2709b76dc84e0b2d2c3965b38d')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2436, N'admin', N'12/18/23', N'19:28:30', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'c81027048acf7de613f2e6efd4190515c4e12688ded91adb0a43d5d65f148875')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2437, N'admin', N'12/18/23', N'19:28:32', N'El usuario  se logueo.', N'Baja', N'Login', N'149b86e0858cc98478c86643ad182fcdb57562e65fad9749dbf0af5fa2878c0c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2438, N'admin', N'12/18/23', N'19:28:52', N'El usuario  agrego un curso.', N'Media', N'Login', N'6323452ad38464256d2d641c23b3ee21fed0c08d055776fd872ad61daf7cf147')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2439, N'admin', N'12/18/23', N'19:32:22', N'El usuario  se logueo.', N'Baja', N'Login', N'0476d17f9fcc9f19c59ea55206bfea9cab1d6827a170d0fe87e7973f3aac50ba')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2440, N'admin', N'12/18/23', N'19:32:33', N'El usuario  edito un curso.', N'Media', N'Login', N'3ab59aeae30f9f3eb7090c0d08ead98c160333678ec85a42d4e0fc948784b378')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2441, N'admin', N'12/18/23', N'19:32:36', N'El usuario  edito un curso.', N'Media', N'Login', N'6b4fbe1363d2318115e315da3ff03a5dbe6d1741aee10e8896a8e23e34dd77dd')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2442, N'admin', N'12/18/23', N'19:32:39', N'El usuario  edito un curso.', N'Media', N'Login', N'7ef3e9fe9a2e943a94906dd3dfc419f47e1f6beff869add5131b047dd51f41b9')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2443, N'admin', N'12/18/23', N'19:32:54', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'8c23cf541008dd7a6532c2a9607eb452c6bf6ede3e236d90ff88243bad491c0e')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2444, N'admin', N'12/18/23', N'19:32:55', N'El usuario  se logueo.', N'Baja', N'Login', N'e4bf3aa02c2a0c6a1521de2740025efd9c27849e397dc1abe333a1bbe6f7a3dc')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2445, N'admin', N'12/18/23', N'19:33:08', N'El usuario  agrego un curso.', N'Media', N'Login', N'd630c1ee06225a5e92553fd2c44b902d1f3e54b8ac0a2c648cbdba2c8daa2f3f')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2446, N'admin', N'12/18/23', N'19:33:12', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'a830b867535177c2c05b42aaea7b7bb1a0828501e4227560a66751e30e0d8264')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2447, N'admin', N'12/18/23', N'19:33:13', N'El usuario  se logueo.', N'Baja', N'Login', N'69413d2dc5a72ce21a527d74c9c0d77c97cef2174c30dffc99657ebdd6174470')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2448, N'admin', N'12/18/23', N'19:33:19', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'c648fa508d006e088c817912e80f5d0253d470f9831a0da4c919559a99d5a299')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2449, N'admin', N'12/18/23', N'19:33:20', N'El usuario  se logueo.', N'Baja', N'Login', N'ae756f766dc57d715720ba6d86ff3fb8a801527946bbd6d3618a937e97471e4b')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2450, N'admin', N'12/18/23', N'19:33:55', N'El usuario  edito un curso.', N'Media', N'Login', N'54c7505140121f089fdf6585a67629bca6453f6f51d3fcf7641c75a273d34305')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2451, N'admin', N'12/18/23', N'19:34:10', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'ad2f45e4eb7ab52cbe71ffd620c18445befdc32d4c4a793f369665c3cadaaa91')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2452, N'admin', N'12/18/23', N'19:34:11', N'El usuario  se logueo.', N'Baja', N'Login', N'd4f8f95fc5e413f09b43f921773aaa1c810f9bda50f4d43d2106b79a4965ce83')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2453, N'admin', N'12/18/23', N'19:34:30', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'24a0e2d885e92cc2bbf7370dd21891bf208cfc445b9bc58570e34b39cec1c550')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2457, N'admin', N'12/18/23', N'21:21:32', N'El usuario  se logueo.', N'Baja', N'Login', N'314469136a0a3397f1ac689a86d5888ff0b1175f70f1ab221862687d080f19df')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2460, N'admin', N'12/18/23', N'22:46:18', N'El usuario  se logueo.', N'Baja', N'Login', N'a2bae073797001c4483964853c0581e7b4a923884bde4cd06bad275c0867a448')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2454, N'admin', N'12/18/23', N'21:19:58', N'El usuario  se logueo.', N'Baja', N'Login', N'7abeab31d1c88ea4d17e37dbcae94cd5a412261690354d24822a0442f7481433')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2455, N'admin', N'12/18/23', N'21:20:13', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'f09f1273fd56e1ab6bef29a0b3b53f71ad21d08b607176a514bdc6238afbf72c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2456, N'admin', N'12/18/23', N'21:20:15', N'El usuario  se logueo.', N'Baja', N'Login', N'f4dae93893496838b14b316401dd56e90fb0fb75926e5b3521ac7036c2a6b7f6')
GO
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2458, N'admin', N'12/18/23', N'21:29:24', N'El usuario  se logueo.', N'Baja', N'Login', N'ab89dafcab9b12654f98fece9ecd85d6d9892e35ba3a8deb33b206b27f8750be')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2459, N'admin', N'12/18/23', N'22:33:06', N'El usuario  se logueo.', N'Baja', N'Login', N'7bd2b8e182e4d02349844dd90cbc7bba24e3a71bcd3bb3ed81ac0a6591528ec3')
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (1, N'tu vieja', N'el curso de tu vieja', N'22        ', N'f007971a47e6e9c71ce791c80d24c518ddb7cd5e85768b1f4b68a993d056fa9b')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (3, N'Curso de  Lenguaje de senias', N'Curso introductorio', N'7000      ', N'd59af938dfe278662aa718508791267af91a5c20399870e1edddf4eb68baeedd')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (4, N'Curso de Interpretacion en vivo', N'Curso Avanzado ', N'12000     ', N'b788733ff4211e920da4b8de1aa3afef0feaa7b8795ed8048d556d1034cbfb72')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (5, N'Curso de marketing', N'Curso Intermedio', N'5000      ', N'32b7e2d6a027b7530ae5586a0eb2e9b4f828579cd421008b30eb89c4d1cfa210')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (6, N'Curso de marketing visual', N'Curso Avanzado', N'8000      ', N'ce2f5150920498e51661e133de6fa51545f9b04fcfa680bd9b1f724ba9e22611')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (7, N'Curso de mercadotecnia', N'Curso Intermedio', N'4000      ', N'69409f22ec667c7d3649255124c0c1241a52a89d84d4b44bfb4bf1c3998447bc')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (8, N'Curso de lenguaje de marcado', N'Curso completo', N'3200      ', N'f7a17fd1b70e20922374cb83c9f9e5c9e5035b7ec126549cfabc322c86bd47d1')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (9, N'Curso test2', N'Detalles del curso 2', N'2138      ', N'19eeb3008ca5d61c6f82902b6d6d0eb3e07835cedb00b4aa2c7982e80b0b9063')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (10, N'tu vieja', N'el curso de tu vieja', N'2         ', N'b0c38550dba7f4675561a27831e5827932c524016aa3e9c60c827e648edc0177')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (11, N'tu vieja', N'asddd', N'23423     ', N'a76d2b41de608d9c2693448e364d3ae2849f77ffc354a1f3756de5f0da650293')
INSERT [dbo].[Courses] ([ID], [Name], [Description], [Precio], [dvh]) VALUES (12, N'holamundo', N'wefwaef', N'123       ', N'92e6ec6636f12f3c56eba105402eb5f5e651145d86946690634eaf176b52e5a1')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
INSERT [dbo].[dvv] ([dvv], [tablename]) VALUES (N'1ad7233e1a908cb5cd6ba44fe5b675649af6cf9ce71cdb066823005a14386250', N'Users')
INSERT [dbo].[dvv] ([dvv], [tablename]) VALUES (N'28f67d0e8a55c5f571f6d90bb580b641318750e1fdafedfc747c885268099828', N'Courses')
INSERT [dbo].[dvv] ([dvv], [tablename]) VALUES (N'd239c0c2888ad9e31a1750d1e862335c7f1a407c02d5080025891be895afdbae', N'Bitacora')
INSERT [dbo].[dvv] ([dvv], [tablename]) VALUES (N'a506d8b1286e457b82c24abb6b3fd90c97ebb66d07e75cdeeac69ab1313fbf92', N'Permission')
GO
SET IDENTITY_INSERT [dbo].[Interpretaciones] ON 

INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (1, N'A', N'Letra A', 5, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (2, N'B', N'Letra B', 5, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (3, N'C', N'Letra C', 5, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (4, N'D', N'Letra D', 5, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (5, N'Hola', N'Palabra hola', 5, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (6, N'Adios', N'Palabra adios', 6, 1, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (7, N'Lunes', N'Palabra lunes', 6, 0, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (8, N'Pepito', N'Palabra pepito', 6, 0, N'11/15/2023 11:03:32 AM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (9, N'River', N'River palabra', 6, 0, N'11/26/2023 2:21:12 PM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (10, N'Plate', N'El mas grande', 6, 0, N'11/27/2023 11:42:15 PM')
INSERT [dbo].[Interpretaciones] ([ID], [Nombre], [Descripcion], [ID_user], [Aprobada], [Fecha]) VALUES (11, N'Racing', N'Racing club de Avellaneda', 6, 0, N'11/27/2023 11:42:32 PM')
SET IDENTITY_INSERT [dbo].[Interpretaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'Admin', 3, NULL, NULL, N'ed060174849669ba68edeb30cd7d429dea40eb4c7e26601b38c81de1249cdbfd')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'AdminCompras', 17, N'AdminCompras', N'Menu de compras como administrador', N'fcd7fa7e04996e2b577ad31931d077bb897a0281796e965babb38b2b9bad4642')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'AdminSolicitudes', 14, N'AdminSolicitudes', N'Menu de solicitudes como Admin', N'732e4026ab2f14197ef66b4e0457c29e1f5ae20a457baeb844759f7cc05578df')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'Backup', 11, N'Backup', N'Menu de backup/restore', N'6a4d238c9e50c09974c69ce7f98329eb2d4729a0b39ed636f2bd1b9b6517651f')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'Bitacora', 1, N'Bitacora', N'Vista de la bitacora', N'943610b58a1572456fb5618512136da2ed36a0fd30e84df80c44a7985c0805cd')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'Cliente', 4, NULL, NULL, N'2a6b542e3dd8e9563b3ec59b0ee61bcc621a2f3ad0501356986ef847b2373ee8')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'Compras', 16, N'Compras', N'Realizar compras', N'fc9c49a9ae2a46b5554ba4d0d0b60bff2a014e2ac0e8ffc2702976e228b833f2')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'Default', 6, N'Default', N'Default', N'fcb38d9bbe0547d8b953ff0b8ad7dced07744c9c940232542f784d930807fe29')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'FamiliaTest1', 20, NULL, NULL, N'1021cf4d4283f6601dc45498f87b5c1cbe42b375e44a2840e7c15560e1fcc65d')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'Los simpsons', 18, NULL, NULL, N'1966dca10adef7bc84ed7c66bdcd73b8a2c8062cf198acf9994818d6dbbeebff')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'Patentes', 5, N'Patentes', N'Menu de familias y componentes', N'b604c6431909a0e1c2f6e4275c0f30171f25027419f3ab651ac4079d572f3232')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'Solicitud', 15, N'Solicitud', N'Realizar una solicitud', N'd665a7da4952b8bf54ab1f543fb66e02256e7e118735fd74cae313cf0422aedd')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'Usuarios', 2, N'Usuarios', N'Menu de usuarios', N'8c082742af8ef4bdd11a39e387be339053d8d7b9d3e656cad98ce2dd87590fba')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'WebMaster', 10, NULL, NULL, N'f920189991382e84dc077fa91a0402ed7c792c5a4422dc8615a9657c40ac2f64')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'WebService', 12, N'WebService', N'Menu de Webservices', N'83c132af565f8b96a3ceb9e20716e30eaf5b2d570b16fec27e9cdbed24c6bbe2')
INSERT [dbo].[Permission] ([Name], [ID], [Permission], [Description], [dvh]) VALUES (N'XML', 13, N'XML', N'Menu de salidas XML', N'3cbd23e747fae1d1ca50127a611d1c6a0ab44a44aa4d0bbd4aef338188e081eb')
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (3, 1, N'eb1e33e8a81b697b75855af6bfcdbcbf7cbbde9f94962ceaec1ed8af21f5a50f')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (3, 2, N'e29c9c180c6279b0b02abd6a1801c7c04082cf486ec027aa13515e4f3884bb6b')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (3, 5, N'9f14025af0065b30e47e23ebb3b491d39ae8ed17d33739e5ff3827ffb3634953')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (18, 1, N'580811fa95269f3ecd4f22d176e079d36093573680b6ef66fa341e687a15b5da')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (3, 16, N'7a20311cf7a4b222d436424480bc65dd0f9d2cefcbbb1fa148ca0d7e1d5bb55a')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (3, 15, N'377adeb4cd4096adc7ca64b533938cffc6294a9b3534f883b2336a26252cda9a')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (3, 12, N'865736a1c30a82dc67aba820360a01b1d9d0da5643234cd07c4d60b06eb530c5')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (3, 13, N'8efbbe9bc19ad2e043c6cdb187c0a0fedde70b6458443ce0b5648ec04ccf4cdf')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (3, 14, N'748064be03a08df81e31bd6f9e7e7c4cc9f84b4401b9a3c6e85b7ff816d3ba68')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (4, 16, N'67e0bdb7b6c549d4fa834d0f6848ce6a3a12e07de9cea949ad41932bd5881bc4')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (4, 15, N'fc72c98a6c2916c1bbf9f39fce094f5785bb6f1d656971520b660b2e8a760fe3')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (10, 11, N'3dd9c0995d54c0abd51a90f1d57b1ce77bc885fc8a7cea52dcad3c2540dda5ee')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (10, 1, N'16dc368a89b428b2485484313ba67a3912ca03f2b2b42429174a4f8b3dc84e44')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (10, 12, N'165940940a02a187e4463ff467090930038c5af8fc26107bf301e714f599a1da')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (10, 13, N'2ec42bc1f3e672fc1cf7fdcfc23246415dcf20f03c0d4a5bbbd92a185708f5b7')
INSERT [dbo].[Permission_Permission] ([ID_Permission_Father], [ID_Permission_Child], [dvh]) VALUES (20, 17, N'46e67c525617663b392a53c0e94ba79e62db62a851fb175ae87756d4e73c9718')
GO
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (6, 3)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (4, 1)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (7, 3)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (5, 4)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (8, 4)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (6, 6)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (7, 6)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (5, 6)
INSERT [dbo].[User_Permission] ([ID_User], [ID_Permission]) VALUES (8, 6)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Dni], [Name], [LastName], [Nickname], [Password], [Email], [Phone], [Address], [dvh], [Language_Id], [Tries], [Blocked]) VALUES (6, N'39430861', N'Julian', N'Lastra', N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'julianlastra.kz@gmail.com', N'1159363830', N'Posadas 289', N'5b44e9aa3d2bd3c70979f21dbca88209b22af67f1b6749cd4a3e8bdd1190e179', 1, 0, 0)
INSERT [dbo].[Users] ([Id], [Dni], [Name], [LastName], [Nickname], [Password], [Email], [Phone], [Address], [dvh], [Language_Id], [Tries], [Blocked]) VALUES (7, N'39430862', N'Julian', N'lastra', N'julian', N'ce0fee7e61f9c74f1110f0e5940a80b4f059f189217d0c3d26bb41960d4bf597', N'julianlastra.kz@gmail.com', N'12293392', N'Posadas 289', N'62f495d05cd7b17cba74daf50189841f2e83d26dc689e6c0cc60d6849d892459', 2, 0, 0)
INSERT [dbo].[Users] ([Id], [Dni], [Name], [LastName], [Nickname], [Password], [Email], [Phone], [Address], [dvh], [Language_Id], [Tries], [Blocked]) VALUES (8, N'23231315', N'Luis Alberto', N'Spinetta', N'spinetta', N'ce0fee7e61f9c74f1110f0e5940a80b4f059f189217d0c3d26bb41960d4bf597', N'luis@spinetta.com', N'2229942', N'Av Livertador', N'2a94370674c42c6436e86b82f24889fb9c2cfc6f49e9efcbfe22d1b27973175e', 1, 1, 0)
INSERT [dbo].[Users] ([Id], [Dni], [Name], [LastName], [Nickname], [Password], [Email], [Phone], [Address], [dvh], [Language_Id], [Tries], [Blocked]) VALUES (4, N'321321', N'David', N'Guilmoure', N'davidg', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'd@gmail.com', N'1234', N'Lodnres 14', N'69a800b8b8463c1ecb3964c38dae08cd5c8d2374eddb3ba3ccbed0457f38b5be', 1, 0, 0)
INSERT [dbo].[Users] ([Id], [Dni], [Name], [LastName], [Nickname], [Password], [Email], [Phone], [Address], [dvh], [Language_Id], [Tries], [Blocked]) VALUES (5, N'32131', N'Pepe', N'pepe', N'pepe', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'racingcampeon', N'123', N'pepe ', N'7ff4997aca75a1623f959c23b23acdb6301c64c73f6b2d3d68b02c4b5b6d7074', 1, 7, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [tfi] SET  READ_WRITE 
GO
