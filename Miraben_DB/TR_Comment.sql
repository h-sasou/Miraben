Drop Table If Exists TR_Comment;

Create Table
	TR_Comment(
		UserID					varchar(30) not null
        ,ShopID					smallint not null 
        ,FoodID					smallint not null 
		-- ,CategoryCode			varchar(15) not null
        ,CommentID  			smallint
        ,Comment				varchar(150) not null
		,PRIMARY KEY(UserID,ShopID,FoodID,CommentID)
        );
        
        
        


drop PROCEDURE InComment;
DELIMITER //
CREATE PROCEDURE InComment(IN input varchar(30))
BEGIN



DECLARE InputCoomentID Smallint;
set InputCoomentID =  MAX(UserID, ShopID, FoodID, ComentID)+1;

INSERT INTO TR_Comment (UserID, ShopID, FoodID, ComentID, Comment)
VALUES (InputUserID, InputShopID, InputFoodID, InputCoomentIDInputComment);




END;
//
DELIMITER ;
