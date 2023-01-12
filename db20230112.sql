/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.31 : Database - GOODTIME
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`GOODTIME` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `GOODTIME`;

/*Table structure for table `ADDRESS` */

DROP TABLE IF EXISTS `ADDRESS`;

CREATE TABLE `ADDRESS` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '地址編號',
  `ZIP` varchar(5) DEFAULT NULL,
  `REGION` varchar(45) DEFAULT NULL COMMENT '省市',
  `DISTRICT` varchar(45) DEFAULT NULL COMMENT '區域',
  `LOCATION` varchar(256) NOT NULL COMMENT '詳細地址',
  `FK_ADDRESS_MEMBER_ID` int DEFAULT NULL COMMENT 'FK_會員編號',
  PRIMARY KEY (`ID`),
  KEY `FK_ADDRESS_MEMBER_ID_idx` (`FK_ADDRESS_MEMBER_ID`),
  CONSTRAINT `FK_ADDRESS_MEMBER_ID` FOREIGN KEY (`FK_ADDRESS_MEMBER_ID`) REFERENCES `MEMBER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

/*Data for the table `ADDRESS` */

insert  into `ADDRESS`(`ID`,`ZIP`,`REGION`,`DISTRICT`,`LOCATION`,`FK_ADDRESS_MEMBER_ID`) values 
(1,'104','台北市','中山區','南京東路三段219號5樓',5),
(2,'','','','台北市松山區敦化北路100號2樓',5),
(3,NULL,NULL,NULL,'110台北市信義區莊敬路334號1樓',7),
(7,NULL,NULL,NULL,'100台北市中正區濟南路一段321號',38);

/*Table structure for table `BOOKING` */

DROP TABLE IF EXISTS `BOOKING`;

CREATE TABLE `BOOKING` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '預約編號',
  `PRICE` mediumint NOT NULL COMMENT '單價',
  `STATUS` tinyint NOT NULL COMMENT '預約狀態',
  `STATUS_DATE` timestamp NOT NULL COMMENT '預約狀態更新日期',
  `STATUS_REASON` varchar(128) NOT NULL COMMENT '預約狀態原因',
  `START_DATE` date NOT NULL COMMENT '開始使用日期',
  `END_DATE` date NOT NULL COMMENT '最後使用日期',
  `BOOKING_NOTE` varchar(256) DEFAULT NULL COMMENT '預約備註',
  `CS_BOOKING_NOTE` varchar(256) DEFAULT NULL COMMENT '客服預約備註',
  `CREATE_DATE` timestamp NOT NULL COMMENT '下單日期',
  `FK_BOOKING_MEMBER_ID` int NOT NULL COMMENT 'FK_會員編號',
  `FK_LOCATION_ID` int NOT NULL COMMENT 'FK_場地編號',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ID_idx` (`FK_BOOKING_MEMBER_ID`),
  KEY `FK_LOCATION_ID_idx` (`FK_LOCATION_ID`),
  CONSTRAINT `FK_BOOKING_MEMBER_ID` FOREIGN KEY (`FK_BOOKING_MEMBER_ID`) REFERENCES `MEMBER` (`ID`),
  CONSTRAINT `FK_LOCATION_ID` FOREIGN KEY (`FK_LOCATION_ID`) REFERENCES `LOCATION` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `BOOKING` */

insert  into `BOOKING`(`ID`,`PRICE`,`STATUS`,`STATUS_DATE`,`STATUS_REASON`,`START_DATE`,`END_DATE`,`BOOKING_NOTE`,`CS_BOOKING_NOTE`,`CREATE_DATE`,`FK_BOOKING_MEMBER_ID`,`FK_LOCATION_ID`) values 
(1,10000,0,'2022-12-25 16:54:25','','2022-12-31','2023-01-07','BOOKING_NOTE','','2022-12-25 16:54:25',5,1);

/*Table structure for table `CART` */

DROP TABLE IF EXISTS `CART`;

CREATE TABLE `CART` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '購物車編號',
  `QTY` smallint NOT NULL COMMENT '數量',
  `CART_DATE` timestamp NOT NULL COMMENT '加入購物車日期',
  `FK_CART_MEMBER_ID` int NOT NULL COMMENT '會員編號',
  `FK_CART_PRODUCT_ID` int NOT NULL COMMENT '商品編號',
  `FK_CART_PRODUCT_SPEC_ID` int NOT NULL COMMENT '商品規格編號',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ID_idx` (`FK_CART_MEMBER_ID`),
  KEY `FK_PRODUCT_ID_idx` (`FK_CART_PRODUCT_ID`),
  KEY `FK_CART_PRODUCT_SPEC_SPEC_idx` (`FK_CART_PRODUCT_SPEC_ID`),
  CONSTRAINT `FK_CART_MEMBER_ID` FOREIGN KEY (`FK_CART_MEMBER_ID`) REFERENCES `MEMBER` (`ID`),
  CONSTRAINT `FK_CART_PRODUCT_ID` FOREIGN KEY (`FK_CART_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`),
  CONSTRAINT `FK_CART_PRODUCT_SPEC_ID` FOREIGN KEY (`FK_CART_PRODUCT_SPEC_ID`) REFERENCES `PRODUCT_SPEC` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

/*Data for the table `CART` */

insert  into `CART`(`ID`,`QTY`,`CART_DATE`,`FK_CART_MEMBER_ID`,`FK_CART_PRODUCT_ID`,`FK_CART_PRODUCT_SPEC_ID`) values 
(1,2,'2022-12-26 11:32:07',5,1,4),
(3,1,'2023-01-09 17:54:24',5,2,2),
(24,3,'2023-01-12 19:27:05',5,2,1);

/*Table structure for table `EXPO` */

DROP TABLE IF EXISTS `EXPO`;

CREATE TABLE `EXPO` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '展覽編號',
  `TITLE` varchar(128) NOT NULL COMMENT '展覽標題',
  `CONTENT` mediumtext COMMENT '展覽內文',
  `MAIN_PHOTO` varchar(256) DEFAULT NULL COMMENT '展覽主圖',
  `FK_EXPO_PAGE_ID` int NOT NULL COMMENT 'FK_展覽分頁編號',
  `START_DATE` date NOT NULL COMMENT '展覽開始日期',
  `END_DATE` date NOT NULL COMMENT '展覽結束日期',
  `CREATE_DATE` timestamp NOT NULL COMMENT '展覽新增時間',
  `EDIT_DATE` timestamp NOT NULL COMMENT '最後更新日期',
  `ADULT_PRICE` smallint NOT NULL COMMENT '一般票票價',
  `CONC_PRICE` smallint NOT NULL COMMENT '優待票票價 concession',
  `GROUP_PRICE` smallint NOT NULL COMMENT '團體票票價',
  `FK_BOOKING_ID` int DEFAULT NULL COMMENT 'FK_預約編號',
  `INFO` mediumtext COMMENT '展覽資訊',
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_EXPO_PAGE_ID`),
  KEY `FK_BOOKING_ID_idx` (`FK_BOOKING_ID`),
  CONSTRAINT `FK_BOOKING_ID` FOREIGN KEY (`FK_BOOKING_ID`) REFERENCES `BOOKING` (`ID`),
  CONSTRAINT `FK_EXPO_PAGE_ID` FOREIGN KEY (`FK_EXPO_PAGE_ID`) REFERENCES `PAGE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `EXPO` */

insert  into `EXPO`(`ID`,`TITLE`,`CONTENT`,`MAIN_PHOTO`,`FK_EXPO_PAGE_ID`,`START_DATE`,`END_DATE`,`CREATE_DATE`,`EDIT_DATE`,`ADULT_PRICE`,`CONC_PRICE`,`GROUP_PRICE`,`FK_BOOKING_ID`,`INFO`) values 
(1,'《Lindsayooo》新興畫家特展','最近在Instagram點擊量爆增粉絲人數達百萬最熱門的新創插畫家Lindsayoo，畫家細膩的筆觸與寫實的作畫風格，短時間快速達到百萬人數訂閱，應許多粉絲留言要求，多次連繫畫家展出活動接洽此次為韶光文創園區特別限定期間展出，千萬不要錯過好機會！限定期間2024.12.01~2024.12.32 ，購票即送限量明信片。','EXPO.JPG',3,'2022-12-26','2023-01-15','2022-12-26 12:36:13','2022-12-26 12:36:13',300,250,230,NULL,NULL);

/*Table structure for table `INFO` */

DROP TABLE IF EXISTS `INFO`;

CREATE TABLE `INFO` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '消息編號',
  `TITLE` varchar(100) NOT NULL COMMENT '消息標題',
  `CONTENT` mediumtext COMMENT '消息內文',
  `MAIN_PHOTO` varchar(256) DEFAULT NULL COMMENT '消息主圖',
  `PERIOD` varchar(35) NOT NULL COMMENT '公告期間',
  `STATUS` tinyint(1) NOT NULL COMMENT '消息頁狀態',
  `CREATE_DATE` timestamp NOT NULL COMMENT '新增日期',
  `EDIT_DATE` timestamp NOT NULL COMMENT '最後編輯日期',
  `FK_INFO_PAGE_ID` int NOT NULL COMMENT 'FK_消息頁編號',
  `FK_INFO_TYPE_ID` int NOT NULL COMMENT 'FK_消息頁類型編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_INFO_PAGE_ID`),
  KEY `FK_INFO_TYPE_ID_idx` (`FK_INFO_TYPE_ID`),
  CONSTRAINT `FK_INFO_PAGE_ID` FOREIGN KEY (`FK_INFO_PAGE_ID`) REFERENCES `PAGE` (`ID`),
  CONSTRAINT `FK_INFO_TYPE_ID` FOREIGN KEY (`FK_INFO_TYPE_ID`) REFERENCES `INFO_TYPE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `INFO` */

insert  into `INFO`(`ID`,`TITLE`,`CONTENT`,`MAIN_PHOTO`,`PERIOD`,`STATUS`,`CREATE_DATE`,`EDIT_DATE`,`FK_INFO_PAGE_ID`,`FK_INFO_TYPE_ID`) values 
(1,'動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！','{\"消息內文\": \"動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！\"}','{\"0\": \"PRODUCT1.JPG\"}','2022/12/25 00:00 - 2023/01/07 23:59',0,'2022-12-25 17:08:56','2022-12-25 17:08:56',1,1);

/*Table structure for table `INFO_TYPE` */

DROP TABLE IF EXISTS `INFO_TYPE`;

CREATE TABLE `INFO_TYPE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '消息類型',
  `DESC` varchar(100) NOT NULL COMMENT '消息類型描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `INFO_TYPE` */

insert  into `INFO_TYPE`(`ID`,`DESC`) values 
(1,'園區公告');

/*Table structure for table `LOCATION` */

DROP TABLE IF EXISTS `LOCATION`;

CREATE TABLE `LOCATION` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '場地編號',
  `NAME` varchar(45) NOT NULL COMMENT '場地名稱',
  `PRICE` mediumint NOT NULL COMMENT '出租訂價',
  `DESC` json NOT NULL COMMENT '場地描述',
  `DEVICE` varchar(256) NOT NULL COMMENT '場地設備',
  `RULE` varchar(256) NOT NULL COMMENT '場地規範',
  `AREA` varchar(128) NOT NULL COMMENT '場地空間',
  `MAIN_PHOTO` json NOT NULL COMMENT '場地主圖',
  `LOCATED` varchar(64) NOT NULL COMMENT '場地位置',
  `STATUS` tinyint(1) NOT NULL COMMENT '開放預約狀態',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `LOCATION` */

insert  into `LOCATION`(`ID`,`NAME`,`PRICE`,`DESC`,`DEVICE`,`RULE`,`AREA`,`MAIN_PHOTO`,`LOCATED`,`STATUS`) values 
(1,'1號倉庫',10000,'{\"構造\": \"室內為長廊式空間，鋼骨鋼筋混凝土柱樑系統，加強磚造結構\"}','基礎照明、空調、簡易掃具','園區嚴禁使用任何火具。','141坪','{\"0\": \"場地主圖\"}','由大門進來後左轉到底即可抵達1號倉庫',0);

/*Table structure for table `MEMBER` */

DROP TABLE IF EXISTS `MEMBER`;

CREATE TABLE `MEMBER` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '會員編號',
  `USERNAME` varchar(100) NOT NULL COMMENT '會員名稱',
  `EMAIL` varchar(100) NOT NULL COMMENT '會員電郵',
  `PASSWORD` varchar(45) NOT NULL COMMENT '會員密碼',
  `PHONE` varchar(10) NOT NULL COMMENT '會員電話',
  `VERIFY` tinyint(1) NOT NULL DEFAULT '0' COMMENT '會員狀態',
  `FK_ROLE_ID` int NOT NULL DEFAULT '2' COMMENT '會員權限代碼',
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_ID_idx` (`FK_ROLE_ID`),
  CONSTRAINT `FK_ROLE_ID` FOREIGN KEY (`FK_ROLE_ID`) REFERENCES `ROLE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;

/*Data for the table `MEMBER` */

insert  into `MEMBER`(`ID`,`USERNAME`,`EMAIL`,`PASSWORD`,`PHONE`,`VERIFY`,`FK_ROLE_ID`) values 
(1,'admin','admin@goodtime.com','g3_@dmin','0987654321',0,1),
(5,'member1','member@goodtime.com','member1','0987654321',0,2),
(7,'member2','member2@goodtime.com','member2','0987654321',0,2),
(38,'member3','member3@goodtime.com','member3','0987654321',0,2);

/*Table structure for table `PAGE` */

DROP TABLE IF EXISTS `PAGE`;

CREATE TABLE `PAGE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '頁面編號',
  `TYPE` varchar(45) NOT NULL COMMENT '頁面類型',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PAGE` */

insert  into `PAGE`(`ID`,`TYPE`) values 
(1,'消息頁'),
(2,'商品頁'),
(3,'展覽頁');

/*Table structure for table `PO` */

DROP TABLE IF EXISTS `PO`;

CREATE TABLE `PO` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '主單編號',
  `FREIGHT` smallint NOT NULL COMMENT '運費',
  `ETD` date NOT NULL,
  `SHIP_DATE` date DEFAULT NULL,
  `BL` varchar(45) DEFAULT NULL,
  `STATUS` tinyint NOT NULL,
  `STATUS_DATE` timestamp NOT NULL,
  `STATUS_REASON` varchar(128) DEFAULT NULL,
  `PO_NOTE` varchar(256) DEFAULT NULL,
  `CS_PO_NOTE` varchar(256) DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL,
  `FK_PO_MEMBER_ID` int NOT NULL COMMENT 'FK_會員編號',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ID_idx` (`FK_PO_MEMBER_ID`),
  CONSTRAINT `FK_PO_MEMBER_ID` FOREIGN KEY (`FK_PO_MEMBER_ID`) REFERENCES `MEMBER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PO` */

insert  into `PO`(`ID`,`FREIGHT`,`ETD`,`SHIP_DATE`,`BL`,`STATUS`,`STATUS_DATE`,`STATUS_REASON`,`PO_NOTE`,`CS_PO_NOTE`,`CREATE_DATE`,`FK_PO_MEMBER_ID`) values 
(1,60,'2022-12-31',NULL,NULL,0,'2022-12-26 11:43:21',NULL,NULL,NULL,'2022-12-26 11:43:21',5);

/*Table structure for table `PO_DETAIL` */

DROP TABLE IF EXISTS `PO_DETAIL`;

CREATE TABLE `PO_DETAIL` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '訂單編號',
  `FK_PO_DETAIL_PRODUCT_ID` int NOT NULL COMMENT 'FK_商品編號',
  `UNIT_PRICE` mediumint NOT NULL COMMENT '單價',
  `QTY` tinyint NOT NULL COMMENT '下單數量',
  `FK_PO_DETAIL_PO_ID` int NOT NULL COMMENT 'FK_訂單_訂單編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_ID_idx` (`FK_PO_DETAIL_PRODUCT_ID`),
  KEY `FK_PO_ID_idx` (`FK_PO_DETAIL_PO_ID`),
  CONSTRAINT `FK_PO_DETAIL_PO_ID` FOREIGN KEY (`FK_PO_DETAIL_PO_ID`) REFERENCES `PO` (`ID`),
  CONSTRAINT `FK_PO_DETAIL_PRODUCT_ID` FOREIGN KEY (`FK_PO_DETAIL_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PO_DETAIL` */

insert  into `PO_DETAIL`(`ID`,`FK_PO_DETAIL_PRODUCT_ID`,`UNIT_PRICE`,`QTY`,`FK_PO_DETAIL_PO_ID`) values 
(1,1,960,3,1);

/*Table structure for table `PRODUCT` */

DROP TABLE IF EXISTS `PRODUCT`;

CREATE TABLE `PRODUCT` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品編號',
  `PRODUCT_NAME` varchar(100) NOT NULL COMMENT '商品名稱',
  `PERIOD` varchar(35) NOT NULL COMMENT '銷售期間',
  `STATUS` tinyint(1) NOT NULL COMMENT '商品頁狀態',
  `HIDE` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隱藏賣場',
  `PRICE` mediumint NOT NULL DEFAULT '0' COMMENT '商品單價',
  `DESC` mediumtext COMMENT '商品描述',
  `MAIN_PHOTO` varchar(256) DEFAULT NULL COMMENT '商品主圖',
  `STOCK_QTY` smallint NOT NULL COMMENT '庫存數量',
  `MAX_QTY` tinyint NOT NULL COMMENT '最大下單數量',
  `CREATE_DATE` timestamp NOT NULL COMMENT '商品新增日期',
  `EDIT_DATE` timestamp NOT NULL COMMENT '商品編輯日期',
  `FK_PRODUCT_PAGE_ID` int NOT NULL COMMENT 'FK_頁面編號',
  `FK_SUPPLIER_ID` int DEFAULT NULL COMMENT 'FK_供應商編號',
  `FK_PRODUCT_TYPE_ID` int NOT NULL COMMENT 'FK_商品類型編號',
  `SPEC` mediumtext COMMENT '規格',
  `NOTE` mediumtext COMMENT '備註',
  `FEATURED` varchar(256) NOT NULL COMMENT '商品賣點',
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_PRODUCT_TYPE_ID`),
  KEY `FK_SUPPLIER_ID_idx` (`FK_SUPPLIER_ID`),
  KEY `FK_PAGE_ID_idx1` (`FK_PRODUCT_PAGE_ID`),
  CONSTRAINT `FK_PRODUCT_PAGE_ID` FOREIGN KEY (`FK_PRODUCT_PAGE_ID`) REFERENCES `PAGE` (`ID`),
  CONSTRAINT `FK_PRODUCT_TYPE_ID` FOREIGN KEY (`FK_PRODUCT_TYPE_ID`) REFERENCES `PRODUCT_TYPE` (`ID`),
  CONSTRAINT `FK_SUPPLIER_ID` FOREIGN KEY (`FK_SUPPLIER_ID`) REFERENCES `SUPPLIER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PRODUCT` */

insert  into `PRODUCT`(`ID`,`PRODUCT_NAME`,`PERIOD`,`STATUS`,`HIDE`,`PRICE`,`DESC`,`MAIN_PHOTO`,`STOCK_QTY`,`MAX_QTY`,`CREATE_DATE`,`EDIT_DATE`,`FK_PRODUCT_PAGE_ID`,`FK_SUPPLIER_ID`,`FK_PRODUCT_TYPE_ID`,`SPEC`,`NOTE`,`FEATURED`) values 
(1,'蒙娜麗莎貓貓掛畫','2022/12/31 00:00 - 2046/12/31 00:00',0,0,960,'文藝復興時期畫家列奧納多·達芬奇所繪的一幅肖像畫與其代表作。<br>\n加上愛貓的作家為畫作添加了創意理念<br>\n讓生活充滿有趣的色彩。','../img/store/store04.jpg',9999,10,'2022-12-25 17:13:20','2022-12-25 17:13:20',2,1,1,'產品名稱：蒙娜麗莎貓掛畫\r<br>木框原料︰進口松木實木內框\r<br>專業畫布︰防水防皺專業油畫布\r<br>產品尺寸：(小)30x30cm  (中)40x50cm  (大)50x70cm','尺寸','進口松木實木內框\n,防水防皺專業油畫布\n,畫家限定少數款'),
(2,'自訂款迷你保溫瓶','2022/12/31 00:00 - 2046/12/31 00:00',0,0,590,'輕巧便攜：<br />\n                迷你保溫瓶容量為350ml，重量僅190g，無論去到哪，都可以輕鬆攜帶。<br />\n                <br>\n                長效保溫鎖冷：<br />\n                無論冬天還是夏天，冷水還是熱水，都可以保持長效保溫和保冷。<br />\n                <br>\n                SUS 304不鏽鋼安全材質：<br />\n                採用SUS\n                304食品級不鏽鋼材質，抗氧化、耐腐蝕、易清潔，讓您輕鬆健康飲水。<br />\n                <br>\n                真空技術：<br />\n                採用不鏽鋼真空技術，有效阻隔溫度傳導，打造保溫鎖冷效果。<br />\n                <br>\n                保溫測試：<br />\n                在20°C±5°C的室內溫度下，將100°C的水倒入至密封蓋下端。<br />\n                當水溫降至95°C±1°C時，立即拴緊杯蓋。6小時後杯內水溫不低於58℃。<br />\n                <br>\n                保冷測試：<br />\n                在20°C±5℃的室內溫度下，將冰水倒入至密封蓋的下端。<br />\n                當水溫升至4℃±1℃時，拴緊蓋子。6小時後杯內水溫不高於12°C。','../img/product_detail/item01.png',9999,10,'2023-01-08 10:58:00','2023-01-08 10:58:00',2,NULL,2,'產品名稱：自訂款迷你保溫杯<br />\n                保溫效率：高於58°C（6小時）<br />\n                冷藏效率：低於12°C（6小時）<br />\n                產品材質：SUS304不鏽鋼<br />\n                產品容量：350ml<br />\n                產品重量：190g<br />\n                產品尺寸：60 x 60 x 180mm','顏色','採用SUS304不鏽鋼材質，讓你安心飲用,小巧便攜，重量僅200克, 長效保溫保冷');

/*Table structure for table `PRODUCT_PIC` */

DROP TABLE IF EXISTS `PRODUCT_PIC`;

CREATE TABLE `PRODUCT_PIC` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品圖編號',
  `PATH` varchar(128) NOT NULL COMMENT '商品圖路徑',
  `FK_PRODUCT_PIC_PRODUCT_ID` int NOT NULL COMMENT 'FK_商品編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_PIC_PRODUCT_ID_idx` (`FK_PRODUCT_PIC_PRODUCT_ID`),
  CONSTRAINT `FK_PRODUCT_PIC_PRODUCT_ID` FOREIGN KEY (`FK_PRODUCT_PIC_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='商品圖';

/*Data for the table `PRODUCT_PIC` */

insert  into `PRODUCT_PIC`(`ID`,`PATH`,`FK_PRODUCT_PIC_PRODUCT_ID`) values 
(1,'aaa',1),
(2,'../img/product_detail/item01_01.png',2),
(3,'../img/product_detail/item01_02.png',2),
(4,'../img/product_detail/item01_03.png',2);

/*Table structure for table `PRODUCT_SPEC` */

DROP TABLE IF EXISTS `PRODUCT_SPEC`;

CREATE TABLE `PRODUCT_SPEC` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品規格編號',
  `SPEC` varchar(45) NOT NULL COMMENT '商品規格',
  `FK_PRODUCT_SPEC_PRODUCT_ID` int NOT NULL COMMENT 'FK_商品編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_SPEC_PRODUCT_ID_idx` (`FK_PRODUCT_SPEC_PRODUCT_ID`),
  CONSTRAINT `FK_PRODUCT_SPEC_PRODUCT_ID` FOREIGN KEY (`FK_PRODUCT_SPEC_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='商品規格';

/*Data for the table `PRODUCT_SPEC` */

insert  into `PRODUCT_SPEC`(`ID`,`SPEC`,`FK_PRODUCT_SPEC_PRODUCT_ID`) values 
(1,'黑色',2),
(2,'藍色',2),
(3,'粉色',2),
(4,'30x30cm',1),
(5,'40x50cm',1),
(6,'50x70cm',1);

/*Table structure for table `PRODUCT_TYPE` */

DROP TABLE IF EXISTS `PRODUCT_TYPE`;

CREATE TABLE `PRODUCT_TYPE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品類型編號',
  `PRODUCT_TYPE_NAME` varchar(45) NOT NULL COMMENT '商品類型名稱',
  `DESC` varchar(100) DEFAULT NULL COMMENT '商品類型描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PRODUCT_TYPE` */

insert  into `PRODUCT_TYPE`(`ID`,`PRODUCT_TYPE_NAME`,`DESC`) values 
(1,'平面畫作','2D畫作不限大小'),
(2,'生活用品','生活用品');

/*Table structure for table `ROLE` */

DROP TABLE IF EXISTS `ROLE`;

CREATE TABLE `ROLE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESC` varchar(45) NOT NULL COMMENT '權限描述',
  `INDEX` varchar(45) NOT NULL COMMENT '後台首頁',
  `INDEX_LEVEL` tinyint NOT NULL COMMENT '首頁權限',
  `OVERVIEW` varchar(45) NOT NULL COMMENT '後台銷售狀況',
  `OVERVIEW_LEVEL` tinyint NOT NULL COMMENT '銷售概況權限',
  `PO` varchar(45) NOT NULL COMMENT '後台訂單頁',
  `PO_LEVEL` tinyint NOT NULL COMMENT '訂單頁權限',
  `PRODUCT` varchar(45) NOT NULL COMMENT '後台商品頁',
  `PRODUCT_LEVEL` tinyint NOT NULL COMMENT '商品頁權限',
  `INFO` varchar(45) NOT NULL COMMENT '後台消息頁',
  `INFO_LEVEL` tinyint NOT NULL COMMENT '消息頁權限',
  `RENTAL` varchar(45) NOT NULL COMMENT '後台場地頁',
  `RENTAL_LEVEL` tinyint NOT NULL COMMENT '埸地頁權限',
  `MEMBER` varchar(45) NOT NULL COMMENT '後台會員頁',
  `MEMBER_LEVEL` tinyint NOT NULL COMMENT '會員頁權限',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Data for the table `ROLE` */

insert  into `ROLE`(`ID`,`DESC`,`INDEX`,`INDEX_LEVEL`,`OVERVIEW`,`OVERVIEW_LEVEL`,`PO`,`PO_LEVEL`,`PRODUCT`,`PRODUCT_LEVEL`,`INFO`,`INFO_LEVEL`,`RENTAL`,`RENTAL_LEVEL`,`MEMBER`,`MEMBER_LEVEL`) values 
(1,'admin管理員','後台主頁權限',0,'後台銷售概況權限',0,'後台訂單權限',0,'後台商品頁權限',0,'後台消息頁',0,'後台場地頁',0,'後台會員頁',0),
(2,'member一般會員','後台主頁權限',1,'後台銷售概況權限',1,'後台訂單權限',1,'後台商品頁權限',1,'後台消息頁',1,'後台場地頁',1,'後台會員頁',1);

/*Table structure for table `SUPPLIER` */

DROP TABLE IF EXISTS `SUPPLIER`;

CREATE TABLE `SUPPLIER` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '供應商編號',
  `SUPPLIER_NAME` varchar(45) NOT NULL COMMENT '供應商名稱',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `SUPPLIER` */

insert  into `SUPPLIER`(`ID`,`SUPPLIER_NAME`) values 
(1,'日本畫展');

/*Table structure for table `b_member` */

DROP TABLE IF EXISTS `b_member`;

/*!50001 DROP VIEW IF EXISTS `b_member` */;
/*!50001 DROP TABLE IF EXISTS `b_member` */;

/*!50001 CREATE TABLE  `b_member`(
 `ID` int ,
 `USERNAME` varchar(100) ,
 `VERIFY` tinyint(1) ,
 `EMAIL` varchar(100) ,
 `DESC` varchar(45) 
)*/;

/*Table structure for table `b_member_detail` */

DROP TABLE IF EXISTS `b_member_detail`;

/*!50001 DROP VIEW IF EXISTS `b_member_detail` */;
/*!50001 DROP TABLE IF EXISTS `b_member_detail` */;

/*!50001 CREATE TABLE  `b_member_detail`(
 `ID` int ,
 `USERNAME` varchar(100) ,
 `EMAIL` varchar(100) ,
 `PASSWORD` varchar(45) ,
 `PHONE` varchar(10) ,
 `VERIFY` tinyint(1) ,
 `FK_ROLE_ID` int ,
 `ZIP` varchar(5) ,
 `REGION` varchar(45) ,
 `DISTRICT` varchar(45) ,
 `LOCATION` varchar(256) 
)*/;

/*Table structure for table `b_news_detail` */

DROP TABLE IF EXISTS `b_news_detail`;

/*!50001 DROP VIEW IF EXISTS `b_news_detail` */;
/*!50001 DROP TABLE IF EXISTS `b_news_detail` */;

/*!50001 CREATE TABLE  `b_news_detail`(
 `ID` int ,
 `TITLE` varchar(100) ,
 `CONTENT` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `PERIOD` varchar(35) ,
 `STATUS` tinyint(1) ,
 `CREATE_DATE` timestamp ,
 `EDIT_DATE` timestamp ,
 `FK_INFO_PAGE_ID` int ,
 `FK_INFO_TYPE_ID` int ,
 `DESC` varchar(100) 
)*/;

/*Table structure for table `b_product` */

DROP TABLE IF EXISTS `b_product`;

/*!50001 DROP VIEW IF EXISTS `b_product` */;
/*!50001 DROP TABLE IF EXISTS `b_product` */;

/*!50001 CREATE TABLE  `b_product`(
 `ID` int ,
 `product_NAME` varchar(100) ,
 `PERIOD` varchar(35) ,
 `STATUS` tinyint(1) ,
 `HIDE` tinyint(1) ,
 `PRICE` mediumint ,
 `MAIN_PHOTO` varchar(256) 
)*/;

/*Table structure for table `b_product_detail` */

DROP TABLE IF EXISTS `b_product_detail`;

/*!50001 DROP VIEW IF EXISTS `b_product_detail` */;
/*!50001 DROP TABLE IF EXISTS `b_product_detail` */;

/*!50001 CREATE TABLE  `b_product_detail`(
 `ID` int ,
 `PRODUCT_NAME` varchar(100) ,
 `PERIOD` varchar(35) ,
 `STATUS` tinyint(1) ,
 `HIDE` tinyint(1) ,
 `PRICE` mediumint ,
 `DESC` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `STOCK_QTY` smallint ,
 `MAX_QTY` tinyint ,
 `CREATE_DATE` timestamp ,
 `EDIT_DATE` timestamp ,
 `FK_PRODUCT_PAGE_ID` int ,
 `FK_SUPPLIER_ID` int ,
 `FK_PRODUCT_TYPE_ID` int ,
 `SPEC` mediumtext ,
 `NOTE` mediumtext ,
 `PRODUCT_TYPE_NAME` varchar(45) ,
 `SUPPLIER_NAME` varchar(45) ,
 `PATH` varchar(128) 
)*/;

/*Table structure for table `b_rental` */

DROP TABLE IF EXISTS `b_rental`;

/*!50001 DROP VIEW IF EXISTS `b_rental` */;
/*!50001 DROP TABLE IF EXISTS `b_rental` */;

/*!50001 CREATE TABLE  `b_rental`(
 `ID` int ,
 `NAME` varchar(45) ,
 `PRICE` mediumint ,
 `DESC` json ,
 `MAIN_PHOTO` json ,
 `LOCATED` varchar(64) ,
 `STATUS` tinyint(1) 
)*/;

/*Table structure for table `b_rental_detail` */

DROP TABLE IF EXISTS `b_rental_detail`;

/*!50001 DROP VIEW IF EXISTS `b_rental_detail` */;
/*!50001 DROP TABLE IF EXISTS `b_rental_detail` */;

/*!50001 CREATE TABLE  `b_rental_detail`(
 `ID` int ,
 `NAME` varchar(45) ,
 `PRICE` mediumint ,
 `DESC` json ,
 `DEVICE` varchar(256) ,
 `RULE` varchar(256) ,
 `AREA` varchar(128) ,
 `MAIN_PHOTO` json ,
 `LOCATED` varchar(64) ,
 `STATUS` tinyint(1) 
)*/;

/*Table structure for table `f_expo` */

DROP TABLE IF EXISTS `f_expo`;

/*!50001 DROP VIEW IF EXISTS `f_expo` */;
/*!50001 DROP TABLE IF EXISTS `f_expo` */;

/*!50001 CREATE TABLE  `f_expo`(
 `ID` int ,
 `TITLE` varchar(128) ,
 `MAIN_PHOTO` varchar(256) ,
 `START_DATE` date ,
 `END_DATE` date ,
 `TYPE` varchar(45) 
)*/;

/*Table structure for table `f_expo_inner` */

DROP TABLE IF EXISTS `f_expo_inner`;

/*!50001 DROP VIEW IF EXISTS `f_expo_inner` */;
/*!50001 DROP TABLE IF EXISTS `f_expo_inner` */;

/*!50001 CREATE TABLE  `f_expo_inner`(
 `ID` int ,
 `TITLE` varchar(128) ,
 `CONTENT` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `START_DATE` date ,
 `END_DATE` date ,
 `ADULT_PRICE` smallint ,
 `CONC_PRICE` smallint ,
 `GROUP_PRICE` smallint ,
 `TYPE` varchar(45) 
)*/;

/*Table structure for table `f_index_1` */

DROP TABLE IF EXISTS `f_index_1`;

/*!50001 DROP VIEW IF EXISTS `f_index_1` */;
/*!50001 DROP TABLE IF EXISTS `f_index_1` */;

/*!50001 CREATE TABLE  `f_index_1`(
 `TITLE` varchar(128) ,
 `CONTENT` mediumtext ,
 `MAIN_PHOTO` varchar(256) 
)*/;

/*Table structure for table `f_index_2` */

DROP TABLE IF EXISTS `f_index_2`;

/*!50001 DROP VIEW IF EXISTS `f_index_2` */;
/*!50001 DROP TABLE IF EXISTS `f_index_2` */;

/*!50001 CREATE TABLE  `f_index_2`(
 `TITLE` varchar(100) ,
 `EDIT_DATE` timestamp ,
 `DESC` varchar(100) 
)*/;

/*Table structure for table `f_news` */

DROP TABLE IF EXISTS `f_news`;

/*!50001 DROP VIEW IF EXISTS `f_news` */;
/*!50001 DROP TABLE IF EXISTS `f_news` */;

/*!50001 CREATE TABLE  `f_news`(
 `ID` int ,
 `TITLE` varchar(100) ,
 `STATUS` tinyint(1) ,
 `CREATE_DATE` timestamp ,
 `DESC` varchar(100) 
)*/;

/*Table structure for table `f_news_inner` */

DROP TABLE IF EXISTS `f_news_inner`;

/*!50001 DROP VIEW IF EXISTS `f_news_inner` */;
/*!50001 DROP TABLE IF EXISTS `f_news_inner` */;

/*!50001 CREATE TABLE  `f_news_inner`(
 `ID` int ,
 `TITLE` varchar(100) ,
 `CONTENT` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `STATUS` tinyint(1) ,
 `CREATE_DATE` timestamp ,
 `DESC` varchar(100) 
)*/;

/*Table structure for table `f_rental` */

DROP TABLE IF EXISTS `f_rental`;

/*!50001 DROP VIEW IF EXISTS `f_rental` */;
/*!50001 DROP TABLE IF EXISTS `f_rental` */;

/*!50001 CREATE TABLE  `f_rental`(
 `ID` int ,
 `NAME` varchar(45) ,
 `PRICE` mediumint ,
 `DESC` json ,
 `DEVICE` varchar(256) ,
 `RULE` varchar(256) ,
 `AREA` varchar(128) ,
 `MAIN_PHOTO` json ,
 `LOCATED` varchar(64) ,
 `STATUS` tinyint(1) 
)*/;

/*Table structure for table `f_rental_inner` */

DROP TABLE IF EXISTS `f_rental_inner`;

/*!50001 DROP VIEW IF EXISTS `f_rental_inner` */;
/*!50001 DROP TABLE IF EXISTS `f_rental_inner` */;

/*!50001 CREATE TABLE  `f_rental_inner`(
 `ID` int ,
 `NAME` varchar(45) ,
 `MAIN_PHOTO` json ,
 `START_DATE` date ,
 `END_DATE` date 
)*/;

/*Table structure for table `f_store` */

DROP TABLE IF EXISTS `f_store`;

/*!50001 DROP VIEW IF EXISTS `f_store` */;
/*!50001 DROP TABLE IF EXISTS `f_store` */;

/*!50001 CREATE TABLE  `f_store`(
 `ID` int ,
 `PRODUCT_NAME` varchar(100) ,
 `PERIOD` varchar(35) ,
 `STATUS` tinyint(1) ,
 `HIDE` tinyint(1) ,
 `PRICE` mediumint ,
 `MAIN_PHOTO` varchar(256) ,
 `PRODUCT_TYPE_NAME` varchar(45) ,
 `SUPPLIER_NAME` varchar(45) 
)*/;

/*Table structure for table `f_store_product` */

DROP TABLE IF EXISTS `f_store_product`;

/*!50001 DROP VIEW IF EXISTS `f_store_product` */;
/*!50001 DROP TABLE IF EXISTS `f_store_product` */;

/*!50001 CREATE TABLE  `f_store_product`(
 `ID` int ,
 `PRODUCT_NAME` varchar(100) ,
 `PERIOD` varchar(35) ,
 `STATUS` tinyint(1) ,
 `HIDE` tinyint(1) ,
 `PRICE` mediumint ,
 `DESC` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `STOCK_QTY` smallint ,
 `MAX_QTY` tinyint ,
 `SUPPLIER_NAME` varchar(45) ,
 `PRODUCT_TYPE_NAME` varchar(45) ,
 `PATH` varchar(128) 
)*/;

/*View structure for view b_member */

/*!50001 DROP TABLE IF EXISTS `b_member` */;
/*!50001 DROP VIEW IF EXISTS `b_member` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_member` AS select `m`.`ID` AS `ID`,`m`.`USERNAME` AS `USERNAME`,`m`.`VERIFY` AS `VERIFY`,`m`.`EMAIL` AS `EMAIL`,`r`.`DESC` AS `DESC` from (`member` `m` join `role` `r` on((`m`.`FK_ROLE_ID` = `r`.`ID`))) */;

/*View structure for view b_member_detail */

/*!50001 DROP TABLE IF EXISTS `b_member_detail` */;
/*!50001 DROP VIEW IF EXISTS `b_member_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_member_detail` AS select `m`.`ID` AS `ID`,`m`.`USERNAME` AS `USERNAME`,`m`.`EMAIL` AS `EMAIL`,`m`.`PASSWORD` AS `PASSWORD`,`m`.`PHONE` AS `PHONE`,`m`.`VERIFY` AS `VERIFY`,`m`.`FK_ROLE_ID` AS `FK_ROLE_ID`,`a`.`ZIP` AS `ZIP`,`a`.`REGION` AS `REGION`,`a`.`DISTRICT` AS `DISTRICT`,`a`.`LOCATION` AS `LOCATION` from (`member` `m` join `address` `a` on((`m`.`ID` = `a`.`FK_ADDRESS_MEMBER_ID`))) */;

/*View structure for view b_news_detail */

/*!50001 DROP TABLE IF EXISTS `b_news_detail` */;
/*!50001 DROP VIEW IF EXISTS `b_news_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_news_detail` AS select `i`.`ID` AS `ID`,`i`.`TITLE` AS `TITLE`,`i`.`CONTENT` AS `CONTENT`,`i`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`i`.`PERIOD` AS `PERIOD`,`i`.`STATUS` AS `STATUS`,`i`.`CREATE_DATE` AS `CREATE_DATE`,`i`.`EDIT_DATE` AS `EDIT_DATE`,`i`.`FK_INFO_PAGE_ID` AS `FK_INFO_PAGE_ID`,`i`.`FK_INFO_TYPE_ID` AS `FK_INFO_TYPE_ID`,`it`.`DESC` AS `DESC` from (`info` `i` join `info_type` `it` on((`i`.`FK_INFO_TYPE_ID` = `it`.`ID`))) */;

/*View structure for view b_product */

/*!50001 DROP TABLE IF EXISTS `b_product` */;
/*!50001 DROP VIEW IF EXISTS `b_product` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_product` AS select `product`.`ID` AS `ID`,`product`.`PRODUCT_NAME` AS `product_NAME`,`product`.`PERIOD` AS `PERIOD`,`product`.`STATUS` AS `STATUS`,`product`.`HIDE` AS `HIDE`,`product`.`PRICE` AS `PRICE`,`product`.`MAIN_PHOTO` AS `MAIN_PHOTO` from `product` */;

/*View structure for view b_product_detail */

/*!50001 DROP TABLE IF EXISTS `b_product_detail` */;
/*!50001 DROP VIEW IF EXISTS `b_product_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_product_detail` AS select `p`.`ID` AS `ID`,`p`.`PRODUCT_NAME` AS `PRODUCT_NAME`,`p`.`PERIOD` AS `PERIOD`,`p`.`STATUS` AS `STATUS`,`p`.`HIDE` AS `HIDE`,`p`.`PRICE` AS `PRICE`,`p`.`DESC` AS `DESC`,`p`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`p`.`STOCK_QTY` AS `STOCK_QTY`,`p`.`MAX_QTY` AS `MAX_QTY`,`p`.`CREATE_DATE` AS `CREATE_DATE`,`p`.`EDIT_DATE` AS `EDIT_DATE`,`p`.`FK_PRODUCT_PAGE_ID` AS `FK_PRODUCT_PAGE_ID`,`p`.`FK_SUPPLIER_ID` AS `FK_SUPPLIER_ID`,`p`.`FK_PRODUCT_TYPE_ID` AS `FK_PRODUCT_TYPE_ID`,`p`.`SPEC` AS `SPEC`,`p`.`NOTE` AS `NOTE`,`pt`.`PRODUCT_TYPE_NAME` AS `PRODUCT_TYPE_NAME`,`s`.`SUPPLIER_NAME` AS `SUPPLIER_NAME`,`pp`.`PATH` AS `PATH` from (((`product` `p` join `product_type` `pt` on((`p`.`FK_PRODUCT_TYPE_ID` = `pt`.`ID`))) join `supplier` `s` on((`p`.`FK_SUPPLIER_ID` = `s`.`ID`))) join `product_pic` `pp` on((`pp`.`FK_PRODUCT_PIC_PRODUCT_ID` = `p`.`ID`))) */;

/*View structure for view b_rental */

/*!50001 DROP TABLE IF EXISTS `b_rental` */;
/*!50001 DROP VIEW IF EXISTS `b_rental` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_rental` AS select `location`.`ID` AS `ID`,`location`.`NAME` AS `NAME`,`location`.`PRICE` AS `PRICE`,`location`.`DESC` AS `DESC`,`location`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`location`.`LOCATED` AS `LOCATED`,`location`.`STATUS` AS `STATUS` from `location` */;

/*View structure for view b_rental_detail */

/*!50001 DROP TABLE IF EXISTS `b_rental_detail` */;
/*!50001 DROP VIEW IF EXISTS `b_rental_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_rental_detail` AS select `l`.`ID` AS `ID`,`l`.`NAME` AS `NAME`,`l`.`PRICE` AS `PRICE`,`l`.`DESC` AS `DESC`,`l`.`DEVICE` AS `DEVICE`,`l`.`RULE` AS `RULE`,`l`.`AREA` AS `AREA`,`l`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`l`.`LOCATED` AS `LOCATED`,`l`.`STATUS` AS `STATUS` from `location` `l` */;

/*View structure for view f_expo */

/*!50001 DROP TABLE IF EXISTS `f_expo` */;
/*!50001 DROP VIEW IF EXISTS `f_expo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_expo` AS select `e`.`ID` AS `ID`,`e`.`TITLE` AS `TITLE`,`e`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`e`.`START_DATE` AS `START_DATE`,`e`.`END_DATE` AS `END_DATE`,`p`.`TYPE` AS `TYPE` from (`expo` `e` join `page` `p` on((`e`.`FK_EXPO_PAGE_ID` = `p`.`ID`))) */;

/*View structure for view f_expo_inner */

/*!50001 DROP TABLE IF EXISTS `f_expo_inner` */;
/*!50001 DROP VIEW IF EXISTS `f_expo_inner` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_expo_inner` AS select `e`.`ID` AS `ID`,`e`.`TITLE` AS `TITLE`,`e`.`CONTENT` AS `CONTENT`,`e`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`e`.`START_DATE` AS `START_DATE`,`e`.`END_DATE` AS `END_DATE`,`e`.`ADULT_PRICE` AS `ADULT_PRICE`,`e`.`CONC_PRICE` AS `CONC_PRICE`,`e`.`GROUP_PRICE` AS `GROUP_PRICE`,`p`.`TYPE` AS `TYPE` from (`expo` `e` join `page` `p` on((`e`.`FK_EXPO_PAGE_ID` = `p`.`ID`))) */;

/*View structure for view f_index_1 */

/*!50001 DROP TABLE IF EXISTS `f_index_1` */;
/*!50001 DROP VIEW IF EXISTS `f_index_1` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_index_1` AS select `expo`.`TITLE` AS `TITLE`,`expo`.`CONTENT` AS `CONTENT`,`expo`.`MAIN_PHOTO` AS `MAIN_PHOTO` from `expo` */;

/*View structure for view f_index_2 */

/*!50001 DROP TABLE IF EXISTS `f_index_2` */;
/*!50001 DROP VIEW IF EXISTS `f_index_2` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_index_2` AS select `i`.`TITLE` AS `TITLE`,`i`.`EDIT_DATE` AS `EDIT_DATE`,`it`.`DESC` AS `DESC` from (`info` `i` join `info_type` `it` on((`i`.`FK_INFO_TYPE_ID` = `it`.`ID`))) */;

/*View structure for view f_news */

/*!50001 DROP TABLE IF EXISTS `f_news` */;
/*!50001 DROP VIEW IF EXISTS `f_news` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_news` AS select `i`.`ID` AS `ID`,`i`.`TITLE` AS `TITLE`,`i`.`STATUS` AS `STATUS`,`i`.`CREATE_DATE` AS `CREATE_DATE`,`it`.`DESC` AS `DESC` from (`info` `i` join `info_type` `it` on((`i`.`FK_INFO_TYPE_ID` = `it`.`ID`))) */;

/*View structure for view f_news_inner */

/*!50001 DROP TABLE IF EXISTS `f_news_inner` */;
/*!50001 DROP VIEW IF EXISTS `f_news_inner` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_news_inner` AS select `i`.`ID` AS `ID`,`i`.`TITLE` AS `TITLE`,`i`.`CONTENT` AS `CONTENT`,`i`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`i`.`STATUS` AS `STATUS`,`i`.`CREATE_DATE` AS `CREATE_DATE`,`it`.`DESC` AS `DESC` from (`info` `i` join `info_type` `it` on((`i`.`FK_INFO_TYPE_ID` = `it`.`ID`))) */;

/*View structure for view f_rental */

/*!50001 DROP TABLE IF EXISTS `f_rental` */;
/*!50001 DROP VIEW IF EXISTS `f_rental` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_rental` AS select `location`.`ID` AS `ID`,`location`.`NAME` AS `NAME`,`location`.`PRICE` AS `PRICE`,`location`.`DESC` AS `DESC`,`location`.`DEVICE` AS `DEVICE`,`location`.`RULE` AS `RULE`,`location`.`AREA` AS `AREA`,`location`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`location`.`LOCATED` AS `LOCATED`,`location`.`STATUS` AS `STATUS` from `location` */;

/*View structure for view f_rental_inner */

/*!50001 DROP TABLE IF EXISTS `f_rental_inner` */;
/*!50001 DROP VIEW IF EXISTS `f_rental_inner` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_rental_inner` AS select `l`.`ID` AS `ID`,`l`.`NAME` AS `NAME`,`l`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`b`.`START_DATE` AS `START_DATE`,`b`.`END_DATE` AS `END_DATE` from (`location` `l` join `booking` `b` on((`l`.`ID` = `b`.`FK_LOCATION_ID`))) */;

/*View structure for view f_store */

/*!50001 DROP TABLE IF EXISTS `f_store` */;
/*!50001 DROP VIEW IF EXISTS `f_store` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_store` AS select `p`.`ID` AS `ID`,`p`.`PRODUCT_NAME` AS `PRODUCT_NAME`,`p`.`PERIOD` AS `PERIOD`,`p`.`STATUS` AS `STATUS`,`p`.`HIDE` AS `HIDE`,`p`.`PRICE` AS `PRICE`,`p`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`pt`.`PRODUCT_TYPE_NAME` AS `PRODUCT_TYPE_NAME`,`s`.`SUPPLIER_NAME` AS `SUPPLIER_NAME` from ((`product` `p` join `product_type` `pt` on((`p`.`FK_PRODUCT_TYPE_ID` = `pt`.`ID`))) join `supplier` `s` on((`p`.`FK_SUPPLIER_ID` = `s`.`ID`))) */;

/*View structure for view f_store_product */

/*!50001 DROP TABLE IF EXISTS `f_store_product` */;
/*!50001 DROP VIEW IF EXISTS `f_store_product` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_store_product` AS select `p`.`ID` AS `ID`,`p`.`PRODUCT_NAME` AS `PRODUCT_NAME`,`p`.`PERIOD` AS `PERIOD`,`p`.`STATUS` AS `STATUS`,`p`.`HIDE` AS `HIDE`,`p`.`PRICE` AS `PRICE`,`p`.`DESC` AS `DESC`,`p`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`p`.`STOCK_QTY` AS `STOCK_QTY`,`p`.`MAX_QTY` AS `MAX_QTY`,`s`.`SUPPLIER_NAME` AS `SUPPLIER_NAME`,`pt`.`PRODUCT_TYPE_NAME` AS `PRODUCT_TYPE_NAME`,`pp`.`PATH` AS `PATH` from (((`product` `p` join `supplier` `s` on((`p`.`FK_SUPPLIER_ID` = `s`.`ID`))) join `product_type` `pt` on((`p`.`FK_PRODUCT_TYPE_ID` = `pt`.`ID`))) join `product_pic` `pp` on((`pp`.`FK_PRODUCT_PIC_PRODUCT_ID` = `p`.`ID`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
