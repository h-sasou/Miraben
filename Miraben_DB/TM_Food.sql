drop procedure CallFood;

DELIMITER //
CREATE PROCEDURE CallFood(IN input int)
BEGIN

select * FROM TM_Food WHERE ShopID = input;

END;

/*
インサートするときはこれ使ってね
drop procedure FoodInsert;
DELIMITER //
CREATE PROCEDURE FoodInsert(IN ShopID int, IN FoodID int,  FoodName VARCHAR(20),IN Price decimal(6,2),IN Calorie VARCHAR(10),IN CategoryCode VARCHAR(15))
BEGIN
    INSERT INTO TM_Food (ShopID, FoodID, FoodName, Price, Calorie ,CategoryCode) 
	values (ShopID, FoodID, FoodName, Price, Calorie, CategoryCode);
END;
//

DELIMITER ;
*/


Drop Table If Exists TM_Food;

Create Table
	TM_Food(
		ShopID			smallint  not null 
		,FoodID			smallint not null 
        ,FoodName		varchar(20) not null
        ,Price			decimal(6,2) zerofill not null
        ,commentID		smallint
        ,calorie		varchar(10)
        ,CategoryCode		varchar(15) 
        ,DeleteFlg		boolean not null DEFAULT '0'
		,PRIMARY KEY(ShopID,FoodID)
        );
        
        
        
        
        
        
        
        