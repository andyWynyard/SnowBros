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
CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(191) NULL,
  `phone_number` VARCHAR(45) NULL,
  `picture` VARCHAR(300) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `destination` (
  `id` INT NOT NULL,
  `name` VARCHAR(300) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trip` (
  `id` INT NOT NULL,
  `title` VARCHAR(300) NULL,
  `number_seats` INT NULL,
  `point_of_origin` VARCHAR(300) NULL,
  `date` DATETIME NULL,
  `point_of_return` VARCHAR(300) NULL,
  `description` VARCHAR(300) NULL,
  `destination_id` INT NOT NULL,
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
CREATE TABLE IF NOT EXISTS `extra_curr` (
  `trip_id` INT NULL,
  `name` VARCHAR(45) NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `extras_idx` (`trip_id` ASC),
  CONSTRAINT `extras`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `return`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `return` (
  `id` INT NULL,
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
CREATE TABLE IF NOT EXISTS `user_rating` (
  `value` INT NOT NULL,
  `user_id` INT NOT NULL,
  `id` INT NOT NULL,
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
CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL,
  `name` VARCHAR(300) NULL,
  `exp` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` INT NOT NULL,
  `user_id` INT NULL,
  `admin` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `type_idx` (`user_id` ASC),
  CONSTRAINT `type`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `activity_user` (
  `activity_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  INDEX `activity_idx` (`activity_id` ASC),
  INDEX `user_idx` (`user_id` ASC),
  CONSTRAINT `activity`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'user1' IDENTIFIED BY 'user1';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'user1';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
