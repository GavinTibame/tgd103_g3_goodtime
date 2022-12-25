# table ROLE insert

insert into mydb.ROLE(`DESC`, `INDEX`, INDEX_LEVEL, OVERVIEW, OVERVIEW_LEVEL, PO, PO_LEVEL, PRODUCT, PRODUCT_LEVEL, INFO, INFO_LEVEL, RENTAL, RENTAL_LEVEL, `MEMBER`, MEMBER_LEVEL)
values('admin管理員', 
	'後台主頁權限', 0, 
	'後台銷售概況權限', 0, 
	'後台訂單權限', 0, 
	'後台商品頁權限', 0, 
	'後台消息頁', 0, 
	'後台場地頁', 0, 
	'後台會員頁', 0);

# table ADDRESS insert

insert into mydb.ADDRESS(ZIP, REGION, DISTRICT, LOCATION)
values('104', '台北市', '中山區', '南京東路三段219號5樓');

# table MEMBER insert

insert into mydb.MEMBER(USERNAME, EMAIL, `PASSWORD`, PHONE, VERIFY, 
	FK_ADDRESS_ID, FK_ROLE_ID)
values('admin管理員', 'admin@goodtime.com', 'g3_@dmin',	'0987654321', 0, 
	1, 1);