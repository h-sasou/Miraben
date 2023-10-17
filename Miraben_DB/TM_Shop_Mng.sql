Drop Table If Exists TM_Shop_mng;

Create Table
	TM_Shop_mng(
		ShopID			smallint not null primary key unique auto_increment unique
		,ShopName		varchar(30) NOT NULL
        ,ShopKen		varchar(10) not null
        ,ShopShi		varchar(20) not null
        ,ShopTyo		varchar(50) not null
        ,ShopBill		varchar(30)
        ,Mon		BOOLEAN DEFAULT '0'
        ,Tue		BOOLEAN DEFAULT '0'
        ,Wed		BOOLEAN DEFAULT '0'
        ,Thu		BOOLEAN DEFAULT '0'
        ,Fri		BOOLEAN DEFAULT '0'
        ,Sat		BOOLEAN DEFAULT '0'
        ,Sun		BOOLEAN DEFAULT '0'
        ,Hol		BOOLEAN DEFAULT '0'
        ,TelNum		varchar(15)
        ,EigyouStart		time
        ,EigyouEnd			time
        ,DeleteFlg		boolean not null DEFAULT '0'
        );
        
        ALTER TABLE TM_Shop_mng
			MODIFY ShopName VARCHAR(30) NOT NULL;



drop procedure ShopInsert;

DELIMITER //

CREATE PROCEDURE ShopInsert(in ShopName varchar(30),in ShopKen varchar(30),in ShopShi varchar(30),in ShopTyo varchar(30), ShopBill varchar(30),in Mon BOOLEAN,in Tue BOOLEAN,in Wed BOOLEAN, inThu BOOLEAN,in Fri BOOLEAN,in Sat BOOLEAN,in Sun BOOLEAN,in Hol BOOLEAN,in TelNum varchar(15),in EigyouStart time,in EigyouEnd time,in DeleteFlg boolean) 
BEGIN

	INSERT INTO TM_Shop_mng (ShopName, ShopKen, ShopShi, ShopTyo, ShopBill, Mon, Tue, Wed, Thu, Fri, Sat, Sun, Hol, TelNum, EigyouStart, EigyouEnd, DeleteFlg) 
	VALUES (ShopName, ShopKen, ShopShi, ShopTyo, ShopBill, Mon, Tue, Wed, Thu, Fri, Sat, Sun, Hol, TelNum, EigyouStart, EigyouEnd, DeleteFlg);
END;
//

DELIMITER ;

        
        
        
        
        