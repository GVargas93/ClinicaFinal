USE [Clinica]
GO
/****** Object:  StoredProcedure [dbo].[Drop_Permiso]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Drop_Permiso]
@Permiso_id			int
AS
BEGIN
delete from [dbo].[Tbl_Permiso]
WHERE Permiso_id = @Permiso_id;
end

GO
/****** Object:  StoredProcedure [dbo].[Drop_PermisoUsr]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Drop_PermisoUsr]
@PermisoUsr_id			int
AS
BEGIN
delete from [dbo].[Tbl_PermisoUsuario]
WHERE PermisoUsr_id = @PermisoUsr_id;
end

GO
/****** Object:  StoredProcedure [dbo].[Drop_Usuario]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Drop_Usuario]
@Pk_tbl_Usuario			int
AS
BEGIN
delete from [dbo].[Tbl_Usuario]
WHERE Usuario_id = @Pk_tbl_Usuario;
end

GO
/****** Object:  StoredProcedure [dbo].[Ins_Permiso]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Ins_Permiso]
@Permiso_id		int OUTPUT,
@nombrePermiso	varchar(50)

AS
BEGIN
INSERT INTO [dbo].[Tbl_Permiso]         
values (@nombrePermiso)
SET @Permiso_id	 = SCOPE_IDENTITY();
select @Permiso_id = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[Ins_PermisoUsr]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Ins_PermisoUsr]
@PermisoUsr_id		int OUTPUT,
@Fk_permiso_id		int,
@Fk_usuario_id		int

AS
BEGIN
INSERT INTO [dbo].[Tbl_PermisoUsuario]         
values (@Fk_permiso_id,@Fk_usuario_id)
SET @PermisoUsr_id	 = SCOPE_IDENTITY();
select @PermisoUsr_id = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[Ins_Usuario]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Ins_Usuario]
@Pk_tbl_Usuario			int OUTPUT,
@nombreCompleto			varchar(50),
@userName				varchar(50),
@password				varchar(50)

AS
BEGIN
INSERT INTO [dbo].[Tbl_Usuario]         
values (@nombreCompleto,@userName,@password)
SET @Pk_tbl_Usuario	 = SCOPE_IDENTITY();
select @Pk_tbl_Usuario = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[LOGIN_GETALL]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LOGIN_GETALL]
@UserName	varchar(250),
@password	varchar(250)
AS
BEGIN
SELECT U.userName, U.password, P.nombrePermiso
FROM dbo.Tbl_Permiso P, dbo.Tbl_PermisoUsuario PU, dbo.Tbl_Usuario U, dbo.Tbl_Doctor D
WHERE P.Permiso_id = PU.Fk_permiso_id
AND U.Usuario_id = PU.Fk_usuario_id
AND U.Usuario_id = D.Fk_usuario_id
AND U.userName = @UserName
AND U.password = @password
END

GO
/****** Object:  StoredProcedure [dbo].[Select_Permiso]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Select_Permiso]
AS
BEGIN
SELECT        *
FROM           [dbo].[Tbl_Permiso]
END

GO
/****** Object:  StoredProcedure [dbo].[Select_PermisoUsr]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Select_PermisoUsr]
AS
BEGIN
SELECT        *
FROM           [dbo].[Tbl_PermisoUsuario]
END

GO
/****** Object:  StoredProcedure [dbo].[Select_Usuario]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Select_Usuario]
AS
BEGIN
SELECT        *
FROM           [dbo].[Tbl_Usuario]
END

GO
/****** Object:  StoredProcedure [dbo].[Upd_Permiso]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Upd_Permiso]
@Permiso_id		int OUTPUT,
@nombrePermiso	varchar(50)
as
begin
update [dbo].[Tbl_Permiso] set nombrePermiso = @nombrePermiso
where  Permiso_id= @Permiso_id ;
end

GO
/****** Object:  StoredProcedure [dbo].[Upd_PermisoUsr]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Upd_PermisoUsr]
@PermisoUsr_id		int,
@Fk_permiso_id		int,
@Fk_usuario_id		int
as
begin
update [dbo].[Tbl_PermisoUsuario] set Fk_permiso_id = @Fk_permiso_id, Fk_usuario_id = @Fk_usuario_id
where  PermisoUsr_id= @PermisoUsr_id ;
end

GO
/****** Object:  StoredProcedure [dbo].[Upd_Usuario]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Upd_Usuario]
@Pk_tbl_Usuario			int,
@nombreCompleto			varchar(50),
@userName				varchar(50),
@password				varchar(50)
as
begin
update [dbo].[Tbl_Usuario] set nombreCompleto = @nombreCompleto, userName = @userName, password = @password
where  Usuario_id = @Pk_tbl_Usuario;
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarCita]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Actualizar la Cita
-- =============================================
CREATE PROCEDURE [dbo].[usp_ActualizarCita]
	@varfecha_hora varchar(50),
	@varObservacion	varchar(50),
	@intDoctorId	int,
	@intPacienteId	int,
	@intUsuarioId	int,
	@intCitaId	INT 

AS
BEGIN

	SET NOCOUNT ON;



UPDATE [dbo].[Tbl_Cita]
   SET [fecha_hora] = @varfecha_hora
      ,[observacion] = @varObservacion
      ,[Fk_doctor_id] = @intDoctorId
      ,[Fk_paciente_id] = @intPacienteId
      ,[Fk_usuario_id] = @intUsuarioId

 WHERE cita_id=@intCitaId



END


GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarConsulta]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Actualizar la Consulta
-- =============================================
CREATE PROCEDURE [dbo].[usp_ActualizarConsulta]
	@varfecha_hora varchar(50),
	@varObservacion	varchar(50),
	@varDiagnostico	varchar(50),
	@varEstudio	varchar(50),
	@varCitaId	int,
	@intConsultaId	INT 

AS
BEGIN

	SET NOCOUNT ON;


UPDATE [dbo].[Tbl_Atencion_Consulta]
   SET [fechaHora] = @varfecha_hora
      ,[observacion] =@varObservacion
      ,[diagnostico] = @varDiagnostico
      ,[estudio] = @varEstudio
      ,[Fk_cita_id] = @varCitaId

 WHERE atencion_id=@intConsultaId



END


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCita]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Eliminar la Cita
-- =============================================
CREATE PROCEDURE [dbo].[usp_EliminarCita]
	@intCitaId	INT 

AS
BEGIN

	SET NOCOUNT ON;

DELETE FROM [dbo].[Tbl_Cita]
      WHERE cita_id=@intCitaId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarConsulta]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Eliminar la Consulta
-- =============================================
CREATE PROCEDURE [dbo].[usp_EliminarConsulta]
	@intConsultaId	INT 

AS
BEGIN

	SET NOCOUNT ON;


DELETE FROM [dbo].[Tbl_Atencion_Consulta]
      WHERE atencion_id= @intConsultaId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetCita]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Obtiene una lista de Atencion de Cita
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetCita]
AS
BEGIN

	SET NOCOUNT ON;

SELECT [cita_id]
      ,[fecha_hora]
      ,[observacion]
      ,[Fk_doctor_id]
      ,[Fk_paciente_id]
      ,[Fk_usuario_id]
  FROM [dbo].[Tbl_Cita]


END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetCitaById]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description: seleccionar la cita por Id
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetCitaById]
	@intCitaId	INT 

AS
BEGIN

	SET NOCOUNT ON;


SELECT [fecha_hora]
      ,[observacion]
      ,[Fk_doctor_id]
      ,[Fk_paciente_id]
      ,[Fk_usuario_id]
  FROM [dbo].[Tbl_Cita]

      WHERE cita_id= @intCitaId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetConsulta]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Obtiene una lista de Atencion de Consulta
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetConsulta]
AS
BEGIN

	SET NOCOUNT ON;

SELECT [atencion_id]
      ,[fechaHora]
      ,[observacion]
      ,[diagnostico]
      ,[estudio]
      ,[Fk_cita_id]
  FROM [dbo].[Tbl_Atencion_Consulta]



END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetConsultaById]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description: seleccionar la Consulta por Id
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetConsultaById]
	@intConsultaId	INT 

AS
BEGIN

	SET NOCOUNT ON;

SELECT [fechaHora]
      ,[observacion]
      ,[diagnostico]
      ,[estudio]
      ,[Fk_cita_id]
  FROM [dbo].[Tbl_Atencion_Consulta]


      WHERE atencion_id= @intConsultaId

END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarCita]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Insertar de Cita
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsertarCita]
	@varfecha_hora varchar(50),
	@varObservacion	varchar(50),
	@intDoctorId	int,
	@intPacienteId	int,
	@intUsuarioId	int,
	@intCitaId	INT OUTPUT

AS
BEGIN

	SET NOCOUNT ON;


INSERT INTO [dbo].[Tbl_Cita]
           ([fecha_hora]
           ,[observacion]
           ,[Fk_doctor_id]
           ,[Fk_paciente_id]
           ,[Fk_usuario_id])
     VALUES	(@varfecha_hora, @varObservacion, @intDoctorId, @intPacienteId, @intUsuarioId)

		   SET @intCitaId = SCOPE_IDENTITY()

END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarConsulta]    Script Date: 28/04/2016 3:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Insertar la Consulta
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsertarConsulta]
	@varfecha_hora varchar(50),
	@varObservacion	varchar(50),
	@varDiagnostico	varchar(50),
	@varEstudio	varchar(50),
	@varCitaId	int,
	@intConsultaId	INT OUTPUT

AS
BEGIN

	SET NOCOUNT ON;


INSERT INTO [dbo].[Tbl_Atencion_Consulta]
           ([fechaHora]
           ,[observacion]
           ,[diagnostico]
           ,[estudio]
           ,[Fk_cita_id])
     VALUES
           ( @varfecha_hora, @varObservacion,@varDiagnostico,@varEstudio,@varCitaId )


		   SET @intConsultaId = SCOPE_IDENTITY()

END



/****** Object:  StoredProcedure [dbo].[actulizar_doctor]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON

GO


/****** Object:  StoredProcedure [dbo].[actulizar_doctor]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<jose alberto clavijo>
-- Create date: <20/04/16>
-- Description:	<actulizar ,doctor>
-- =============================================
CREATE PROCEDURE [dbo].[actulizar_doctor]

	@varnombre nvarchar(50),
	@varespecialidad nvarchar(50),
	@vartelefono varchar(50),
	@vartusuario_id varchar(50),
	@intdoctor_id int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
UPDATE [Clinica].[dbo].[Doctor]
   SET 	
      [nombre] = @varnombre
      ,[especialidad] = @varespecialidad
      ,[telefono]= @vartelefono
      ,[usuario_id]=@vartusuario_id
   
 WHERE [doctor_id]= @intdoctor_id;


END
GO

/****** Object:  StoredProcedure [dbo].[actulizar_paciente]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<jose alberto clavijo>
-- Create date: <20/04/16>
-- Description:	<actulizar paciente>
-- =============================================
CREATE PROCEDURE [dbo].[actulizar_paciente]

@varnombre nvarchar(50),
	@varapellido nvarchar(50),
	@vardireccion nvarchar(50),
	@inttelefono varchar(50),
	@intpaciente_id int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
UPDATE [Clinica].[dbo].[Paciente]
   SET 	
      [nombre] = @varnombre
      ,[apellido] = @varapellido
      ,[direccion]=@vardireccion
      ,[telefono]= @inttelefono
      
   
 WHERE [paciente_id]= @intpaciente_id;


END
GO

/****** Object:  StoredProcedure [dbo].[eliminar_paciente]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<jose alberto clavijo>
-- Create date: <,20/04/16>
-- Description:	<Eliminar paciente>
-- =============================================
CREATE PROCEDURE  [dbo].[eliminar_paciente]
@intpaciente_id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
delete from [dbo].[Paciente]
where [paciente_id]= @intpaciente_id



END
GO

/****** Object:  StoredProcedure [dbo].[EliminarDoctor]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<jose alberto clavijo>
-- Create date: <20/04/16>
-- Description:	<Eliminar doctor>
-- =============================================
CREATE PROCEDURE  [dbo].[EliminarDoctor]
@intdoctor_id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
delete from [dbo].[Doctor]
where [doctor_id]=@intdoctor_id



END
GO

/****** Object:  StoredProcedure [dbo].[getDoctor]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<jose alberto clavijo>
-- Create date: <20/04/16>
-- Description:	<obteniendo lista de doctores>
-- =============================================
CREATE PROCEDURE  [dbo].[getDoctor]

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
select [doctor_id],
[nombre],
[especialidad],
[telefono],
[usuario_id]
  from [dbo].[Doctor]
   



END
GO

/****** Object:  StoredProcedure [dbo].[getDoctorById]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<jose alberto clavijo>
-- Create date: <20/04/16>
-- Description:	<obteniendo un doctor>
-- =============================================
CREATE PROCEDURE  [dbo].[getDoctorById]


	@intdoctor_id int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
select [doctor_id],
[nombre],
[especialidad],
[telefono],
[usuario_id]
  from [dbo].[Doctor]
   
 WHERE [doctor_id]= @intdoctor_id


END
GO

/****** Object:  StoredProcedure [dbo].[getpaciente]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<jose alberto clavijo>
-- Create date: <20/04/16>
-- Description:	< obteniendo lista de paciente>
-- =============================================
Create PROCEDURE  [dbo].[getpaciente]


	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
select [paciente_id],
[nombre],
[apellido],
[direccion],
[telefono]

  from [dbo].[Paciente]

END
GO

/****** Object:  StoredProcedure [dbo].[getpacienteById]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<jose alberto clavijo>
-- Create date: <20/04/16>
-- Description:	<obteniendo un paciente>
-- =============================================
CREATE PROCEDURE  [dbo].[getpacienteById]


	@intpaciente_id int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
select [paciente_id],
[nombre],
[apellido],
[direccion],
[telefono]

  from [dbo].[Paciente]
   
 WHERE [paciente_id]= @intpaciente_id


END
GO

/****** Object:  StoredProcedure [dbo].[insertar_doctor]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		jose clavijo
-- Create date: 20/04/16
-- Description:	insertar doctor
-- =============================================
CREATE PROCEDURE [dbo].[insertar_doctor]
	@varnombre nvarchar(50),
	@varespecialidad nvarchar(50),
	@vartelefono varchar(50),
	@vartusuario_id varchar(50),
	@intdoctor_id int out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into[dbo].[Doctor]
   ([nombre]
   ,[especialidad]
   ,[telefono]
   ,[usuario_id])
   values
   (@varnombre
   ,@varespecialidad
   ,@vartelefono
   ,@vartusuario_id)
	set @intdoctor_id = SCOPE_IDENTITY()
END

GO

/****** Object:  StoredProcedure [dbo].[insertar_paciente]    Script Date: 04/25/2016 06:40:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		jose clavijo
-- Create date: 20/04/16
-- Description:	Insertar Paciente
-- =============================================
CREATE PROCEDURE  [dbo].[insertar_paciente]
	@varnombre nvarchar(50),
	@varapellido nvarchar(50),
	@vardireccion nvarchar(50),
	@inttelefono varchar(50),
	@intpaciente_id int out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into[dbo].[Paciente]
   ([nombre]
   ,[apellido]
   ,[direccion]
   ,[telefono])
   values
   (@varnombre
   ,@varapellido
   ,@vardireccion
   ,@inttelefono)
	set @intpaciente_id = SCOPE_IDENTITY()
END

GO



