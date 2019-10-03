/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.15 : Database - travel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`travel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `travel`;

/*Table structure for table `hotel` */

DROP TABLE IF EXISTS `hotel`;

CREATE TABLE `hotel` (
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `pos` varchar(20) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hotel` */

insert  into `hotel`(`image`,`name`,`pos`,`price`,`description`) values 
('NPU.jpeg','ana上帝酒店','上海',235.00,'安帝天辽阔，斧高不及毛'),
('shanghai-1.jpg','世博洲际酒店','上海',715.00,'路窄江寒'),
('jiaocheng-1.jpg','北京瑞安酒店','北京',233.00,''),
('ChengLou.jpg','大唐芙蓉园','西安',357.00,'秦岭兵工厂'),
('jiaocheng-2.jpg','汉庭酒店','北京',120.00,'王府井'),
('shanghai-2.jpg','浦东香格里拉酒店','上海',430.00,'来人给公子绑石头'),
('BinMaYong.jpg','西京汉庭酒店','西安',603.00,'兵马俑相眠'),
('QinLing.jpg','西安钟楼酒店','西安',1177.00,'我无敌，随便打'),
('BinMaYong.jpg','长富宫','北京',666.00,''),
('ShangHai.jpg','陆家嘴汉庭酒店','上海',999.00,'黄浦江边'),
('deep-1.jpg','黄埔江警告','上海',903.00,'sjforever');

/*Table structure for table `location` */

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `location_id` int(8) NOT NULL,
  `lng` double(30,20) NOT NULL,
  `lat` double(30,20) NOT NULL,
  `des` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `log_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  PRIMARY KEY (`location_id`,`log_id`,`user_id`),
  KEY `log_id` (`log_id`),
  KEY `user_id2` (`user_id`),
  CONSTRAINT `log_id` FOREIGN KEY (`log_id`) REFERENCES `user_logs` (`log_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`user_id`) REFERENCES `user_logs` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `location` */

insert  into `location`(`location_id`,`lng`,`lat`,`des`,`log_id`,`user_id`) values 
(1,116.39750237027886000000,39.91881848501811400000,'地点一',1,1),
(1,116.33900471546910000000,39.85481800013456000000,'啊手动阀发送',1,2),
(1,116.37874575123053000000,39.92003590331227500000,'asdf ',1,3),
(1,116.70917845002081000000,39.92263667839601000000,'123',2,1),
(1,116.37982371784250000000,39.92069994045914400000,'撒发阿斯蒂芬',2,2),
(1,116.39132202837021000000,39.92114262828435000000,'一',3,1),
(1,116.40174237228597000000,39.92125329978988000000,'全为',3,2),
(1,126.04939982056759000000,40.61999357626999000000,'123',4,1),
(1,116.40274847445714000000,39.93696682290200000000,'地点一',4,2),
(1,116.39613694590369000000,39.91920584775090000000,'123',5,1),
(2,116.41848678699195000000,39.91804375292653600000,'地点二',1,1),
(2,116.35740201231344000000,39.85254698094538400000,'安抚啊额我发阿文',1,2),
(2,116.39577762369970000000,39.91583018398395000000,'asdf ',1,3),
(2,116.61144281053521000000,39.87392479544062000000,'234',2,1),
(2,116.39002846843584000000,39.92075527659507000000,'第三个岁的法国',2,2),
(2,116.40964746077377000000,39.91931652241173000000,'二',3,1),
(2,116.40174237228597000000,39.91704765582716000000,'撒地方',3,2),
(2,126.95546669015175000000,40.67954834914944000000,'234',4,1),
(2,116.43458442173076000000,39.93857116820758000000,'地点二',4,2),
(2,116.41467797162964000000,39.91660494131743000000,'234',5,1),
(3,116.39132202837021000000,39.90941042622053000000,'地点三',1,1),
(3,116.36731930514361000000,39.85210384641857000000,'爱的爱的发',1,2),
(3,116.38133287109926000000,39.90680914481918000000,'adsfsadg',1,3),
(3,116.70802861896804000000,39.86639348175691000000,'345',2,1),
(3,116.39232813054139000000,39.91477871347197000000,'撒地方噶士大夫',2,2),
(3,116.43961493258664000000,39.92269201295427000000,'三',3,1),
(3,116.40296406777954000000,39.91212229443639400000,'撒地方给',3,2),
(3,126.94166871751848000000,40.15221774014986500000,'345',4,1),
(3,116.45844341607577000000,39.93696682290200000000,'地点三',4,2),
(4,116.41848678699195000000,39.90907835328769000000,'地点四',1,1),
(4,116.37119998494671000000,39.85127296140838000000,'阿道夫阿文',1,2),
(4,116.37421829146024000000,39.91206695126884000000,'sdgas',1,3),
(4,116.74654795923590000000,39.90448451124208000000,'456',2,1),
(4,116.38851931517908000000,39.90885697043099000000,'撒地方高峰时段',2,2),
(4,116.44665764778486000000,39.93021709294113000000,'四',3,1),
(4,116.40246101669395000000,39.90858024084598600000,'的撒反对',3,2),
(4,125.98960860582345000000,40.12397649829568000000,'46',4,1),
(5,116.37680541132897000000,39.92031258624564000000,'adsg',1,3),
(5,126.35295521849933000000,40.60246727318338000000,'456',4,1);

/*Table structure for table `patharrange` */

DROP TABLE IF EXISTS `patharrange`;

CREATE TABLE `patharrange` (
  `path` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `satisfcation` float(255,0) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `day` int(255) DEFAULT NULL,
  `short_dis` varchar(255) DEFAULT NULL,
  `pos` varchar(255) NOT NULL,
  PRIMARY KEY (`path`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `patharrange` */

insert  into `patharrange`(`path`,`description`,`image`,`price`,`satisfcation`,`level`,`day`,`short_dis`,`pos`) values 
('上海东方明珠-透明观光廊-城隍庙-黄浦江-外滩2日游','当日可定 乘坐浦江游船 东方明珠 透明观光廊','ShangHai.jpg',2440.00,5,'五星级',2,'畅游','上海'),
('上海双飞5日自由行','南京路/外滩/人民广场/火车站地区，斯维登精品公寓/锦江都城经典/康铂酒店/北方智选自选，畅游魔都，领略时尚与经典的魅力','shanghai-2.jpg',1314.00,4,'三星品质',5,'经济型','上海'),
('上海外滩+东方明珠高铁动车2日自由行','宿外滩附近（经济快捷/高档型/五星）多种酒店资源自选','shanghai-1.jpg',8888.00,5,'五星级',2,'牛人严选','上海'),
('兵马俑-华清池-华山-壶口瀑布-黄帝陵-延安7日游','西安段12人小团，精选舒适酒店，含手工皮影/登山手套，含24H接机','ChengLou.jpg',3154.00,4,'三星品质',7,'畅游','西安'),
('北京双高或双动3日游','','BinMaYong.jpg',2350.00,4,'五星级',3,'牛人严选','北京'),
('北京当地参团7日游','自营倾情打造/五星服务0暗店/热销4年纯玩精品，故宫上新了/深度游3H(含珍宝馆)，获奖导游精讲漫游，香山红叶赏秋景，观升旗仪式 ','huashan.jpeg',6688.00,4,'四星级',7,'经济型','北京'),
('北京故宫-恭王府-八达岭长城-颐和园2日游','体验北京红色之旅 纯玩无购物 家庭出游 乘黄包车游胡同 美食升级','NPU.jpeg',1550.00,5,'五星级',2,'经济型','北京'),
('西安-兵马俑-华清宫-华山-明城墙-大明宫3日游','二环内接，双景区耳麦，含自助中餐，纯玩0购物，夜游大唐不夜城，华山6小时，潼关黄河湾','jiaocheng-1.jpg',3220.00,3,'还行吧',3,'那当然','西安'),
('西安-华山-兵马俑-华清池-大明宫当地5日游','牛人五星，自营纯玩爆款，国际五星自助餐，历博快速通道，24H接送机，超1w人出游（当地参团）','QinLing.jpg',1234.00,2,'还行吧',5,'畅游','西安'),
('西安-法门寺-华清池-兵马俑-乾陵-大明宫5日当地游','牛人五星，纯玩爆品，途牛自营地接，探秘国家宝藏，享国际品牌自助餐（当地参团）','jiaocheng-2.jpg',880.00,5,'四星级',5,'经济型','西安');

/*Table structure for table `spotticket` */

DROP TABLE IF EXISTS `spotticket`;

CREATE TABLE `spotticket` (
  `spotname` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `alt` varchar(255) NOT NULL,
  PRIMARY KEY (`spotname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `spotticket` */

insert  into `spotticket`(`spotname`,`city`,`description`,`price`,`img`,`alt`) values 
('华山','渭南','华山为五岳之西岳，南接秦岭，北瞰黄渭，是中华民族文化的发祥地之一。',29,'huashan.jpeg','朝阳台'),
('大熊猫繁育基地','成都','成都大熊猫繁育基地位处成都市北郊虎头山，是国内开展大熊猫等珍稀濒危野生动物移地保护的主要基地之一。',55,'panda.jpg','大熊猫'),
('大雁塔','西安','大雁塔是西安的城市符号，相传唐代永徽三年，玄奘为藏经典而修建，为阁楼式砖塔,是中国唐朝佛教建筑艺术杰作。',55,'DayanPagoda.jpg','大雁塔广场'),
('成都武侯祠','成都','武侯祠位于四川成都南郊，占地56亩，是国内纪念蜀汉丞相诸葛亮的主要胜迹。',0,'KamTemple.jpg','武侯祠'),
('杜甫草堂','成都','杜甫草堂坐落于浣花溪畔，是首批国家一级博物馆，园林清幽秀丽，是中国文学史上的一块圣地。',29,'Dufu.jpg','杜甫草堂'),
('杜莎夫人蜡像馆','香港','杜莎夫人蜡像馆位于香港太平山顶凌霄阁，云集全球名人蜡像，为参观者提供逼真、有趣的互动体验。',216,'waxworks.jpg','奥黛丽赫本'),
('秦始皇兵马俑博物馆','西安','秦俑博物馆位于今西安市临潼区，展示秦始皇陵的一部分陪葬坑。秦兵马俑的发掘被誉为“二十世纪考古史上伟大的发现之一。',19,'potteryfigurine.jpg','兵马俑'),
('维多利亚港','香港','维多利亚港位于香港岛和九龙半岛之间的天然良港，岸上高楼林立，有“世界三大夜景”的美誉。',129,'victoriaHarbour.jpg','维多利亚港夜景'),
('迪士尼','香港','香港迪士尼乐园位于香港大屿山，含七大主题园区，分别展现不同时代迪士尼故事的魅力！',548,'disney.jpg','童话建筑'),
('都江堰','成都','都江堰位于坐落在成都平原西部的岷江上，公元前三世纪，蜀郡太守李冰带领人民群众建造了举世无双的都江堰工程，非常科学地实现了导江、防洪、引流灌溉的一系列功效。',80,'Dujiangyan.jpg','都江堰'),
('陕西省历史博物馆','西安','陕西历史博物馆位于西安大雁塔的西北侧，是中国第一座大型现代化国家级博物馆。',79,'treasure.jpg','镶金兽首玛瑙杯');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `phoneNum` varchar(30) DEFAULT NULL,
  `user_id` int(8) NOT NULL,
  `password` varchar(30) NOT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`phoneNum`,`user_id`,`password`,`user_name`) values 
('17795832432',1,'1','Liu_PiPiPi'),
('15540155969',2,'2','DaLao'),
('17795832651',3,'3','飞翔的企鹅'),
('11230513213',4,'4','GaoZhiyang');

/*Table structure for table `user2` */

DROP TABLE IF EXISTS `user2`;

CREATE TABLE `user2` (
  `userId` varchar(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` char(255) DEFAULT NULL,
  `character` varchar(255) DEFAULT NULL,
  `route` varchar(10) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user2` */

insert  into `user2`(`userId`,`name`,`sex`,`character`,`route`,`image`,`tel`,`city`) values 
('2017303181','湮灭','男','一起去旅行吧！','xian1','picOne.jpg','18868539953','xian'),
('2017303182','月光宝盒','男','一起去旅行吧！','xian1','picTwo.jpg','13397378622','xian'),
('2017303183','宝杜','女','一起去旅行吧！','xian2','picThree.jpg','15802374264','xian'),
('2017303184','大魔王','男','一起去旅行吧！','xian2','picFour.jpg','13502876271','xian'),
('2017303185','跑步者','女','一起去旅行吧！','beijing1','pic5.jpg','18837851073','beijing'),
('2017303186','时光机','男','一起去旅行吧！','beijing2','pic6.jpg','13304509347','beijing'),
('2017303187','大黄蜂','女','一起去旅行吧！','shanghai2','pic7.jpg','17829236279','shanghai'),
('2017303188','时代异变','女','一起去旅行吧！','shanghai2','pic8.jpg','15983637842','shanghai'),
('2017303189','夏末','女','一起去旅行吧！','shanghai2','pic9.jpg','15217993270','shanghai'),
('2017303190','开秋','男','run!run!run!','shanghai2','pic10.jpg','16218328937','shanghai'),
('2017303191','凛冬将至','男','人生是走出来的','shanghai2','pic11.jpg','16328939394','shanghai'),
('2017303192','春暖花开','女','一起去旅行吧！','shanghai2','pic12.jpg','13027832936','shanghai');

/*Table structure for table `user_logs` */

DROP TABLE IF EXISTS `user_logs`;

CREATE TABLE `user_logs` (
  `log_id` int(8) NOT NULL DEFAULT '0',
  `user_id` int(8) NOT NULL DEFAULT '0',
  `card_imgUrl` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `card_title` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `card_abstract` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `card_date` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`log_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_logs` */

insert  into `user_logs`(`log_id`,`user_id`,`card_imgUrl`,`card_title`,`card_abstract`,`card_date`) values 
(1,1,'http://i.froala.com/download/51aecba34749549633322ae1455bcb7c1bc0ef51.jpg?1567736355','第一篇游记北京','经过二十多个小经过二十多个小时的车上颠簸，终于来到了美丽的蓉城———成经过—成经过成经经过成经经过成经经过成经经过成经过二...','2019-09-06'),
(1,2,'http://i.froala.com/download/a3f32a7b450aba003bf000ef2ed8a02837a87bb9.jpg?1567736738','    成都行','提起四川，常听别人说巴蜀之地、天府之国、蜀道难难于上青天。今年暑假和爸爸一起去了四川的省会——成都，真是大开眼界，见识了四川。　　四川的山真多，我们坐着火...','2019-09-06'),
(1,3,'http://i.froala.com/download/d7440682b4262a332d970c44ff49d8e044c39b12.jpg?1567736977','美丽的西安','西安是一个很美的地方，你去过吗？那儿的风光，真是令人陶醉，去过的人都连连赞叹，而且，那里的小吃，也很棒哦！现在，让我来带你去欣赏一下西安的十大美景，以及两...','2019-09-06'),
(2,1,'http://i.froala.com/download/deb05c40164c96f9759401f73e2868eb1fb5969d.jpg?1567736491','北京，北京','北京是我一直向往的地方，今年暑假我终于如愿以偿了。八月十四日，妈妈带着我坐了两个小时的飞机到达了我国的首都，开始了我们的北京之旅。第一天，我们就来到天安门...','2019-09-06'),
(2,2,'http://i.froala.com/download/bf2f374640ecc341a5dd261b147f145d9d85883b.jpg?1567736799','成都印象','经过二十多个小时的车上颠簸，终于来到了美丽的蓉城——成都，聆听“阅读的力量——2013年新教育国际高峰论坛”上的“高端”发言。看着车窗外一闪而过的成都街景...','2019-09-06'),
(3,1,'http://i.froala.com/download/395bf7de6c8925655263240c8975dff7d924dd55.jpg?1567736565','    香港一日游','此次暑假的香港之行，已是我第二次到香港，却是我第一次真正感受香港，感受这座繁华都市的魅力。山中遇出行前从网上了解到香港近几天多雨，可过关之时，仍是晴空万里...','2019-09-06'),
(3,2,'http://i.froala.com/download/63e0177baf11cbae9a289bf1c697bdad387e4fb6.jpg?1567736880','上海美好时光','这个暑假，我听爸爸妈妈说要带我去上海旅游，听到这个消息，我兴奋不已，在等待的几天里，我心里不时勾画着上海的美丽，每天都掰着手指头数，期盼着成行的那一刻。 ...','2019-09-06'),
(4,1,'http://i.froala.com/download/dbb524807a9e6d51e8b8e67491884481d9e5ee23.jpg?1567736642','成都是一座巴适的城市','要亲近一个城市，最好还是戒骄戒躁地住一阵子。　　这次到成都去，是应四川少年儿童出版社之约，做“‘读好看的书，做幸福的人’——儿童文学作家王钢校园行”活动。...','2019-09-06'),
(4,2,'http://i.froala.com/download/77b52413cc195c240b30bf478dc2f42a1026c53c.jpg?1567742431','文章','请在此框内输入在此框内输入正文在此框内输入正文在此框内输入正文在此框内输入正文 ...','2019-09-06'),
(5,1,'http://localhost:8080/travelLog/%E6%B8%B8%E8%AE%B0%E6%95%B0%E6%8D%AE%E5%BA%93%E6%B5%8B%E8%AF%95/Editor/img/map.png','请在此编辑标题ddddd','请在此框内输入正文)...','2019-09-07');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
