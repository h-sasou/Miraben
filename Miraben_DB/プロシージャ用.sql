1


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
        
        



2

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

insert into TP_Control  (LoginControl) values (0); 
*/


3

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


drop procedure UserLogout;
DELIMITER //
CREATE PROCEDURE UserLogout(IN InputUserID varchar(20), IN InputLogoutTime datetime)
BEGIN
UPDATE TE_User_Login
SET LogoutTime = InputLogoutTime
WHERE UserID = InputUserID;
END;
//
DELIMITER ;

/*
ログアウトユーザーと日時を追加するときに呼び出すやつだよ
call UserLogout('j-murata@ciel.japan', '2023-10-18 10:00:00');
*/



4

drop procedure Receive;
DELIMITER //
CREATE PROCEDURE Receive(IN InputUser varchar(30))
BEGIN
	UPDATE  TE_Order
		SET pickFlg = 1 WHERE pickFlg = 0
        and UserID = InputUser;
END;
//
DELIMITER ;
-- 注文選択の商品受け取りのボタンを押すとそのユーザーの受け取りフラグが１になる。
幹事画面用



５

drop PROCEDURE OrderLeader;
DELIMITER //
CREATE PROCEDURE OrderLeader(IN input smallint)
BEGIN
SELECT 
TM_User.UserName, TE_Order.OrderShopName, TE_Order.OrderFoodName, 
SUBSTRING(TE_Order.some, 
    REGEXP_INSTR(TE_Order.some, '[1-9]') -- [1-9]は0以外の数値を表す正規表現
  ) AS some,
SUBSTRING(TE_Order.Price, 
    REGEXP_INSTR(TE_Order.Price, '[1-9]') -- [1-9]は0以外の数値を表す正規表現
  ) AS Price, 
TE_Order.payFlg, TE_Order.pickFlg 
FROM TT_Order_Mng
join TM_User on TT_Order_Mng.LeaderID = TM_User.UserID
join TE_Order on  TT_Order_Mng.OrderID = TE_Order.OrderID
where TT_Order_Mng.ShopID = input;
END;
//
DELIMITER ;
-- 幹事画面の表示を出す部分



６




drop PROCEDURE UserOrder;
DELIMITER //
CREATE PROCEDURE UserOrder(IN InputUserID varchar(30), IN InputOrderShopName varchar(30) , IN InputOrderFoodName varchar(30) , IN Inputsome decimal(6) ,
 IN InputPrice decimal(6) , IN Inputcalorie varchar(10) ,IN InputOrderTime datetime,IN InputShopID smallint)
BEGIN
INSERT INTO TE_Order (UserID, OrderShopName, OrderFoodName, some, Price, calorie, OrderTime)
VALUES (InputUserID, InputOrderShopName, InputOrderFoodName, Inputsome, InputPrice, Inputcalorie, InputOrderTime);
INSERT INTO TT_Order_Mng (ShopID, OrderID,UserID) 
VALUES (InputShopID, LAST_INSERT_ID(), InputUserID);
INSERT INTO TR_Order_Rireki (UserID, OrderShopName, OrderFoodName, some, Price, calorie, OrderTime)
VALUES (InputUserID, InputOrderShopName, InputOrderFoodName, Inputsome, InputPrice, Inputcalorie, InputOrderTime);
END;
//
DELIMITER ;
-- 注文確定したときに個別注文、注文管理、注文履歴のデータに全部送るよ


7



drop PROCEDURE InComment;
DELIMITER //
 CREATE PROCEDURE InComment(IN InputUserID varchar(30),IN InputShopID smallint,IN InputFoodID smallint,IN InputComment varchar(150))
BEGIN
 DECLARE InputCommentID smallint;
 set InputCommentID = COALESCE((select MAX(CommentID) + 1
from TR_Comment
where UserID = InputUserID
AND ShopID = InputShopID
AND FoodID = InputFoodID), 0);
INSERT INTO TR_Comment (UserID, ShopID, FoodID, CommentID, Comment)
VALUES (InputUserID, InputShopID, InputFoodID,  InputCommentID, InputComment);
END;
//
DELIMITER ;
-- コメント入力のクエリだお
/*
call InComment('a-ito@ciel-japan.jp','5','2','なによりもさけ！！！！');
