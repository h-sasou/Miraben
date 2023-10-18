Drop Table If Exists TT_Order_Mng;

Create Table
	TT_Order_Mng(
		OrderMngID			smallint not null primary key unique
		,ShopID				varchar(5) not null
        ,OrderID			varchar(5) not null 
        ,LeaderID			varchar(20) not null
		,MngFlg				boolean not null
        );
        
        