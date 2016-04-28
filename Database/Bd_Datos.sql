USE Clinica;

INSERT INTO dbo.Tbl_Permiso(nombrePermiso) VALUES ('Administrador');
INSERT INTO dbo.Tbl_Permiso(nombrePermiso) VALUES ('Insertar y Editar');
INSERT INTO dbo.Tbl_Permiso(nombrePermiso) VALUES ('Observador de Informacion');


INSERT INTO dbo.Tbl_Usuario(nombreCompleto, userName, password) VALUES ('Alberto Garcia','albertogarcia','albertogarcia');
INSERT INTO dbo.Tbl_Usuario(nombreCompleto, userName, password) VALUES ('Gerardo Vargas','gerardoVargas','gerardovargas');
INSERT INTO dbo.Tbl_Usuario(nombreCompleto, userName, password) VALUES ('Antonio Black','antonioblack','antonioblack');


INSERT INTO dbo.Tbl_PermisoUsuario(Fk_permiso_id, Fk_usuario_id) VALUES (1,1);
INSERT INTO dbo.Tbl_PermisoUsuario(Fk_permiso_id, Fk_usuario_id) VALUES (2,2);
INSERT INTO dbo.Tbl_PermisoUsuario(Fk_permiso_id, Fk_usuario_id) VALUES (3,3);


INSERT INTO dbo.Tbl_Doctor(nombre, especialidad, telefono, Fk_usuario_id) VALUES ('Dr. Garcia', 'Oncologo', '3265478', 1);
INSERT INTO dbo.Tbl_Doctor(nombre, especialidad, telefono, Fk_usuario_id) VALUES ('Dr. Vargas', 'Pediatra', '3641789', 2);
INSERT INTO dbo.Tbl_Doctor(nombre, especialidad, telefono, Fk_usuario_id) VALUES ('Dr. Black', 'Operacion', '3695412', 3);