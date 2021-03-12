USE test_RegistoUsuarios
GO

INSERT INTO test_HabilidadesBlandas
           (Habilidad)
     VALUES
           ('Buena comunicación')
GO

INSERT INTO test_HabilidadesBlandas
           (Habilidad)
     VALUES
           ('Buena organización')
GO

INSERT INTO test_HabilidadesBlandas
           (Habilidad)
     VALUES
           ('Trabajo en equipo')
GO

INSERT INTO test_HabilidadesBlandas
           (Habilidad)
     VALUES
           ('Puntualidad')
GO

INSERT INTO test_HabilidadesBlandas
           (Habilidad)
     VALUES
           ('Ser creativo')
GO

INSERT INTO test_HabilidadesBlandas
           (Habilidad)
     VALUES
           ('Facilidad de adaptación')
GO

-- //////////////////////////////////////////////////////

INSERT INTO test_Usuarios
           (TipoIdentificacion
           ,Cedula
           ,NombreCompleto
           ,NombreUsaurio
           ,Password
           ,CorreoElectronico)
     VALUES
           (0
           ,'402290345'
           ,'Esteban Espinoza Fallas'
           ,'esteban25'
           ,'password1'
           ,'eef251195@gmail.com')
GO

INSERT INTO test_Usuarios
           (TipoIdentificacion
           ,Cedula
           ,NombreCompleto
           ,NombreUsaurio
           ,Password
           ,CorreoElectronico)
     VALUES
           (0
           ,'555555A45654'
           ,'Juan Perez'
           ,'juan35'
           ,'password2'
           ,'juan35@gmail.com')
GO

INSERT INTO test_Usuarios
           (TipoIdentificacion
           ,Cedula
           ,NombreCompleto
           ,NombreUsaurio
           ,Password
           ,CorreoElectronico)
     VALUES
           (0
           ,'asd123g4563'
           ,'Maria Brenes'
           ,'mariaB85'
           ,'password3'
           ,'amariab@gmail.com')
GO

-- //////////////////////////////////////////////////////

INSERT INTO test_Telefonos
           (Numero
           ,test_User_IdUsuario)
     VALUES
           ('84119542'
           ,1)
GO

INSERT INTO test_Telefonos
           (Numero
           ,test_User_IdUsuario)
     VALUES
           ('83348303'
           ,2)
GO

INSERT INTO test_Telefonos
           (Numero
           ,test_User_IdUsuario)
     VALUES
           ('55555555'
           ,2)
GO

INSERT INTO test_Telefonos
           (Numero
           ,test_User_IdUsuario)
     VALUES
           ('55555555'
           ,3)
GO

INSERT INTO test_Telefonos
           (Numero
           ,test_User_IdUsuario)
     VALUES
           ('85855858'
           ,3)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (1
           ,1)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (1
           ,2)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (1
           ,3)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (2
           ,1)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (2
           ,2)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (2
           ,3)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (2
           ,4)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (3
           ,1)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (3
           ,2)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (3
           ,3)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (3
           ,4)
GO

INSERT INTO test_HabilidadesBlandasXUsuario
           (test_Usuario_IdUsuario
           ,test_Habilidades_IdHabilidad)
     VALUES
           (3
           ,5)
GO
