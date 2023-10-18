Drop Table If Exists TE_Food_Count;

Create Table
	TE_Food_Count(
		ShopID					smallint not null
        ,FoodID					smallint not null unique
		,PRIMARY KEY(ShopID,FoodID)
        );
        