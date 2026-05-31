--Yull Mesa

CREATE PROCEDURE RegistrarVenta
    @id_funcion INT,
    @id_cliente INT,
    @total DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Tickets (id_funcion, id_cliente, total, fecha_compra)
    VALUES (@id_funcion, @id_cliente, @total, GETDATE());
    PRINT 'Venta registrada con éxito.';
END;

go

CREATE PROCEDURE ObtenerTotalGastoCliente
    @id_cliente INT,
    @total_gastado DECIMAL(10,2) OUTPUT
AS
BEGIN
    SELECT @total_gastado = SUM(total)
    FROM Tickets
    WHERE id_cliente = @id_cliente;
END;
go--agregue los go para evitar que el programe me subraye en rojo los nombres establecidos de cada procedure

CREATE PROCEDURE ActualizarPrecioFuncion
    @id_funcion INT,
    @nuevo_precio DECIMAL(10,2)
AS
BEGIN
    IF @nuevo_precio > 0
    BEGIN
        UPDATE Funciones SET precio_base = @nuevo_precio WHERE id_funcion = @id_funcion;
        PRINT 'Precio actualizado correctamente.';
    END
    ELSE
    BEGIN
        PRINT 'Error: El precio debe ser mayor a cero.';
    END
END;

go

-- 1. Ejecutar el registro de una venta (Nuevo ticket)
-- Parametros: id_funcion, id_cliente, total
EXEC RegistrarVenta @id_funcion = 1, @id_cliente = 2, @total = 15000;

-- 2. Ejecutar la obtención del total gastado (Uso de parámetro OUTPUT)
-- Declaramos la variable donde se guardará el resultado
DECLARE @GastoTotal DECIMAL(10,2);
EXEC ObtenerTotalGastoCliente @id_cliente = 1, @total_gastado = @GastoTotal OUTPUT;
-- Mostramos el resultado
SELECT 'El total gastado por el cliente es:' AS Concepto, @GastoTotal AS Valor;

-- 3. Ejecutar la actualización de precio de una función
-- Parametros: id_funcion, nuevo_precio
EXEC ActualizarPrecioFuncion @id_funcion = 1, @nuevo_precio = 18000;

-- en mi computador al intentar ejecutar todos los exec al mismo tiempo solo me devolvio el segundo 