-- creacion y seleccion de la base de datos

-- creacion de la base de datos
CREATE DATABASE peliculas;
--seleccionar la base de datos para su posterior uso
USE peliculas;

-- ---------------------------------
-- ---------------------------------

-- creacion de las tablas

CREATE TABLE actor (
    CodActor int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre varchar(50) NOT NULL,
    FNacimiento date DEFAULT NULL,
    Nacionalidad varchar(50) DEFAULT NULL
);

CREATE TABLE pelicula (
    CodPelicula int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Titulo varchar(50) NOT NULL,
    Anyo varchar(4) NOT NULL,
    Nacionalidad varchar(30) DEFAULT NULL,
    Duracion float DEFAULT NULL,
    FechaEstreno date DEFAULT NULL,
    Taquilla double DEFAULT 0.00,
    Productora varchar(50) DEFAULT NULL,
    Distribuidora varchar(50) DEFAULT NULL,
    director_CodDirector int  DEFAULT NULL
);

CREATE TABLE actores_en_peliculas (
    CodActores_en_peliculas int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    pelicula_CodPelicula int  NOT NULL,
    actor_CodActor int  NOT NULL
);

CREATE TABLE director (
    CodDirector int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre varchar(50) NOT NULL,
    FNacimiento date DEFAULT NULL,
    Nacionalidad varchar(50) DEFAULT NULL
);

CREATE TABLE genero (
    CodGenero int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre varchar(50) NOT NULL
);

CREATE TABLE generos_en_peliculas (
    CodGeneros_en_peliculas int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    pelicula_CodPelicula int  NOT NULL,
    genero_CodGenero int  NOT NULL
);

-- claves foraneas

ALTER TABLE generos_en_peliculas ADD CONSTRAINT generos_en_peliculas_genero
FOREIGN KEY (genero_CodGenero)
REFERENCES genero (CodGenero)  
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE generos_en_peliculas ADD CONSTRAINT generos_en_peliculas_pelicula
FOREIGN KEY (pelicula_CodPelicula)
REFERENCES pelicula (CodPelicula)  
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE pelicula ADD CONSTRAINT pelicula_director
FOREIGN KEY (director_CodDirector)
REFERENCES director (CodDirector)  
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE actores_en_peliculas ADD CONSTRAINT actores_en_peliculas_actor
FOREIGN KEY (actor_CodActor)
REFERENCES actor (CodActor)  
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE actores_en_peliculas ADD CONSTRAINT actores_en_peliculas_pelicula
FOREIGN KEY (pelicula_CodPelicula)
REFERENCES pelicula (CodPelicula)  
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ---------------------
-- ---------------------

-- insercion de los datos

INSERT INTO director (Nombre, FNacimiento, Nacionalidad) VALUES
-- 1
('Robert Zemeckis', '1952-05-14', 'Estados Unidos'),
-- 2
('Steven Spielberg', '1946-12-18', 'Estados Unidos'),
-- 3
('Robert C. Cooper', '1968-09-14', 'Canada'),
-- 4
('Fabián Bielinsky', '1959-02-03', 'Argentina'),
-- 5
('Ariel Winograd', '1977-08-23', 'Argentina'),
-- 6
('Carlos Galettini', '1938-06-23', 'Argentina'),
-- 7
('Lee David Zlotoff', '1954-07-10', 'Estados Unidos'),
-- 8
('Terence Young', '1915-06-20', 'China'),
-- 9
('Jon Amiel', '1948-05-20', 'Reino Unido'),
-- 10
('Tim Story', '1970-03-13', 'Estados Unidos'),
-- 11
('Brian De Palma', '1940-09-11', 'Estados Unidos'),
-- 12
('Joseph Kosinski', '1974-05-03', 'Estados Unidos'),
-- 13
('George Lucas', '1944-05-14', 'Estados Unidos'),
-- 14
('Damián Szifron', '1975-07-09', 'Argentina'),
-- 15
('Chuck Russell', '1958-05-09', 'Estados Unidos'),
-- 16
('James Cameron', '1954-08-16', 'Canada');

INSERT INTO pelicula (Titulo, Anyo, Nacionalidad, Duracion, FechaEstreno, Taquilla, Productora, Distribuidora, director_CodDirector) VALUES 
-- 1
('El naufrago', '2000', 'Estados Unidos', 143.00, '2000-05-12', 100.00, 'ImageMovers', 'Fox', 1),
-- 2
('Atrapame si puedes', '2013', 'Reino Unido', 115.00, '2013-03-21', 200.00, 'Walter F. Parkes', 'Fox', 2),
-- 3
('Stargate SG-1', '2005', 'Estados Unidos', 200.00, '2005-06-05', 150.00, 'Richard Dean Anderson', 'Warner Bros', 3),
-- 4
('9 Reinas', '1999', 'Argentina', 90.00, '1999-07-19', 105.00, 'Damian Zsifron', 'Telefe', 4),
-- 5
('El robo del siglo', '2020', 'Argentina', 115.00, '2020-08-27', 75.00, 'AZ Films', 'Telefe', 5),
-- 6
('Los Exterminators', '1989', 'Argentina', 125.00, '1989-06-24', 150.00, 'Argentina Sono Film', 'Canal 13', 6),
-- 7
('Mac Gyver', '1986', 'Canada', 116.00, '1986-09-06', 250.00, 'John Rich', 'Warner Bros', 7),
-- 8
('Indiana Jones y la ultima cruzada', '1989', 'Estados Unidos', 135.00, '1989-05-12', 474.00, 'LucasFilm', 'Warner Bros', 2),
-- 9
('James Bond', '1962', 'Reino Unido', 105.00, '1962-09-29', 400.00, 'No de lan Fleming', 'Universal', 8),
-- 10
('La emboscada', '1999', 'Estados Unidos', 118.00, '1999-04-30', 350.00, 'Terry Rawlings', 'Universal', 9),
-- 11
('Los 4 Fantasticos', '2005', 'Estados Unidos', 125.00, '2005-08-25', 330.50, 'Constantin Film', 'Disney', 10),
-- 12
('Los Intocables', '1987', 'Estados Unidos', 120.00, '1987-08-27', 350.00, 'Art Linson', 'Universal', 11),
-- 13
('Tron: El legado', '2010', 'Estados Unidos', 127.00, '2010-07-28', 400.00, 'Dean Edward Mitzner', 'Buena Vista Pictures', 12);

INSERT INTO actor (Nombre, FNacimiento, Nacionalidad) VALUES
-- 1
('Tom Hanks', '1965-05-30', 'Canada'),
-- 2
('Helen Hunt', '1975-03-12', 'Estados Unidos'),
-- 3
('Leonardo DiCaprio', '1978-2-05', 'Estados Unidos'),
-- 4
('Christopher Walken', '1963-04-25', 'Canada'),
-- 5
('Richard Dean Anderson', '1957-06-30', 'Estados Unidos'),
-- 6
('Michael Shanks', '1978-06-11', 'Estados Unidos'),
-- 7
('Amanda Tapping', '1976-10-09', 'Estados Unidos'),
-- 8
('Christopher Judge', '1974-01-16', 'Estados Unidos'),
-- 9
('Ricardo Darin', '1963-12-19', 'Argentina'),
-- 10
('Gaston Pauls', '1977-08-02', 'Argentina'),
-- 11
('Guillermo Francella', '1963-09-12', 'Argentina'),
-- 12
('Johana Francella', '1985-01-24', 'Argentina'),
-- 13
('Diego Peretti', '1975-04-15', 'Argentina'),
-- 14
('Pablo Rago', '1972-05-03', 'Argentina'),
-- 15
('Emilio Dissi', '1960-06-24', 'Argentina'),
-- 16
('Dana Elcar', '1952-07-12', 'Suecia'),
-- 17
('Harrison Ford', '1946-05-14', 'Finlandia'),
-- 18
('Sean Connery', '1930-08-25', 'Reino Unido'),
-- 19
('Catherine Zeta Jones', '1969-09-25', 'Reino Unido'),
-- 20
('Chris Evans', '1981-06-13', 'Estados Unidos'),
-- 21
('Jessica Alba', '1981-04-28', 'Estados Unidos'),
-- 22
('Michael Chiklis', '1963-08-30', 'Estados Unidos'),
-- 23
('Ioan Gruffudd', '1973-10-06', 'Reino Unido'),
-- 24
('Kevin Costner', '1955-01-18', 'Estados Unidos'),
-- 25
('Andy Garcia', '1956-04-12', 'Estados Unidos'),
-- 26
('Robert De Niro', '1943-08-17', 'Estados Unidos'),
-- 27
('Guillermo Yacob', '1984-07-26', 'Argentina'),
-- 28
('Jeff Bridges', '1955-09-28', 'Reino Unido'),
-- 29
('Olivia Wilde', '1981-06-11', 'Estados Unidos'),
-- 30
('Beau Garret', '1986-09-29', 'Canada');

INSERT INTO actores_en_peliculas (pelicula_CodPelicula, actor_CodActor) VALUES
-- El Naufrago
(1, 1),
(1, 2),
-- Atrapame si puedes
(2, 1),
(2, 3),
(2, 4),
-- Stargate SG1
(3, 5),
(3, 6),
(3, 7),
(3, 8),
-- 9 Reinas
(4, 9),
(4, 10),
-- El robo del siglo
(5, 11),
(5, 12),
(5, 13),
(5, 14),
-- Los Exterminators
(6, 11),
(6, 15),
-- MacGyver
(7, 5),
(7, 16),
-- Indiana Jones y la ultima cruzada
(8, 17),
(8, 18),
-- James Bond
(9, 18),
-- La emboscada
(10, 18),
(10, 19),
-- Los 4 Fantasticos
(11, 20),
(11, 21),
(11, 22),
(11, 23),
--  Los Intocables
(12, 18),
(12, 24),
(12, 25),
(12, 26),
--  Tron: El legado
(13, 27),
(13, 28),
(13, 29),
(13, 30);

INSERT INTO genero (Nombre) VALUES
--  1
('Acción'),
--  2
('Aventura'),
--  3
('Ciencia Ficcion'),
--  4
('Comedia'),
--  5
('Drama'),
--  6
('Fantasia'),
--  7
('Romance'),
--  8
('Suspenso');

INSERT INTO generos_en_peliculas (pelicula_CodPelicula, genero_CodGenero) VALUES
--  El Naufrago
(1, 2),
(1, 4),
(1, 5),
--  Atrapame si puedes
(2, 2),
(2, 5),
--  Stargate SG1
(3, 1),
(3, 2),
(3, 3),
(3, 6),
--  9 Reinas
(4, 2),
(4, 5),
--  El robo del siglo
(5, 5),
--  Los Exterminators
(6, 1),
(6, 2),
(6, 4),
--  MacGyver
(7, 1),
(7, 2),
--  Indiana Jones y la ultima cruzada
(8, 2),
(8, 4),
(8, 6),
--  James Bond
(9, 1),
(9, 5),
(9, 7),
--  La emboscada
(10, 1),
(10, 2),
(10, 7),
(10, 8),
--  Los 4 Fantasticos
(11, 1),
(11, 6),
--  Los Intocables
(12, 5),
(12, 8),
--  Tron: El legado
(13, 1),
(13, 2),
(13, 3),
(13, 6);

-- -------------------------------
-- -------------------------------

-- resolucion de los puntos siguientes del trabajo

-- 4) Modifica el valor del campo Taquilla de las películas de Estados Unidos, de manera que se conviertan de dólares a pesos, multiplicando su valor por 300.

UPDATE pelicula 
SET Taquilla = Taquilla * 300
WHERE Nacionalidad = 'Estados Unidos';

-- 5) Muestra los actores y actrices, nacidos en Estados Unidos entre los años 1970 y 2000, según la información almacenada en tu base de datos.

SELECT Nombre, FNacimiento FROM actor
WHERE Nacionalidad = 'Estados Unidos' AND FNacimiento >= '1970-01-01' AND FNacimiento <= '1999-12-31';

-- 6) ¿Cuál ha sido la recaudación total de las películas realizadas en Argentina?

SELECT SUM(Taquilla) AS Total_taquilla_argentinas FROM pelicula
WHERE Nacionalidad = 'Argentina';

-- 7) Muestra el nombre y lugar de nacimiento de los directores con peliculas que comiencen con el articulo ‘los’.

SELECT director.Nombre AS Nombre_director, director.Nacionalidad FROM director
JOIN pelicula ON pelicula.director_CodDirector = director.CodDirector
WHERE pelicula.Titulo LIKE 'Los%';

-- 8) Mostrar un listado en el que aparezcan cuántas películas tenemos de cada nacionalidad.

SELECT Nacionalidad, COUNT(Nacionalidad) AS Cantidad_peliculas FROM pelicula
GROUP BY Nacionalidad; 

-- 9) ¿Quién es el actor que ha participado en más películas?

SELECT actor.Nombre AS Nombre_actor, COUNT(actor.CodActor) AS Cantidad_peliculas_protagonizadas FROM actor
JOIN actores_en_peliculas ON actor.CodActor = actores_en_peliculas.actor_CodActor 
GROUP BY actor.CodActor
ORDER BY cantidad_peliculas_protagonizadas DESC
LIMIT 1;

-- 10) ¿Qué directores han dirigido menos películas de las que tienes almacenadas?

SELECT director.Nombre, COUNT(director.CodDirector) AS Total_peliculas_dirigidas FROM director
JOIN pelicula ON director.CodDirector = pelicula.director_CodDirector 
GROUP BY director.CodDirector
ORDER BY total_peliculas_dirigidas ASC
LIMIT 15;

-- 11) ¿Qué directores (de los que tenemos almacenados) no han dirigido ninguna de las películas de la tabla `pelicula`?

SELECT director.Nombre FROM director
LEFT JOIN pelicula ON director.CodDirector = pelicula.director_CodDirector
WHERE pelicula.director_CodDirector IS NULL;