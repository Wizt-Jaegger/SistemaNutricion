-- Create the database if it doesn't exist
drop database if exists nutricion2;

CREATE DATABASE IF NOT EXISTS nutricion2;
USE nutricion2;
select * from nutriologo;
select * from paciente;
select * from admin;
-- Select * from lastLoggedUser;
 CREATE TABLE IF NOT EXISTS lastLoggedUser(
	idLastUser int NOT NULL auto_increment,
	nombreUsuario VARCHAR(255),
    usertype VARCHAR(255),
    primary key(idLastUser)
 );

CREATE TABLE IF NOT EXISTS `alimento` (
 `nombreAlimento` VARCHAR(255) NOT NULL,
 `receta` TEXT NULL DEFAULT NULL,
 PRIMARY KEY (`nombreAlimento`)
 );
 
-- Table `nutricion`.`admin`
CREATE TABLE IF NOT EXISTS `admin` (
 `username` VARCHAR(255) NOT NULL,
 `password` VARCHAR(255) NOT NULL,
 PRIMARY KEY (`username`));

-- Table `nutricion`.`alimento`


-- Table `nutricion`.`paciente`
CREATE TABLE IF NOT EXISTS `paciente` (
 `nombreUsuario` VARCHAR(255) NOT NULL,
 `nombre` VARCHAR(255) NULL DEFAULT NULL,
 `edad` INT(11) NULL DEFAULT NULL,
 `contrasena` VARCHAR(255) NULL DEFAULT NULL,
 `numSegSocial` VARCHAR(255) NULL DEFAULT NULL,
 PRIMARY KEY (`nombreUsuario`));

-- Table `nutricion`.`planalimenticio`
CREATE TABLE IF NOT EXISTS `planalimenticio` (
 `idPlanAlimenticio` INT(11) NOT NULL AUTO_INCREMENT,
 `fechaInicio` DATE NULL DEFAULT NULL,
 `fechaFin` DATE NULL DEFAULT NULL,
 `nombreUsuario` VARCHAR(255) NULL DEFAULT NULL,
 
 PRIMARY KEY (`idPlanAlimenticio`),
 INDEX `nombreUsuario` (`nombreUsuario` ASC),
 CONSTRAINT `planalimenticio_ibfk_1`
    FOREIGN KEY (`nombreUsuario`)
    REFERENCES `paciente` (`nombreUsuario`));

-- Table `nutricion`.`detalleplanalimenticio`
CREATE TABLE IF NOT EXISTS `detalleplanalimenticio` (
 `idPlanAlimenticio` INT(11) NOT NULL,
 `nombreAlimento` VARCHAR(255) NOT NULL,
 `horaConsumo` TIME NULL DEFAULT NULL,
 `diaSemana` VARCHAR(255) NOT NULL,
 PRIMARY KEY (`idPlanAlimenticio`, `horaConsumo`, `diaSemana`),
 INDEX `nombreAlimento` (`nombreAlimento` ASC),
 CONSTRAINT `detalleplanalimenticio_ibfk_1`
    FOREIGN KEY (`idPlanAlimenticio`)
    REFERENCES `planalimenticio` (`idPlanAlimenticio`),
 CONSTRAINT `detalleplanalimenticio_ibfk_2`
    FOREIGN KEY (`nombreAlimento`)
    REFERENCES `alimento` (`nombreAlimento`)
);

-- Table `nutricion`.`nutriologo`
CREATE TABLE IF NOT EXISTS `nutriologo` (
 `nombreUsuario` VARCHAR(255) NOT NULL,
 `nombre` VARCHAR(255) NULL DEFAULT NULL,
 `edad` INT(11) NULL DEFAULT NULL,
 `contrasena` VARCHAR(255) NULL DEFAULT NULL,
 `cedulaProfesional` VARCHAR(255) NULL DEFAULT NULL,
 PRIMARY KEY (`nombreUsuario`)
 );

-- Table `nutricion`.`nutriologoplanalimenticio`
CREATE TABLE IF NOT EXISTS `nutriologoplanalimenticio` (
 `idNutriologoPlan` INT(11) NOT NULL AUTO_INCREMENT,
 `nombreUsuario` VARCHAR(255) NULL DEFAULT NULL,
 `idPlanAlimenticio` INT(11) NULL DEFAULT NULL,
 PRIMARY KEY (`idNutriologoPlan`),
 INDEX `nombreUsuario` (`nombreUsuario` ASC),
 INDEX `idPlanAlimenticio` (`idPlanAlimenticio` ASC),
 CONSTRAINT `nutriologoplanalimenticio_ibfk_1`
    FOREIGN KEY (`nombreUsuario`)
    REFERENCES `nutriologo` (`nombreUsuario`),
 CONSTRAINT `nutriologoplanalimenticio_ibfk_2`
    FOREIGN KEY (`idPlanAlimenticio`)
    REFERENCES `planalimenticio` (`idPlanAlimenticio`)
    );
SELECT * from alimento;
SELECT * from nutriologo;