create database test_RegistoUsuarios;
GO

USE [test_RegistoUsuarios];
GO


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='test_Usuarios' and xtype='U')
BEGIN
    CREATE TABLE test_Usuarios (
        IdUsuario INT NOT NULL IDENTITY(1,1),
		TipoIdentificacion BIT NOT NULL,
		Cedula VARCHAR(40) NOT NULL,
		NombreCompleto VARCHAR(50) NOT NULL,
		NombreUsaurio VARCHAR(50) NOT NULL,
		[Password] VARCHAR(16) NOT NULL,
		CorreoElectronico VARCHAR(100) NOT NULL
    )
END
GO

ALTER TABLE test_Usuarios
ADD CONSTRAINT PK_test_Usuarios PRIMARY KEY (IdUsuario);
GO

ALTER TABLE test_Usuarios
ADD CONSTRAINT UC_test_Usuarios UNIQUE (Cedula);
GO


-- ///////////////////////////////////////////////////////////////////////////////
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='test_Telefonos' and xtype='U')
BEGIN
    CREATE TABLE test_Telefonos (
        IdTelefono INT NOT NULL IDENTITY(1,1),
		Numero VARCHAR(8) NOT NULL,
		test_User_IdUsuario INT NOT NULL,
    )
END
GO

ALTER TABLE test_Telefonos
ADD CONSTRAINT PK_test_Telefonos PRIMARY KEY (IdTelefono);
GO

ALTER TABLE test_Telefonos
ADD CONSTRAINT FK_test_Telefonos FOREIGN KEY (test_User_IdUsuario) REFERENCES test_Usuarios(IdUsuario);
GO

-- ///////////////////////////////////////////////////////////////////////////////
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='test_HabilidadesBlandas' and xtype='U')
BEGIN
    CREATE TABLE test_HabilidadesBlandas (
        IdHabilidad INT NOT NULL IDENTITY(1,1),
		Habilidad VARCHAR(45) NOT NULL,
    )
END
GO

ALTER TABLE test_HabilidadesBlandas
ADD CONSTRAINT PK_test_HabilidadesBlandas PRIMARY KEY (IdHabilidad);
GO

-- ///////////////////////////////////////////////////////////////////////////////
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='test_HabilidadesBlandasXUsuario' and xtype='U')
BEGIN
    CREATE TABLE test_HabilidadesBlandasXUsuario (
        test_Usuario_IdUsuario INT NOT NULL,
		test_Habilidades_IdHabilidad INT NOT NULL,
    )
END
GO

ALTER TABLE test_HabilidadesBlandasXUsuario
ADD CONSTRAINT PK_test_HabilidadesBlandasXUsuario PRIMARY KEY (test_Usuario_IdUsuario,test_Habilidades_IdHabilidad);
GO

-- ///////////////////////////////////////////////////////////////////////////////
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='test_Roles' and xtype='U')
BEGIN
    CREATE TABLE test_Roles (
        IdRol INT NOT NULL IDENTITY(1,1),
		NombreRol VARCHAR(15) NOT NULL,
    )
END
GO

ALTER TABLE test_Roles
ADD CONSTRAINT PK_test_Roles PRIMARY KEY (IdRol);
GO

-- ///////////////////////////////////////////////////////////////////////////////
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='test_RolesXUsuario' and xtype='U')
BEGIN
    CREATE TABLE test_RolesXUsuario (
        test_Usuario_IdUsuario INT NOT NULL ,
		test_Roles_IdRol INT NOT NULL
    )
END
GO

ALTER TABLE test_RolesXUsuario
ADD CONSTRAINT PK_test_RolesXUsuario PRIMARY KEY (test_Usuario_IdUsuario,test_Roles_IdRol);
GO
