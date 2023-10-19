Drop Table If Exists TE_User_Login;

Create Table
	TE_User_Login(
		UserID					varchar(20) not null
        ,LoginTime				datetime 
        ,LogoutTime				datetime
        );
        