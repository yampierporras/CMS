CREATE OR REPLACE ROLE 'Rol_Andromeda';
GRANT 'Rol_Andromeda' TO 'AS_Administrador'@'localhost';
SET DEFAULT ROLE 'Rol_Andromeda' FOR 'AS_Administrador'@'localhost';

CREATE OR REPLACE ROLE 'Rol_BDAndromeda';
GRANT 'Rol_BDAndromeda' TO 'ABD_Administrador'@'localhost';
SET DEFAULT ROLE 'Rol_BDAndromeda' FOR 'ABD_Administrador'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'Rol_BDAndromeda' WITH GRANT OPTION;

FLUSH PRIVILEGES;