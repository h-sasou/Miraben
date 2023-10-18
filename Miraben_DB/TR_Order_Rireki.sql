Drop Table If Exists TR_Order_Rireki;

Create Table
	TR_Order_Rireki(
		 OrderRirekiID smallint unsigned NOT NULL AUTO_INCREMENT
		,UserID varchar(20) NOT NULL
        ,ShopID varchar(5) NOT NULL 
        ,FoodID varchar(5) NOT NULL
		,some decimal(3) unsigned zerofill DEFAULT NULL
		,OrderTime datetime DEFAULT NULL
        ,PRIMARY KEY (OrderRirekiID)
        );
      
drop PROCEDURE MyPageOrderRireki;
DELIMITER //
CREATE PROCEDURE MyPageOrderRireki(IN input varchar(30))
BEGIN
select TR_Order_Rireki.OrderTime, TM_Shop_mng.ShopName, TM_Food.FoodName, TR_Order_Rireki.some, TM_Food.Price 
from TR_Order_Rireki 
join TM_Shop_mng on TR_Order_Rireki.ShopID = TM_Shop_mng.ShopID
join TM_Food on TR_Order_Rireki.FoodID = TM_Food.FoodID
join TM_User on TR_Order_Rireki.UserID = TM_User.UserID
where CONCAT(TR_Order_Rireki.FoodID, TR_Order_Rireki.ShopID) = CONCAT(TM_Food.FoodID, TM_Food.ShopID)
and TR_Order_Rireki.UserID = input;
END;
//
DELIMITER ;
