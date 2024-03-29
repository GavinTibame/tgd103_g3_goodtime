/*
SQLyog Community v13.1.5  (64 bit)
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
  `ACTIVITY_NAME` varchar(64) NOT NULL COMMENT '活動名稱',
  `APPLICANT` varchar(128) NOT NULL COMMENT '申請單位',
  `PRINCIPAL` varchar(45) NOT NULL COMMENT '負責人姓名',
  `GROUP_TYPE` varchar(45) NOT NULL COMMENT '單位類別',
  `ID_PIC` varchar(256) NOT NULL COMMENT '上傳證件',
  `CONTACT_NAME` varchar(128) NOT NULL COMMENT '聯絡人姓名',
  `TEL` varchar(45) NOT NULL COMMENT '聯絡人電話',
  `ACTIVITY_TYPE` varchar(45) NOT NULL COMMENT '活動性質',
  `SEE_TYPE` varchar(45) NOT NULL COMMENT '觀賞性質',
  `OTHER` varchar(128) DEFAULT NULL COMMENT '其他需求',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ID_idx` (`FK_BOOKING_MEMBER_ID`),
  KEY `FK_LOCATION_ID_idx` (`FK_LOCATION_ID`),
  CONSTRAINT `FK_BOOKING_MEMBER_ID` FOREIGN KEY (`FK_BOOKING_MEMBER_ID`) REFERENCES `MEMBER` (`ID`),
  CONSTRAINT `FK_LOCATION_ID` FOREIGN KEY (`FK_LOCATION_ID`) REFERENCES `LOCATION` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `BOOKING` */

insert  into `BOOKING`(`ID`,`PRICE`,`STATUS`,`STATUS_DATE`,`STATUS_REASON`,`START_DATE`,`END_DATE`,`BOOKING_NOTE`,`CS_BOOKING_NOTE`,`CREATE_DATE`,`FK_BOOKING_MEMBER_ID`,`FK_LOCATION_ID`,`ACTIVITY_NAME`,`APPLICANT`,`PRINCIPAL`,`GROUP_TYPE`,`ID_PIC`,`CONTACT_NAME`,`TEL`,`ACTIVITY_TYPE`,`SEE_TYPE`,`OTHER`) values 
(1,10000,0,'2022-12-25 16:54:25','','2022-12-31','2023-01-07','BOOKING_NOTE','','2022-12-25 16:54:25',5,1,'','','','','','','','','',NULL);

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
  `TAG1` varchar(12) DEFAULT NULL COMMENT '展演活動標籤(上)',
  `TAG2` varchar(12) DEFAULT NULL COMMENT '展演活動標籤(下)',
  `BANNER_PHOTO` varchar(256) DEFAULT NULL COMMENT '活動內頁BANNER照片路徑',
  `INFO` mediumtext COMMENT '展覽資訊',
  `STATUS` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_EXPO_PAGE_ID`),
  KEY `FK_BOOKING_ID_idx` (`FK_BOOKING_ID`),
  CONSTRAINT `FK_BOOKING_ID` FOREIGN KEY (`FK_BOOKING_ID`) REFERENCES `BOOKING` (`ID`),
  CONSTRAINT `FK_EXPO_PAGE_ID` FOREIGN KEY (`FK_EXPO_PAGE_ID`) REFERENCES `PAGE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

/*Data for the table `EXPO` */

insert  into `EXPO`(`ID`,`TITLE`,`CONTENT`,`MAIN_PHOTO`,`FK_EXPO_PAGE_ID`,`START_DATE`,`END_DATE`,`CREATE_DATE`,`EDIT_DATE`,`ADULT_PRICE`,`CONC_PRICE`,`GROUP_PRICE`,`FK_BOOKING_ID`,`TAG1`,`TAG2`,`BANNER_PHOTO`,`INFO`,`STATUS`) values 
(1,'《Lindsayooo》新興畫家特展','最近在Instagram點擊量爆增粉絲人數達百萬最熱門的新創插畫家Lindsayoo，畫家細膩的筆觸與寫實的作畫風格，短時間快速達到百萬人數訂閱，應許多粉絲留言要求，多次連繫畫家展出活動接洽此次為韶光文創園區特別限定期間展出，千萬不要錯過好機會！限定期間2024.12.01~2024.12.32 ，購票即送限量明信片。','../img/event/',3,'2022-12-26','2023-01-15','2022-12-26 12:36:13','2023-01-26 13:59:47',3000,250,230,NULL,'活動特展','手繪限定油畫',NULL,NULL,1),
(2,'《國際婚紗展》2023台北國際婚紗展','婚禮體驗採購 輕鬆一站購足','../img/event_detail/banner2.png',3,'2023-01-16','2023-02-21','2022-01-23 16:11:25','2022-01-23 16:11:25',150,130,100,NULL,'活動特展','人氣喜餅',NULL,NULL,2),
(3,'《崖下的波妞》十周年特展','由吉卜力工作室製作的動畫「崖上的波妞」，今年剛好是10週年。為此，吉卜力週邊專賣店橡子共和國推出了一系列超萌的波妞掌上玩偶，5月中起在日本全國的橡子共和國店面及網路商店販售，6月更計畫加碼推出戲水組合，結合水槍功能還有紗網收納袋。','../img/event_detail/banner3.png',3,'2023-01-06','2023-03-31','2022-01-23 16:14:28','2022-01-23 16:14:28',300,250,230,NULL,'吉卜力特展','波妞造型人氣麻糬',NULL,NULL,1),
(4,'《新海誠》童話特展','新海誠展 從《星之聲》到《你的名字。》」海外首站特展，五大看點','../img/event_detail/banner4.png',3,'2023-01-16','2023-02-28','2022-01-23 16:16:55','2022-01-23 16:16:55',300,250,230,NULL,'電影特展','台灣限定明信片',NULL,NULL,2),
(5,'《ヒグチユウコ》台灣限定特展','ヒグチユウコ(Higuchi Yuko)，樋口裕子為居住於日本的專業畫家和繪本作家。曾多次與 GUCCI 等多家公司合作。','../img/event_detail/banner5.png',3,'2023-02-01','2023-03-01','2022-01-23 16:18:02','2022-01-23 16:18:02',350,300,250,NULL,'插畫特展','台灣限定周邊絲巾',NULL,NULL,1),
(6,'《再見梵谷》光影體驗展','首展至今十餘年，巡迴超過70個城市，《再見梵谷-光影體驗展》因應場地環境不斷蛻變，讓這個展覽宛如有機體般，持續更新、進化，每每呈現大異其趣而各自精彩的面貌。繼2022年台北站與高雄站之後，睽違兩年來到文化之都台南，製作團隊再度大膽突破展覽過去規格，巡迴十多年來首度加入黑色鏡面視覺效果，將三十多座巨幕環繞的視覺饗宴向下延伸，讓觀眾一腳踩進展區瞬間，便宛如陷入梵谷瑰麗迷幻的異境，將沈浸式體驗再度升級，顛覆台北站、高雄站的體驗，帶給觀眾截然不同的感官震撼。','../img/event_detail/banner6.png',3,'2023-01-26','2023-03-31','2022-01-23 16:22:57','2022-01-23 16:22:57',350,300,250,NULL,'名匠特展','原稿明信片',NULL,NULL,1),
(7,'《Game Show》台北國際電玩展','由台北市電腦公會主辦的「台北國際電玩展 Taipei Game Show」，自2003年起，從僅有幾千人的參觀人潮，到如今已成為全國數十萬玩家每年必到的朝聖地。見證遊戲產業的興起與歷經草創時期的艱辛，台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展自2021年起以雙軌並行方式，舉辦線上暨線下展覽，並推出Taipei Game Show ONLINE，藉由線上節目讓全球注目的大作進行新訊發表，為世界各地的產業人士與玩家帶來全方位最新遊戲體驗。','../img/event_detail/banner7.png',3,'2023-02-01','2023-02-08','2022-01-23 16:26:14','2022-01-23 16:26:14',250,230,200,NULL,'國際電玩展','限定紀念品',NULL,NULL,1),
(8,'《諸神黃昏》北歐神話特展','即便在北歐神話裡，諸神也並非長生不死。諸神明白所有九個國度的居住者最終全面滅亡。這意味著將會有一場巨人跟諸神之間的最後一戰，且最終會以一場熊熊火焰燃燒毀掉九個國度作為落幕。「諸神的黃昏」（Ragnarok）就是北歐神話預言中的災難日，當不幸之日來臨時，黑狼斯庫爾（Skoll）會吞食太陽，牠的兄弟哈提（Hati）則會吃掉月亮。','../img/event_detail/banner8.png',3,'2023-01-31','2023-02-23','2022-01-23 16:29:48','2022-01-23 16:29:48',250,230,200,NULL,'神話特展','神話明信片',NULL,NULL,1),
(9,'《流體藝術》暈染雙人流體畫展','是一種抽象有趣、創作簡單的的藝術形式，也是一種反傳統筆觸畫出的作品。不需畫筆的你，可以隨心所欲，透過許多方式，如澆灌、旋轉、拖曳、風吹、火烤等，使作品能呈現萬種風貌。在操作過程中感受自己的內在宇宙，釋放一切情緒，可以恣意奔放，可以成熟內斂，在沒有框條拘束下的畫布，讓心靈與流動的線條合而為一，呈現獨一無二的自己。以不同組合方式的探索，創作出另一種視野的延伸之美。藝術之所以令人動情，是因為我們在抽象中找到模糊的自己，因為生活即是藝術，值得你細細品味！」','../img/event_detail/banner9.png',3,'2023-02-02','2023-02-28','2022-01-23 16:33:21','2022-01-23 16:33:21',250,230,200,NULL,'多媒體特展','限定印章',NULL,NULL,1),
(10,'《名窯特展》琺瑯彩瓷特展','當我們看文物時，首先映入眼簾的是它的造型和裝飾紋樣；再進一步思考時，就又想要瞭解相關的時代背景和製作技術。那麼，綜整這些因素所形塑出來的整體特色就是風格。從這個角度看清朝康熙、雍正和乾隆三個時期（1662-1795）的琺瑯彩瓷，除了推薦這是十八世紀最具代表性的瓷器之外，也想透過展覽說明因應彩料的研發與使用，以及主政者三位皇帝對官窯的不同訴求，而形成的三個階段的風格樣式。','../img/event_detail/banner10.png',3,'2023-02-05','2023-02-15','2022-01-23 16:37:45','2022-01-23 16:37:45',350,300,250,NULL,'瓷器特展','獨家小瓷器',NULL,NULL,1),
(11,'《微縮人生》微型展的奇幻世界','12萬粉絲朝聖的微型展將帶著新作品再次席捲全台，這次是田中老師第二次來台舉辦大型個展，自台北微型展後田中老師粉絲成長一倍以上！Instagram 從60萬增加至130萬人追蹤、Twitter從20萬增加至25萬人次追蹤！','../img/event_detail/banner11.png',3,'2023-02-16','2023-03-31','2022-01-23 16:42:01','2022-01-23 16:42:01',300,250,230,NULL,'攝影特展','微型紀念品',NULL,NULL,1),
(12,'《美食饗味》2023台灣國際美食展','專業分區 完整展出 - 定位鮮明，滿足小眾需求，成就零售未來。','../img/event_detail/banner12.png',3,'2023-02-16','2023-02-28','2022-01-23 16:57:29','2022-01-23 16:57:29',280,250,230,NULL,'美食特展','各國美食',NULL,NULL,1);

/*Table structure for table `INFO` */

DROP TABLE IF EXISTS `INFO`;

CREATE TABLE `INFO` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '消息編號',
  `TITLE` varchar(100) NOT NULL COMMENT '消息標題',
  `CONTENT` mediumtext COMMENT '消息內文',
  `MAIN_PHOTO` varchar(256) DEFAULT NULL COMMENT '消息主圖',
  `STATUS` tinyint(1) NOT NULL COMMENT '消息頁狀態',
  `CREATE_DATE` timestamp NOT NULL COMMENT '新增日期',
  `EDIT_DATE` timestamp NOT NULL COMMENT '最後編輯日期',
  `FK_INFO_PAGE_ID` int NOT NULL COMMENT 'FK_消息頁編號',
  `FK_INFO_TYPE_ID` int NOT NULL COMMENT 'FK_消息頁類型編號',
  `START` varchar(10) NOT NULL,
  `END` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_INFO_PAGE_ID`),
  KEY `FK_INFO_TYPE_ID_idx` (`FK_INFO_TYPE_ID`),
  CONSTRAINT `FK_INFO_PAGE_ID` FOREIGN KEY (`FK_INFO_PAGE_ID`) REFERENCES `PAGE` (`ID`),
  CONSTRAINT `FK_INFO_TYPE_ID` FOREIGN KEY (`FK_INFO_TYPE_ID`) REFERENCES `INFO_TYPE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

/*Data for the table `INFO` */

insert  into `INFO`(`ID`,`TITLE`,`CONTENT`,`MAIN_PHOTO`,`STATUS`,`CREATE_DATE`,`EDIT_DATE`,`FK_INFO_PAGE_ID`,`FK_INFO_TYPE_ID`,`START`,`END`) values 
(1,'漫畫展延期至3/30','{\"消息內文\":\"因應政府防疫政策，園區配合政府提供場地作為疫苗施打場地。','../img/new/news_detail_01.png',1,'2023-01-23 14:38:07','2023-01-23 14:38:07',1,2,'2023-02-01','2023-02-28'),
(2,'2023春節園區商家營業時間一覽表','{\"消息內文\":\"2023 春節連假準備開始！','../img/new/news_detail_02.png',1,'2023-01-23 14:44:07','2023-01-23 14:44:07',1,1,'2023-02-01','2023-02-28'),
(3,'焙可先生營業時間延長至22:00','{\"消息內文\":\"為配合春節特別活動，1/21至1/24，焙可先生延長營業時間至22:00。','../img/new/news_detail_03.png',1,'2023-01-23 14:46:09','2023-01-23 14:46:09',1,3,'2023-02-01','2023-02-28'),
(4,'官方LINE好友募集中','{\"消息內文\":\"✱ 韶光文創園區｜LINE好友募集中 ✱','../img/new/news_detail_04.png',1,'2023-01-23 14:47:12','2023-01-23 14:47:12',1,1,'2023-02-01','2023-02-28'),
(5,'2023點讀韶光封面插畫徵集','{\"消息內文\":\"為延續韶光文創園區「鼓勵原創」的精神，「點讀韶光」自2022改版以來，便保持封面版位開放，讓創意從實體空間延伸到平面紙本，提供給創作者多樣化的舞台。','../img/new/news_detail_05.png',1,'2023-01-23 15:22:47','2023-01-23 15:22:47',1,1,'2023-02-01','2023-02-28'),
(6,'2023 韶光志工大募集！！！','{\"消息內文\":\"韶光園區如一山有四季般，常有不同的活動在一整年間為此處帶來不同的樣貌；','../img/new/news_detail_06.png',1,'2023-01-24 09:22:47','2023-01-24 09:22:47',1,1,'2023-02-01','2023-02-28'),
(7,'TibaMe學生大膽創意無邊際','{\"消息內文\":\"是否常常想要享受歡樂的氣氛搭配一瓶啤酒的美妙，但派對上震耳欲聾的聲音又讓你感到不舒服呢？由TibaMe學生舉辦的【那邊看起來好蝦！】開幕派對會讓你耳目一新。這是一個由靜音派對衍生出的派對形式，觀眾到場後只需連上直播網頁並插上耳機，就可以開始享受一場舒適又充滿科技感的Party！靜音派對起源於倫敦，而後風靡於各大國際城市，不會干擾到左鄰右舍，可以讓本來禁止撥放音樂的地方，搖身一變成了眾人狂歡的場所。','../img/new/news_detail_07.png',1,'2023-01-24 10:47:59','2023-01-24 10:47:59',1,2,'2023-02-01','2023-02-28'),
(8,'今年朗讀節，我們一起帶著專題上街頭','{\"消息內文\":\"今年朗讀節一共有三大特色五大亮點！由知名文化評論家擔任總策劃，青鳥文化制作擔任主要企劃統籌，邀請到五月天的瑪莎、美學大師蔣勳、金曲台語男歌手謝銘佑、導演吳念真與三金設計師方序中，三地接續以文學、設計、建築、音樂、戲劇、電影接力。朗讀的形式從經典講座結合鋼琴、傳統布袋戲到叛逆搖滾樂，多語朗讀的影視新創再回到民謠。更邀請來自日本的《革命青春：高校1968》作者四方田犬彥老師擔任國際講座嘉賓。\"}','../img/new/news_detail_08.png',1,'2023-01-24 11:08:01','2023-01-24 11:08:01',1,2,'2023-02-01','2023-02-28'),
(9,'崖下的波妞》十周年特展','{\"消息內文\":\"為紀念動畫推出十週年，除介紹動畫重要角色外，展區內將重現眾多經典場景，得以親身感受作品的獨特魅力，更有首次在台曝光的動畫複製原稿展出！\"}','../img/new/news_detail_09.png',1,'2023-01-24 13:22:07','2023-01-24 13:22:07',1,2,'2023-02-01','2023-02-28'),
(10,'02.01-02.15 園區防疫管理措施','{\"消息內文\":\"韶光文創園區將配合實施相關防疫指引，並遵循文化部展覽場館防疫管理辦法，落實總人流管制及實聯制登記。','../img/new/news_detail_10.png',1,'2023-01-24 14:44:27','2023-01-24 14:44:27',1,3,'2023-02-01','2023-02-28'),
(11,'藝FUN券使用大補帖！ 全家一起遊韶光','{\"消息內文\":\"你也是藝Fun券幸運中獎的幸運兒嗎？ 不論你是想逛展覽、買文創商品、看電影、吃美食，在全園區都可以使用喔。為了回饋給韶光的朋友們更多好康，現在單筆消費滿額還可以享現金現抵優惠，滿1000現抵100、滿2000現抵200！ 快一起來看看，在韶光文創園區怎麼花最划算？ \"}','../img/new/news_detail_11.png',1,'2023-01-25 10:31:58','2023-01-25 10:31:58',1,3,'2023-02-01','2023-02-28'),
(12,'Wapple PLUS 台北旅遊情報導覽特集','{\"消息內文\":\"出版地區：日本','../img/new/news_detail_12.png',1,'2023-01-25 12:08:23','2023-01-25 12:08:23',1,3,'2023-02-01','2023-02-28');

/*Table structure for table `INFO_TYPE` */

DROP TABLE IF EXISTS `INFO_TYPE`;

CREATE TABLE `INFO_TYPE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '消息類型',
  `DESC` varchar(100) NOT NULL COMMENT '消息類型描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Data for the table `INFO_TYPE` */

insert  into `INFO_TYPE`(`ID`,`DESC`) values 
(1,'園區公告'),
(2,'展演資訊'),
(3,'其他消息');

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;

/*Data for the table `MEMBER` */

insert  into `MEMBER`(`ID`,`USERNAME`,`EMAIL`,`PASSWORD`,`PHONE`,`VERIFY`,`FK_ROLE_ID`) values 
(1,'admin','admin@goodtime.com','g3_@dmin','0987654321',1,1),
(5,'member1','member@goodtime.com','member1','0987654321',1,2),
(7,'member2','member2@goodtime.com','member2','0987654321',1,2),
(38,'member3','member3@goodtime.com','member3','0987654321',1,2),
(39,'董怡均','qwer777889@gmail.com','sed77789','0983082095',1,2);

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

/*Table structure for table `PASSPORT` */

DROP TABLE IF EXISTS `PASSPORT`;

CREATE TABLE `PASSPORT` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '門票護照編號',
  `EXPO_ID` int NOT NULL COMMENT '展覽編號',
  `UNIT_PRICE` smallint NOT NULL COMMENT '門票單價',
  `QTY` tinyint NOT NULL COMMENT '下單數量',
  `PO_ID` int NOT NULL COMMENT 'FK_訂單編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PASSPORT_PO_ID_idx` (`PO_ID`),
  CONSTRAINT `FK_PASSPORT_PO_ID` FOREIGN KEY (`PO_ID`) REFERENCES `PO` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='門票訂單';

/*Data for the table `PASSPORT` */

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
  `FK_PO_PRODUCT_SPEC_ID` int NOT NULL COMMENT 'FK_商品規格編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_ID_idx` (`FK_PO_DETAIL_PRODUCT_ID`),
  KEY `FK_PO_ID_idx` (`FK_PO_DETAIL_PO_ID`),
  KEY `FK_PO_PRODUCT_SPEC_ID_idx` (`FK_PO_PRODUCT_SPEC_ID`),
  CONSTRAINT `FK_PO_DETAIL_PO_ID` FOREIGN KEY (`FK_PO_DETAIL_PO_ID`) REFERENCES `PO` (`ID`),
  CONSTRAINT `FK_PO_DETAIL_PRODUCT_ID` FOREIGN KEY (`FK_PO_DETAIL_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`),
  CONSTRAINT `FK_PO_PRODUCT_SPEC_ID` FOREIGN KEY (`FK_PO_PRODUCT_SPEC_ID`) REFERENCES `PRODUCT_SPEC` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PO_DETAIL` */

insert  into `PO_DETAIL`(`ID`,`FK_PO_DETAIL_PRODUCT_ID`,`UNIT_PRICE`,`QTY`,`FK_PO_DETAIL_PO_ID`,`FK_PO_PRODUCT_SPEC_ID`) values 
(2,1,960,3,1,4),
(3,1,960,1,1,5);

/*Table structure for table `PRODUCT` */

DROP TABLE IF EXISTS `PRODUCT`;

CREATE TABLE `PRODUCT` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品編號',
  `PRODUCT_NAME` varchar(100) NOT NULL COMMENT '商品名稱',
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
  `FK_EXPO_ID` int DEFAULT NULL COMMENT 'FK_供應商編號',
  `FK_PRODUCT_TYPE_ID` int NOT NULL COMMENT 'FK_商品類型編號',
  `SPEC` mediumtext COMMENT '規格',
  `NOTE` mediumtext COMMENT '備註',
  `FEATURED` varchar(256) NOT NULL COMMENT '商品賣點',
  `START` varchar(10) NOT NULL COMMENT '開始銷售日',
  `END` varchar(10) NOT NULL COMMENT '結束銷售日',
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_PRODUCT_TYPE_ID`),
  KEY `FK_SUPPLIER_ID_idx` (`FK_EXPO_ID`),
  KEY `FK_PAGE_ID_idx1` (`FK_PRODUCT_PAGE_ID`),
  CONSTRAINT `FK_PRODUCT_PAGE_ID` FOREIGN KEY (`FK_PRODUCT_PAGE_ID`) REFERENCES `PAGE` (`ID`),
  CONSTRAINT `FK_PRODUCT_TYPE_ID` FOREIGN KEY (`FK_PRODUCT_TYPE_ID`) REFERENCES `PRODUCT_TYPE` (`ID`),
  CONSTRAINT `FK_SUPPLIER_ID` FOREIGN KEY (`FK_EXPO_ID`) REFERENCES `SUPPLIER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PRODUCT` */

insert  into `PRODUCT`(`ID`,`PRODUCT_NAME`,`STATUS`,`HIDE`,`PRICE`,`DESC`,`MAIN_PHOTO`,`STOCK_QTY`,`MAX_QTY`,`CREATE_DATE`,`EDIT_DATE`,`FK_PRODUCT_PAGE_ID`,`FK_EXPO_ID`,`FK_PRODUCT_TYPE_ID`,`SPEC`,`NOTE`,`FEATURED`,`START`,`END`) values 
(1,'蒙娜麗莎貓貓掛畫',0,0,960,'文藝復興時期畫家列奧納多·達芬奇所繪的一幅肖像畫與其代表作。<br>\n加上愛貓的作家為畫作添加了創意理念<br>\n讓生活充滿有趣的色彩。','../img/product_detail/item17.png',9999,10,'2022-12-25 17:13:20','2022-12-25 17:13:20',2,1,1,'產品名稱：蒙娜麗莎貓掛畫\r<br>木框原料︰進口松木實木內框\r<br>專業畫布︰防水防皺專業油畫布\r<br>產品尺寸：(小)30x30cm  (中)40x50cm  (大)50x70cm','尺寸','進口松木實木內框\n,防水防皺專業油畫布\n,畫家限定少數款','2022/12/01','2046/12/31'),
(2,'自訂款迷你保溫瓶',0,0,590,'輕巧便攜：<br />\n                迷你保溫瓶容量為350ml，重量僅190g，無論去到哪，都可以輕鬆攜帶。<br />\n                <br>\n                長效保溫鎖冷：<br />\n                無論冬天還是夏天，冷水還是熱水，都可以保持長效保溫和保冷。<br />\n                <br>\n                SUS 304不鏽鋼安全材質：<br />\n                採用SUS\n                304食品級不鏽鋼材質，抗氧化、耐腐蝕、易清潔，讓您輕鬆健康飲水。<br />\n                <br>\n                真空技術：<br />\n                採用不鏽鋼真空技術，有效阻隔溫度傳導，打造保溫鎖冷效果。<br />\n                <br>\n                保溫測試：<br />\n                在20°C±5°C的室內溫度下，將100°C的水倒入至密封蓋下端。<br />\n                當水溫降至95°C±1°C時，立即拴緊杯蓋。6小時後杯內水溫不低於58℃。<br />\n                <br>\n                保冷測試：<br />\n                在20°C±5℃的室內溫度下，將冰水倒入至密封蓋的下端。<br />\n                當水溫升至4℃±1℃時，拴緊蓋子。6小時後杯內水溫不高於12°C。','../img/product_detail/item01.png',9999,10,'2023-01-08 10:58:00','2023-01-08 10:58:00',2,1,2,'產品名稱：自訂款迷你保溫杯<br />\n                保溫效率：高於58°C（6小時）<br />\n                冷藏效率：低於12°C（6小時）<br />\n                產品材質：SUS304不鏽鋼<br />\n                產品容量：350ml<br />\n                產品重量：190g<br />\n                產品尺寸：60 x 60 x 180mm','顏色','採用SUS304不鏽鋼材質，讓你安心飲用,小巧便攜，重量僅200克, 長效保溫保冷','2022/12/01','2046/12/31'),
(3,'貓貓洗頭掛畫',1,1,900,'文藝復興時期畫家列奧納多·達芬奇所繪的一幅肖像畫與其代表作。<br>','../img/product_detail/item02.png',9999,10,'2023-01-23 17:01:22','2023-01-23 17:01:22',2,1,1,'產品名稱：貓貓洗頭掛畫<br />木框原料︰進口松木實木內框<br>','尺寸','進口松木實木內框 ,防水防皺專業油畫布 ,畫家限定少數款','2022/12/01','2046/12/31'),
(4,'惡夢去去捕夢網',1,1,450,'捕夢網是印地安人的幸運物，古老印第安人相傳捕夢網可以將惡夢從網中捕獲，將好夢透過羽毛下滑到夢境之內。傳統上當有小朋友出世時，部落裡既長輩就會送一個給小朋友，寓意一個衷心的祝福,並希望可以幫小朋友將惡夢過濾，只留下美夢，健康快樂成長。<br>','../img/product_detail/item03.png',9999,10,'2023-01-23 17:10:57','2023-01-23 17:10:57',2,1,2,'產品名稱：惡夢去去捕夢網<br>','尺寸','人手製造每個都獨一無二, 歡迎客製化訂造, 印第安的祝福文化','2022/12/01','2046/12/31'),
(5,'手繪限定油畫',1,1,2000,'油畫風格採用較為寫實的畫風，著重光影的變化，以及顏色的堆疊。<br>','../img/product_detail/item04.png',9999,10,'2023-01-23 17:30:16','2023-01-23 17:30:16',2,1,1,'產品名稱：手繪限定油畫<br>','尺寸','純手工厚油肌理畫, 現代丙烯裝飾畫, 採用高端亞麻布料','2022/12/01','2046/12/31'),
(6,'畫家限定簽名',1,1,5600,'正版現貨，日本知名畫家限定款簽名卡<br>','../img/product_detail/item05.png',9999,10,'2023-01-23 20:13:47','2023-01-23 20:13:47',2,1,1,'產品名稱：畫家限定簽名<br>','尺寸','日本知名畫家簽名, 值得珍藏, 正版現貨 ','2023/01/21','2046/12/31'),
(7,'格魯特時鐘',1,1,560,'由原木拼接製作而成，有別於以往的整片原木裁切製作，原木拼接雖製程更繁複，但較能持續提供作品給喜愛此風格的客人，所以大面積的作品我們改以原木拼接的方式繼續開發新產品。<br>','../img/product_detail/item06.png',9999,10,'2023-01-26 11:41:29','2023-01-26 11:41:29',2,1,2,'產品名稱：格魯特時鐘<br>','尺寸','北美硬楓木原木拼接, 天然色澤與紋路, 手工塗佈德國百年 OSMO 天然環保漆','2023/01/21','2046/12/31'),
(8,'手繪限量明信片組',1,1,990,'不知道要選哪幾張明信片而感到煩惱嗎？<br>','../img/product_detail/item07.png',9999,10,'2023-01-26 11:45:57','2023-01-26 11:45:57',2,1,1,'產品名稱：手繪限量明信片組<br>','顏色','30張不嫌少, 每張皆附牛皮信封, 經典圖文搭配 ','2023/01/21','2046/12/31'),
(9,'手繪限量明信片',1,1,560,'正版現貨，日本超人氣畫家限定手繪明信片<br>','../img/product_detail/item08.png',9999,10,'2023-01-26 11:52:42','2023-01-26 11:52:42',2,1,1,'產品名稱：手繪限量明信片<br>','組合','日本超高人氣畫家手繪, 臺灣場獨家限定款, 適合不同場合的萬用卡片','2023/01/21','2046/12/31'),
(10,'限量手繪絲巾',1,1,1600,'雪紡大方絲巾大小恰到好處的方巾，除了作為秋冬保暖圍巾方巾使用，更是從來不退流行的時尚髮飾髮帶，或者包包綁帶！<br>\r ','../img/product_detail/item09.png',9999,10,'2023-01-26 11:55:58','2023-01-26 11:55:58',2,1,2,'產品名稱：限量手繪絲巾<br>\r 產品尺寸：(小)30 x 30cm (中)50 x 50cm (大)87 x 87cm<br>\r 產品材質：100% 聚酯纖維 (強撚絲巾布)<br>\r 洗滌方式：請用冷水手洗。避免烘乾、長時間浸泡及曝曬。<br>\r 產品外盒包裝：25 x 25 x 0.5cm 牛皮紙盒','尺寸','雪紡大方絲巾, 秋冬保暖圍巾方巾, 時尚髮飾or包包綁帶','2023/01/21','2046/12/31'),
(11,'水彩風手繪小卡組',1,1,560,'原創手繪水彩插畫、文創手工和純藝術<br>','../img/product_detail/item10.png',9999,10,'2023-01-26 12:00:11','2023-01-26 12:00:11',2,1,1,'產品名稱：水彩風手繪小卡組<br>\r 尺寸：約 6.5 X 9cm<br>\r 材質：水彩紙<br>\r 款式：聖誕/星空/空色<br>\r 共 3 款，一包 12 張\r ','款式','原創手繪水彩插畫, 文創手工和純藝術, 手繪水彩系列','2023/01/21','2046/12/31'),
(12,'自訂手工餐盤',1,1,700,'讓生活中的用品，改變一點點造型、改變一點點色彩、改變一點點質感，都可以讓生活變得不一樣。<br>','../img/product_detail/item11.png',9999,10,'2023-01-26 12:04:28','2023-01-26 12:04:28',2,1,2,'產品名稱：自訂手工餐盤<br>','顏色','皆為手工拉坯製作, 使用霧面釉色呈現質感, 獨一無二的手作陶瓷','2023/01/21','2046/12/31'),
(13,'限定手繡毛巾',1,1,560,'正面用上日本紗巾布，配搭純色純綿布，色彩鮮明。 後面使用柔軟舒適的短毛巾布，可以擦汗/口水，一巾多用。<br> \r 於純綿布的位置繡上不同字句或名字，讓它更有獨特感。 <br>\r 在手巾側面用不同材質的織帶/絲帶縫製小標籤，可以給Baby觸摸，有利觸覺及視覺等感官。','../img/product_detail/item12.png',9999,10,'2023-01-26 12:08:47','2023-01-26 12:08:47',2,1,2,'產品名稱：限定手繡毛巾<br>','顏色','珊瑚絨材質, 超細纖維質地, 好收納方便取用','2023/01/21','2046/12/31'),
(14,'文青手帳本',1,1,400,'手帳，是生活裡的沉浸式書寫。 <br>','../img/product_detail/item13.png',9999,10,'2023-01-26 12:12:54','2023-01-26 12:12:54',2,1,2,'產品名稱：文青手帳本<br>','顏色','書皮燙金質感大提升, 月期許&月總結&每月計畫表, 插畫搭配金句是美的日常！','2023/01/21','2046/12/31'),
(15,'創作者御用顏料',1,1,560,'成分均為全國公證認證，成分安全天然環保<br>','../img/product_detail/item14.png',9999,10,'2023-01-26 12:19:12','2023-01-26 12:19:12',2,1,2,'產品名稱：創作者御用顏料<br>','組合','顏色彩飽和可調色, 堆疊不吃色不混色, 防水配方水洗不掉色','2023-01-25','2046-12-31'),
(16,'DIY毛線聖誕樹',1,1,560,'來自俄羅斯的刺繡方式，用一支筆就完成刺繡的作品！<br>','../img/product_detail/item15.png',9999,10,'2023-01-26 12:22:59','2023-01-26 12:22:59',2,1,2,'產品名稱：DIY毛線聖誕樹<br>','顏色','俄羅斯戳戳繍, 在布上戳戳戳、不打結就可以完成刺繡, 療癒好入門的超實用作品','2023/01/25','2046/12/31'),
(17,'山形實木杯墊',1,1,280,'選用㊣臺灣鶯歌製造吸水杯墊，質白好上色，吸水效果佳<br>','../img/product_detail/item16.png',9999,10,'2023-01-26 12:26:17','2023-01-26 12:26:17',2,1,2,'產品名稱：山形實木杯墊<br>','款式','經SGS檢驗合格不含重金屬, 吸水效果佳, 防滑墊貼近桌面更耐用','2023/01/25','2046/12/31');

/*Table structure for table `PRODUCT_PIC` */

DROP TABLE IF EXISTS `PRODUCT_PIC`;

CREATE TABLE `PRODUCT_PIC` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品圖編號',
  `PATH` varchar(128) NOT NULL COMMENT '商品圖路徑',
  `FK_PRODUCT_PIC_PRODUCT_ID` int NOT NULL COMMENT 'FK_商品編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_PIC_PRODUCT_ID_idx` (`FK_PRODUCT_PIC_PRODUCT_ID`),
  CONSTRAINT `FK_PRODUCT_PIC_PRODUCT_ID` FOREIGN KEY (`FK_PRODUCT_PIC_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COMMENT='商品圖';

/*Data for the table `PRODUCT_PIC` */

insert  into `PRODUCT_PIC`(`ID`,`PATH`,`FK_PRODUCT_PIC_PRODUCT_ID`) values 
(1,'../img/product_detail/item17_01.png',1),
(2,'../img/product_detail/item01_01.png',2),
(3,'../img/product_detail/item01_02.png',2),
(4,'../img/product_detail/item01_03.png',2),
(5,'../img/product_detail/item02_01.png',3),
(6,'../img/product_detail/item02_02.png',3),
(7,'../img/product_detail/item02_03.png',3),
(8,'../img/product_detail/item03_01.png',4),
(9,'../img/product_detail/item03_02.png',4),
(10,'../img/product_detail/item03_03.png',4),
(11,'../img/product_detail/item04_01.png',5),
(12,'../img/product_detail/item04_02.png',5),
(13,'../img/product_detail/item04_03.png',5),
(14,'../img/product_detail/item05_01.png',6),
(15,'../img/product_detail/item05_02.png',6),
(16,'../img/product_detail/item05_03.png',6),
(17,'../img/product_detail/item06_01.png',7),
(18,'../img/product_detail/item06_02.png',7),
(19,'../img/product_detail/item06_03.png',7),
(20,'../img/product_detail/item07_01.png',8),
(21,'../img/product_detail/item07_02.png',8),
(22,'../img/product_detail/item07_03.png',8),
(23,'../img/product_detail/item08_01.png',9),
(24,'../img/product_detail/item08_02.png',9),
(25,'../img/product_detail/item08_03.png',9),
(26,'../img/product_detail/item09_01.png',10),
(27,'../img/product_detail/item09_02.png',10),
(28,'../img/product_detail/item09_03.png',10),
(29,'../img/product_detail/item10_01.png',11),
(30,'../img/product_detail/item10_02.png',11),
(31,'../img/product_detail/item10_03.png',11),
(32,'../img/product_detail/item11_01.png',12),
(33,'../img/product_detail/item11_02.png',12),
(34,'../img/product_detail/item11_03.png',12),
(35,'../img/product_detail/item12_01.png',13),
(36,'../img/product_detail/item12_02.png',13),
(37,'../img/product_detail/item12_03.png',13),
(38,'../img/product_detail/item13_01.png',14),
(39,'../img/product_detail/item13_02.png',14),
(40,'../img/product_detail/item13_03.png',14),
(41,'../img/product_detail/item14_01.png',15),
(42,'../img/product_detail/item14_02.png',15),
(43,'../img/product_detail/item14_03.png',15),
(44,'../img/product_detail/item15_01.png',16),
(45,'../img/product_detail/item15_02.png',16),
(46,'../img/product_detail/item15_03.png',16),
(47,'../img/product_detail/item16_01.png',17),
(48,'../img/product_detail/item16_02.png',17),
(49,'../img/product_detail/item16_03.png',17),
(50,'../img/product_detail/item17_02.png',1),
(51,'../img/product_detail/item17_03.png',1);

/*Table structure for table `PRODUCT_SPEC` */

DROP TABLE IF EXISTS `PRODUCT_SPEC`;

CREATE TABLE `PRODUCT_SPEC` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品規格編號',
  `SPEC` varchar(45) NOT NULL COMMENT '商品規格',
  `FK_PRODUCT_SPEC_PRODUCT_ID` int NOT NULL COMMENT 'FK_商品編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_SPEC_PRODUCT_ID_idx` (`FK_PRODUCT_SPEC_PRODUCT_ID`),
  CONSTRAINT `FK_PRODUCT_SPEC_PRODUCT_ID` FOREIGN KEY (`FK_PRODUCT_SPEC_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COMMENT='商品規格';

/*Data for the table `PRODUCT_SPEC` */

insert  into `PRODUCT_SPEC`(`ID`,`SPEC`,`FK_PRODUCT_SPEC_PRODUCT_ID`) values 
(1,'黑色',2),
(2,'藍色',2),
(3,'粉色',2),
(4,'30x30cm',1),
(5,'40x50cm',1),
(6,'50x70cm',1),
(7,'30x30cm',3),
(8,'40x50cm',3),
(9,'50x70cm',3),
(10,'27cm',4),
(11,'30cm',4),
(12,'32cm',4),
(13,'30x30cm',5),
(14,'40x50cm',5),
(15,'50x70cm',5),
(16,'30x30cm',6),
(17,'40x50cm',6),
(18,'50x70cm',6),
(19,'20cm',7),
(20,'26cm',7),
(21,'30cm',7),
(22,'黑色',8),
(23,'白色',8),
(24,'灰色',8),
(25,'8張',9),
(26,'24張',9),
(27,'100張',9),
(28,'30x30cm',10),
(29,'50x50cm',10),
(30,'87x87cm',10),
(31,'聖誕',11),
(32,'星空',11),
(33,'空色',11),
(34,'黑色',12),
(35,'白色',12),
(36,'綠色',12),
(37,'白色',13),
(38,'米色',13),
(39,'藍色',13),
(40,'粉色',14),
(41,'米色',14),
(42,'綠色',14),
(43,'8入',15),
(44,'24入',15),
(45,'32入',15),
(46,'大地色',16),
(47,'聖誕綠',16),
(48,'喜氣紅',16),
(49,'陶瓷款',17),
(50,'毛氈款',17);

/*Table structure for table `PRODUCT_TYPE` */

DROP TABLE IF EXISTS `PRODUCT_TYPE`;

CREATE TABLE `PRODUCT_TYPE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品類型編號',
  `PRODUCT_TYPE_NAME` varchar(45) NOT NULL COMMENT '商品類型名稱',
  `PRODUCT_DETAIL_DESC` varchar(100) DEFAULT NULL COMMENT '商品類型描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PRODUCT_TYPE` */

insert  into `PRODUCT_TYPE`(`ID`,`PRODUCT_TYPE_NAME`,`PRODUCT_DETAIL_DESC`) values 
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

/*Table structure for table `TICKET` */

DROP TABLE IF EXISTS `TICKET`;

CREATE TABLE `TICKET` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '門票購物車編號',
  `QTY` smallint NOT NULL COMMENT '數量',
  `TICKET_DATE` timestamp NOT NULL COMMENT '加入日期',
  `MEMBER_ID` int NOT NULL COMMENT 'FK_會員編號',
  `EXPO_ID` int NOT NULL COMMENT 'FK_展覽編號',
  `EXPO_PRICE` int NOT NULL COMMENT '展覽票價',
  PRIMARY KEY (`ID`),
  KEY `FK_TICKET_MEMBER_ID_idx` (`MEMBER_ID`),
  KEY `FK_TICKET_EXPO_ID_idx` (`EXPO_ID`),
  CONSTRAINT `FK_TICKET_EXPO_ID` FOREIGN KEY (`EXPO_ID`) REFERENCES `EXPO` (`ID`),
  CONSTRAINT `FK_TICKET_MEMBER_ID` FOREIGN KEY (`MEMBER_ID`) REFERENCES `MEMBER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='門票購物車';

/*Data for the table `TICKET` */

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

/*Table structure for table `b_new` */

DROP TABLE IF EXISTS `b_new`;

/*!50001 DROP VIEW IF EXISTS `b_new` */;
/*!50001 DROP TABLE IF EXISTS `b_new` */;

/*!50001 CREATE TABLE  `b_new`(
 `MAIN_PHOTO` varchar(256) ,
 `TITLE` varchar(100) ,
 `ID` int ,
 `START` varchar(10) ,
 `END` varchar(10) ,
 `STATUS` tinyint(1) ,
 `EDIT_DATE` timestamp ,
 `FK_INFO_PAGE_ID` int 
)*/;

/*Table structure for table `b_new_detail` */

DROP TABLE IF EXISTS `b_new_detail`;

/*!50001 DROP VIEW IF EXISTS `b_new_detail` */;
/*!50001 DROP TABLE IF EXISTS `b_new_detail` */;

/*!50001 CREATE TABLE  `b_new_detail`(
 `ID` int ,
 `TITLE` varchar(100) ,
 `CONTENT` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `STATUS` tinyint(1) ,
 `CREATE_DATE` timestamp ,
 `EDIT_DATE` timestamp ,
 `FK_INFO_PAGE_ID` int ,
 `FK_INFO_TYPE_ID` int ,
 `START` varchar(10) ,
 `END` varchar(10) ,
 `DESC` varchar(100) 
)*/;

/*Table structure for table `b_product` */

DROP TABLE IF EXISTS `b_product`;

/*!50001 DROP VIEW IF EXISTS `b_product` */;
/*!50001 DROP TABLE IF EXISTS `b_product` */;

/*!50001 CREATE TABLE  `b_product`(
 `ID` int ,
 `PRODUCT_NAME` varchar(100) ,
 `START` varchar(10) ,
 `END` varchar(10) ,
 `STATUS` tinyint(1) ,
 `HIDE` tinyint(1) ,
 `PRICE` mediumint ,
 `MAIN_PHOTO` varchar(256) ,
 `FK_PRODUCT_PAGE_ID` int ,
 `PRODUCT_TYPE_NAME` varchar(45) 
)*/;

/*Table structure for table `b_product_detail` */

DROP TABLE IF EXISTS `b_product_detail`;

/*!50001 DROP VIEW IF EXISTS `b_product_detail` */;
/*!50001 DROP TABLE IF EXISTS `b_product_detail` */;

/*!50001 CREATE TABLE  `b_product_detail`(
 `ID` int ,
 `PRODUCT_NAME` varchar(100) ,
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
 `FK_EXPO_ID` int ,
 `FK_PRODUCT_TYPE_ID` int ,
 `SPEC` mediumtext ,
 `NOTE` mediumtext ,
 `FEATURED` varchar(256) ,
 `START` varchar(10) ,
 `END` varchar(10) ,
 `TITLE` varchar(128) ,
 `PRODUCT_TYPE_NAME` varchar(45) ,
 `PRODUCT_DETAIL_DESC` varchar(100) 
)*/;

/*Table structure for table `b_product_detail_pic` */

DROP TABLE IF EXISTS `b_product_detail_pic`;

/*!50001 DROP VIEW IF EXISTS `b_product_detail_pic` */;
/*!50001 DROP TABLE IF EXISTS `b_product_detail_pic` */;

/*!50001 CREATE TABLE  `b_product_detail_pic`(
 `PATH` varchar(128) ,
 `FK_PRODUCT_PIC_PRODUCT_ID` int ,
 `ID` int 
)*/;

/*Table structure for table `b_product_detail_size` */

DROP TABLE IF EXISTS `b_product_detail_size`;

/*!50001 DROP VIEW IF EXISTS `b_product_detail_size` */;
/*!50001 DROP TABLE IF EXISTS `b_product_detail_size` */;

/*!50001 CREATE TABLE  `b_product_detail_size`(
 `SPEC` varchar(45) ,
 `FK_PRODUCT_SPEC_PRODUCT_ID` int ,
 `ID` int 
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

/*View structure for view b_member */

/*!50001 DROP TABLE IF EXISTS `b_member` */;
/*!50001 DROP VIEW IF EXISTS `b_member` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_member` AS select `m`.`ID` AS `ID`,`m`.`USERNAME` AS `USERNAME`,`m`.`VERIFY` AS `VERIFY`,`m`.`EMAIL` AS `EMAIL`,`r`.`DESC` AS `DESC` from (`member` `m` join `role` `r` on((`m`.`FK_ROLE_ID` = `r`.`ID`))) */;

/*View structure for view b_new */

/*!50001 DROP TABLE IF EXISTS `b_new` */;
/*!50001 DROP VIEW IF EXISTS `b_new` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_new` AS select `info`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`info`.`TITLE` AS `TITLE`,`info`.`ID` AS `ID`,`info`.`START` AS `START`,`info`.`END` AS `END`,`info`.`STATUS` AS `STATUS`,`info`.`EDIT_DATE` AS `EDIT_DATE`,`info`.`FK_INFO_PAGE_ID` AS `FK_INFO_PAGE_ID` from `info` */;

/*View structure for view b_new_detail */

/*!50001 DROP TABLE IF EXISTS `b_new_detail` */;
/*!50001 DROP VIEW IF EXISTS `b_new_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_new_detail` AS select `i`.`ID` AS `ID`,`i`.`TITLE` AS `TITLE`,`i`.`CONTENT` AS `CONTENT`,`i`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`i`.`STATUS` AS `STATUS`,`i`.`CREATE_DATE` AS `CREATE_DATE`,`i`.`EDIT_DATE` AS `EDIT_DATE`,`i`.`FK_INFO_PAGE_ID` AS `FK_INFO_PAGE_ID`,`i`.`FK_INFO_TYPE_ID` AS `FK_INFO_TYPE_ID`,`i`.`START` AS `START`,`i`.`END` AS `END`,`it`.`DESC` AS `DESC` from (`info` `i` join `info_type` `it` on((`i`.`FK_INFO_TYPE_ID` = `it`.`ID`))) */;

/*View structure for view b_product */

/*!50001 DROP TABLE IF EXISTS `b_product` */;
/*!50001 DROP VIEW IF EXISTS `b_product` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_product` AS select `p`.`ID` AS `ID`,`p`.`PRODUCT_NAME` AS `PRODUCT_NAME`,`p`.`START` AS `START`,`p`.`END` AS `END`,`p`.`STATUS` AS `STATUS`,`p`.`HIDE` AS `HIDE`,`p`.`PRICE` AS `PRICE`,`p`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`p`.`FK_PRODUCT_PAGE_ID` AS `FK_PRODUCT_PAGE_ID`,`pt`.`PRODUCT_TYPE_NAME` AS `PRODUCT_TYPE_NAME` from (`product` `p` join `product_type` `pt` on((`p`.`FK_PRODUCT_TYPE_ID` = `pt`.`ID`))) */;

/*View structure for view b_product_detail */

/*!50001 DROP TABLE IF EXISTS `b_product_detail` */;
/*!50001 DROP VIEW IF EXISTS `b_product_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_product_detail` AS select `p`.`ID` AS `ID`,`p`.`PRODUCT_NAME` AS `PRODUCT_NAME`,`p`.`STATUS` AS `STATUS`,`p`.`HIDE` AS `HIDE`,`p`.`PRICE` AS `PRICE`,`p`.`DESC` AS `DESC`,`p`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`p`.`STOCK_QTY` AS `STOCK_QTY`,`p`.`MAX_QTY` AS `MAX_QTY`,`p`.`CREATE_DATE` AS `CREATE_DATE`,`p`.`EDIT_DATE` AS `EDIT_DATE`,`p`.`FK_PRODUCT_PAGE_ID` AS `FK_PRODUCT_PAGE_ID`,`p`.`FK_EXPO_ID` AS `FK_EXPO_ID`,`p`.`FK_PRODUCT_TYPE_ID` AS `FK_PRODUCT_TYPE_ID`,`p`.`SPEC` AS `SPEC`,`p`.`NOTE` AS `NOTE`,`p`.`FEATURED` AS `FEATURED`,`p`.`START` AS `START`,`p`.`END` AS `END`,`e`.`TITLE` AS `TITLE`,`pt`.`PRODUCT_TYPE_NAME` AS `PRODUCT_TYPE_NAME`,`pt`.`PRODUCT_DETAIL_DESC` AS `PRODUCT_DETAIL_DESC` from ((`product` `p` join `product_type` `pt` on((`p`.`FK_PRODUCT_TYPE_ID` = `pt`.`ID`))) join `expo` `e` on((`p`.`FK_EXPO_ID` = `e`.`ID`))) */;

/*View structure for view b_product_detail_pic */

/*!50001 DROP TABLE IF EXISTS `b_product_detail_pic` */;
/*!50001 DROP VIEW IF EXISTS `b_product_detail_pic` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_product_detail_pic` AS select `pp`.`PATH` AS `PATH`,`pp`.`FK_PRODUCT_PIC_PRODUCT_ID` AS `FK_PRODUCT_PIC_PRODUCT_ID`,`p`.`ID` AS `ID` from (`product` `p` join `product_pic` `pp` on((`p`.`ID` = `pp`.`FK_PRODUCT_PIC_PRODUCT_ID`))) */;

/*View structure for view b_product_detail_size */

/*!50001 DROP TABLE IF EXISTS `b_product_detail_size` */;
/*!50001 DROP VIEW IF EXISTS `b_product_detail_size` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_product_detail_size` AS select `ps`.`SPEC` AS `SPEC`,`ps`.`FK_PRODUCT_SPEC_PRODUCT_ID` AS `FK_PRODUCT_SPEC_PRODUCT_ID`,`p`.`ID` AS `ID` from (`product` `p` join `product_spec` `ps` on((`p`.`ID` = `ps`.`FK_PRODUCT_SPEC_PRODUCT_ID`))) */;

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
