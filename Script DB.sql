USE [master]
DECLARE @DatabaseName nvarchar(50)
SET @DatabaseName = N'tfi'

DECLARE @SQL varchar(max)

SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
FROM MASTER..SysProcesses
WHERE DBId = DB_ID(@DatabaseName) AND SPId <> @@SPId

--SELECT @SQL 
EXEC(@SQL)
DROP DATABASE [tfi]
GO
CREATE DATABASE [tfi] 
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
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2453, N'admin', N'12/18/23', N'19:34:30', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'24a0e2d885e92cc2bbf7370dd21891bf208cfc445b9bc58570e34b39cec1c550')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2457, N'admin', N'12/18/23', N'21:21:32', N'El usuario  se logueo.', N'Baja', N'Login', N'314469136a0a3397f1ac689a86d5888ff0b1175f70f1ab221862687d080f19df')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2460, N'admin', N'12/18/23', N'22:46:18', N'El usuario  se logueo.', N'Baja', N'Login', N'a2bae073797001c4483964853c0581e7b4a923884bde4cd06bad275c0867a448')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2454, N'admin', N'12/18/23', N'21:19:58', N'El usuario  se logueo.', N'Baja', N'Login', N'7abeab31d1c88ea4d17e37dbcae94cd5a412261690354d24822a0442f7481433')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2455, N'admin', N'12/18/23', N'21:20:13', N'El usuario  se deslogueo.', N'Baja', N'Logout', N'f09f1273fd56e1ab6bef29a0b3b53f71ad21d08b607176a514bdc6238afbf72c')
INSERT [dbo].[Bitacora] ([Id], [UserName], [Date], [Time], [Info], [Priority], [Activity], [dvh]) VALUES (2456, N'admin', N'12/18/23', N'21:20:15', N'El usuario  se logueo.', N'Baja', N'Login', N'f4dae93893496838b14b316401dd56e90fb0fb75926e5b3521ac7036c2a6b7f6')
GO
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