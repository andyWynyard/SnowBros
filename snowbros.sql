-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema snowbros
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `snowbros` ;

-- -----------------------------------------------------
-- Schema snowbros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `snowbros` DEFAULT CHARACTER SET utf8 ;
USE `snowbros` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(191) NULL,
  `phone_number` VARCHAR(45) NULL,
  `picture` VARCHAR(300) NULL,
  `password` VARCHAR(45) NULL,
  `admin` TINYINT(1) NOT NULL,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination` ;

CREATE TABLE IF NOT EXISTS `destination` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(300) NULL,
  `link` VARCHAR(300) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trip` ;

CREATE TABLE IF NOT EXISTS `trip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(300) NULL,
  `number_seats` INT NULL,
  `point_of_origin` VARCHAR(300) NULL,
  `date` DATETIME NULL,
  `point_of_return` VARCHAR(300) NULL,
  `description` VARCHAR(300) NULL,
  `destination_id` INT NOT NULL,
  `owner_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `dest_idx` (`destination_id` ASC),
  CONSTRAINT `dest`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_trip` ;

CREATE TABLE IF NOT EXISTS `user_trip` (
  `user_id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `trip_id_idx` (`trip_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `trip_id`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `extra_curr`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `extra_curr` ;

CREATE TABLE IF NOT EXISTS `extra_curr` (
  `name` VARCHAR(45) NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `return1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `return1` ;

CREATE TABLE IF NOT EXISTS `return1` (
  `id` INT NULL AUTO_INCREMENT,
  `trip_id` INT NULL,
  `return` TINYINT(1) NULL,
  `return_time` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `trip return_idx` (`trip_id` ASC),
  CONSTRAINT `trip return`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_rating` ;

CREATE TABLE IF NOT EXISTS `user_rating` (
  `value` INT NOT NULL,
  `user_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `rate_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `rating`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(300) NULL,
  `exp` INT NOT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_idx` (`user_id` ASC),
  CONSTRAINT `user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trip_ec`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trip_ec` ;

CREATE TABLE IF NOT EXISTS `trip_ec` (
  `trip_id` INT NOT NULL,
  `ec_id` INT NOT NULL,
  INDEX `ec_idx` (`ec_id` ASC),
  CONSTRAINT `trip`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ec`
    FOREIGN KEY (`ec_id`)
    REFERENCES `extra_curr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_friend` ;

CREATE TABLE IF NOT EXISTS `user_friend` (
  `friend_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_user_friend_user1_idx` (`user_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_friend_user_idx` (`friend_id` ASC),
  CONSTRAINT `fk_user_friend_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_user`
    FOREIGN KEY (`friend_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message` ;

CREATE TABLE IF NOT EXISTS `message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` VARCHAR(160) NULL,
  `trip_id` INT NOT NULL,
  `date` VARCHAR(100) NOT NULL,
  `owner_name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `trip_idx` (`trip_id` ASC),
  CONSTRAINT `trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO user9;
 DROP USER user9;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'user9' IDENTIFIED BY 'user9';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'user9';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
