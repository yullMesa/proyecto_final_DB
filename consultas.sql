-- 1. JOIN: Listado de tickets con nombre de cliente, película y sala
-- yo Yull Sebastian Mesa le agregue los alias para que el sql server sepa de que tabla hablo al hacer =
SELECT 
    T.id_ticket, C.nombre AS Cliente, P.titulo AS Pelicula, S.nombre_sala
FROM Tickets T
JOIN Clientes C ON T.id_cliente = C.id_cliente
JOIN Funciones F ON T.id_funcion = F.id_funcion
JOIN Peliculas P ON F.id_pelicula = P.id_pelicula
JOIN Salas S ON F.id_sala = S.id_sala;

-- 2. AGREGACIÓN: Total de boletos vendidos por cada película (COUNT + GROUP BY)
SELECT 
    P.titulo, COUNT(T.id_ticket) AS Total_Vendidos
FROM Peliculas P
JOIN Funciones F ON P.id_pelicula = F.id_pelicula
JOIN Tickets T ON F.id_funcion = T.id_funcion
GROUP BY P.titulo;

-- 3. AGREGACIÓN: Precio promedio, mínimo y máximo de las funciones por sala (AVG, MIN, MAX)
-- Decidi usar otras consultas a parte de los join
SELECT 
    S.nombre_sala, 
    AVG(F.precio_base) AS Precio_Promedio,
    MIN(F.precio_base) AS Precio_Minimo,
    MAX(F.precio_base) AS Precio_Maximo
FROM Salas S
JOIN Funciones F ON S.id_sala = F.id_sala
GROUP BY S.nombre_sala;

-- 4. JOIN + FILTRO: Clientes Premium y sus compras
SELECT 
    C.nombre, C.membresia, T.id_ticket, T.total
FROM Clientes C
JOIN Tickets T ON C.id_cliente = T.id_cliente
WHERE C.membresia = 'Premium';