# SISTEMA GESTOR DE CONTENIDOS PERSONALIZADO

El sistema gestor de contenidos personalizado permite administrar contenido de una página web de manera optima.

# Arquitectura general
- DataBase
- BackEnd
- FrontEnd

# DataBase

> **Estándares DB**

El nombramiento de las tablas se realizaran en mayusculas y en plural anteponiedo 2 prefijos, el primero hace referencia a la base de datos, el segundo indica que es una tabla seguido del nombre de este:"AT_NOMBRETABLAS". Los campos se nombraran en minusculas y en singular.

-tablas estaticas: tendran el prefijo "E".

-claves primarias: [prefijo id] + [nombre tabla]

-campos: [tipo dato] + [abrev. tabla] + [atributo]

-clave foranea: [nombre tabla] + [perfijo id]

-procedimientos almacenados: [proc] + [_] + [nombre del procedimiento]

 los parametros seran los mismos de los campos de las tablas, anteponiendoles el simbolo "@"

Usuarios: AS - administrador del sistema / US - usuario del sistema

Roles: [Nombrerol]




 
# BackEnd

> **Estándares Back**

# FrontEnd

> **Estándares Front**
