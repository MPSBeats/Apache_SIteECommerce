-- MySQL Script generated by MySQL Workbench
-- 10/17/18 16:33:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema oshop
-- -----------------------------------------------------
USE ecom;
-- -----------------------------------------------------
-- Table `brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brand` ;

CREATE TABLE IF NOT EXISTS `brand` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT 'Le nom de la marque',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création de la marque',
  `updated_at` TIMESTAMP NULL COMMENT 'La date de la dernière mise à jour de la marque',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT 'Le nom de la catégorie',
  `subtitle` VARCHAR(64) NULL,
  `picture` VARCHAR(128) NULL COMMENT 'L\'URL de l\'image de la catégorie (utilisée en home, par exemple)',
  `home_order` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'L\'ordre d\'affichage de la catégorie sur la home (0=pas affichée en home)',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création de la catégorie',
  `updated_at` TIMESTAMP NULL COMMENT 'La date de la dernière mise à jour de la catégorie',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type` ;

CREATE TABLE IF NOT EXISTS `type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT 'Le nom du type',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création de la catégorie',
  `updated_at` TIMESTAMP NULL COMMENT 'La date de la dernière mise à jour de la catégorie',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT 'Le nom du produit',
  `description` TEXT NULL COMMENT 'La description du produit',
  `picture` VARCHAR(128) NULL COMMENT 'L\'URL de l\'image du produit',
  `price` DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT 'Le prix du produit',
  `rate` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'L\'avis sur le produit, de 1 à 5',
  `status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Le statut du produit (0=non renseignée, 1=dispo, 2=pas dispo)',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création du produit',
  `updated_at` TIMESTAMP NULL COMMENT 'La date de la dernière mise à jour du produit',
  `brand_id` INT UNSIGNED NOT NULL,
  `category_id` INT UNSIGNED NULL,
  `type_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_brand_idx` (`brand_id` ASC),
  INDEX `fk_product_category1_idx` (`category_id` ASC),
  INDEX `fk_product_type1_idx` (`type_id` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `brand`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'TeeStyle', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'Shirtify', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'TeeTrend', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'TopThreads', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'oTeez', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'TeeVibes', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'PHPshirts', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'ShirtHub', '2018-10-17 9:00:00', NULL);


COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (1, 'Relax', 'Pour chiller en style', 'public/img/categ1.jpeg', 4, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (2, 'Professionnel', 'Un look au top', 'public/img/categ2.jpeg', 2, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (3, 'Élégance', 'T-shirts chics et sobres', 'public/img/categ3.jpeg', 5, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (4, 'Casual', 'Paré pour la sortie', 'public/img/categ4.jpeg', 3, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (5, 'Rétro', 'Adoptez le vintage', 'public/img/categ5.jpeg', 1, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (6, 'Plage et détente', 'T-shirts légers et stylés', 'public/img/categ6.jpeg', 0, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (7, 'Sportif', 'Bougez avec confort', 'public/img/categ7.jpeg', 0, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (8, 'Gaming', 'Pour les geeks', 'public/img/categ8.jpeg', 0, '2018-10-17 8:00:00', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `type`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'T-shirts casual', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'T-shirts sportifs', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'Débardeurs', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'T-shirts oversize', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'T-shirts élégants', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'T-shirts à motifs', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'T-shirts basiques', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'T-shirts graphiques', '2018-10-17 10:00:00', NULL);


COMMIT;


-- -----------------------------------------------------
-- Data for table `product`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (1, "Tee-shirt Kissing", "Tee-shirt inspiré de l'amour et de la passion. Parfait pour afficher votre côté romantique avec style et confort.", "public/img/1-kiss.jpg", 40, 4, 1, "2018-10-17 11:00:00", NULL, 2, 1, 7);
INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (2, "Tee-shirt Pink Lady", "Un tee-shirt féminin, élégant et lumineux, pour celles qui veulent apporter une touche de douceur et de sophistication à leur tenue.", "public/img/2-rose.jpg", 20, 2, 1, "2018-10-17 11:00:00", NULL, 4, 6, 2);
INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (3, "Tee-shirt Panda", "Tee-shirt amusant avec un imprimé panda, idéal pour les amoureux des animaux. Confortable et original, il ajoute une touche de fun à vos journées.", "public/img/3-panda.jpg", 50, 5, 1, "2018-10-17 11:00:00", NULL, 5, 1, 7);
INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (4, "Tee-shirt Zombie", "Tee-shirt avec un design de zombie, parfait pour ceux qui aiment les univers fantastiques et l'horreur. Portez-le pour un look unique et décalé.", "public/img/4-zombie.jpg", 40, 2, 1, "2018-10-17 11:00:00", NULL, 7, 1, 7);
INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (5, "Tee-shirt Minion", "Un tee-shirt drôle et décontracté avec un imprimé de Minion. Parfait pour les fans de la culture pop et les moments de fun entre amis.", "public/img/5-minion.jpg", 44, 3, 1, "2018-10-17 11:00:00", NULL, 6, 1, 7);
INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (6, "Tee-shirt Père Noël", "Un tee-shirt amusant pour les fêtes de fin d'année. Affichez votre esprit de Noël avec ce design inspiré du Père Noël pour célébrer la magie des fêtes.", "public/img/6-pernoel.jpg", 36, 2, 2, "2018-10-17 11:00:00", NULL, 8, 1, 7);
INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (7, "Tee-shirt Sleepy", "Un tee-shirt confortable et décontracté, parfait pour se détendre après une longue journée. Idéal pour les moments de repos et de relaxation.", "public/img/7-sleepy.jpg", 40, 3, 1, "2018-10-17 11:00:00", NULL, 4, 1, 7);
INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (8, "Tee-shirt Bear", "Un tee-shirt à l'impression d'un ours majestueux. Idéal pour ceux qui aiment afficher leur côté sauvage et naturel avec style.", "public/img/8-bear.jpg", 46, 4, 1, "2018-10-17 11:00:00", NULL, 5, 1, 7);



COMMIT;
