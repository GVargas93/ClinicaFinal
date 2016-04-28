-- =================================================
-- Autor:			Gerardo, Jose, Alvaro
-- Fecha:			19/04/2016
-- Descripción:		Clinica-Software
-- Versión:			0.1.1
-- =================================================

------------------------------------- Soy Una Barra Separadora  :) ----------------------------------------

PRINT 'INICIANDO CREACION DE LA BASE DE DATOS'

USE master;
GO

IF EXISTS(SELECT name FROM sys.databases WHERE name = 'clinica')
	DROP DATABASE clinica
GO

IF NOT EXISTS(SELECT name FROM sys.databases WHERE name = 'clinica')
	CREATE DATABASE Clinica;
GO

USE Clinica
GO

PRINT 'FIN CREACION BASE DE DATOS'
GO


PRINT 'INICIANDO CREACION DE ESQUEMAS'

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'dbo')
	Exec('CREATE SCHEMA dbo')
GO

PRINT 'FIN CREACION DE ESQUEMAS'
GO
------------------------------------- Soy Una Barra Separadora :) ----------------------------------------

PRINT 'INICIANDO CREACION DE TABLAS'
------------------------------------- Soy Una Barra Separadora  :) ----------------------------------------
Print 'Iniciando 1 Tabla-Tbl_Usuario'

IF EXISTS(SELECT name FROM Clinica..sysobjects WHERE name = N'Tbl_Usuario' AND xtype='U')
	DROP TABLE [dbo].[Tbl_Usuario]
	GO

CREATE TABLE [dbo].[Tbl_Usuario]
(
Usuario_id			int identity(1,1) not null,
nombreCompleto			varchar(50) not null,
userName				varchar(50) not null,
password				varchar(50) not null,
Constraint	Pk_tbl_Usuario primary key (Usuario_id)
)
Go
Print 'Finalizando 1 Tabla-Tbl_Usuario'

------------------------------------- Soy Una Barra Separadora :) ----------------------------------------
------------------------------------ Soy Una Barra Separadora :) ----------------------------------------
Print 'Iniciando 2 Tabla-Tbl_Permiso'

IF EXISTS(SELECT name FROM Clinica..sysobjects WHERE name = N'Tbl_Permiso' AND xtype='U')
	DROP TABLE [dbo].[Tbl_Permiso]
	GO

CREATE TABLE [dbo].[Tbl_Permiso]
(
Permiso_id		int identity(1,1) not null,
nombrePermiso			varchar(50) not null,
CONSTRAINT PK_Tbl_Permiso primary key(Permiso_id)
)
Go
Print 'Finalizando 2 Tabla-Tbl_Permiso'
------------------------------------- Soy Una Barra Separadora  :) --------------------------------------
------------------------------------ Soy Una Barra Separadora :) ----------------------------------------
Print 'Iniciando 3 Tabla-Tbl_PermisoUsuario'

IF EXISTS(SELECT name FROM Clinica..sysobjects WHERE name = N'Tbl_PermisoUsuario' AND xtype='U')
	DROP TABLE [dbo].[Tbl_PermisoUsuario]
	GO

CREATE TABLE [dbo].[Tbl_PermisoUsuario]
(
PermisoUsr_id		int identity(1,1) not null,
Fk_permiso_id		int not null,
Fk_usuario_id		int not null,
CONSTRAINT PK_Tbl_PermisoUsuario primary key(PermisoUsr_id),
constraint FK_Tbl_Usuario foreign key(Fk_usuario_id) references [dbo].[Tbl_Usuario](Usuario_id),
constraint FK_Tbl_Permiso foreign key(Fk_permiso_id) references [dbo].[Tbl_Permiso](Permiso_id)	
)
Go
Print 'Finalizando 3 Tabla-Tbl_PermisoUsuario'

------------------------------------- Soy Una Barra Separadora  :) ----------------------------------------
------------------------------------ Soy Una Barra Separadora :) ----------------------------------------
Print 'Iniciando 4 Tabla-Tbl_Doctor'

IF EXISTS(SELECT name FROM Clinica..sysobjects WHERE name = N'Tbl_Doctor' AND xtype='U')
	DROP TABLE [dbo].[Tbl_Doctor]
	GO

CREATE TABLE [dbo].[Tbl_Doctor]
(
doctor_id			int identity(1,1) not null,
nombre				varchar(50) not null,
especialidad				varchar(50) not null,
telefono				varchar(50) not null,
Fk_usuario_id		int not null,
CONSTRAINT PK_Tbl_Doctor primary key(doctor_id),
constraint FK_Tbl_UsuarioDoctor foreign key(Fk_usuario_id) references [dbo].[Tbl_Usuario](usuario_id)			
)
Go
Print 'Finalizando 4 Tabla-Tbl_Doctor'

------------------------------------- Soy Una Barra Separadora  :) ----------------------------------------
------------------------------------ Soy Una Barra Separadora :) ----------------------------------------
Print 'Iniciando 5 Tabla-Tbl_Paciente'

IF EXISTS(SELECT name FROM Clinica..sysobjects WHERE name = N'Tbl_Paciente' AND xtype='U')
	DROP TABLE [dbo].[Tbl_Paciente]
	GO

CREATE TABLE [dbo].[Tbl_Paciente]
(
paciente_id			int identity(1,1) not null,
nombre				varchar(50) not null,
apellido				varchar(50) not null,
direccion				varchar(50) not null,
telefono				varchar(50) not null,
CONSTRAINT PK_Tbl_Paciente primary key(paciente_id)
)
Go

Print 'Finalizando 5 Tabla-Tbl_Paciente'

------------------------------------- Soy Una Barra Separadora  :) ----------------------------------------
------------------------------------ Soy Una Barra Separadora :) ----------------------------------------
Print 'Iniciando 6 Tabla-Tbl_Cita'

IF EXISTS(SELECT name FROM Clinica..sysobjects WHERE name = N'Tbl_Cita' AND xtype='U')
	DROP TABLE [dbo].[Tbl_Cita]
	GO

CREATE TABLE [dbo].[Tbl_Cita]
(
cita_id			int identity(1,1) not null,
fecha_hora				varchar(50) not null,
observacion				varchar(50) not null,
Fk_doctor_id		int not null,
Fk_paciente_id		int not null,
Fk_usuario_id		int not null,
CONSTRAINT PK_Tbl_Cita primary key(cita_id),
constraint FK_Tbl_Doctor foreign key(Fk_doctor_id) references [dbo].[Tbl_Doctor](doctor_id),
constraint FK_Tbl_Paciente foreign key(Fk_paciente_id) references [dbo].[Tbl_Paciente](paciente_id),
constraint FK_Tbl_UsuarioCita foreign key(Fk_usuario_id) references [dbo].[Tbl_Usuario](usuario_id)			
)
Go
Print 'Finalizando 6 Tabla-Tbl_Cita'

------------------------------------- Soy Una Barra Separadora  :) ----------------------------------------
------------------------------------ Soy Una Barra Separadora :) ----------------------------------------
Print 'Iniciando 7 Tabla-Tbl_Atencion_Consulta'

IF EXISTS(SELECT name FROM Clinica..sysobjects WHERE name = N'Tbl_Atencion_Consulta' AND xtype='U')
	DROP TABLE [dbo].[Tbl_Atencion_Consulta]
	GO

CREATE TABLE [dbo].[Tbl_Atencion_Consulta]
(
atencion_id			int identity(1,1) not null,
fechaHora				varchar(50) not null,
observacion				varchar(50) not null,
diagnostico				varchar(50) not null,
estudio				varchar(50) not null,
Fk_cita_id		int not null,
CONSTRAINT PK_Tbl_Atencion primary key(atencion_id),
constraint FK_Tbl_Cita foreign key(Fk_cita_id) references [dbo].[Tbl_Cita](cita_id)			
)
Go
Print 'Finalizando 7 Tabla-Tbl_Atencion_Consulta'

------------------------------------- Soy Una Barra Separadora  :) ----------------------------------------


