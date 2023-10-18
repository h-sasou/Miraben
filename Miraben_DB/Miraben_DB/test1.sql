drop procedure FoodInsert;
DELIMITER //
CREATE PROCEDURE FoodInsert(IN ShopID int,FoodName VARCHAR(20),IN Price decimal(6,2),IN Calorie VARCHAR(10),IN CategoryCode VARCHAR(15))
BEGIN

	DECLARE FoodID_N INT;
  
     SELECT IFNULL(MAX(FoodID), 0) + 1 INTO FoodID_N FROM TM_Food WHERE ShopID = ShopID;

    INSERT INTO TM_Food (ShopID, FoodID, FoodName, Price, Calorie ,CategoryCode) 
	values (ShopID, FoodID_N, FoodName, Price, Calorie, CategoryCode);
END;
//
DELIMITER ;
