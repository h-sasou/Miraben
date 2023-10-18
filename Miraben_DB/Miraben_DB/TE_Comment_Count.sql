Drop Table If Exists TE_Comment_Count;

Create Table
	TE_Comment_Count(
		UserID					varcharacter(20) not null unique
        ,ShopID					varcharacter(5)  not null
        ,FoodID					varcharacter(5) not null unique
        ,CommentID				varcharacter(5) not null unique
		,PRIMARY KEY(UserID,ShopID,FoodID,CommentID)
        );
        