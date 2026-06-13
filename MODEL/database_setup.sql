-- =====================================================================
--  EventHunters - Script de creación de base de datos
--  Ejecutar entero en MySQL Workbench (botón del rayo / Ctrl+Shift+Enter)
-- =====================================================================

-- 1) Base de datos -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS mp0487_event_hunters
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE mp0487_event_hunters;

-- 2) Tabla USUARIOS ----------------------------------------------------
--    (estructura tomada de CONTROLLER/userController.php)
CREATE TABLE IF NOT EXISTS USUARIOS (
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(25),
    email    VARCHAR(50),
    password VARCHAR(255),
    foto     VARCHAR(255),
    rol      ENUM('admin', 'user') DEFAULT 'user'
);

-- 3) Tabla EVENTOS -----------------------------------------------------
--    (estructura tomada de CONTROLLER/eventsController.php)
CREATE TABLE IF NOT EXISTS EVENTOS (
    name       VARCHAR(50) PRIMARY KEY,
    place      VARCHAR(50),
    date       DATE,
    price      INT,
    usermail   VARCHAR(50),
    image_name VARCHAR(255)
);

-- 4) Usuarios de ejemplo ----------------------------------------------
--    Necesarios porque los eventos referencian estos correos (usermail).
--    Las contraseñas se guardan en texto plano, igual que en la app.
INSERT INTO USUARIOS (name, email, password, foto, rol) VALUES
('Admin EventHunters', 'admin@eventhunters.com', 'admin123', NULL, 'admin'),
('Usuario Uno',        'user@example.com',       'user123',  NULL, 'user'),
('Usuario Dos',        'user2@example.com',      'user123',  NULL, 'user'),
('Usuario Tres',       'user3@example.com',      'user123',  NULL, 'user');

-- 5) Eventos de ejemplo -----------------------------------------------
INSERT INTO EVENTOS (name, place, date, price, usermail, image_name) VALUES
('Experiencia inmersiva IKONO Barcelona', 'Barcelona', '2026-04-15', 18, 'admin@eventhunters.com', 'card__img1.jpg'),
('Candlelight: Tributo a ABBA', 'Barcelona', '2026-04-20', 25, 'admin@eventhunters.com', 'card__img2.jpg'),
('UNIVERSO GOYA. ENTRE LA LUZ Y LA OSCURIDAD', 'Madrid', '2026-05-10', 16, 'admin@eventhunters.com', 'card__img3.jpg'),
('VR World Lab: experiencia de realidad virtual', 'Barcelona', '2026-04-25', 22, 'admin@eventhunters.com', 'card__img4.jpg'),
('Dinos Alive: una experiencia inmersiva', 'Tarragona', '2026-05-05', 0, 'admin@eventhunters.com', 'card__img5.jpg'),
('Exposición interactiva sobre Antártida', 'Barcelona', '2026-05-15', 0, 'user@example.com', 'card__img6.jpg'),
('Petra: La Gloria de Los Nabateos', 'Barcelona', '2026-06-01', 0, 'user@example.com', 'card__img7.jpg'),
('LEONARDO VERSUS MICHELANGELO', 'Barcelona', '2026-06-10', 0, 'user@example.com', 'card__img8.jpg'),
('Experiencia de Realidad Virtual en Aventurico', 'Barcelona', '2026-04-30', 20, 'user2@example.com', 'card__img9.jpg'),
('TITANIC: THE OFFICIAL EXHIBITION', 'Barcelona', '2026-05-20', 19, 'user2@example.com', 'card__img10.jpg'),
('Simracing - El horizonte del circuito', 'Barcelona', '2026-06-15', 15, 'user3@example.com', 'card__img11.jpg'),
('Magia y Comedia en el Bosc de les Fades', 'Barcelona', '2026-07-01', 12, 'user3@example.com', 'card__img12.jpg');
