
GO
/****** Object:  Table [dbo].[CodigoCatastrofico]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[Cuenta]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[Especialidad]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[IPA]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[LogReclamacionesAjustadas]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[Municipio]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[Reclamaciones]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[RegistroCatastrofico]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[Tier]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 10/16/2022 10:16:47 PM ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/16/2022 10:16:47 PM ******/
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
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([Cuenta])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([Especialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([IdCodigoCatastrofico])
REFERENCES [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuario] ([idusuario])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([Municipio])
REFERENCES [dbo].[Municipio] ([idMunicipio])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([NumeroIPA])
REFERENCES [dbo].[IPA] ([NumeroIPA])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([TipoServicio])
REFERENCES [dbo].[TipoServicio] ([idServicio])
GO
ALTER TABLE [dbo].[Reclamaciones]  WITH CHECK ADD FOREIGN KEY([Tier])
REFERENCES [dbo].[Tier] ([idTier])
GO
ALTER TABLE [dbo].[RegistroCatastrofico]  WITH CHECK ADD FOREIGN KEY([IdCodigoCatastrofico])
REFERENCES [dbo].[CodigoCatastrofico] ([idCodigoCatastrofico])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([rolid])
REFERENCES [dbo].[Rol] ([id])
GO
