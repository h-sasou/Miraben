Drop Table If Exists TR_Comment;

Create Table
	TR_Comment(
		UserID					varchar(30) not null UNIQUE
        ,ShopID					smallint not null 
        ,FoodID					smallint not null 
		-- ,CategoryCode			varchar(15) not null
        ,CommentID  			smallint DEFAULT '0'
        ,Comment				varchar(150) not null
		,PRIMARY KEY(UserID,ShopID,FoodID,CommentID)
        );
        
        
drop PROCEDURE InComment;
DELIMITER //
 CREATE PROCEDURE InComment(IN InputUserID varchar(30),IN InputShopID smallint,IN InputFoodID smallint,IN InputComment varchar(150))
BEGIN
 DECLARE InputCommentID smallint;
 set InputCommentID = COALESCE((select MAX(CommentID) + 1
from TR_Comment
where UserID = InputUserID
AND ShopID = InputShopID
AND FoodID = InputFoodID), 0);
INSERT INTO TR_Comment (UserID, ShopID, FoodID, CommentID, Comment)
VALUES (InputUserID, InputShopID, InputFoodID,  InputCommentID, InputComment);
END;
//
DELIMITER ;
-- コメント入力のクエリだお
/*
call InComment('a-ito@ciel-japan.jp','5','2','なによりもさけ！！！！');
*/