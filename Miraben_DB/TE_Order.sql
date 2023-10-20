Drop Table If Exists TE_Order;

Create Table
	TE_Order(
		OrderID				smallint not null primary key unique AUTO_INCREMENT
		,UserID					varchar(30) not null
        ,OrderShopName			varchar(30) not null
        ,OrderFoodName			varchar(30) not null 
        ,some					varchar(30) not null
        ,Price 					decimal(6)unsigned zerofill DEFAULT NULL
        ,calorie				varchar(10)
        ,OrderTime				datetime not null
        ,payFlg					boolean not null DEFAULT '0'
        ,pickFlg				boolean not null DEFAULT '0'
        );
        
        
        
        
        