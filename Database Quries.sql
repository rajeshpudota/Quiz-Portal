Table Creation Syntax

		ROLES

		USER
		
		LOGIN_INFO

		QUIZ_DETAILS

		USER_QUIZ_DETAILS

		QUIZ_QUESTIONS1

		
		
ROLES:
		CREATE TABLE IF NOT EXISTS `test`.`ROLES` (
		`ROLE_ID` VARCHAR(10) NOT NULL ,
		`ROLE_NAME` VARCHAR(10) NULL ,
		`ROLE_DESCRIPTION` VARCHAR(45) NULL ,
		PRIMARY KEY (`ROLE_ID`) )
		ENGINE = InnoDB
		DEFAULT CHARACTER SET = utf8
		COLLATE = utf8_bin;
			

USER :
		CREATE TABLE IF NOT EXISTS `test`.`USER` (
		`USER_EMAIL_ID` VARCHAR(70) NOT NULL ,
		`ROLE_ID` INT ,
		`ACCESS_ENABLE_DT` DATE , 
		`ACCESS_DISABLE_DT` DATE ,
		PRIMARY KEY (`USER_EMAIL_ID`))
		ENGINE = InnoDB
		DEFAULT CHARACTER SET = utf8
		COLLATE = utf8_bin;
	

LOGIN_INFO:
		CREATE TABLE IF NOT EXISTS `test`.`LOGIN_INFO` (
		 `ID` INT AUTO_INCREMENT PRIMARY KEY,
		 `USER_EMAIL_ID` VARCHAR(70) ,
		 `LOGIN_TIMESTAMP` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
		 `LOGOUT_TIMESTAMP` TIMESTAMP NULL ,
		 `ROLE_ID` INT ,
		CONSTRAINT `FKLOGIN_INFO_USER_EMAIL_ID`
		FOREIGN KEY `FKLOGIN_INFO_USER_EMAIL_ID` (USER_EMAIL_ID)
		REFERENCES `test`.`USER` (USER_EMAIL_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE )
		ENGINE = InnoDB
		DEFAULT CHARACTER SET = utf8
		COLLATE = utf8_bin;
		
		
QUIZ_DETAILS:
		CREATE TABLE IF NOT EXISTS `test`.`QUIZ_DETAILS` (
		 `QUIZ_ID` INT AUTO_INCREMENT PRIMARY KEY ,
		 `SET_BY_USER_EMAIL_ID` VARCHAR(70) NOT NULL ,
		 `QUIZ_NAME` VARCHAR(75) NOT NULL ,
		 `AVAILABLE_FROM_DT` DATE ,
		 `AVAILABLE_TO_DT` DATE ,
		 `CURRENT_STATUS` CHAR(1) ,
		 `DURATION` TINYINT ,
		 
		CONSTRAINT `FKQUIZ_SET_BY_USER_EMAIL_ID`
		FOREIGN KEY `FKQUIZ_SET_BY_USER_EMAIL_ID` (`SET_BY_USER_EMAIL_ID`)
		REFERENCES `test`.`USER` (`USER_EMAIL_ID`)
		ON DELETE CASCADE
		ON UPDATE CASCADE )
		ENGINE = InnoDB
		DEFAULT CHARACTER SET = utf8
		COLLATE = utf8_bin;
		
		
USER_QUIZ_DETAILS:
		CREATE TABLE IF NOT EXISTS `test`.`USER_QUIZ_DETAILS` (
		`USER_EMAIL_ID` VARCHAR(70)  ,
		`QUIZ_ID` INT NOT NULL ,
		`QUIZ_NAME` VARCHAR(75) NOT NULL ,
		`QUIZ_TAKEN_DT` DATE ,
		`ANSWER_KEYS` VARCHAR(100) ,
		`STATUS` CHAR(1) ,
		`QUIZ_SCORE` VARCHAR(10) ,
		PRIMARY KEY (`USER_EMAIL_ID`,`QUIZ_ID`) ,
		CONSTRAINT `FKUSER_QUIZ_DETAILS_USER_EMAIL_ID`
		FOREIGN KEY `FKUSER_QUIZ_DETAILS_USER_EMAIL_ID` (USER_EMAIL_ID)
		REFERENCES `test`.`USER` (USER_EMAIL_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION ,
		
		CONSTRAINT FKUSER_QUIZ_DETAILS_QUIZ_ID
		FOREIGN KEY FKUSER_QUIZ_DETAILS_QUIZ_ID (QUIZ_ID)
		REFERENCES test.QUIZ_DETAILS (QUIZ_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE )
		ENGINE = InnoDB
		DEFAULT CHARACTER SET = utf8
		COLLATE = utf8_bin;

		
QUIZ_QUESTIONS1:
		CREATE TABLE IF NOT EXISTS `test`.`QUIZ_QUESTIONS1` (
		`QUESTION_ID` INT AUTO_INCREMENT PRIMARY KEY ,
		`QUIZ_ID` INT NOT NULL ,
		`QUESTION_TEXT` VARCHAR(300) NOT NULL,
		`OPTION1` VARCHAR(150) NOT NULL ,
		`OPTION2` VARCHAR(150) NOT NULL ,
		`OPTION3` VARCHAR(150) NOT NULL ,
		`OPTION4` VARCHAR(150) NOT NULL ,
		`ANSWER_KEY` VARCHAR(1) NOT NULL ,
		CONSTRAINT FKQUIZ_QUESTIONS1_QUIZ_ID
		FOREIGN KEY FKQUIZ_QUESTIONS1_QUIZ_ID (QUIZ_ID)
		REFERENCES test.QUIZ_DETAILS (QUIZ_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE )
		ENGINE = InnoDB
		DEFAULT CHARACTER SET = utf8
		COLLATE = utf8_bin;