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
-- Table `user_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_type` ;

CREATE TABLE IF NOT EXISTS `user_type` (
  `id` INT NOT NULL,
  `admin` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(191) NULL,
  `phone_number` VARCHAR(45) NULL,
  `picture` VARCHAR(300) NULL,
  `password` VARCHAR(45) NULL,
  `user_type` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `usertype_idx` (`user_type` ASC),
  CONSTRAINT `usertype`
    FOREIGN KEY (`user_type`)
    REFERENCES `user_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination` ;

CREATE TABLE IF NOT EXISTS `destination` (
  `id` INT NOT NULL,
  `name` VARCHAR(300) NULL,
  `link` VARCHAR(300) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trip` ;

CREATE TABLE IF NOT EXISTS `trip` (
  `id` INT NOT NULL,
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
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `return1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `return1` ;

CREATE TABLE IF NOT EXISTS `return1` (
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
DROP TABLE IF EXISTS `user_rating` ;

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
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL,
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

SET SQL_MODE = '';
GRANT USAGE ON *.* TO user9;
 DROP USER user9;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'user9' IDENTIFIED BY 'user9';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'user9';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowbros`;
INSERT INTO `user_type` (`id`, `admin`) VALUES (1, false);
INSERT INTO `user_type` (`id`, `admin`) VALUES (2, false);
INSERT INTO `user_type` (`id`, `admin`) VALUES (3, false);
INSERT INTO `user_type` (`id`, `admin`) VALUES (4, false);
INSERT INTO `user_type` (`id`, `admin`) VALUES (5, true);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowbros`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `picture`, `password`, `user_type`) VALUES (1, 'Charlie', 'Actor', 'charlie@sd.com', '3333333333', 'images/charlie.jpg', 'password', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `picture`, `password`, `user_type`) VALUES (2, 'Travis', 'Way', 'travis@sd.com', '2222222222', 'images/travis.jpg', 'password', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `picture`, `password`, `user_type`) VALUES (3, 'Michael', 'Maldonado', 'michael@sd.com', '7777777777', 'images/mike.jpg', 'password', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `picture`, `password`, `user_type`) VALUES (4, 'Andy', 'BeerFoot', 'Andy@s.com', '010101010101', 'images/andy.jpg', 'passworde', 1);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `picture`, `password`, `user_type`) VALUES (5, 'Admin', 'Admin', 'admin@sd.com', '11111111111', 'images/admin.jpg', 'admin', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `destination`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowbros`;
INSERT INTO `destination` (`id`, `name`, `link`) VALUES (1, 'Copper Mountain', NULL);
INSERT INTO `destination` (`id`, `name`, `link`) VALUES (2, 'Breckenridge', NULL);
INSERT INTO `destination` (`id`, `name`, `link`) VALUES (3, 'Vail Mountain Resort', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowbros`;
INSERT INTO `trip` (`id`, `title`, `number_seats`, `point_of_origin`, `date`, `point_of_return`, `description`, `destination_id`, `owner_id`) VALUES (1, 'Andy\'s Big Trip to ShredTown', 3, 'Moe\'s Bagels', '2017-12-12 06:00:00', 'At the car', 'ShredTown yalllllll', 1, DEFAULT);
INSERT INTO `trip` (`id`, `title`, `number_seats`, `point_of_origin`, `date`, `point_of_return`, `description`, `destination_id`, `owner_id`) VALUES (2, 'Charlie\'s Average sized trip to Shredville', 2, 'Rosenberg\'s Bagels', '2017-12-13 06:00:00', 'Apres-Ski Bar', 'Shredville, guys', 2, DEFAULT);
INSERT INTO `trip` (`id`, `title`, `number_seats`, `point_of_origin`, `date`, `point_of_return`, `description`, `destination_id`, `owner_id`) VALUES (3, 'Travis\' Small trip to ShredCity', 4, 'The Bagel Deli', '2018-01-02 07:00:00', 'The trunk of the car', 'SHREDDDINNNNNGGG', 3, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowbros`;
INSERT INTO `user_trip` (`user_id`, `trip_id`) VALUES (1, 3);
INSERT INTO `user_trip` (`user_id`, `trip_id`) VALUES (5, 2);
INSERT INTO `user_trip` (`user_id`, `trip_id`) VALUES (2, 1);
INSERT INTO `user_trip` (`user_id`, `trip_id`) VALUES (3, 1);
INSERT INTO `user_trip` (`user_id`, `trip_id`) VALUES (4, 1);
INSERT INTO `user_trip` (`user_id`, `trip_id`) VALUES (1, 2);
INSERT INTO `user_trip` (`user_id`, `trip_id`) VALUES (5, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `extra_curr`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowbros`;
INSERT INTO `extra_curr` (`name`, `id`) VALUES ('Dat Sweet Sweet Chronic', 1);
INSERT INTO `extra_curr` (`name`, `id`) VALUES ('Drank', 2);
INSERT INTO `extra_curr` (`name`, `id`) VALUES ('Drunk', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `return1`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowbros`;
INSERT INTO `return1` (`id`, `trip_id`, `return`, `return_time`) VALUES (1, 1, true, '2017-12-12 14:30:00');
INSERT INTO `return1` (`id`, `trip_id`, `return`, `return_time`) VALUES (2, 2, true, '2017-12-13 15:00:00');
INSERT INTO `return1` (`id`, `trip_id`, `return`, `return_time`) VALUES (3, 3, true, '2018-01-12 15:30:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowbros`;
INSERT INTO `user_rating` (`value`, `user_id`, `id`) VALUES (4, 1, 1);
INSERT INTO `user_rating` (`value`, `user_id`, `id`) VALUES (5, 1, 2);
INSERT INTO `user_rating` (`value`, `user_id`, `id`) VALUES (4, 2, 3);
INSERT INTO `user_rating` (`value`, `user_id`, `id`) VALUES (3, 2, 4);
INSERT INTO `user_rating` (`value`, `user_id`, `id`) VALUES (5, 4, 5);
INSERT INTO `user_rating` (`value`, `user_id`, `id`) VALUES (3, 3, 6);
INSERT INTO `user_rating` (`value`, `user_id`, `id`) VALUES (2, 4, 7);
INSERT INTO `user_rating` (`value`, `user_id`, `id`) VALUES (4, 3, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowbros`;
INSERT INTO `activity` (`id`, `name`, `exp`, `user_id`) VALUES (1, 'Skiing', 5, 1);
INSERT INTO `activity` (`id`, `name`, `exp`, `user_id`) VALUES (2, 'Snowboarding', 2, 1);
INSERT INTO `activity` (`id`, `name`, `exp`, `user_id`) VALUES (3, 'Skiing', 1, 3);
INSERT INTO `activity` (`id`, `name`, `exp`, `user_id`) VALUES (4, 'Skiing', 1, 2);
INSERT INTO `activity` (`id`, `name`, `exp`, `user_id`) VALUES (5, 'Skiing', 4, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trip_ec`
-- -----------------------------------------------------
START TRANSACTION;
USE `snowbros`;
INSERT INTO `trip_ec` (`trip_id`, `ec_id`) VALUES (1, 1);
INSERT INTO `trip_ec` (`trip_id`, `ec_id`) VALUES (2, 1);
INSERT INTO `trip_ec` (`trip_id`, `ec_id`) VALUES (3, 1);
INSERT INTO `trip_ec` (`trip_id`, `ec_id`) VALUES (1, 2);
INSERT INTO `trip_ec` (`trip_id`, `ec_id`) VALUES (2, 2);
INSERT INTO `trip_ec` (`trip_id`, `ec_id`) VALUES (3, 2);
INSERT INTO `trip_ec` (`trip_id`, `ec_id`) VALUES (1, 3);
INSERT INTO `trip_ec` (`trip_id`, `ec_id`) VALUES (2, 3);
INSERT INTO `trip_ec` (`trip_id`, `ec_id`) VALUES (3, 3);

COMMIT;

