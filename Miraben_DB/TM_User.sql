Drop Table If Exists TM_User;

Create Table
	TM_User(
		UserID			varchar(30) not null primary key unique
		,UserName		varchar(20) not null
        ,PassWord		varchar(20) not null
        );


drop PROCEDURE FirstLogin;
DELIMITER //
CREATE PROCEDURE FirstLogin(IN InputUserName varchar(20), IN InputPassWord varchar(20), IN InputUserID varchar(30))
BEGIN
update TM_User
set UserName = InputUserName, PassWord = InputPassWord
where UserID = InputUserID;
END;
//
DELIMITER ;
/*
新規登録の画面の入力
暫定登録用のプロシージャだよ！
call FirstLogin('ずんむら', '19910727', 's-sugiyama@ciel.japan');
  */      
        
        