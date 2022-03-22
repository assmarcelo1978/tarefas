-- MySQL Script generated by MySQL Workbench
-- Tue Mar 22 08:19:28 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tarefas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tarefas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tarefas` DEFAULT CHARACTER SET utf8 ;
USE `tarefas` ;

-- -----------------------------------------------------
-- Table `tarefas`.`autorizacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarefas`.`autorizacoes` (
  `idautorizacoes` INT NOT NULL,
  `nivelautorizacao` INT NOT NULL,
  `nomeautorizacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idautorizacoes`),
  UNIQUE INDEX `nivelautorizacao_UNIQUE` (`nivelautorizacao` ASC)  ,
  UNIQUE INDEX `nomeautorizacao_UNIQUE` (`nomeautorizacao` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarefas`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarefas`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `autorizacoes_idautorizacoes` INT NOT NULL,
  `nomeusuarios` VARCHAR(45) NULL,
  `emailusuario` VARCHAR(45) NULL,
  `datainclusao` DATETIME NULL,
  PRIMARY KEY (`idusuarios`),
  UNIQUE INDEX `emailusuario_UNIQUE` (`emailusuario` ASC) ,
  INDEX `fk_usuarios_autorizacoes1_idx` (`autorizacoes_idautorizacoes` ASC) ,
  CONSTRAINT `fk_usuarios_autorizacoes1`
    FOREIGN KEY (`autorizacoes_idautorizacoes`)
    REFERENCES `tarefas`.`autorizacoes` (`idautorizacoes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarefas`.`tarefas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarefas`.`tarefas` (
  `idtarefas` INT NOT NULL,
  `nometarefas` VARCHAR(45) NOT NULL,
  `grupotarefas` INT NULL,
  `tipotarefas` INT NULL,
  `usuariotarefa` INT NULL,
  PRIMARY KEY (`idtarefas`),
  UNIQUE INDEX `nometarefas_UNIQUE` (`nometarefas` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarefas`.`tipotarefas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarefas`.`tipotarefas` (
  `idtipotarefas` INT NOT NULL,
  `tipotarefas` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipotarefas`),
  UNIQUE INDEX `tipotarefas_UNIQUE` (`tipotarefas` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarefas`.`grupotarefas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarefas`.`grupotarefas` (
  `idgrupotarefas` INT NOT NULL,
  `grupotarefas` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgrupotarefas`),
  UNIQUE INDEX `grupotarefas_UNIQUE` (`grupotarefas` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarefas`.`times`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarefas`.`times` (
  `idtimes` INT NOT NULL,
  `nometime` VARCHAR(45) NULL,
  `participantetime` VARCHAR(45) NULL,
  PRIMARY KEY (`idtimes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarefas`.`listatarefas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarefas`.`listatarefas` (
  `idlistatarefas` INT NOT NULL,
  `inclusaotarefa` DATE NOT NULL,
  `alteracaotarefa` DATETIME NULL,
  `conclusaotarefa` DATE NULL,
  `remocaotarefa` DATE NULL,
  `alteradortarefa` INT NULL,
  `tarefas_idtarefas` INT NOT NULL,
  `times_idtimes` INT NOT NULL,
  `usuarios_idusuarios` INT NOT NULL,
  `grupotarefas_idgrupotarefas` INT NOT NULL,
  `tipotarefas_idtipotarefas` INT NOT NULL,
  `listatarefascol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlistatarefas`),
  INDEX `fk_listatarefas_tarefas1_idx` (`tarefas_idtarefas` ASC) ,
  INDEX `fk_listatarefas_times1_idx` (`times_idtimes` ASC) ,
  INDEX `fk_listatarefas_usuarios1_idx` (`usuarios_idusuarios` ASC) ,
  INDEX `fk_listatarefas_grupotarefas1_idx` (`grupotarefas_idgrupotarefas` ASC) ,
  INDEX `fk_listatarefas_tipotarefas1_idx` (`tipotarefas_idtipotarefas` ASC) ,
  CONSTRAINT `fk_listatarefas_tarefas1`
    FOREIGN KEY (`tarefas_idtarefas`)
    REFERENCES `tarefas`.`tarefas` (`idtarefas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_listatarefas_times1`
    FOREIGN KEY (`times_idtimes`)
    REFERENCES `tarefas`.`times` (`idtimes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_listatarefas_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios`)
    REFERENCES `tarefas`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_listatarefas_grupotarefas1`
    FOREIGN KEY (`grupotarefas_idgrupotarefas`)
    REFERENCES `tarefas`.`grupotarefas` (`idgrupotarefas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_listatarefas_tipotarefas1`
    FOREIGN KEY (`tipotarefas_idtipotarefas`)
    REFERENCES `tarefas`.`tipotarefas` (`idtipotarefas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
