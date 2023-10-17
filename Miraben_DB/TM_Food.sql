drop procedure CallFood;

DELIMITER //
CREATE PROCEDURE CallFood(IN input int)
BEGIN

select * FROM TM_Food WHERE ShopID = input;

END;
DELIMITER ;

drop procedure FoodInsert;
DELIMITER //
CREATE PROCEDURE FoodInsert(IN ShopID int, IN FoodID int,  FoodName VARCHAR(20),IN Price decimal(6,2),IN Calorie VARCHAR(10),IN CategoryCode VARCHAR(15))
BEGIN
    INSERT INTO TM_Food (ShopID, FoodID, FoodName, Price, Calorie ,CategoryCode) 
	values (ShopID, FoodID, FoodName, Price, Calorie, CategoryCode);
END;
//
DELIMITER ;

/*
インサートするときはこれ使ってね。
(呼び出し)　(プロシージャ名)(ShopID, FoodID, FoodName, Price, Calorie ,CategoryCode);
call FoodInsert('4', '4', 'しゃーもん', '600', '高', '1');

呼び出すときはこれ使ってね
(呼び出し)　(プロシージャ名)(店IDの何番を表示させるか )
call CallMenu(x);



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
        