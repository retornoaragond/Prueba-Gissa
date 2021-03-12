USE [test_RegistoUsuarios];
GO

CREATE PROCEDURE test_SelectAllUsuarios
AS
	SELECT * FROM test_Usuarios
GO

CREATE PROCEDURE test_SelectOneUsuario @Id INT
AS
	SELECT * FROM test_Usuarios WHERE IdUsuario = @Id
GO

CREATE PROCEDURE test_InsertUsuario
		@TipoIdentificacion BIT,
		@Cedula nVARCHAR(40),
		@NombreCompleto nVARCHAR(50),
		@NombreUsaurio nVARCHAR(50),
		@Password nVARCHAR(16),
		@CorreoElectronico nVARCHAR(100)
AS
	INSERT INTO test_Usuarios
			   ([TipoIdentificacion]
			   ,[Cedula]
			   ,[NombreCompleto]
			   ,[NombreUsaurio]
			   ,[Password]
			   ,[CorreoElectronico])
		 VALUES
			   (@TipoIdentificacion
			   ,@Cedula
			   ,@NombreCompleto
			   ,@NombreUsaurio
			   ,@Password
			   ,@CorreoElectronico)
GO

CREATE PROCEDURE test_UpdateUsuario
		@IdUsuario INT,
		@TipoIdentificacion BIT,
		@Cedula nVARCHAR(40),
		@NombreCompleto nVARCHAR(50),
		@NombreUsaurio nVARCHAR(50),
		@Password nVARCHAR(16),
		@CorreoElectronico nVARCHAR(100)
AS
	UPDATE test_Usuarios
	   SET [TipoIdentificacion] = @TipoIdentificacion
	      ,[Cedula] = @Cedula
	      ,[NombreCompleto] = @NombreCompleto
	      ,[NombreUsaurio] = @NombreUsaurio
	      ,[Password] = @Password
	      ,[CorreoElectronico] = @CorreoElectronico
	 WHERE IdUsuario = @IdUsuario
GO

CREATE PROCEDURE test_DeleteUsuario @Id INT
AS
	DELETE FROM test_Usuarios WHERE IdUsuario = @Id
GO

CREATE PROCEDURE test_SelectUsuarioByCedula 
	@Cedula nVARCHAR(40)
AS
	SELECT top 1 * FROM test_Usuarios
GO

-- /////////////////////////////////////////////////////////////

CREATE PROCEDURE test_SelectAllTelefonosByUsuario @Id INT
AS
	SELECT * FROM test_Telefonos WHERE test_User_IdUsuario = @Id
GO

CREATE PROCEDURE test_InsertTelefono
		@Numero VARCHAR(8),
		@test_User_IdUsuario INT
AS
	INSERT INTO test_Telefonos
				([Numero]
			   ,[test_User_IdUsuario])
		 VALUES
				(@Numero
			   ,@test_User_IdUsuario)
GO


CREATE PROCEDURE test_DeleteTelefono @Id INT
AS
	DELETE FROM test_Telefonos WHERE IdTelefono = @Id
GO

-- /////////////////////////////////////////////////////////////

CREATE PROCEDURE test_SelectHabilidadesBlandasXUsuario @Id INT
AS
	SELECT habilidades.IdHabilidad, habilidades.Habilidad 
	FROM test_HabilidadesBlandasXUsuario habil_user
			left outer join test_HabilidadesBlandas habilidades 
			on habilidades.IdHabilidad = habil_user.test_Habilidades_IdHabilidad 
			left outer join test_Usuarios usuarios
			on usuarios.IdUsuario = habil_user.test_Usuario_IdUsuario
	WHERE usuarios.IdUsuario = @Id
GO

CREATE PROCEDURE test_DeleteHabilidadesBlandasXUsuario @IdU INT, @IdHB INT
AS
	DELETE FROM test_HabilidadesBlandasXUsuario 
	WHERE test_Usuario_IdUsuario = @IdU
	AND test_Habilidades_IdHabilidad = @IdHB
GO


CREATE PROCEDURE test_InsertHabilidadesBlandasXUsuario
		@test_Usuario_IdUsuario INT,
		@test_Habilidades_IdHabilidad INT
AS
	INSERT INTO test_HabilidadesBlandasXUsuario
           ([test_Usuario_IdUsuario]
           ,[test_Habilidades_IdHabilidad])
     VALUES
           (@test_Usuario_IdUsuario
           ,@test_Habilidades_IdHabilidad)
GO

