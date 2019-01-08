CREATE OR REPLACE TABLE AT_Usuarios(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tusCorreo VARCHAR(50) NOT NULL,
    tusContraseña VARCHAR(20) NOT NULL,
    busVigencia BOOL NOT NULL,
    personaID INT NOT NULL,
    FOREIGN KEY (personaID) 
        REFERENCES AT_Personas (idPersona)
);

CREATE OR REPLACE TABLE AT_Personas(
    idPersona INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tperNombre VARCHAR(50) NOT NULL,
    dperFechaNac DATE NOT NULL, 
    bperVigencia BOOL NOT NULL    
);