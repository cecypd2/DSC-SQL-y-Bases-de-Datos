-- Crear la tabla de Productos
CREATE TABLE productos (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Crear la tabla de Clientes
CREATE TABLE clientes (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);

-- Crear la tabla de Pedidos
CREATE TABLE pedidos (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES clientes(customer_id)
);

-- Crear la tabla de Detalles de Pedidos
CREATE TABLE detalles_pedidos (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES pedidos(order_id),
    FOREIGN KEY (product_id) REFERENCES productos(product_id)
);

-- Crear la tabla de Promociones
CREATE TABLE promociones (
    promotion_id INT PRIMARY KEY,
  	product_id INT,
    promotion_name VARCHAR(255),
    discount DECIMAL(5, 2),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (product_id) REFERENCES productos(product_id)
);

-- Insertar datos en la tabla de Productos
INSERT INTO productos (product_id, product_name, price, stock_quantity)
VALUES
    (1, 'Laptop Gamer A', 1200.00, 50),
    (2, 'Smartphone Geek B', 699.00, 100),
    (3, 'Auriculares Bluetooth', 149.00, 75),
    (4, 'Cámara DSLR', 899.00, 30),
    (5, 'Tablet Avanzada', 499.00, 60),
    (6, 'Tablet Económica', 199.00, 40),
    (7, 'Monitor Ultra Ancho', 699.00, 25),
    (8, 'Mouse Gamer', 49.00, 100),
    (9, 'Teclado Mecánico', 79.00, 80),
    (10, 'Impresora Multifuncional', 299.00, 15),
    (11, 'Cargador', 299.00, 9);

-- Insertar datos en la tabla de Clientes
INSERT INTO clientes (customer_id, first_name, last_name, email)
VALUES
    (1, 'Ana', 'Pérez', 'ana@example.com'),
    (2, 'Carlos', 'González', 'carlos@example.com'),
    (3, 'Laura', 'Rodríguez', 'laura@example.com'),
    (4, 'Javier', 'López', 'javier@example.com'),
    (5, 'María', 'García', 'maria@example.com'),
    (6, 'Pedro', 'Martínez', 'pedro@example.com'),
    (7, 'Luisa', 'Sánchez', 'luisa@example.com'),
    (8, 'Roberto', 'Fernández', 'roberto@example.com'),
    (9, 'Elena', 'Hernández', 'elena@example.com'),
    (10, 'David', 'Ramírez', 'david@example.com');

-- Insertar datos en la tabla de Pedidos
INSERT INTO pedidos (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2023-05-15', 2200.00),
    (102, 2, '2023-05-16', 699.00),
    (103, 3, '2023-06-17', 447.00),
    (104, 4, '2023-06-18', 899.00),
    (105, 5, '2023-06-19', 1498.00),
    (106, 6, '2023-07-20', 498.00),
    (107, 7, '2023-07-21', 897.00),
    (108, 8, '2023-08-22', 1149.00),
    (109, 9, '2023-08-23', 249.00),
    (110, 10, '2023-08-24', 1399.00);

-- Insertar datos en la tabla de Detalles de Pedidos
INSERT INTO detalles_pedidos (order_detail_id, order_id, product_id, quantity, subtotal)
VALUES
    (1, 101, 1, 2, 2400.00),
    (2, 102, 2, 1, 699.00),
    (3, 103, 3, 3, 447.00),
    (4, 104, 4, 1, 899.00),
    (5, 105, 5, 2, 2996.00),
    (6, 106, 6, 2, 398.00),
    (7, 107, 7, 1, 699.00),
    (8, 108, 8, 3, 147.00),
    (9, 109, 9, 1, 79.00),
    (10, 110, 10, 2, 2798.00);

-- Insertar datos en la tabla de Promociones
INSERT INTO promociones (promotion_id, product_id,promotion_name, discount, start_date, end_date)
VALUES
    (1, 1,'Oferta de Verano', 0.15, '2023-06-01', '2023-08-31'),
    (2, 1,'Descuento de Invierno', 0.10, '2023-12-01', '2024-02-29'),
    (3, 3,'Promoción de Primavera', 0.20, '2023-03-01', '2023-05-31'),
    (4, 1,'Oferta Flash', 0.25, '2023-09-15', '2023-09-17'),
    (5, 6,'Día de Acción de Gracias', 0.30, '2023-11-20', '2023-11-30'),
    (6, 7,'Venta de Black Friday', 0.40, '2023-11-25', '2023-11-26'),
    (7, 5,'Cyber Monday', 0.35, '2023-11-28', '2023-11-28'),
    (8, 3,'Navidad Especial', 0.20, '2023-12-15', '2023-12-25'),
    (9, 7,'Año Nuevo', 0.15, '2024-01-01', '2024-01-02');
    
-- Comandos de la presentación
SELECT * FROM productos
WHERE stock_quantity > 0;

UPDATE productos SET stock_quantity = 51 WHERE product_name = 'Laptop Gamer A';
 
SELECT * FROM productos WHERE product_name = 'Laptop Gamer A';

SELECT customer_id, first_name, last_name, email FROM clientes WHERE (SELECT SUM(total_amount) FROM pedidos WHERE customer_id = clientes.customer_id) > 1000;

SELECT SUM(total_amount) as total_ventas FROM pedidos WHERE order_date >= '2023-06-01' AND order_date <= '2023-08-31';

SELECT product_name, price FROM productos WHERE price > 500 AND product_id NOT IN (SELECT product_id FROM promociones); 

SELECT customer_id, first_name, last_name, email FROM clientes WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM pedidos WHERE order_date >= '2023-06-01');

UPDATE productos SET price = 299 WHERE product_name = 'Tablet Avanzada'; 
SELECT * from productos where product_name = 'Tablet Avanzada';

INSERT INTO clientes (first_name, last_name, email) VALUES ('Nuevo', 'Cliente', 'nuevo@cliente.com'); 
SELECT * from clientes;

SELECT product_name, stock_quantity FROM productos WHERE stock_quantity < 10 AND product_id NOT IN (SELECT product_id FROM detalles_pedidos);