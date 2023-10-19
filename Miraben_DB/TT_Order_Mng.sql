Drop Table If Exists TT_Order_Mng;

Create Table
	TT_Order_Mng(
		OrderMngID			smallint not null primary key unique AUTO_INCREMENT
		,ShopID				varchar(5) not null
        ,OrderID			varchar(5) not null 
        ,LeaderID			varchar(30) not null
		,MngFlg				boolean not null null DEFAULT '0'
        );
        
        
        
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