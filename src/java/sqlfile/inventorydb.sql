DROP SCHEMA IF EXISTS `inventorydb`;
CREATE SCHEMA IF NOT EXISTS `inventorydb` DEFAULT CHARACTER SET latin1;
USE `inventorydb`;

-- -----------------------------------------------------
-- Table `inventorydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventorydb`.`category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`));

-- -----------------------------------------------------
-- Table `inventorydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventorydb`.`role` (
  `role_id` INT(11) NOT NULL,
  `role_name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`role_id`));

-- -----------------------------------------------------
-- Table `inventorydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventorydb`.`user` (
  `email` VARCHAR(40) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `role` INT(11) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_user_role`
    FOREIGN KEY (`role`)
    REFERENCES `inventorydb`.`role` (`role_id`));


-- -----------------------------------------------------
-- Table `inventorydb`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventorydb`.`item` (
  `item_id` INT(11) NOT NULL AUTO_INCREMENT,
  `category` INT(11) NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  `owner` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `fk_items_categories`
    FOREIGN KEY (`category`)
    REFERENCES `inventorydb`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_owner`
    FOREIGN KEY (`owner`)
    REFERENCES `inventorydb`.`user` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `role` VALUES (1, 'system admin');
INSERT INTO `role` VALUES (2, 'regular user');
INSERT INTO `role` VALUES (3, 'company admin');

INSERT INTO `category` (`category_name`) VALUES ('kitchen');
INSERT INTO `category` (`category_name`) VALUES ('bathroom');
INSERT INTO `category` (`category_name`) VALUES ('living room');
INSERT INTO `category` (`category_name`) VALUES ('basement');
INSERT INTO `category` (`category_name`) VALUES ('bedrooom');
INSERT INTO `category` (`category_name`) VALUES ('garage');
INSERT INTO `category` (`category_name`) VALUES ('office');
INSERT INTO `category` (`category_name`) VALUES ('utility room');
INSERT INTO `category` (`category_name`) VALUES ('storage');
INSERT INTO `category` (`category_name`) VALUES ('other');

INSERT INTO `user` (`email`,`active`,`first_name`,`last_name`,`password`,`role`)
	VALUES ('cprg352+admin@gmail.com', true, 'Admin','Admin', 'password', 1);
INSERT INTO `user` (`email`,`active`,`first_name`,`last_name`,`password`,`role`)
	VALUES ('cprg352+admin2@gmail.com', true, 'Admin2','Admin2', 'password', 3);
INSERT INTO `user` (`email`,`active`,`first_name`,`last_name`,`password`,`role`)
	VALUES ('cprg352+anne@gmail.com', true, 'Anne','Annerson', 'password', 2);
INSERT INTO `user` (`email`,`active`,`first_name`,`last_name`,`password`,`role`)
	VALUES ('cprg352+barb@gmail.com', true, 'Barb','Barber', 'password', 2);

INSERT INTO `item` (`category`,`item_name`,`price`,`owner`) VALUES (1, 'blender',29.99,'cprg352+anne@gmail.com');
INSERT INTO `item` (`category`,`item_name`,`price`,`owner`) VALUES (1, 'toaster',19.99,'cprg352+anne@gmail.com');
INSERT INTO `item` (`category`,`item_name`,`price`,`owner`) VALUES (3, 'lamp',5,'cprg352+anne@gmail.com');
INSERT INTO `item` (`category`,`item_name`,`price`,`owner`) VALUES (6, 'winter tires',200,'cprg352+anne@gmail.com');
INSERT INTO `item` (`category`,`item_name`,`price`,`owner`) VALUES (5, 'dresser',50,'cprg352+anne@gmail.com');
