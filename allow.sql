-- 1. Crear el usuario (La persona/rol que entrará a la base)
--Yo Yull Mesa busco demostrar aqui con vendedor cine nombre de ejemplo que el codigo funciona asi no este estipulado en las entidades dicho nombre
CREATE USER VendedorCine WITHOUT LOGIN;

-- 2. Ahora sí, le doy los permisos al usuario fake  (GRANT) sobre las tablas de la venta de tickets
GRANT SELECT ON Peliculas TO VendedorCine;
GRANT SELECT ON Funciones TO VendedorCine;
GRANT SELECT ON Tickets TO VendedorCine;
GRANT SELECT ON Clientes TO VendedorCine;

-- 3.  permiso de vender (INSERT)
GRANT INSERT ON Tickets TO VendedorCine;
GRANT INSERT ON Detalle_Tickets TO VendedorCine;

-- 4. Le prohibo borrar denegandole el permiso (DENY DELETE)
DENY DELETE ON Peliculas TO VendedorCine;
DENY DELETE ON Tickets TO VendedorCine;