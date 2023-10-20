Drop Table If Exists TR_Order_Rireki;

Create Table
	TR_Order_Rireki(
		 OrderRirekiID smallint unsigned NOT NULL AUTO_INCREMENT
		,UserID varchar(20) NOT NULL
        ,ShopID varchar(5) NOT NULL 
        ,FoodID varchar(5) NOT NULL
		,some decimal(3,2) unsigned zerofill DEFAULT NULL
		,OrderTime datetime DEFAULT NULL
        ,PRIMARY KEY (OrderRirekiID)
        );
        
        
         
