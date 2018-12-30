#Procedimiento almacenado para guardar usuarios.
DELIMITER //
CREATE OR REPLACE PROCEDURE proc_GuardarUsuario
(
    jsonusuario JSON
)
BEGIN
	CREATE OR REPLACE TEMPORARY TABLE tempUsuario(
		idUsuario INT,
		tusCorreo VARCHAR(50) NOT NULL,
		tusContraseña VARCHAR(20) NOT NULL,
		busVigencia BOOL NOT NULL,
		personaID INT NOT NULL
    );
    
    CREATE OR REPLACE TEMPORARY TABLE tempPersona(
		idPersona INT,
		tperNombre VARCHAR(50) NOT NULL,
		dperFechaNac DATE NOT NULL, 
		bperVigencia BOOL NOT NULL    
    );
    
    SET @jsonPersona=JSON_QUERY(jsonusuario,'$.Persona');
    
	INSERT INTO tempPersona 
    (idPersona,tperNombre,dperFechaNac,bperVigencia)
	SELECT
		JSON_VALUE(@jsonPersona, '$.idPersona'),
    	JSON_VALUE(@jsonPersona, '$.Nombre'),
		JSON_VALUE(@jsonPersona, '$.FechaNac'),
        JSON_VALUE(@jsonPersona, '$.Vigencia');
    
    INSERT INTO tempUsuario 
    (idUsuario,tusCorreo,tusContraseña,busVigencia,personaID)
	SELECT
		JSON_VALUE(jsonusuario, '$.idUsuario'),
    	JSON_VALUE(jsonusuario, '$.Correo'),
		JSON_VALUE(jsonusuario, '$.Contraseña'),
        JSON_VALUE(jsonusuario, '$.Vigencia'),
        JSON_VALUE(jsonusuario, '$.personaId');
        
	INSERT INTO at_personas
    (idPersona,tperNombre,dperFechaNac,bperVigencia)
    SELECT
    idPersona,tperNombre,dperFechaNac,bperVigencia
    FROM tempPersona A
    ON DUPLICATE KEY
    UPDATE 	
			tperNombre = A.tperNombre,
			dperFechaNac = A.dperFechaNac,
            bperVigencia = A.bperVigencia;
    
    SET @IDPERSONA = LAST_INSERT_ID();
    
	INSERT INTO AT_Usuarios
    (idUsuario,tusCorreo,tusContraseña,busVigencia,personaID)
    SELECT
    idUsuario,tusCorreo,tusContraseña,busVigencia,@IDPERSONA
    FROM tempUsuario A
    ON DUPLICATE KEY
    UPDATE
        tusCorreo = A.tusCorreo,
        tusContraseña = A.tusContraseña,
        busVigencia = A.busVigencia;
    
END
// DELIMITER ;



SET @JSONALGO=
'{
   "idUsuario":"0",
   "Correo":"YO@ADIOS",
   "Contraseña":"1234567",
   "Vigencia":"1",
   "personaId":"2",
   "Persona":{
				"idPersona":"0",
                "Nombre":"YO",
                "FechaNac":"18850815",
                "Vigencia":"1"
			}
}';

CALL proc_GuardarUsuario (@JSONALGO);


use bd_andromeda;
select *from at_usuarios;
select *from at_personas;

