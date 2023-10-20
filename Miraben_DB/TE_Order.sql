Drop Table If Exists TE_Order;

Create Table
	TE_Order(
		OrderID				smallint not null primary key unique AUTO_INCREMENT
		,UserID					varchar(30) not null
        ,OrderShopName			varchar(30) not null
        ,OrderFoodName			varchar(30) not null 
        ,some					decimal(3) unsigned zerofill not NULL
        ,Price 					decimal(6) unsigned zerofill DEFAULT NULL
        ,calorie				varchar(10)
        ,OrderTime				datetime not null
        ,payFlg					boolean not null DEFAULT '0'
        ,pickFlg				boolean not null DEFAULT '0'
        );
        
        
        
drop PROCEDURE UserOrder;
DELIMITER //
CREATE PROCEDURE UserOrder(IN InputUserID varchar(30), IN InputOrderShopName varchar(30) , IN InputOrderFoodName varchar(30) , IN Inputsome decimal(6) ,
 IN InputPrice decimal(6) , IN Inputcalorie varchar(10) ,IN InputOrderTime datetime,IN InputShopID smallint)
BEGIN
INSERT INTO TE_Order (UserID, OrderShopName, OrderFoodName, some, Price, calorie, OrderTime)
VALUES (InputUserID, InputOrderShopName, InputOrderFoodName, Inputsome, InputPrice, Inputcalorie, InputOrderTime);
INSERT INTO TT_Order_Mng (ShopID, OrderID, UserID) 
VALUES (InputShopID, LAST_INSERT_ID(), InputUserID);
INSERT INTO TR_Order_Rireki (UserID, OrderShopName, OrderFoodName, some, Price, calorie, OrderTime)
VALUES (InputUserID, InputOrderShopName, InputOrderFoodName, Inputsome, InputPrice, Inputcalorie, InputOrderTime);
END;
//
DELIMITER ;





        