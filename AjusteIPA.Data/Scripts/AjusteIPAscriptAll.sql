
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT IF EXISTS [FK__Usuario__rolid__403A8C7D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RegistroCatastrofico]') AND type in (N'U'))
ALTER TABLE [dbo].[RegistroCatastrofico] DROP CONSTRAINT IF EXISTS [FK__RegistroC__IdCod__3F466844]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reclamaciones]') AND type in (N'U'))
ALTER TABLE [dbo].[Reclamaciones] DROP CONSTRAINT IF EXISTS [FK__Reclamaci__Numer__3C69FB99]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reclamaciones]') AND type in (N'U'))
ALTER TABLE [dbo].[Reclamaciones] DROP CONSTRAINT IF EXISTS [FK__Reclamaci__Munic__3B75D760]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reclamaciones]') AND type in (N'U'))
ALTER TABLE [dbo].[Reclamaciones] DROP CONSTRAINT IF EXISTS [FK__Reclamaci__IdCod__398D8EEE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reclamaciones]') AND type in (N'U'))
ALTER TABLE [dbo].[Reclamaciones] DROP CONSTRAINT IF EXISTS [FK__Reclamaci__Espec__38996AB5]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reclamaciones]') AND type in (N'U'))
ALTER TABLE [dbo].[Reclamaciones] DROP CONSTRAINT IF EXISTS [FK__Reclamaci__Cuent__37A5467C]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[TipoServicio]
GO
/****** Object:  Table [dbo].[Tier]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[Tier]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[Rol]
GO
/****** Object:  Table [dbo].[RegistroCatastrofico]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[RegistroCatastrofico]
GO
/****** Object:  Table [dbo].[Reclamaciones]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[Reclamaciones]
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[Municipio]
GO
/****** Object:  Table [dbo].[LogReclamacionesAjustadas]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[LogReclamacionesAjustadas]
GO
/****** Object:  Table [dbo].[IPA]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[IPA]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[Especialidad]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[Cuenta]
GO
/****** Object:  Table [dbo].[CodigoCatastrofico]    Script Date: 10/16/2022 11:47:50 PM ******/
DROP TABLE IF EXISTS [dbo].[CodigoCatastrofico]
GO
/****** Object:  Table [dbo].[CodigoCatastrofico]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodigoCatastrofico](
	[idCodigoCatastrofico] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
 CONSTRAINT [PK_CodigoCatastrofico] PRIMARY KEY CLUSTERED 
(
	[idCodigoCatastrofico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[idCuenta] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[idCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPA]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPA](
	[NumeroIPA] [int] NOT NULL,
	[NombreIPA] [varchar](50) NULL,
	[NumeroPCP] [varchar](50) NULL,
	[NombrePCP] [varchar](50) NULL,
	[FechaEfectividad] [datetime] NULL,
	[FechaTerminacion] [datetime] NULL,
	[Estatus] [char](1) NULL,
 CONSTRAINT [PK_IPA] PRIMARY KEY CLUSTERED 
(
	[NumeroIPA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogReclamacionesAjustadas]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogReclamacionesAjustadas](
	[idReclamacion] [int] NULL,
	[NumReclamacion] [varchar](50) NULL,
	[NumeroIPA] [int] NULL,
	[NumeroPCP] [varchar](50) NULL,
	[NombrePCP] [varchar](50) NULL,
	[Tier] [int] NULL,
	[Cuenta] [int] NULL,
	[NumeroContrato] [varchar](50) NULL,
	[NombreAsegurado] [varchar](50) NULL,
	[Edad] [varchar](50) NULL,
	[FechaServicio] [datetime] NULL,
	[FechaPago] [datetime] NULL,
	[TipoServicio] [int] NULL,
	[LugarServicio] [varchar](50) NULL,
	[NumeroServicio] [varchar](50) NULL,
	[ICD9] [varchar](50) NULL,
	[ICD10] [varchar](50) NULL,
	[IdCodigoCatastrofico] [int] NULL,
	[Especialidad] [int] NULL,
	[Municipio] [int] NULL,
	[CantidadPagada] [float] NULL,
	[EstatusAjuste] [varchar](50) NULL,
	[CantidadAjustada] [float] NULL,
	[FechaAjuste] [datetime] NULL,
	[EstatusReclamacion] [varchar](50) NULL,
	[IDUsuario] [int] NULL,
	[Comentarios] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipio](
	[idMunicipio] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
 CONSTRAINT [PK_Municipio] PRIMARY KEY CLUSTERED 
(
	[idMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reclamaciones]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reclamaciones](
	[idReclamacion] [int] NOT NULL,
	[NumReclamacion] [varchar](50) NULL,
	[NumeroIPA] [int] NULL,
	[NumeroPCP] [varchar](50) NULL,
	[NombrePCP] [varchar](50) NULL,
	[Tier] [int] NULL,
	[Cuenta] [int] NULL,
	[NumeroContrato] [varchar](50) NULL,
	[NombreAsegurado] [varchar](50) NULL,
	[Edad] [varchar](50) NULL,
	[FechaServicio] [datetime] NULL,
	[FechaPago] [datetime] NULL,
	[TipoServicio] [int] NULL,
	[LugarServicio] [varchar](50) NULL,
	[NumeroServicio] [varchar](50) NULL,
	[CargoTotal] [float] NULL,
	[ICD9] [varchar](50) NULL,
	[ICD10] [varchar](50) NULL,
	[IdCodigoCatastrofico] [int] NULL,
	[Especialidad] [int] NULL,
	[Municipio] [int] NULL,
	[CantidadPagada] [float] NULL,
	[EstatusAjuste] [varchar](50) NULL,
	[CantidadAjustada] [float] NULL,
	[FechaAjuste] [datetime] NULL,
	[EstatusReclamacion] [varchar](50) NULL,
	[IDUsuario] [int] NULL,
	[Comentarios] [varchar](50) NULL,
 CONSTRAINT [PK_Reclamaciones] PRIMARY KEY CLUSTERED 
(
	[idReclamacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroCatastrofico]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroCatastrofico](
	[idRegCatastrofico] [int] NOT NULL,
	[NumeroContrato] [varchar](50) NULL,
	[NombreAsegurado] [varchar](50) NULL,
	[IdCodigoCatastrofico] [int] NULL,
	[FechaComienzo] [datetime] NULL,
	[FechaTerminacion] [datetime] NULL,
 CONSTRAINT [PK_RegistroCatastrofico] PRIMARY KEY CLUSTERED 
(
	[idRegCatastrofico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[id] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tier]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tier](
	[idTier] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
 CONSTRAINT [PK_Tier] PRIMARY KEY CLUSTERED 
(
	[idTier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServicio](
	[idServicio] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
 CONSTRAINT [PK_TipoServicio] PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/16/2022 11:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idusuario] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[numempleado] [varchar](8) NULL,
	[rolid] [int] NULL,
	[password] [varchar](25) NULL,
	[Estatus] [char](1) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (1, N'Anemia Aplasica')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (2, N'Artritis Reumatoide')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (3, N'Autismo')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (4, N'Cancer')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (5, N'Cancer de piel como Melanoma Invasivo o celulas escamosas con evidencia de metastasis')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (6, N'Cancer en la Piel - Carcinoma')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (7, N'Enfermedad Renal Cronica')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (8, N'Escleroderma')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (9, N'Esclerosis Multiple y Esclerosis lateral amiotrofica')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (10, N'Fibrosis Quistica')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (11, N'Hemofilia')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (12, N'Lepra')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (13, N'Lupus Eritematoso Sistemico')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (14, N'Menores con Necesidades Especiales de Salud')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (15, N'Obstetricia')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (16, N'Tuberculosis')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (17, N'VIH-SIDA')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (18, N'Adultos con Fenilcetonuria')
INSERT [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico], [descripcion]) VALUES (19, N'Hipertension Pulmonar')
GO
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (1010, N'Primary care physicians')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (1020, N'Specialty referrals')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (1030, N'Pharmacy referrals')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (1040, N'Laboratory referrals')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (1050, N'X-Rays referrals')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (1060, N'Referral medical services in ER')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (1070, N'Referred medical services given at hospital')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (1080, N'Referred mental ambulatory and referred substance')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (2010, N'Hospital services')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (2020, N'ER Facility')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (2030, N'Hi tech labs')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (2040, N'Ambulatory surgery facilities')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (3010, N'Mental health facilities - alcohol and substance')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (4010, N'Ambulance')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (5010, N'Allied professionals')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (6010, N'Reinsurance')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (7010, N'Dental')
INSERT [dbo].[Cuenta] ([idCuenta], [descripcion]) VALUES (8010, N'Administrative')
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (1, N'Generalista')
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (2, N'Medicina de Familia')
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (3, N'Medicina Interna')
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (4, N'Neumologia Pediatrica')
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (5, N'Obstetricia y Ginecologia')
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (6, N'Centros de Vacunacion')
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (7, N'Pediatria')
GO
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (4300, N'MEDICAL NETWORK LLC', N'43001', N'Brito Peguero Yudit M', CAST(N'2021-02-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (4302, N'NEO SALUTIS INC', N'43021', N'Rodriguez Lopez Oscar E', CAST(N'2018-07-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (4307, N'CENTRO MEDICINA PRIMARIA VEGA ALTA CORP', N'43071', N'Heal Barbosa David', CAST(N'2019-08-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (4309, N'ANCHOR HEALTH MANAGEMENT CORP', N'43091', N'Gonzalez Rodriguez Julio A', CAST(N'2021-10-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (4318, N'METRO SALUD GRUPO PROFESIONAL', N'43181', N'Girona Lozada Marielys D ', CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (4350, N'QUALITY CARE PHYSICIANS LLC', N'43501', N'Cortes Rexach Ivan', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (4356, N'GRUPO DE MEDICINA FAMILIAR DE COROZAL', N'43561', N'Rivera Molina Zoraida', CAST(N'2018-10-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (5008, N'ACO DEL NORTE LLC', N'50081', N'Acevedo Tacoronte Jose', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (5013, N'CENTRO DE SALUD DE LARES INC', N'50131', N'Garcia Feliciano Arturo T', CAST(N'2020-05-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (5015, N'CAMUY HEALTH SERVICES INC', N'50151', N'Ball Rosa Francisco E', CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (5020, N'CENTRO DE MEDICINA INTEGRAL DE MANATI INC', N'50201', N'Gomez Adrover Reynaldo', CAST(N'2018-11-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (5032, N'ALLIED SELECT MEDICAL GROUP INC', N'50321', N'Colon Marin Jaquelin', CAST(N'2018-08-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (7602, N'INTERNAL MEDICINE CANOVANAS GROUP CORP', N'76021', N'Marte Cabrera Francisco', CAST(N'2022-02-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (7629, N'FAMILY MEDICINE GROUP', N'76291', N'Alejandro Santiago Axel ', CAST(N'2022-04-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (7644, N'CONCILIO DE SALUD INTEGRAL DE LOIZA', N'76441', N'Febo Cruz Nancy I', CAST(N'2019-03-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (8132, N'ASOCIACION DE MEDICOS DEL OESTE INC', N'81321', N'Tosca Claudio Maria D', CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (8133, N'PEPINO HEALTH GROUP INC', N'81331', N'Lopez Rodriguez Xiomara', CAST(N'2019-06-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (8135, N'DOCTORES ASOCIADOS DEL NOROESTE', N'81351', N'Nieves Rivera Erick', CAST(N'2021-02-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (8205, N'OMEGA 205', N'82051', N'Acosta Del Toro Humberto', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (8225, N'HOSPITAL CASTANER', N'82251', N'Perez Menendez Zenaida E', CAST(N'2019-07-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (70403, N'RED DE MEDICOS ASOCIADOS DEL SUR INC REMAS', N'704031', N'Montalvo Gonzalez Juan C ', CAST(N'2021-04-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (80805, N'CENTRO POLIMENONITA DE COAMO INC', N'808051', N'Reyes Rodriguez Roberto', CAST(N'2018-07-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (80806, N'CORPORACION PROFESIONAL SERVICIO MEDICO INFANTIL', N'808061', N'Arroyo Pagan Ida P', CAST(N'2018-10-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (80808, N'CENTRO DE SALUD FAMILIAR ARROYO', N'808081', N'Perez Briones Julio A', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (80810, N'CENTRO DE SALUD DE PATILLAS', N'808101', N'Roubert Rivera Hector L ', CAST(N'2018-04-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (80828, N'CENTRO INTEGRAL DE MEDICINA DE AIBONITO', N'808281', N'Colon Velez Enid', CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (80833, N'SERVICIOS MEDICOS DE OROCOVIS INC', N'808331', N'Mendez Ortiz Jorge W', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (80834, N'VISION 2000', N'808341', N'Godineaux Manfredy Yamilka D', CAST(N'2022-03-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (90705, N'JUNCOS FIRST MEDICAL CENTER INC', N'907051', N'Hernandez Rodriguez Raul E', CAST(N'2020-09-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (90720, N'TURABO MEDICAL PRIMARY GROUP', N'907201', N'Pastrana Maldonado Pablo A', CAST(N'2018-05-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (90756, N'GRUPO MEDICO DE CIDRA INC', N'907561', N'Ortiz Matos Juan L', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[IPA] ([NumeroIPA], [NombreIPA], [NumeroPCP], [NombrePCP], [FechaEfectividad], [FechaTerminacion], [Estatus]) VALUES (90767, N'PUERTO RICO PERFORMANCE MEDICAL GROUP INC', N'907671', N'Guilbee Perez Lilliam M', CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2099-01-01T00:00:00.000' AS DateTime), N'1')
GO
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (1, N'Adjuntas', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (2, N'Arecibo', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (3, N'Barceloneta', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (4, N'Camuy', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (5, N'Ciales', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (6, N'Florida', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (7, N'Hatillo', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (8, N'Jayuya', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (9, N'Lares', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (10, N'Manati', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (11, N'Morovis', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (12, N'Quebradillas', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (13, N'Utuado', N'Arecibo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (14, N'Aguas Buenas', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (15, N'Aibonito', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (16, N'Arroyo', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (17, N'Barranquitas', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (18, N'Caguas', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (19, N'Cayey', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (20, N'Cidra', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (21, N'Comerio', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (22, N'Guayama', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (23, N'Gurabo', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (24, N'Juncos', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (25, N'Orocovis', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (26, N'Patillas', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (27, N'Salinas', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (28, N'San Lorenzo', N'Caguas')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (29, N'Ceiba', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (30, N'Culebra', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (31, N'Fajardo', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (32, N'Humacao', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (33, N'Las Piedras', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (34, N'Luquillo', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (35, N'Maunabo', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (36, N'Naguabo', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (37, N'Rio Grande', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (38, N'Yabucoa', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (39, N'Vieques', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (40, N'Aguada', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (41, N'Aguadilla', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (42, N'Anasco', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (43, N'Cabo Rojo', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (44, N'Hormigueros', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (45, N'Isabela', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (46, N'Lajas', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (47, N'Las Marias', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (48, N'Moca', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (49, N'Maricao', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (50, N'Mayaguez', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (51, N'Rincon', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (52, N'Sabana Grande', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (53, N'San German', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (54, N'San Sebastian', N'Mayaguez')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (55, N'Coamo', N'Ponce')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (56, N'Guanica', N'Ponce')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (57, N'Guayanilla', N'Ponce')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (58, N'Juana Diaz', N'Ponce')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (59, N'Penuelas', N'Ponce')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (60, N'Ponce', N'Ponce')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (61, N'Santa Isabel', N'Ponce')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (62, N'Villalba', N'Ponce')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (63, N'Yauco', N'Ponce')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (64, N'Bayamon', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (65, N'Carolina', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (66, N'Catano', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (67, N'Corozal', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (68, N'Dorado', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (69, N'Guaynabo', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (70, N'Naranjito', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (71, N'San Juan', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (72, N'Toa Alta', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (73, N'Toa Baja', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (74, N'Trujillo Alto', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (75, N'Vega Alta', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (76, N'Vega Baja', N'San Juan')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (77, N'Canovanas', N'Fajardo')
INSERT [dbo].[Municipio] ([idMunicipio], [Nombre], [Region]) VALUES (78, N'Loiza', N'Fajardo')
GO
INSERT [dbo].[Reclamaciones] ([idReclamacion], [NumReclamacion], [NumeroIPA], [NumeroPCP], [NombrePCP], [Tier], [Cuenta], [NumeroContrato], [NombreAsegurado], [Edad], [FechaServicio], [FechaPago], [TipoServicio], [LugarServicio], [NumeroServicio], [CargoTotal], [ICD9], [ICD10], [IdCodigoCatastrofico], [Especialidad], [Municipio], [CantidadPagada], [EstatusAjuste], [CantidadAjustada], [FechaAjuste], [EstatusReclamacion], [IDUsuario], [Comentarios]) VALUES (1, N'C1111
', 7629, N'76291
', N'Alejandro Santiago Axel
', 1, 1010, N'008000000001
', N'Juan Del Pueblo
', N'66', CAST(N'2022-04-25T00:00:00.000' AS DateTime), CAST(N'2022-06-24T00:00:00.000' AS DateTime), 1, N'Oficina
', N'1', 70, NULL, N'Z01.89', 16, 3, 65, 70, N'Aceptado', 70, CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'Procesado', 1003, N'Revisada')
INSERT [dbo].[Reclamaciones] ([idReclamacion], [NumReclamacion], [NumeroIPA], [NumeroPCP], [NombrePCP], [Tier], [Cuenta], [NumeroContrato], [NombreAsegurado], [Edad], [FechaServicio], [FechaPago], [TipoServicio], [LugarServicio], [NumeroServicio], [CargoTotal], [ICD9], [ICD10], [IdCodigoCatastrofico], [Especialidad], [Municipio], [CantidadPagada], [EstatusAjuste], [CantidadAjustada], [FechaAjuste], [EstatusReclamacion], [IDUsuario], [Comentarios]) VALUES (2, N'R1122
', 80834, N'808341
', N'Godineaux Manfredy Yamilka D
', 24, 2010, N'008780000367
', N'Solina Rincon
', N'23', CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'2022-09-27T00:00:00.000' AS DateTime), 11, N'Hospital', N'1', 50, NULL, N'Z71.89', 15, 1, 22, 0, N'Denegado', 0, CAST(N'2020-10-03T00:00:00.000' AS DateTime), N'Procesado', 1003, N'Revisada')
INSERT [dbo].[Reclamaciones] ([idReclamacion], [NumReclamacion], [NumeroIPA], [NumeroPCP], [NombrePCP], [Tier], [Cuenta], [NumeroContrato], [NombreAsegurado], [Edad], [FechaServicio], [FechaPago], [TipoServicio], [LugarServicio], [NumeroServicio], [CargoTotal], [ICD9], [ICD10], [IdCodigoCatastrofico], [Especialidad], [Municipio], [CantidadPagada], [EstatusAjuste], [CantidadAjustada], [FechaAjuste], [EstatusReclamacion], [IDUsuario], [Comentarios]) VALUES (3, N'C1133
', 90756, N'907561
', N'Ortiz Matos Juan L
', 22, 1010, N'008000003030
', N'Santa Tapia
', N'62', CAST(N'2022-08-03T00:00:00.000' AS DateTime), CAST(N'2022-09-15T00:00:00.000' AS DateTime), 1, N'Oficina
', N'1', 65, NULL, N'Z01.89', 7, 3, 67, NULL, NULL, NULL, NULL, N'Pendiente', NULL, NULL)
INSERT [dbo].[Reclamaciones] ([idReclamacion], [NumReclamacion], [NumeroIPA], [NumeroPCP], [NombrePCP], [Tier], [Cuenta], [NumeroContrato], [NombreAsegurado], [Edad], [FechaServicio], [FechaPago], [TipoServicio], [LugarServicio], [NumeroServicio], [CargoTotal], [ICD9], [ICD10], [IdCodigoCatastrofico], [Especialidad], [Municipio], [CantidadPagada], [EstatusAjuste], [CantidadAjustada], [FechaAjuste], [EstatusReclamacion], [IDUsuario], [Comentarios]) VALUES (4, N'R1144
', NULL, NULL, NULL, 2, 1010, N'ZUA004009999
', N'Felipe Garita
', N'52', CAST(N'2022-06-24T00:00:00.000' AS DateTime), CAST(N'2022-08-31T00:00:00.000' AS DateTime), 4, N'Hospital', N'1', 80, NULL, N'Z71.89', NULL, NULL, 71, NULL, NULL, NULL, NULL, N'Pendiente', NULL, NULL)
GO
INSERT [dbo].[RegistroCatastrofico] ([idRegCatastrofico], [NumeroContrato], [NombreAsegurado], [IdCodigoCatastrofico], [FechaComienzo], [FechaTerminacion]) VALUES (9000, N'008000000001', N'Juan Del Pueblo', 16, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RegistroCatastrofico] ([idRegCatastrofico], [NumeroContrato], [NombreAsegurado], [IdCodigoCatastrofico], [FechaComienzo], [FechaTerminacion]) VALUES (9001, N'008000000012', N'Juana Del Campo', 4, CAST(N'2021-10-01T00:00:00.000' AS DateTime), CAST(N'2022-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[RegistroCatastrofico] ([idRegCatastrofico], [NumeroContrato], [NombreAsegurado], [IdCodigoCatastrofico], [FechaComienzo], [FechaTerminacion]) VALUES (9003, N'008000000712', N'Cristobal Luna', 17, CAST(N'2018-04-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RegistroCatastrofico] ([idRegCatastrofico], [NumeroContrato], [NombreAsegurado], [IdCodigoCatastrofico], [FechaComienzo], [FechaTerminacion]) VALUES (9004, N'008000003030', N'Santa Tapia', 7, CAST(N'2022-02-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RegistroCatastrofico] ([idRegCatastrofico], [NumeroContrato], [NombreAsegurado], [IdCodigoCatastrofico], [FechaComienzo], [FechaTerminacion]) VALUES (9005, N'008000005287', N'Sol Pureza', 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RegistroCatastrofico] ([idRegCatastrofico], [NumeroContrato], [NombreAsegurado], [IdCodigoCatastrofico], [FechaComienzo], [FechaTerminacion]) VALUES (9006, N'008004009999', N'Sebastian Leon', 19, CAST(N'2019-03-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RegistroCatastrofico] ([idRegCatastrofico], [NumeroContrato], [NombreAsegurado], [IdCodigoCatastrofico], [FechaComienzo], [FechaTerminacion]) VALUES (9007, N'008340000798', N'Perla Ballaja', 3, CAST(N'2018-05-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RegistroCatastrofico] ([idRegCatastrofico], [NumeroContrato], [NombreAsegurado], [IdCodigoCatastrofico], [FechaComienzo], [FechaTerminacion]) VALUES (9008, N'008780000367', N'Solina Rincon', 15, CAST(N'2022-06-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RegistroCatastrofico] ([idRegCatastrofico], [NumeroContrato], [NombreAsegurado], [IdCodigoCatastrofico], [FechaComienzo], [FechaTerminacion]) VALUES (9009, N'008009900088', N'Fela Betances', 2, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Rol] ([id], [descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[Rol] ([id], [descripcion]) VALUES (2, N'Gerente')
INSERT [dbo].[Rol] ([id], [descripcion]) VALUES (3, N'Ajustador')
GO
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (1, N'65oMas medicare A Masculino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (2, N'65oMas medicare AB Masculino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (3, N'Fecha de servicio menor a 1996-04-01')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (4, N'Mayor 18 yrs Masculino no medicare')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (5, N'Mayor 18 yrs Femenino no medicare')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (6, N'65oMas medicare AB Femenino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (7, N'65oMas medicare A Femenino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (8, N'0-11 meses Mixto F o M')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (9, N'12-23 meses Mixto F o M')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (10, N'24 meses a 10 yrs Mixto F o M')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (11, N'11 a 18 yrs Mixto F o M')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (12, N'ELA Medicare AB Masculino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (13, N'ELA Medicare A Masculino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (14, N'ELA Mayor 18 yrs Masculino no medicare')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (15, N'ELA Mayor 18 yrs Femenino no medicare')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (16, N'ELA Medicare AB Femenino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (17, N'ELA Medicare A Femenino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (18, N'ELA No medicare menor 1 YR 0-11 meses')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (19, N'ELA No medicare 12 a 23 meses')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (20, N'ELA No medicare 2 a 5 yrs')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (21, N'ELA No medicare 2 a 5 yrs')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (22, N'ELA Pensionados')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (23, N'ELA Opcionales')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (24, N'19-35 yrs Femenino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (25, N'19-35 yrs Masculino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (26, N'36-54 yrs Femenino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (27, N'36-54 yrs Masculino')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (28, N'55-64 Femenino o 64oMas que no tengan medicare A o AB')
INSERT [dbo].[Tier] ([idTier], [descripcion]) VALUES (29, N'55-64 Masculino o 64oMas que no tengan medicare A o AB')
GO
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (1, N'Visitas y Tratamientos Medicos')
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (2, N'Procedimientos Quirurgicos')
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (3, N'Consultas')
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (4, N'Rayos X')
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (5, N'Pruebas Diagnosticas - Laboratorios Clinico y Patologia')
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (6, N'Terapia de Radiacion y Medicina Nuclear')
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (7, N'Anestesia')
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (8, N'Asistencia en Cirugia')
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (9, N'Emergencias')
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (10, N'Dental')
INSERT [dbo].[TipoServicio] ([idServicio], [descripcion]) VALUES (11, N'Hospital')
GO
INSERT [dbo].[Usuario] ([idusuario], [nombre], [apellido], [numempleado], [rolid], [password], [Estatus]) VALUES (1001, N'Admin', N'Admin', N'111001', 1, N'programador1*', N'1')
INSERT [dbo].[Usuario] ([idusuario], [nombre], [apellido], [numempleado], [rolid], [password], [Estatus]) VALUES (1002, N'Glorimar', N'Cirino', N'222002', 2, N'glorimar1*', N'1')
INSERT [dbo].[Usuario] ([idusuario], [nombre], [apellido], [numempleado], [rolid], [password], [Estatus]) VALUES (1003, N'Javier', N'Nieves', N'333003', 3, N'javiernieves1*', N'1')
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([Cuenta])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([Especialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([IdCodigoCatastrofico])
REFERENCES [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([Municipio])
REFERENCES [dbo].[Municipio] ([idMunicipio])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([NumeroIPA])
REFERENCES [dbo].[IPA] ([NumeroIPA])
GO
ALTER TABLE [dbo].[RegistroCatastrofico]  WITH CHECK ADD FOREIGN KEY([IdCodigoCatastrofico])
REFERENCES [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([rolid])
REFERENCES [dbo].[Rol] ([id])
GO
