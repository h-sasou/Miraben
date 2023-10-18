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
CREATE PROCEDURE ShopInsert(in ShopName varchar(30),in ShopKen varchar(10),in ShopShi varchar(20),in ShopTyo varchar(50), ShopBill varchar(30),in Mon BOOLEAN,in Tue BOOLEAN,in Wed BOOLEAN, inThu BOOLEAN,in Fri BOOLEAN,in Sat BOOLEAN,in Sun BOOLEAN,in Hol BOOLEAN,in TelNum varchar(15),in EigyouStart time,in EigyouEnd time,in DeleteFlg boolean) 
BEGIN
	INSERT INTO TM_Shop_mng (ShopName, ShopKen, ShopShi, ShopTyo, ShopBill, Mon, Tue, Wed, Thu, Fri, Sat, Sun, Hol, TelNum, EigyouStart, EigyouEnd, DeleteFlg) 
	VALUES (ShopName, ShopKen, ShopShi, ShopTyo, ShopBill, Mon, Tue, Wed, Thu, Fri, Sat, Sun, Hol, TelNum, EigyouStart, EigyouEnd, DeleteFlg);
END;
//
DELIMITER ;

drop procedure CallMenu;
DELIMITER //
CREATE PROCEDURE CallMenu(IN input int)
BEGIN
select * FROM TM_Shop_mng WHERE ShopID = input;
END;//
DELIMITER ;

/*
インサートするときはこれ使ってね
-- 呼び出し プロシージャ名(ShopName, ShopKen, ShopShi, ShopTyo, ShopBill, Mon, Tue, Wed, Thu, Fri, Sat, Sun, Hol, TelNum, EigyouStart, EigyouEnd, DeleteFlg) 
call ShopInsert('豚貴族','山梨県','山梨市','山梨町', '新日本ビル',0,1,1,1,1,0,0,0,09014231455,'09:00','17:00',0); 

呼び出す時はこれ使ってね
(呼び出し)　(プロシージャ名)(店IDの何番を表示させるか )
call  CallMenu(x);

*/
        
        
        