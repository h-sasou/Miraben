Drop Table If Exists TE_Userz_Login;

Create Table
	TE_Userz_Login(
		UserID					varchar(20) not null
        ,LoginTime				datetime 
        ,LogoutTime				datetime
        );
        