-- 1. Películas
INSERT INTO Peliculas (titulo, duracion, clasificacion) VALUES 
('Avatar', 162, 'PG-13'), ('Inception', 148, 'PG-13'), ('Toy Story', 81, 'G'), 
('El Padrino', 175, 'R'), ('Titanic', 195, 'PG-13'), ('Joker', 122, 'R'), 
('Parasite', 132, 'R'), ('Matrix', 136, 'R'), ('Gladiador', 155, 'R'), 
('Interstellar', 169, 'PG-13'), ('Coco', 105, 'G'), ('Up', 96, 'G');

-- 2. Salas
INSERT INTO Salas (nombre_sala, capacidad) VALUES 
('Sala 1', 100), ('Sala 2', 80), ('Sala 3', 120), ('Sala 4', 90), 
('Sala 5', 100), ('Sala 6', 80), ('Sala 7', 120), ('Sala 8', 90), 
('Sala 9', 100), ('Sala 10', 80), ('Sala 11', 120), ('Sala 12', 90);

-- 3. Funciones (Relaciona Películas y Salas)
INSERT INTO Funciones (id_pelicula, id_sala, fecha_hora, precio_base) VALUES 
(1, 1, '2026-06-01 14:00:00', 15000), (2, 2, '2026-06-01 15:00:00', 15000), 
(3, 3, '2026-06-01 16:00:00', 12000), (4, 4, '2026-06-01 17:00:00', 20000), 
(5, 5, '2026-06-01 18:00:00', 15000), (6, 6, '2026-06-01 19:00:00', 18000), 
(7, 7, '2026-06-01 20:00:00', 18000), (8, 8, '2026-06-01 21:00:00', 15000), 
(9, 9, '2026-06-01 22:00:00', 20000), (10, 10, '2026-06-01 14:30:00', 15000), 
(11, 11, '2026-06-01 15:30:00', 12000), (12, 12, '2026-06-01 16:30:00', 12000);

-- 4. Clientes(DML aquí  en este archivo use el dml)
INSERT INTO Clientes (nombre, email, telefono) VALUES 
('Juan Perez', 'juan@email.com', '3001'), ('Ana Lopez', 'ana@email.com', '3002'), 
('Luis Diaz', 'luis@email.com', '3003'), ('Maria G', 'maria@email.com', '3004'), 
('Carlos R', 'carlos@email.com', '3005'), ('Sofia T', 'sofia@email.com', '3006'), 
('Pedro M', 'pedro@email.com', '3007'), ('Lucia V', 'lucia@email.com', '3008'), 
('Jorge H', 'jorge@email.com', '3009'), ('Elena B', 'elena@email.com', '3010'), 
('Diego S', 'diego@email.com', '3011'), ('Paula N', 'paula@email.com', '3012');

-- 5. Butacas (Asignadas a salas / Yull Sebastian Mesa)
INSERT INTO Butacas (id_sala, fila, numero) VALUES 
(1, 'A', 1), (1, 'A', 2), (2, 'B', 1), (2, 'B', 2), 
(3, 'C', 1), (3, 'C', 2), (4, 'D', 1), (4, 'D', 2), 
(5, 'E', 1), (5, 'E', 2), (6, 'F', 1), (6, 'F', 2);

-- 6. Tickets
INSERT INTO Tickets (id_funcion, id_cliente, total) VALUES 
(1, 1, 15000), (2, 2, 15000), (3, 3, 12000), (4, 4, 20000), 
(5, 5, 15000), (6, 6, 18000), (7, 7, 18000), (8, 8, 15000), 
(9, 9, 20000), (10, 10, 15000), (11, 11, 12000), (12, 12, 12000);

-- 7. Detalle_Tickets
INSERT INTO Detalle_Tickets (id_ticket, id_butaca) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), 
(7, 7), (8, 8), (9, 9), (10, 10), (11, 11), (12, 12);