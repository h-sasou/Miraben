Drop Table If Exists TE_User_Login;

Create Table
	TE_User_Login(
		UserID					varchar(20) not null PRIMARY KEY
        ,LoginTime				datetime 
        ,LogoutTime				datetime
        );
        
        
drop procedure UserLogin;
DELIMITER //
CREATE PROCEDURE UserLogin(IN InputUserID varchar(20), IN InputLoginTime datetime)
BEGIN
DELETE FROM TE_User_Login
WHERE UserID = InputUserID;
insert into TE_User_Login(UserID, LoginTime)
VALUES (InputUserID, InputLoginTime);
END;
//
DELIMITER ;
/*
ログインユーザーと日時を追加するときに呼び出すやつだよ
call UserLogin('j-murata@ciel.japan', '2023-10-18 10:00:00');
*/