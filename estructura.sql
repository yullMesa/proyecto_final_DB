create database SaleTickets
go

use SaleTickets
go

-- 1. Tabla de Pel�culas
CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(100) NOT NULL,
    duracion INT NOT NULL,
    clasificacion VARCHAR(10)
);

-- 2. Tabla de Salas
CREATE TABLE Salas (
    id_sala INT PRIMARY KEY IDENTITY(1,1),
    nombre_sala VARCHAR(50),
    capacidad INT
);

-- 3. Tabla de Funciones (Depende de Peliculas y Salas / proyecto final DB para el sabado en la ma�ana)
CREATE TABLE Funciones (
    id_funcion INT PRIMARY KEY IDENTITY(1,1),
    id_pelicula INT,
    id_sala INT,
    fecha_hora DATETIME,
    precio_base DECIMAL(10,2),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_sala) REFERENCES Salas(id_sala)
);

-- 4. Tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20)
);

-- 5. Tabla de Butacas (Depende de Salas)
CREATE TABLE Butacas (
    id_butaca INT PRIMARY KEY IDENTITY(1,1),
    id_sala INT,
    fila CHAR(1),
    numero INT,
    FOREIGN KEY (id_sala) REFERENCES Salas(id_sala)
);

-- 6. Tabla de Tickets (Depende de Funciones y Clientes  )
CREATE TABLE Tickets (
    id_ticket INT PRIMARY KEY IDENTITY(1,1),
    id_funcion INT,
    id_cliente INT,
    fecha_compra DATETIME DEFAULT GETDATE(),
    total DECIMAL(10,2),
    FOREIGN KEY (id_funcion) REFERENCES Funciones(id_funcion),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- 7. Tabla de Detalle_Tickets (Relaci�n N:M entre Tickets y Butacas  Yull Sebastina Mesa)
CREATE TABLE Detalle_Tickets (
    id_detalle INT PRIMARY KEY IDENTITY(1,1),
    id_ticket INT,
    id_butaca INT,
    FOREIGN KEY (id_ticket) REFERENCES Tickets(id_ticket),
    FOREIGN KEY (id_butaca) REFERENCES Butacas(id_butaca)
);


-- Agregar la columna de membres�a(Esto lo hice despues para poder utilizar el DCL en el proyecto)
ALTER TABLE Clientes 
ADD membresia VARCHAR(20) DEFAULT 'Corriente';

-- Actualizar los datos existentes para que tengan una categor�a
UPDATE Clientes SET membresia = 'Premium' WHERE id_cliente IN (1, 4, 7, 10);
UPDATE Clientes SET membresia = 'Platinum' WHERE id_cliente IN (2, 5, 8, 11);
-- Los que no actualizamos quedar�n como 'Corriente' por defecto