-- MySQL Script generated by MySQL Workbench
-- Sun Jan 15 00:26:28 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TB_TALENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_TALENTO` (
  `ID` INT NOT NULL,
  `NOME` VARCHAR(45) NULL,
  `PRIORIDADE` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_PERSONAGEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_PERSONAGEM` (
  `ID` INT NOT NULL,
  `NOME` VARCHAR(45) NULL,
  `ID_TALENTO` INT NOT NULL,
  `PHOTO_URL` VARCHAR(200) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_TB_PERSONAGEM_TB_TALENTO_idx` (`ID_TALENTO` ASC) VISIBLE,
  CONSTRAINT `fk_TB_PERSONAGEM_TB_TALENTO`
    FOREIGN KEY (`ID_TALENTO`)
    REFERENCES `mydb`.`TB_TALENTO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_ARMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_ARMA` (
  `ID` INT NOT NULL,
  `NOME` VARCHAR(45) NULL,
  `PHOTO_URL` VARCHAR(200) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_STATUS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_STATUS` (
  `ID` INT NOT NULL,
  `NOME` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_ARTEFATO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_ARTEFATO` (
  `ID` INT NOT NULL,
  `NOME` INT NOT NULL,
  `ID_STATUS` INT NOT NULL,
  `PHOTO_URL` VARCHAR(200) NULL,
  PRIMARY KEY (`ID`, `ID_STATUS`),
  INDEX `fk_TB_ARTEFATO_TB_STATUS_ARTEFATO1_idx` (`ID_STATUS` ASC) VISIBLE,
  CONSTRAINT `fk_TB_ARTEFATO_TB_STATUS_ARTEFATO1`
    FOREIGN KEY (`ID_STATUS`)
    REFERENCES `mydb`.`TB_STATUS` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_PERSONAGEM_ARMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_PERSONAGEM_ARMA` (
  `ID_PERSONAGEM` INT NOT NULL,
  `ID_ARMA` INT NOT NULL,
  `PRIORIDADE` INT NOT NULL,
  PRIMARY KEY (`ID_PERSONAGEM`, `ID_ARMA`),
  INDEX `fk_TB_PERSONAGEM_has_TB_ARMA_TB_ARMA1_idx` (`ID_ARMA` ASC) VISIBLE,
  INDEX `fk_TB_PERSONAGEM_has_TB_ARMA_TB_PERSONAGEM1_idx` (`ID_PERSONAGEM` ASC) VISIBLE,
  CONSTRAINT `fk_TB_PERSONAGEM_has_TB_ARMA_TB_PERSONAGEM1`
    FOREIGN KEY (`ID_PERSONAGEM`)
    REFERENCES `mydb`.`TB_PERSONAGEM` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_PERSONAGEM_has_TB_ARMA_TB_ARMA1`
    FOREIGN KEY (`ID_ARMA`)
    REFERENCES `mydb`.`TB_ARMA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_PERSONAGEM_ARTEFATO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_PERSONAGEM_ARTEFATO` (
  `ID_PERSONAGEM` INT NOT NULL,
  `ID_ARTEFATO` INT NOT NULL,
  `PRIORIDADE` INT NULL,
  PRIMARY KEY (`ID_PERSONAGEM`, `ID_ARTEFATO`),
  INDEX `fk_TB_PERSONAGEM_has_TB_ARTEFATO_TB_ARTEFATO1_idx` (`ID_ARTEFATO` ASC) VISIBLE,
  INDEX `fk_TB_PERSONAGEM_has_TB_ARTEFATO_TB_PERSONAGEM1_idx` (`ID_PERSONAGEM` ASC) VISIBLE,
  CONSTRAINT `fk_TB_PERSONAGEM_has_TB_ARTEFATO_TB_PERSONAGEM1`
    FOREIGN KEY (`ID_PERSONAGEM`)
    REFERENCES `mydb`.`TB_PERSONAGEM` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_PERSONAGEM_has_TB_ARTEFATO_TB_ARTEFATO1`
    FOREIGN KEY (`ID_ARTEFATO`)
    REFERENCES `mydb`.`TB_ARTEFATO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_SUBSTATUS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_SUBSTATUS` (
  `ID` INT NOT NULL,
  `NOME` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TB_ARTEFATO_SUBSTATUS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TB_ARTEFATO_SUBSTATUS` (
  `ID_ARTEFATO` INT NOT NULL,
  `ID_SUBSTATUS` INT NOT NULL,
  PRIMARY KEY (`ID_ARTEFATO`, `ID_SUBSTATUS`),
  INDEX `fk_TB_ARTEFATO_has_TB_SUBSTATUS_ARTEFATO_TB_SUBSTATUS_ARTEF_idx` (`ID_SUBSTATUS` ASC) VISIBLE,
  INDEX `fk_TB_ARTEFATO_has_TB_SUBSTATUS_ARTEFATO_TB_ARTEFATO1_idx` (`ID_ARTEFATO` ASC) VISIBLE,
  CONSTRAINT `fk_TB_ARTEFATO_has_TB_SUBSTATUS_ARTEFATO_TB_ARTEFATO1`
    FOREIGN KEY (`ID_ARTEFATO`)
    REFERENCES `mydb`.`TB_ARTEFATO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_ARTEFATO_has_TB_SUBSTATUS_ARTEFATO_TB_SUBSTATUS_ARTEFATO1`
    FOREIGN KEY (`ID_SUBSTATUS`)
    REFERENCES `mydb`.`TB_SUBSTATUS` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
