Drop Table If Exists Address;

Create Table
	Address(
		AddressID		int unique auto_increment
		,Y_Num		varchar(100)
        ,Ken		varchar(100)
		,Shi		varchar(200)
        ,Tyo		varchar(200)
	);