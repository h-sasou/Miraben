drop procedure CallFood;

DELIMITER //
CREATE PROCEDURE CallFood(IN input int)
BEGIN

select * FROM TM_Food WHERE ShopID = input;

END;





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
        ,DeleteFlg		boolean not null
		,PRIMARY KEY(ShopID,FoodID)
        );
        
        
        
        
        
        
        
        