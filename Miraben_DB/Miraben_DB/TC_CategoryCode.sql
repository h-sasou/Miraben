Drop Table If Exists TC_CategoryCode;
Create Table
	TC_CategoryCode(
		CategoryCode			varchar(15) not null primary key unique
-- 0=グランドメニュー　1=サイドメニュー　2=デザート　3=トッピング
        );
        