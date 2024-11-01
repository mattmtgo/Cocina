CREATE DATABASE CocinaConsciente;
USE CocinaConsciente;


CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro DATE DEFAULT CURRENT_DATE,
    tipo_usuario ENUM('Administrador', 'Usuario') DEFAULT 'Usuario'
);

CREATE TABLE Recetas (
    id_receta INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    descripcion TEXT,
    tiempo_preparacion INT, -- en minutos
    nivel_dificultad ENUM('Fácil', 'Intermedio', 'Difícil') DEFAULT 'Fácil',
    impacto_ambiental INT, -- Puntuación que indica el impacto ambiental de la receta
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);


CREATE TABLE Ingredientes (
    id_ingrediente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('Vegetal', 'Animal', 'Grano', 'Especia', 'Otro') DEFAULT 'Otro'
);


CREATE TABLE Receta_Ingredientes (
    id_receta INT,
    id_ingrediente INT,
    cantidad DECIMAL(5, 2), -- Cantidad en gramos, mililitros, etc.
    unidad VARCHAR(20), -- Unidad de medida
    PRIMARY KEY (id_receta, id_ingrediente),
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta) ON DELETE CASCADE,
    FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id_ingrediente) ON DELETE CASCADE
);


CREATE TABLE Impacto_Ambiental (
    id_impacto INT PRIMARY KEY AUTO_INCREMENT,
    id_ingrediente INT,
    tipo_impacto ENUM('Deforestación', 'Emisiones de Gases', 'Desperdicio de Agua', 'Otro'),
    descripcion TEXT,
    valor_impacto DECIMAL(5, 2), -- Valor del impacto ambiental
    FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id_ingrediente) ON DELETE SET NULL
);

CREATE TABLE Interacciones (
    id_interaccion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_receta INT,
    tipo_interaccion ENUM('Comentario', 'Valoración'),
    comentario TEXT,
    valoracion INT CHECK (valoracion BETWEEN 1 AND 5), -- Valoración del 1 al 5
    fecha_interaccion DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta) ON DELETE CASCADE
);


CREATE TABLE Comunidad (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_evento VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_evento DATE,
    lugar VARCHAR(150)
);


CREATE TABLE Participacion_Evento (
    id_participacion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_evento INT,
    fecha_participacion DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_evento) REFERENCES Comunidad(id_evento) ON DELETE CASCADE
);


CREATE TABLE Receta_Comunidad (
    id_receta INT,
    id_evento INT,
    PRIMARY KEY (id_receta, id_evento),
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta) ON DELETE CASCADE,
    FOREIGN KEY (id_evento) REFERENCES Comunidad(id_evento) ON DELETE CASCADE
);

drop database cocinaconsciente;
