Drop Table If Exists TT_Order_Mng;

Create Table
	TT_Order_Mng(
		OrderMngID			smallint not null primary key unique AUTO_INCREMENT
		,ShopID				varchar(5) not null
        ,OrderID			smallint not null 
        ,LeaderID			varchar(30) not null unique
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
