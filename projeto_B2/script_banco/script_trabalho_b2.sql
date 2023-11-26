-- MySQL Script generated by MySQL Workbench
-- Sun Nov 19 17:17:54 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`autor` (
  `atr_id` INT NOT NULL,
  `atr_rna` VARCHAR(13) NOT NULL,
  `atr_fnome` VARCHAR(100) NOT NULL,
  `atr_lnome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`atr_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`editora` (
  `edtr_id` INT NOT NULL,
  `edtr_cnpj` VARCHAR(14) NOT NULL,
  `edtr_nome` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`edtr_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`livro` (
  `lvr_id` INT NOT NULL,
  `lvr_nome` VARCHAR(80) NOT NULL,
  `lvr_lancamento` DATETIME NOT NULL,
  `lvr_valor` DECIMAL(6,2) NULL,
  `editora_edtr_id` INT NOT NULL,
  PRIMARY KEY (`lvr_id`),
  INDEX `fk_livro_editora1_idx` (`editora_edtr_id` ASC) VISIBLE,
  CONSTRAINT `fk_livro_editora1`
    FOREIGN KEY (`editora_edtr_id`)
    REFERENCES `biblioteca`.`editora` (`edtr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`exemplares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`exemplares` (
  `exp_id` INT NOT NULL,
  `exp_numero` INT NOT NULL,
  `livro_lvr_id` INT NOT NULL,
  PRIMARY KEY (`exp_id`),
  INDEX `fk_exemplares_livro1_idx` (`livro_lvr_id` ASC) VISIBLE,
  CONSTRAINT `fk_exemplares_livro1`
    FOREIGN KEY (`livro_lvr_id`)
    REFERENCES `biblioteca`.`livro` (`lvr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`socio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`socio` (
  `socio_id` INT NOT NULL,
  `socio_fnome` VARCHAR(100) NOT NULL,
  `socio_lnome` VARCHAR(50) NOT NULL,
  `socio_cpf` VARCHAR(11) NOT NULL,
  `data_nascimento` VARCHAR(45) NULL,
  PRIMARY KEY (`socio_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`livro_has_autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`livro_has_autor` (
  `livro_lvr_id` INT NOT NULL,
  `autor_atr_id` INT NOT NULL,
  PRIMARY KEY (`livro_lvr_id`, `autor_atr_id`),
  INDEX `fk_livro_has_autor_autor1_idx` (`autor_atr_id` ASC) VISIBLE,
  INDEX `fk_livro_has_autor_livro_idx` (`livro_lvr_id` ASC) VISIBLE,
  CONSTRAINT `fk_livro_has_autor_livro`
    FOREIGN KEY (`livro_lvr_id`)
    REFERENCES `biblioteca`.`livro` (`lvr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_has_autor_autor1`
    FOREIGN KEY (`autor_atr_id`)
    REFERENCES `biblioteca`.`autor` (`atr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`autor_has_editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`autor_has_editora` (
  `autor_atr_id` INT NOT NULL,
  `editora_edtr_id` INT NOT NULL,
  PRIMARY KEY (`autor_atr_id`, `editora_edtr_id`),
  INDEX `fk_autor_has_editora_editora1_idx` (`editora_edtr_id` ASC) VISIBLE,
  INDEX `fk_autor_has_editora_autor1_idx` (`autor_atr_id` ASC) VISIBLE,
  CONSTRAINT `fk_autor_has_editora_autor1`
    FOREIGN KEY (`autor_atr_id`)
    REFERENCES `biblioteca`.`autor` (`atr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_autor_has_editora_editora1`
    FOREIGN KEY (`editora_edtr_id`)
    REFERENCES `biblioteca`.`editora` (`edtr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`emprestimo` (
  `socio_socio_id` INT NOT NULL,
  `exemplares_exp_id` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_entrega` DATE NOT NULL,
  PRIMARY KEY (`socio_socio_id`, `exemplares_exp_id`),
  INDEX `fk_socio_has_exemplares_exemplares1_idx` (`exemplares_exp_id` ASC) VISIBLE,
  INDEX `fk_socio_has_exemplares_socio1_idx` (`socio_socio_id` ASC) VISIBLE,
  CONSTRAINT `fk_socio_has_exemplares_socio1`
    FOREIGN KEY (`socio_socio_id`)
    REFERENCES `biblioteca`.`socio` (`socio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_socio_has_exemplares_exemplares1`
    FOREIGN KEY (`exemplares_exp_id`)
    REFERENCES `biblioteca`.`exemplares` (`exp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;