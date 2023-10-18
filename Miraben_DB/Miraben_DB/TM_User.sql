Drop Table If Exists TM_User;

Create Table
	TM_User(
		UserID			varchar(30) not null primary key unique
		,UserName		varchar(20) not null
        ,PassWord		varchar(20) not null
        );
        
        
        
        
        