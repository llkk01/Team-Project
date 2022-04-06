-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db100
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db100
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db100` DEFAULT CHARACTER SET utf8 ;
USE `db100` ;

-- -----------------------------------------------------
-- Table `db100`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db100`.`member` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `tel` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `post` VARCHAR(45) NULL,
  `address` VARCHAR(100) NULL,
  `detailaddress` VARCHAR(100) NULL,
  `email` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL DEFAULT '1',
  `rdate` TIMESTAMP NULL DEFAULT current_timestamp,
  PRIMARY KEY (`no`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db100`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db100`.`admin` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `duty` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db100`.`notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db100`.`notice` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `contents` VARCHAR(1000) NOT NULL,
  `rdate` TIMESTAMP NULL DEFAULT current_timestamp,
  `views` INT NULL DEFAULT 0,
  `writer` INT NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_boardnotice_admin1_idx` (`writer` ASC) VISIBLE,
  CONSTRAINT `fk_boardnotice_admin1`
    FOREIGN KEY (`writer`)
    REFERENCES `db100`.`admin` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db100`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db100`.`product` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `detail` VARCHAR(100) NOT NULL,
  `price` INT NOT NULL,
  `num` INT NOT NULL,
  `quan` INT NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db100`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db100`.`cart` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `m_no` INT NOT NULL,
  `p_no` INT NOT NULL,
  `count` INT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_cart_product1_idx` (`p_no` ASC) VISIBLE,
  INDEX `fk_cart_member1_idx` (`m_no` ASC) VISIBLE,
  CONSTRAINT `fk_cart_product1`
    FOREIGN KEY (`p_no`)
    REFERENCES `db100`.`product` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_member1`
    FOREIGN KEY (`m_no`)
    REFERENCES `db100`.`member` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db100`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db100`.`review` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `contents` VARCHAR(500) NOT NULL,
  `rdate` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  `writer` INT NOT NULL,
  `p_no` INT NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_review_member1_idx` (`writer` ASC) VISIBLE,
  INDEX `fk_review_product1_idx` (`p_no` ASC) VISIBLE,
  CONSTRAINT `fk_review_member1`
    FOREIGN KEY (`writer`)
    REFERENCES `db100`.`member` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_product1`
    FOREIGN KEY (`p_no`)
    REFERENCES `db100`.`product` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db100`.`attach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db100`.`attach` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `size` INT NULL,
  `p_no` INT NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_attach_product1_idx` (`p_no` ASC) VISIBLE,
  CONSTRAINT `fk_attach_product1`
    FOREIGN KEY (`p_no`)
    REFERENCES `db100`.`product` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
