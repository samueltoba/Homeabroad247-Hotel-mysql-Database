-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Homeabroad247 Hotel
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Homeabroad247 Hotel` ;

-- -----------------------------------------------------
-- Schema Homeabroad247 Hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Homeabroad247 Hotel` DEFAULT CHARACTER SET utf8 ;
USE `Homeabroad247 Hotel` ;

-- -----------------------------------------------------
-- Table `Homeabroad247 Hotel`.`guest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Homeabroad247 Hotel`.`guest` ;

CREATE TABLE IF NOT EXISTS `Homeabroad247 Hotel`.`guest` (
  `guest_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`guest_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Homeabroad247 Hotel`.`booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Homeabroad247 Hotel`.`booking` ;

CREATE TABLE IF NOT EXISTS `Homeabroad247 Hotel`.`booking` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `check_in_date` DATE NOT NULL,
  `check_out_date` DATE NOT NULL,
  `num_adults` INT ZEROFILL NULL,
  `num_children` INT ZEROFILL NULL,
  `guest_guest_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`, `guest_guest_id`))
ENGINE = InnoDB;

CREATE INDEX `fk_booking_Guest_idx` ON `Homeabroad247 Hotel`.`booking` (`guest_guest_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Homeabroad247 Hotel`.`floor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Homeabroad247 Hotel`.`floor` ;

CREATE TABLE IF NOT EXISTS `Homeabroad247 Hotel`.`floor` (
  `floor_no` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`floor_no`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `floor_no_UNIQUE` ON `Homeabroad247 Hotel`.`floor` (`floor_no` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Homeabroad247 Hotel`.`room_class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Homeabroad247 Hotel`.`room_class` ;

CREATE TABLE IF NOT EXISTS `Homeabroad247 Hotel`.`room_class` (
  `room_class_id` INT NOT NULL,
  PRIMARY KEY (`room_class_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Homeabroad247 Hotel`.`room_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Homeabroad247 Hotel`.`room_status` ;

CREATE TABLE IF NOT EXISTS `Homeabroad247 Hotel`.`room_status` (
  `room_status_id` INT NOT NULL AUTO_INCREMENT,
  `status_name` VARCHAR(45) NULL,
  PRIMARY KEY (`room_status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Homeabroad247 Hotel`.`room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Homeabroad247 Hotel`.`room` ;

CREATE TABLE IF NOT EXISTS `Homeabroad247 Hotel`.`room` (
  `room_id` INT NOT NULL AUTO_INCREMENT,
  `room_no` VARCHAR(45) NULL,
  `Floor_floor_no` INT NOT NULL,
  `room_class_room_class_id` INT NOT NULL,
  `room_status_room_status_id` INT NOT NULL,
  PRIMARY KEY (`room_id`, `Floor_floor_no`, `room_class_room_class_id`, `room_status_room_status_id`))
ENGINE = InnoDB;

CREATE INDEX `fk_room_Floor1_idx` ON `Homeabroad247 Hotel`.`room` (`Floor_floor_no` ASC) VISIBLE;

CREATE INDEX `fk_room_room_class1_idx` ON `Homeabroad247 Hotel`.`room` (`room_class_room_class_id` ASC) VISIBLE;

CREATE INDEX `fk_room_room_status1_idx` ON `Homeabroad247 Hotel`.`room` (`room_status_room_status_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Homeabroad247 Hotel`.`room_has_booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Homeabroad247 Hotel`.`room_has_booking` ;

CREATE TABLE IF NOT EXISTS `Homeabroad247 Hotel`.`room_has_booking` (
  `room_room_id` INT NOT NULL,
  `booking_booking_id` INT NOT NULL,
  PRIMARY KEY (`room_room_id`, `booking_booking_id`))
ENGINE = InnoDB;

CREATE INDEX `fk_room_has_booking_booking1_idx` ON `Homeabroad247 Hotel`.`room_has_booking` (`booking_booking_id` ASC) VISIBLE;

CREATE INDEX `fk_room_has_booking_room1_idx` ON `Homeabroad247 Hotel`.`room_has_booking` (`room_room_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Homeabroad247 Hotel`.`feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Homeabroad247 Hotel`.`feature` ;

CREATE TABLE IF NOT EXISTS `Homeabroad247 Hotel`.`feature` (
  `room_feature_id` INT NOT NULL AUTO_INCREMENT,
  `base_price` DECIMAL NULL,
  `booking_amount` DECIMAL NULL,
  `feature_name` VARCHAR(45) NULL,
  `description` TEXT(150) NULL,
  PRIMARY KEY (`room_feature_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Homeabroad247 Hotel`.`payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Homeabroad247 Hotel`.`payment` ;

CREATE TABLE IF NOT EXISTS `Homeabroad247 Hotel`.`payment` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `payment_status` VARCHAR(45) NULL,
  `booking_booking_id` INT NOT NULL,
  `payment_method` VARCHAR(45) NULL,
  `payment_date` DATE NULL,
  PRIMARY KEY (`payment_id`))
ENGINE = InnoDB;

CREATE INDEX `fk_payment_booking1_idx` ON `Homeabroad247 Hotel`.`payment` (`booking_booking_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Homeabroad247 Hotel`.`feature_has_room_class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Homeabroad247 Hotel`.`feature_has_room_class` ;

CREATE TABLE IF NOT EXISTS `Homeabroad247 Hotel`.`feature_has_room_class` (
  `feature_room_feature_id` INT NOT NULL,
  `room_class_room_class_id` INT NOT NULL,
  PRIMARY KEY (`feature_room_feature_id`, `room_class_room_class_id`))
ENGINE = InnoDB;

CREATE INDEX `fk_feature_has_room_class_room_class1_idx` ON `Homeabroad247 Hotel`.`feature_has_room_class` (`room_class_room_class_id` ASC) VISIBLE;

CREATE INDEX `fk_feature_has_room_class_feature1_idx` ON `Homeabroad247 Hotel`.`feature_has_room_class` (`feature_room_feature_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
