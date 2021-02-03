-- PARTIE UN



-- exo 1 : Créer une base de données languages.
CREATE DATABASE languages;

-- exo 2 : Créer une base de données webDevelopment avec l’encodage UTF-8.
CREATE DATABASE webDevelopment CHARACTER SET utf8;

-- exo 3 : Créer une base de données frameworks avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS frameworks;

-- exo 4 : Créer une base de données languages avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS languages CHARACTER SET utf8;

-- exo 5 : Supprimer la base de données languages.
DROP DATABASE languages;

-- exo 6 : Supprimer la base de données frameworks si elle existe.
DROP DATABASE IF EXISTS frameworks;

-- exo 7 : Supprimer la base de données languages si elle existe.
DROP DATABASE IF EXISTS languages;



-- PARTIE DEUX


-- exo 1 : Dans la base de données webDevelopment, créer la table languages avec les colonnes :
-- id (type INT, auto-incrémenté, clé primaire)
-- language (type VARCHAR)

use webDevelopment;

CREATE TABLE languages (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  language VARCHAR(100)
);

-- exo 2 : Dans la base de données webDevelopment, créer la table tools avec les colonnes suivantes :
-- id (type INT, auto-incrémenté, clé primaire)
-- tool (type VARCHAR)

CREATE TABLE tools (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tool VARCHAR(100)
);

-- exo 3 : Dans la base de données webDevelopment, créer la table frameworks avec les colonnes suivantes :
-- id (type INT, auto-incrémenté, clé primaire)
-- name (type VARCHAR)

CREATE TABLE frameworks (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50)
);

-- exo 4 : Dans la base de données webDevelopment, créer la table libraries avec les colonnes suivantes :
-- id (type INT, auto-incrémenté, clé primaire)
-- library (type VARCHAR)

CREATE TABLE libraries (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    library VARCHAR(100)
);

-- exo 5 : Dans la base de données webDevelopment, créer la table ide avec les colonnes suivantes :
-- id (type INT, auto-incrémenté, clé primaire)
-- ideName (type VARCHAR)

CREATE TABLE ide (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ideName VARCHAR(100)
);

-- exo 6 : Dans la base de données webDevelopment, créer, si elle n'existe pas, la table frameworks avec les colonnes suivantes :
-- id (type INT, auto-incrémenté, clé primaire)
-- name (type VARCHAR)

CREATE TABLE IF NOT EXISTS frameworks (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50)
);

-- exo 7 : Supprimer la table tools si elle existe.

DROP TABLE IF EXISTS tools;

-- exo 8 : Supprimer la table libraries.

DROP TABLE libraries;

-- exo 9 : Supprimer la table ide.

DROP TABLE ide;

-- TP : Créer la base codex. Y créer une table clients qui aura comme colonnes.

CREATE DATABASE codex;

use codex;

CREATE TABLE clients (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastname VARCHAR(100),
    firstname VARCHAR(100),
    birthDate DATE,
    adress VARCHAR(100),
    firstPhoneNumber INT,
    secondPhoneNumber INT,
    mail VARCHAR(100)
);

-- créer un id unique avec id int primary key not null auto_increment !!!
-- not null = champs obligatoire
-- null = champs facultatif



-- PARTIE TROIS


-- exo 1 : Dans la base de données webDevelopment, ajouter à la table languages une colonne versions (VARCHAR).

use webDevelopment;

ALTER TABLE languages
ADD versions VARCHAR (100);

-- exo 2 : Dans la base de données webDevelopment, ajouter à la table frameworks une colonne version (INT).

ALTER TABLE frameworks
ADD version INT;

-- exo 3 : Dans la base de données webDevelopment, dans la table languages renommer la colonne versions en version.

ALTER TABLE languages
CHANGE versions version VARCHAR (100);

-- exo 4 : Dans la base de données webDevelopment, dans la table frameworks, renommer la colonne name en framework.

ALTER TABLE frameworks
CHANGE name framework VARCHAR (100);

-- exo 5 : Dans la base de données webDevelopment, dans la table frameworks changer le type de la colonne version en VARCHAR de taille 10.

ALTER TABLE frameworks
MODIFY version VARCHAR (10);

-- TP : Dans la base codex, dans la table clients :
-- supprimer la colonne secondPhoneNumber
-- renommer la colonne firstPhoneNumber en phoneNumber
-- changer le type de la colonne phoneNumber en VARCHAR
-- ajouter les colonnes zipCode(VARCHAR) et city(VARCHAR)

use codex;

ALTER TABLE clients
DROP secondPhoneNumber;

ALTER TABLE clients
CHANGE firstPhoneNumber phoneNumber INT;
-- CHANGE modifier nom du champs et le type

ALTER TABLE clients
MODIFY phoneNumber VARCHAR(10);
-- MODIFY modifier juste le type

ALTER TABLE clients
ADD zipCode VARCHAR(5);

ALTER TABLE clients
ADD city VARCHAR(50);



-- PARTIE QUATRE


-- exo 1 : Insérez les données suivantes dans la table languages de la base webDevelopment :
-- JavaScript, version 5
-- PHP, version 5.2
-- PHP, version 5.4
-- HTML, version 5.1
-- JavaScript, version 6
-- JavaScript, version 7
-- JavaScript, version 8
-- PHP, version 7

use webDevelopment;

INSERT INTO languages (language, version)
VALUES
("JavaScript", 5),
("PHP", 5.2),
("PHP", 5.4),
("HTML", 5.1),
("JavaScript", 6),
("JavaScript", 7),
("JavaScript", 8),
("PHP", 7);

-- exo 2 : Insérez les données suivantes dans la table frameworks de la base webDevelopment :
-- Symfony, version 2.8
-- Symfony, version 3
-- Jquery, version 1.6
-- Jquery, version 2.10

INSERT INTO frameworks (framework, version)
VALUES
("Symfony", 2.8),
("Symfony", 3),
("Jquery", 1.6),
("Jquery", 2.10);



-- PARTIE CINQ


-- exo 1 : Dans la table languages, afficher toutes les données de la table.

SELECT * FROM languages;

-- exo 2 : Dans la table languages, afficher toutes les versions de PHP.

SELECT version FROM languages
WHERE language = 'PHP';

-- exo 3 : Dans la table languages, afficher toutes les versions de PHP et de JavaScript.

SELECT version FROM languages
WHERE language IN ('PHP','JavaScript');

-- exo 4 : Dans la table languages, afficher toutes les lignes ayant pour id 3,5,7.

SELECT * FROM languages
WHERE id IN (3, 5, 7);

-- exo 5 : Dans la table languages, afficher les deux première entrées de JavaScript.

SELECT * FROM languages
WHERE language = 'JavaScript'
LIMIT 2;

-- exo 6 : Dans la table languages, afficher toutes les lignes qui ne sont pas du PHP.

SELECT * FROM languages
WHERE language != 'PHP';

-- exo 7 : Dans la table languages, afficher toutes les données par ordre alphabétique.

SELECT * FROM language
ORDER by language;



-- PARTIE SIX


-- exo 1 : Dans la table frameworks, afficher toutes les données de la table ayant une version 2.x (x étant un numéro quelconque).

SELECT * FROM frameworks
WHERE version LIKE '2%';

-- % affiche tous les résultats

-- exo 2 : Dans la table frameworks, afficher toutes les lignes ayant pour id 1 et 3.

SELECT * FROM frameworks
WHERE id IN (1, 3);

-- exo 3 : Dans la table ide, afficher toutes les lignes ayant une date comprise entre le premier janvier 2010 et le 31 decembre 2011.

SELECT * FROM ide
WHERE date BETWEEN '2010-01-01' AND '2011-12-31';



-- PARTIE SEPT


-- exo 1 : Dans la table languages, supprimer toutes les lignes parlant de HTML.

DELETE FROM languages
WHERE language = 'HTML';

-- exo 2 : Dans la table frameworks, modifier toutes les lignes ayant le framework Symfony par Symfony2.

UPDATE frameworks
SET framework = 'Symfony2'
WHERE framework = 'Symfony';

-- SET pour modifier une valeur

-- exo 3 : Dans la table languages, modifier la ligne du langage JavaScript version 5 par la version 5.1.

UPDATE languages
SET version = '5.1'
WHERE language = 'JavaScript' AND version = '5';



-- PARTIE HUIT


-- exo 1 : Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework l'afficher aussi.

SELECT frameworks.name as frameworks, languages.name as language 
FROM frameworks 
INNER JOIN languages 
ON frameworks.languagesId = languages.id;

-- exo 2 : Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework ne pas l'afficher.



-- exo 3 : Afficher le nombre de framework qu'a un langage.

SELECT languages.name as language, COUNT(frameworks.name) as totalframework
FROM languages 
INNER JOIN frameworks 
ON frameworks.languagesId = languages.id
GROUP BY languages.name;

-- exo 4 : Afficher les langages ayant plus de 3 frameworks.

SELECT languages.name as language, COUNT(frameworks.name) as totalframework
FROM languages
INNER JOIN frameworks
ON frameworks.languagesId = languages.id
GROUP BY languages.name
HAVING COUNT(totalframework.name) > 3;