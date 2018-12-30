CREATE OR REPLACE ROLE 'Rol_Andromeda';

GRANT 'Rol_Andromeda' TO 'AS_Administrador'@'%';

SET DEFAULT ROLE 'Rol_Andromeda' FOR 'AS_Administrador'@'%';
