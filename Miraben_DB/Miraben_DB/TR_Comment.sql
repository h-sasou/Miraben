Drop Table If Exists TR_Comment;

Create Table
	TR_Comment(
		UserID					varchar(20) not null
        ,ShopID					varchar(5) not null 
        ,FoodID					varchar(5) not null
		,CategoryCode			varchar(15) not null
        ,CommentID  			smallint
        ,Comment				varchar(150) not null
		,PRIMARY KEY(UserID,ShopID,FoodID,CommentID)
        );
        