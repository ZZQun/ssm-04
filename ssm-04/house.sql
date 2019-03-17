/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.24 : Database - house
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`house` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `house`;

/*Table structure for table `houselist` */

DROP TABLE IF EXISTS `houselist`;

CREATE TABLE `houselist` (
  `houseid` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `price` double(10,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`houseid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `houselist` */

insert  into `houselist`(`houseid`,`address`,`price`,`status`,`detail`) values (16,'菊花园1-364',700.00,'已租赁',NULL),(17,'东风街13号',1300.00,'已租赁',NULL),(20,'穗石村18号',700.00,'未租赁',NULL),(21,'穗石村1号',800.00,'未租赁',NULL),(22,'1111',1111.00,'未租赁',NULL);

/*Table structure for table `paid` */

DROP TABLE IF EXISTS `paid`;

CREATE TABLE `paid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `paydate` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `houseid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `paid` */

insert  into `paid`(`id`,`address`,`price`,`date`,`paydate`,`name`,`userlist_id`,`status`,`houseid`) values (5,'广药1-364',500.00,'2017-09-14','2017-09-27','赵颖欣',10,'租金已缴',0),(6,'菊花园1-364',700.00,'2017-09-30','2017-09-28','李四',12,'租金已缴',0),(7,'碧桂园1-364',4365.00,'2017-10-31','2017-10-08','张三',14,'租金已缴',0),(8,'贝岗街18号',700.00,'2017-10-31','2017-10-10','张思',15,'租金已缴',0),(9,'广药1-364',5000.00,'2017-10-31','2017-10-10','赵颖欣',10,'租金已缴',0);

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

insert  into `schedule`(`id`,`date`,`content`) values (2,'2017-09-08','收数'),(3,'2017-09-20','今天是收租日');

/*Table structure for table `solve` */

DROP TABLE IF EXISTS `solve`;

CREATE TABLE `solve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `houseid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `solve` */

insert  into `solve`(`id`,`address`,`date`,`detail`,`name`,`userlist_id`,`status`,`houseid`) values (4,'广药1-364','2017-09-08','kk','赵颖欣',10,'已处理',NULL),(5,'菊花园1-364','2017-09-28','天花板漏水','李四',12,'已处理',NULL),(6,'碧桂园1-364','2017-10-08','窗户坏了','张三',14,'已处理',NULL),(7,'贝岗街18号','2017-10-10','天花板漏水','张思',15,'已处理',NULL),(8,'广药1-364','2017-10-09','空调漏水','赵颖欣',10,'已处理',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`type`) values (1,'admin','2222222','管理员'),(3,'zyx','12345','租客'),(11,'gggg','111','租客'),(18,'admin2','11111111','租客');

/*Table structure for table `userlist` */

DROP TABLE IF EXISTS `userlist`;

CREATE TABLE `userlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`idcard`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `userlist` */

insert  into `userlist`(`id`,`name`,`idcard`,`phone`,`userid`) values (27,'李2','11111111','11111111',18);

/*Table structure for table `yizulist` */

DROP TABLE IF EXISTS `yizulist`;

CREATE TABLE `yizulist` (
  `id` int(11) NOT NULL,
  `userlistid` int(11) DEFAULT NULL,
  `houseid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `yizulist` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
