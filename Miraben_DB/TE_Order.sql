Drop Table If Exists TE_Order;

Create Table
	TE_Order(
		OrderID			smallint not null primary key unique
		,UserID			varchar(20) not null
        ,ShopID			varchar(5) not null
        ,FoodID			varchar(5) not null 
        ,urine			varchar(5) not null
        ,OrderTime		datetime not null
        ,payFlg			boolean not null
        ,pickFlg		boolean not null
        );
        
        
        
        
        