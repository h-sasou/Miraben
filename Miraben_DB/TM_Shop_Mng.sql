Drop Table If Exists TM_Shop_mng;

Create Table
	TM_Shop_mng(
		ShopID			smallint not null primary key unique auto_increment unique
		,ShopName		varchar(30) NOT NULL
        ,ShopKen		varchar(10) not null
        ,ShopShi		varchar(20) not null
        ,ShopTyo		varchar(50) not null
        ,ShopBill		varchar(30)
        ,Mon		BOOLEAN 
        ,Tue		BOOLEAN 
        ,Wed		BOOLEAN 
        ,Thu		BOOLEAN
        ,Fri		BOOLEAN 
        ,Sat		BOOLEAN 
        ,Sun		BOOLEAN 
        ,Hol		BOOLEAN 
        ,TelNum		varchar(15)
        ,EigyouStart		time
        ,EigyouEnd			time
        ,DeleteFlg		boolean not null
        );
        
        
        ALTER TABLE TM_Shop_mng
			MODIFY ShopName VARCHAR(30) NOT NULL;

        
        
        
        
        
        