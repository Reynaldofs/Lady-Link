-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_lady_link
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_lady_link
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_lady_link` DEFAULT CHARACTER SET utf8 ;
USE `db_lady_link` ;

-- -----------------------------------------------------
-- Table `db_lady_link`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_lady_link`.`tb_usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `usuario` VARCHAR(80) NOT NULL,
  `senha` VARCHAR(77) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_lady_link`.`tb_tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_lady_link`.`tb_tema` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `descricao` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_lady_link`.`tb_postagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_lady_link`.`tb_postagem` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(80) NOT NULL,
  `conteudo` VARCHAR(1000) NOT NULL,
  `data` DATETIME NOT NULL,
  `imagem` VARCHAR(255) NULL,
  `usuario_id` BIGINT NOT NULL,
  `tema_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_postagem_tb_usuario_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_tb_postagem_tb_tema1_idx` (`tema_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagem_tb_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `db_lady_link`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagem_tb_tema1`
    FOREIGN KEY (`tema_id`)
    REFERENCES `db_lady_link`.`tb_tema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
