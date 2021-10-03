-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema myMUNDO
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `myMUNDO` ;

-- -----------------------------------------------------
-- Schema myMUNDO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `myMUNDO` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `myMUNDO` ;

-- -----------------------------------------------------
-- Table `myMUNDO`.`estcivil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myMUNDO`.`estcivil` ;

CREATE TABLE IF NOT EXISTS `myMUNDO`.`estcivil` (
  `idestcivil` INT NOT NULL,
  `estcivil` VARCHAR(20) NULL,
  PRIMARY KEY (`idestcivil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myMUNDO`.`sexo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myMUNDO`.`sexo` ;

CREATE TABLE IF NOT EXISTS `myMUNDO`.`sexo` (
  `idsexo` INT NOT NULL,
  `sexo` VARCHAR(20) NULL,
  PRIMARY KEY (`idsexo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myMUNDO`.`pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myMUNDO`.`pessoa` ;

CREATE TABLE IF NOT EXISTS `myMUNDO`.`pessoa` (
  `idpessoa` INT NOT NULL,
  `nome` VARCHAR(50) NULL,
  `datanasc` DATE NULL,
  `idsexo` INT NOT NULL,
  `idestcivil` INT NOT NULL,
  `dependente_de` INT NULL,
  PRIMARY KEY (`idpessoa`, `idestcivil`, `idsexo`),
  INDEX `fk_pessoa_estcivil_idx` (`idestcivil` ASC),
  INDEX `fk_pessoa_sexo1_idx` (`idsexo` ASC),
  INDEX `fk_pessoa_pessoa1_idx` (`dependente_de` ASC),
  CONSTRAINT `fk_pessoa_estcivil`
    FOREIGN KEY (`idestcivil`)
    REFERENCES `myMUNDO`.`estcivil` (`idestcivil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_sexo1`
    FOREIGN KEY (`idsexo`)
    REFERENCES `myMUNDO`.`sexo` (`idsexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_pessoa1`
    FOREIGN KEY (`dependente_de`)
    REFERENCES `myMUNDO`.`pessoa` (`idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myMUNDO`.`telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myMUNDO`.`telefone` ;

CREATE TABLE IF NOT EXISTS `myMUNDO`.`telefone` (
  `idpessoa` INT NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idpessoa`, `telefone`),
  CONSTRAINT `fk_telefone_pessoa1`
    FOREIGN KEY (`idpessoa`)
    REFERENCES `myMUNDO`.`pessoa` (`idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myMUNDO`.`amizade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myMUNDO`.`amizade` ;

CREATE TABLE IF NOT EXISTS `myMUNDO`.`amizade` (
  `eu` INT NOT NULL,
  `sou_amigo` INT NOT NULL,
  PRIMARY KEY (`eu`, `sou_amigo`),
  INDEX `fk_amizade_pessoa2_idx` (`sou_amigo` ASC),
  CONSTRAINT `fk_amizade_pessoa1`
    FOREIGN KEY (`eu`)
    REFERENCES `myMUNDO`.`pessoa` (`idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_amizade_pessoa2`
    FOREIGN KEY (`sou_amigo`)
    REFERENCES `myMUNDO`.`pessoa` (`idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `myMUNDO`.`estcivil`
-- -----------------------------------------------------
START TRANSACTION;
USE `myMUNDO`;
INSERT INTO `myMUNDO`.`estcivil` (`idestcivil`, `estcivil`) VALUES (1, 'solteiro(a)');
INSERT INTO `myMUNDO`.`estcivil` (`idestcivil`, `estcivil`) VALUES (2, 'casado(a)');
INSERT INTO `myMUNDO`.`estcivil` (`idestcivil`, `estcivil`) VALUES (3, 'viuvo(a)');
INSERT INTO `myMUNDO`.`estcivil` (`idestcivil`, `estcivil`) VALUES (4, 'separado(a)');

COMMIT;


-- -----------------------------------------------------
-- Data for table `myMUNDO`.`sexo`
-- -----------------------------------------------------
START TRANSACTION;
USE `myMUNDO`;
INSERT INTO `myMUNDO`.`sexo` (`idsexo`, `sexo`) VALUES (1, 'masculino');
INSERT INTO `myMUNDO`.`sexo` (`idsexo`, `sexo`) VALUES (2, 'feminino');
INSERT INTO `myMUNDO`.`sexo` (`idsexo`, `sexo`) VALUES (3, 'intersexo');
INSERT INTO `myMUNDO`.`sexo` (`idsexo`, `sexo`) VALUES (4, 'altersexo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `myMUNDO`.`pessoa`
-- -----------------------------------------------------
START TRANSACTION;
USE `myMUNDO`;
INSERT INTO `myMUNDO`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `idsexo`, `idestcivil`, `dependente_de`) VALUES (1, 'Marco', '1960-01-01', 1, 2, NULL);
INSERT INTO `myMUNDO`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `idsexo`, `idestcivil`, `dependente_de`) VALUES (2, 'Ana', '1992-02-01', 2, 2, 1);
INSERT INTO `myMUNDO`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `idsexo`, `idestcivil`, `dependente_de`) VALUES (3, 'Aldo', '1955-03-01', 1, 2, NULL);
INSERT INTO `myMUNDO`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `idsexo`, `idestcivil`, `dependente_de`) VALUES (4, 'Cleusa', '2004-04-01', 2, 1, NULL);
INSERT INTO `myMUNDO`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `idsexo`, `idestcivil`, `dependente_de`) VALUES (5, 'Marcelo', '1983-05-01', 1, 2, 3);
INSERT INTO `myMUNDO`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `idsexo`, `idestcivil`, `dependente_de`) VALUES (6, 'Paula', '1984-06-01', 2, 2, 3);
INSERT INTO `myMUNDO`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `idsexo`, `idestcivil`, `dependente_de`) VALUES (7, 'Julio', '1985-07-01', 1, 2, 3);
INSERT INTO `myMUNDO`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `idsexo`, `idestcivil`, `dependente_de`) VALUES (8, 'Renato', '2000-08-01', 1, 1, 1);
INSERT INTO `myMUNDO`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `idsexo`, `idestcivil`, `dependente_de`) VALUES (9, 'Mariana', '1994-09-01', 2, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `myMUNDO`.`telefone`
-- -----------------------------------------------------
START TRANSACTION;
USE `myMUNDO`;
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (1, '(48) 99999-1111');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (2, '(48) 99999-2221');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (2, '(48) 99999-2222');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (3, '(48) 99999-3331');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (3, '(48) 99999-3332');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (3, '(48) 99999-3333');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (4, '(48) 99999-4441');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (5, '(48) 99999-5551');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (6, '(48) 99999-6661');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (7, '(48) 99999-7771');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (8, '(48) 99999-8881');
INSERT INTO `myMUNDO`.`telefone` (`idpessoa`, `telefone`) VALUES (9, '(48) 99999-9991');

COMMIT;


-- -----------------------------------------------------
-- Data for table `myMUNDO`.`amizade`
-- -----------------------------------------------------
START TRANSACTION;
USE `myMUNDO`;
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (1, 2);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (1, 3);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (1, 5);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (1, 6);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (1, 7);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (1, 9);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (2, 9);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (2, 5);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (2, 6);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (2, 7);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (9, 5);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (9, 6);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (9, 7);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (4, 2);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (4, 6);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (4, 8);
INSERT INTO `myMUNDO`.`amizade` (`eu`, `sou_amigo`) VALUES (4, 9);

COMMIT;
