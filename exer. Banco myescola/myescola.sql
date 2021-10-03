-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema escola
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `myESCOLA` ;

-- -----------------------------------------------------
-- Schema escola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `myESCOLA` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `myESCOLA` ;

-- -----------------------------------------------------
-- Table `myESCOLA`.`estcivil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myESCOLA`.`estcivil` ;

CREATE TABLE IF NOT EXISTS `myESCOLA`.`estcivil` (
  `idestcivil` INT NOT NULL,
  `estcivil` VARCHAR(50) NULL,
  PRIMARY KEY (`idestcivil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myESCOLA`.`sexo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myESCOLA`.`sexo` ;

CREATE TABLE IF NOT EXISTS `myESCOLA`.`sexo` (
  `idsexo` INT NOT NULL,
  `sexo` VARCHAR(50) NULL,
  PRIMARY KEY (`idsexo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myESCOLA`.`pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myESCOLA`.`pessoa` ;

CREATE TABLE IF NOT EXISTS `myESCOLA`.`pessoa` (
  `idpessoa` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `datanasc` DATE NULL,
  `email` VARCHAR(45) NULL,
  `idestcivil` INT NOT NULL,
  `idsexo` INT NOT NULL,
  PRIMARY KEY (`idpessoa`, `idestcivil`, `idsexo`),
  INDEX `fk_pessoa_estcivil1_idx` (`idestcivil` ASC),
  INDEX `fk_pessoa_sexo1_idx` (`idsexo` ASC),
  CONSTRAINT `fk_pessoa_estcivil1`
    FOREIGN KEY (`idestcivil`)
    REFERENCES `myESCOLA`.`estcivil` (`idestcivil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_sexo1`
    FOREIGN KEY (`idsexo`)
    REFERENCES `myESCOLA`.`sexo` (`idsexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myESCOLA`.`telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myESCOLA`.`telefone` ;

CREATE TABLE IF NOT EXISTS `myESCOLA`.`telefone` (
  `idpessoa` INT NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idpessoa`, `telefone`),
  CONSTRAINT `fk_telefone_pessoa1`
    FOREIGN KEY (`idpessoa`)
    REFERENCES `myESCOLA`.`pessoa` (`idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myESCOLA`.`curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myESCOLA`.`curso` ;

CREATE TABLE IF NOT EXISTS `myESCOLA`.`curso` (
  `idcurso` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idcurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myESCOLA`.`matricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myESCOLA`.`matricula` ;

CREATE TABLE IF NOT EXISTS `myESCOLA`.`matricula` (
  `idcurso` INT NOT NULL,
  `idpessoa` INT NOT NULL,
  `datamatricula` DATE NULL,
  PRIMARY KEY (`idcurso`, `idpessoa`),
  INDEX `fk_matricula_pessoa1_idx` (`idpessoa` ASC),
  CONSTRAINT `fk_matricula_curso1`
    FOREIGN KEY (`idcurso`)
    REFERENCES `myESCOLA`.`curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_pessoa1`
    FOREIGN KEY (`idpessoa`)
    REFERENCES `myESCOLA`.`pessoa` (`idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myESCOLA`.`disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myESCOLA`.`disciplina` ;

CREATE TABLE IF NOT EXISTS `myESCOLA`.`disciplina` (
  `iddisciplina` VARCHAR(3) NOT NULL,
  `disciplina` VARCHAR(30) NULL,
  PRIMARY KEY (`iddisciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myESCOLA`.`boletim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myESCOLA`.`boletim` ;

CREATE TABLE IF NOT EXISTS `myESCOLA`.`boletim` (
  `ano_semestre` VARCHAR(6) NOT NULL,
  `idpessoa` INT NOT NULL,
  `iddisciplina` VARCHAR(3) NOT NULL,
  `nota` INT NULL,
  `frequencia` INT NULL,
  PRIMARY KEY (`ano_semestre`, `idpessoa`, `iddisciplina`),
  INDEX `fk_boletim_disciplina1_idx` (`iddisciplina` ASC),
  CONSTRAINT `fk_boletim_disciplina1`
    FOREIGN KEY (`iddisciplina`)
    REFERENCES `myESCOLA`.`disciplina` (`iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletim_pessoa1`
    FOREIGN KEY (`idpessoa`)
    REFERENCES `myESCOLA`.`pessoa` (`idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `myESCOLA`.`estcivil`
-- -----------------------------------------------------
START TRANSACTION;
USE `myESCOLA`;
INSERT INTO `myESCOLA`.`estcivil` (`idestcivil`, `estcivil`) VALUES (1, 'solteiro');
INSERT INTO `myESCOLA`.`estcivil` (`idestcivil`, `estcivil`) VALUES (2, 'casado');
INSERT INTO `myESCOLA`.`estcivil` (`idestcivil`, `estcivil`) VALUES (3, 'viuvo');
INSERT INTO `myESCOLA`.`estcivil` (`idestcivil`, `estcivil`) VALUES (4, 'separado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `myESCOLA`.`sexo`
-- -----------------------------------------------------
START TRANSACTION;
USE `myESCOLA`;
INSERT INTO `myESCOLA`.`sexo` (`idsexo`, `sexo`) VALUES (1, 'masculino');
INSERT INTO `myESCOLA`.`sexo` (`idsexo`, `sexo`) VALUES (2, 'feminino');
INSERT INTO `myESCOLA`.`sexo` (`idsexo`, `sexo`) VALUES (3, 'intersexo');
INSERT INTO `myESCOLA`.`sexo` (`idsexo`, `sexo`) VALUES (4, 'altersexo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `myESCOLA`.`pessoa`
-- -----------------------------------------------------
START TRANSACTION;
USE `myESCOLA`;
INSERT INTO `myESCOLA`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `email`, `idestcivil`, `idsexo`) VALUES (1, 'Ana', '1991-01-01', 'email1', 1, 2);
INSERT INTO `myESCOLA`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `email`, `idestcivil`, `idsexo`) VALUES (2, 'João', '1992-02-02', 'email2', 2, 1);
INSERT INTO `myESCOLA`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `email`, `idestcivil`, `idsexo`) VALUES (3, 'Maria', '1993-03-03', 'email3', 3, 2);
INSERT INTO `myESCOLA`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `email`, `idestcivil`, `idsexo`) VALUES (4, 'Antonio', '1994-04-04', 'email4', 4, 1);
INSERT INTO `myESCOLA`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `email`, `idestcivil`, `idsexo`) VALUES (5, 'Luisa', '1995-05-05', 'email5', 3, 2);
INSERT INTO `myESCOLA`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `email`, `idestcivil`, `idsexo`) VALUES (6, 'Felipe', '1994-06-06', 'email6', 2, 1);
INSERT INTO `myESCOLA`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `email`, `idestcivil`, `idsexo`) VALUES (7, 'Renata', '1993-07-07', 'email7', 1, 2);
INSERT INTO `myESCOLA`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `email`, `idestcivil`, `idsexo`) VALUES (8, 'Marco', '1992-08-08', 'email8', 1, 1);
INSERT INTO `myESCOLA`.`pessoa` (`idpessoa`, `nome`, `datanasc`, `email`, `idestcivil`, `idsexo`) VALUES (9, 'Paula', '1991-09-09', 'email9', 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `myESCOLA`.`telefone`
-- -----------------------------------------------------
START TRANSACTION;
USE `myESCOLA`;
INSERT INTO `myESCOLA`.`telefone` (`idpessoa`, `telefone`) VALUES (1, '1111-1111');
INSERT INTO `myESCOLA`.`telefone` (`idpessoa`, `telefone`) VALUES (2, '2222-2221');
INSERT INTO `myESCOLA`.`telefone` (`idpessoa`, `telefone`) VALUES (2, '2222-2222');
INSERT INTO `myESCOLA`.`telefone` (`idpessoa`, `telefone`) VALUES (4, '4444-4441');
INSERT INTO `myESCOLA`.`telefone` (`idpessoa`, `telefone`) VALUES (4, '4444-4442');
INSERT INTO `myESCOLA`.`telefone` (`idpessoa`, `telefone`) VALUES (4, '4444-4443');
INSERT INTO `myESCOLA`.`telefone` (`idpessoa`, `telefone`) VALUES (4, '4444-4444');

COMMIT;


-- -----------------------------------------------------
-- Data for table `myESCOLA`.`curso`
-- -----------------------------------------------------
START TRANSACTION;
USE `myESCOLA`;
INSERT INTO `myESCOLA`.`curso` (`idcurso`, `nome`) VALUES (1, 'CT Informática');
INSERT INTO `myESCOLA`.`curso` (`idcurso`, `nome`) VALUES (2, 'CT Eletrônica');
INSERT INTO `myESCOLA`.`curso` (`idcurso`, `nome`) VALUES (3, 'CT Eletrotécnica');
INSERT INTO `myESCOLA`.`curso` (`idcurso`, `nome`) VALUES (4, 'CT Edificações');
INSERT INTO `myESCOLA`.`curso` (`idcurso`, `nome`) VALUES (5, 'CT Quimica');

COMMIT;


-- -----------------------------------------------------
-- Data for table `myESCOLA`.`matricula`
-- -----------------------------------------------------
START TRANSACTION;
USE `myESCOLA`;
INSERT INTO `myESCOLA`.`matricula` (`idcurso`, `idpessoa`, `datamatricula`) VALUES (1, 1, '2018/01/01');
INSERT INTO `myESCOLA`.`matricula` (`idcurso`, `idpessoa`, `datamatricula`) VALUES (1, 2, '2018/01/01');
INSERT INTO `myESCOLA`.`matricula` (`idcurso`, `idpessoa`, `datamatricula`) VALUES (1, 3, '2018/01/01');
INSERT INTO `myESCOLA`.`matricula` (`idcurso`, `idpessoa`, `datamatricula`) VALUES (2, 4, '2019/01/01');
INSERT INTO `myESCOLA`.`matricula` (`idcurso`, `idpessoa`, `datamatricula`) VALUES (2, 5, '2019/01/01');
INSERT INTO `myESCOLA`.`matricula` (`idcurso`, `idpessoa`, `datamatricula`) VALUES (3, 6, '2019/01/01');
INSERT INTO `myESCOLA`.`matricula` (`idcurso`, `idpessoa`, `datamatricula`) VALUES (3, 7, '2019/01/01');
INSERT INTO `myESCOLA`.`matricula` (`idcurso`, `idpessoa`, `datamatricula`) VALUES (3, 8, '2019/01/01');
INSERT INTO `myESCOLA`.`matricula` (`idcurso`, `idpessoa`, `datamatricula`) VALUES (4, 9, '2019/01/01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `myESCOLA`.`disciplina`
-- -----------------------------------------------------
START TRANSACTION;
USE `myESCOLA`;
INSERT INTO `myESCOLA`.`disciplina` (`iddisciplina`, `disciplina`) VALUES ('AST', 'Analise de Sistemas');
INSERT INTO `myESCOLA`.`disciplina` (`iddisciplina`, `disciplina`) VALUES ('BAD', 'Banco de Dados');
INSERT INTO `myESCOLA`.`disciplina` (`iddisciplina`, `disciplina`) VALUES ('SOP', 'Sistemas Operacionais');
INSERT INTO `myESCOLA`.`disciplina` (`iddisciplina`, `disciplina`) VALUES ('PRG', 'Programação Básica');

COMMIT;


-- -----------------------------------------------------
-- Data for table `myESCOLA`.`boletim`
-- -----------------------------------------------------
START TRANSACTION;
USE `myESCOLA`;
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 1, 'AST', 9, 90);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 1, 'BAD', 10, 75);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 1, 'SOP', 8, 50);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 1, 'PRG', 5, 80);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 2, 'AST', 7, 70);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 2, 'BAD', 10, 50);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 2, 'SOP', 8, 75);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 2, 'PRG', 7, 80);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 3, 'AST', 9, 80);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 3, 'BAD', 8, 70);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 3, 'SOP', 7, 60);
INSERT INTO `myESCOLA`.`boletim` (`ano_semestre`, `idpessoa`, `iddisciplina`, `nota`, `frequencia`) VALUES ('2019-1', 3, 'PRG', 6, 50);

COMMIT;

select * from escola;
