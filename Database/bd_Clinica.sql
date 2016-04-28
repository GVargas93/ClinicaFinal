USE [Clinica]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AtencionConsulta_Cita]') AND parent_object_id = OBJECT_ID(N'[dbo].[AtencionConsulta]'))
ALTER TABLE [dbo].[AtencionConsulta] DROP CONSTRAINT [FK_AtencionConsulta_Cita]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[AtencionConsulta]    Script Date: 04/27/2016 14:30:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AtencionConsulta]') AND type in (N'U'))
DROP TABLE [dbo].[AtencionConsulta]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[AtencionConsulta]    Script Date: 04/27/2016 14:30:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AtencionConsulta](
	[atencion_id] [int] IDENTITY(1,1) NOT NULL,
	[fechahora] [datetime] NULL,
	[estudio] [nchar](10) NULL,
	[observacion] [nchar](10) NULL,
	[diagnostico] [nchar](10) NULL,
	[estudios] [nchar](10) NULL,
	[medicamentos] [nchar](10) NULL,
	[cita_id] [int] NULL,
 CONSTRAINT [PK_AtencionConsulta] PRIMARY KEY CLUSTERED 
(
	[atencion_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AtencionConsulta]  WITH CHECK ADD  CONSTRAINT [FK_AtencionConsulta_Cita] FOREIGN KEY([cita_id])
REFERENCES [dbo].[Cita] ([cita_id])
GO

ALTER TABLE [dbo].[AtencionConsulta] CHECK CONSTRAINT [FK_AtencionConsulta_Cita]
GO


USE [Clinica]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cita_Doctor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cita]'))
ALTER TABLE [dbo].[Cita] DROP CONSTRAINT [FK_Cita_Doctor]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cita_Paciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cita]'))
ALTER TABLE [dbo].[Cita] DROP CONSTRAINT [FK_Cita_Paciente]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cita_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cita]'))
ALTER TABLE [dbo].[Cita] DROP CONSTRAINT [FK_Cita_Usuario]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[Cita]    Script Date: 04/27/2016 14:32:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cita]') AND type in (N'U'))
DROP TABLE [dbo].[Cita]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[Cita]    Script Date: 04/27/2016 14:32:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Cita](
	[cita_id] [int] NOT NULL,
	[fechahora] [datetime] NULL,
	[observacion] [varchar](50) NULL,
	[doctor_id] [int] NULL,
	[paciente_id] [int] NULL,
	[usuario_id] [varchar](50) NULL,
 CONSTRAINT [PK_Cita] PRIMARY KEY CLUSTERED 
(
	[cita_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Doctor] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctor] ([doctor_id])
GO

ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Doctor]
GO

ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Paciente] FOREIGN KEY([paciente_id])
REFERENCES [dbo].[Paciente] ([paciente_id])
GO

ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Paciente]
GO

ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[Usuario] ([usuario_id])
GO

ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Usuario]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[Doctor]    Script Date: 04/27/2016 14:32:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor]') AND type in (N'U'))
DROP TABLE [dbo].[Doctor]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[Doctor]    Script Date: 04/27/2016 14:32:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Doctor](
	[doctor_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[especialidad] [nvarchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[usuario_id] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[Paciente]    Script Date: 04/27/2016 14:32:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
DROP TABLE [dbo].[Paciente]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[Paciente]    Script Date: 04/27/2016 14:32:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Paciente](
	[paciente_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[telefono] [varchar](50) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[paciente_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[Permiso]    Script Date: 04/27/2016 14:33:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso]') AND type in (N'U'))
DROP TABLE [dbo].[Permiso]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[Permiso]    Script Date: 04/27/2016 14:33:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Permiso](
	[permiso_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_permiso] [varchar](50) NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[permiso_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Clinica]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermisoUsuario_Permiso]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermisoUsuario]'))
ALTER TABLE [dbo].[PermisoUsuario] DROP CONSTRAINT [FK_PermisoUsuario_Permiso]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermisoUsuario_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermisoUsuario]'))
ALTER TABLE [dbo].[PermisoUsuario] DROP CONSTRAINT [FK_PermisoUsuario_Usuario]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[PermisoUsuario]    Script Date: 04/27/2016 14:33:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PermisoUsuario]') AND type in (N'U'))
DROP TABLE [dbo].[PermisoUsuario]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[PermisoUsuario]    Script Date: 04/27/2016 14:33:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PermisoUsuario](
	[usuario_id] [varchar](50) NOT NULL,
	[permiso_id] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PermisoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PermisoUsuario_Permiso] FOREIGN KEY([permiso_id])
REFERENCES [dbo].[Permiso] ([permiso_id])
GO

ALTER TABLE [dbo].[PermisoUsuario] CHECK CONSTRAINT [FK_PermisoUsuario_Permiso]
GO

ALTER TABLE [dbo].[PermisoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PermisoUsuario_Usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[Usuario] ([usuario_id])
GO

ALTER TABLE [dbo].[PermisoUsuario] CHECK CONSTRAINT [FK_PermisoUsuario_Usuario]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[tbl_version]    Script Date: 04/27/2016 14:33:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_version]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_version]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[tbl_version]    Script Date: 04/27/2016 14:33:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_version](
	[versionmayor] [int] NULL,
	[versionmenor] [int] NULL,
	[patch] [int] NULL
) ON [PRIMARY]

GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[Usuario]    Script Date: 04/27/2016 14:33:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[Usuario]
GO

USE [Clinica]
GO

/****** Object:  Table [dbo].[Usuario]    Script Date: 04/27/2016 14:33:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Usuario](
	[usuario_id] [varchar](50) NOT NULL,
	[nombrecompleto] [varchar](100) NULL,
	[usuario] [varchar](50) NULL,
	[contrasena] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

