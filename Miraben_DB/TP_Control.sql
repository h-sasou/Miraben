Drop Table If Exists TP_Control;
Create Table
	TP_Control(
		LoginControl			boolean not null primary key DEFAULT '0'
        );
        

drop procedure AdministratorLogin;
DELIMITER //
CREATE PROCEDURE AdministratorLogin()
BEGIN
	UPDATE  TP_Control
		SET LoginControl = 1 WHERE LoginControl = 0;
END;
//
DELIMITER ;

drop procedure AdministratorLogout;
DELIMITER //
CREATE PROCEDURE AdministratorLogout()
BEGIN
UPDATE  TP_Control
		SET LoginControl = 0 WHERE LoginControl = 1;
END;
//
DELIMITER ;

/*

call AdministratorLogin();
呼び出したらloginControlが1になるよ
call AdministratorLogout();
呼び出したらlogoutControlが0になるよ
*/