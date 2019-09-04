/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 10.1.38-MariaDB : Database - ums
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ums` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ums`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `account_id` bigint(20) unsigned NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `access_token` varchar(100) DEFAULT NULL,
  `password_reset_token` varchar(100) DEFAULT NULL,
  `email_confirmation_token` varchar(100) DEFAULT NULL,
  `role_id_fk` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  CONSTRAINT `user_account` FOREIGN KEY (`account_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `account` */

/*Table structure for table `auditrevisionentity` */

DROP TABLE IF EXISTS `auditrevisionentity`;

CREATE TABLE `auditrevisionentity` (
  `id` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auditrevisionentity` */

insert  into `auditrevisionentity`(`id`,`timestamp`,`username`) values 
(1,1566556153290,'jovana.ilic@mailinator.com'),
(2,1566556196883,'jovana.ilic@mailinator.com'),
(3,1566556289065,'lilly.auldrin@mailinator.com');

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `company_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`company_id`,`company_name`) values 
(1,'FON'),
(2,'CloudAfrica'),
(3,'DonDin'),
(4,'Dragon Ball'),
(5,'Levi9');

/*Table structure for table `company_audit_log` */

DROP TABLE IF EXISTS `company_audit_log`;

CREATE TABLE `company_audit_log` (
  `company_id` bigint(20) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`REV`),
  KEY `FK58613vicnlfo0oq0jrm7c4x2s` (`REV`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `company_audit_log` */

/*Table structure for table `document` */

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `document_id` bigint(20) NOT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `document` */

/*Table structure for table `document_audit_log` */

DROP TABLE IF EXISTS `document_audit_log`;

CREATE TABLE `document_audit_log` (
  `document_id` bigint(20) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`document_id`,`REV`),
  KEY `FKqgigt6wkn3xpxrhl7rhvluevo` (`REV`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `document_audit_log` */

/*Table structure for table `document_field` */

DROP TABLE IF EXISTS `document_field`;

CREATE TABLE `document_field` (
  `document_id_fk` bigint(20) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_value_date` date DEFAULT NULL,
  `field_value_double` double DEFAULT NULL,
  `field_value_integer` int(11) DEFAULT NULL,
  `field_value_long` bigint(20) DEFAULT NULL,
  `field_value_string` varchar(255) DEFAULT NULL,
  `template_field_id_fk` int(11) DEFAULT NULL,
  `template_id_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`document_id_fk`,`field_id`),
  KEY `FKgvyoyf25jjmk1wjt9emu85meu` (`template_field_id_fk`,`template_id_fk`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `document_field` */

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values 
(4);

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `position_id_fk` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKguodx3r7wj0wyr413qmmad3n0` (`position_id_fk`),
  CONSTRAINT `FKguodx3r7wj0wyr413qmmad3n0` FOREIGN KEY (`position_id_fk`) REFERENCES `position` (`position_id`),
  CONSTRAINT `user_position` FOREIGN KEY (`position_id_fk`) REFERENCES `position` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `person` */

insert  into `person`(`id`,`email`,`first_name`,`last_name`,`mobile_number`,`gender`,`date_of_birth`,`position_id_fk`) values 
(2,'marina.guzvic@gmail.com','Marina','Guzvic','+38164/933-9101','Female','1995-05-03',4),
(3,'milos.djordjevic@africa.za','Milos','Djordjevic','+2782/123-456','Male','1996-11-10',1),
(4,'anjaxbasara@gmail.com','Marinica','Guzviceva','+38164/933-9101','Female','1999-10-26',2),
(6,'jovan.ilic2@gmail.com','Jovan','Ilic','+38163/155-6666','Male','1995-11-30',4),
(7,'petar.trifunovic@yahoo.com','Petar','Trifunovic','+2782/123-555','Male','1994-09-12',2),
(8,'jelena.iles@hotmail.com','Jelena','Iles','+38163/129-1286','Female','1990-02-04',4),
(9,'ana.dandolo@gmail.com','Ana','Dandolo','+38163/129-2323','Female','2000-06-21',1),
(10,'the.black.cat@cupboard.com','Mile','Bubisic','+38163/129-111','Male','1993-05-10',3),
(11,'orange.cat@basket.com','Cira ','Spiridonovic Djordjevic','+38163/144-333','Male','1999-06-11',1),
(12,'invisible.cat@cupboard.com','Kaja','Djordjevic','+38164/966-7777','Female','1997-02-09',2),
(13,'zojica@lap.com','Zoja','Djordjevic','+2782/123-1111','Female','2000-05-29',4),
(14,'sniffer@food.com','Buddy','Njuskalo','+38163/144-2424','Male','1989-12-30',1),
(15,'igor.stanojevic@hotmail.com','Igor','Stanojevic','+38163/144-331','Male','1991-02-06',3),
(16,'lana.dragojlovic@gmail.com','Lana','Dragojlovic','+38163/155-7878','Female','2000-03-09',4),
(17,'lana.dragojlovic123@gmail.com','Lana','Dragojlovic','+38163/155-7878','Female','2000-03-09',4);

/*Table structure for table `person_audit_log` */

DROP TABLE IF EXISTS `person_audit_log`;

CREATE TABLE `person_audit_log` (
  `id` bigint(20) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `position_id_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`REV`),
  KEY `FKrcyijisq4g3nonytctddvlmhh` (`REV`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `person_audit_log` */

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `position_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(50) DEFAULT NULL,
  `company_id_fk` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`position_id`),
  KEY `FK2i5of7cea5jcx05f5w8k6g85o` (`company_id_fk`),
  CONSTRAINT `FK2i5of7cea5jcx05f5w8k6g85o` FOREIGN KEY (`company_id_fk`) REFERENCES `company` (`company_id`),
  CONSTRAINT `company_position` FOREIGN KEY (`company_id_fk`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `position` */

insert  into `position`(`position_id`,`position_name`,`company_id_fk`) values 
(1,'Accountant',1),
(2,'HR',2),
(3,'QA specialist',3),
(4,'Java Developer',4);

/*Table structure for table `position_audit_log` */

DROP TABLE IF EXISTS `position_audit_log`;

CREATE TABLE `position_audit_log` (
  `position_id` bigint(20) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `position_name` varchar(255) DEFAULT NULL,
  `company_id_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`position_id`,`REV`),
  KEY `FK2gadnkhs30hc8gi6p9hypupfj` (`REV`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `position_audit_log` */

/*Table structure for table `revinfo` */

DROP TABLE IF EXISTS `revinfo`;

CREATE TABLE `revinfo` (
  `REV` int(11) NOT NULL AUTO_INCREMENT,
  `REVTSTMP` bigint(20) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`REV`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `revinfo` */

insert  into `revinfo`(`REV`,`REVTSTMP`,`username`) values 
(1,1566386751504,NULL);

/*Table structure for table `template` */

DROP TABLE IF EXISTS `template`;

CREATE TABLE `template` (
  `template_id` bigint(20) NOT NULL,
  `template_file` longblob,
  `template_file_name` varchar(255) DEFAULT NULL,
  `template_file_type` varchar(255) DEFAULT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `template` */

insert  into `template`(`template_id`,`template_file`,`template_file_name`,`template_file_type`,`template_name`) values 
(1,'https://dl.acm.org/citation.cfm?id=599797\r\nhttps://ieeexplore.ieee.org/abstract/document/591650','Potential books master.txt','text/plain','Tamplaetaa'),
(2,'PK\0\0\0\0\0!\0�!�}�\0\0\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��MO�@��&��f��]�`��pP<*���v\n��Y����\Z4@Q�Ҥ�}������+]D�IY7����2Ӕ����{a&�5��5 ���z��Hm0e���(g�&ց���z-��)wB~�)��N�Kk��҃�{O��y��>�$\nd�c���J�p�PR\"���H�7		)�=8So��	��ဍ�J�U�H��\"4a��Ϭ�k:Cr�f��s%�їn�[	�Ts]$͊�l�r����\'��A\Z�V������*̆y����K���O�m{\Z�@�>%�{�m7��V�%L���bǼ$���I\'T���h�[!\r�ճ{6Ges,��s�C\Zb���N�RS�;�AA3���y�H���A9b3��d�j���\0\0\0��\0PK\0\0\0\0\0!\0�\Z��\0\0\0N\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���JA���a�}7�\n\"���H�w\"����w̤ھ�� �P�^����O֛���;�<�aYՠ؛`G�kxm��PY�[��g\rGΰino�/<���<�1��ⳆA$>\"f3��\\�ȾT��I	S����������W����Y\rig�@��X6_�]7\Z~\nf��ˉ�ao�.b*lI�r�j)�,\Zl0�%��b�\n6�i���D�_���,	�	���|u�Z^t٢yǯ;!Y,}{�C��/h>\0\0��\0PK\0\0\0\0\0!\0�DӇ,\0\0>\0\0\0word/_rels/document.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���N�0��H�C�;M;`Ch�.��+qNS��h�*���=Ѫ�-+=�����ώ����:���5	�È`��+S$�}�r��$arQ[	;\0�Mz}�~�Z�/²j0�.V5���,Am�g�uZ�]�!?E|EK��,x�<an�߲`wh|�?޺�΢UJ��U��G��Е#j����g�@z?�\n��]�B��8����[�\'+�\Z�����:�c؊��bN�v������s�7{���g���)���\Zډ���Y������7 ���fO���/(N�	�~}�\0\0��\0PK\0\0\0\0\0!\0�]��\0\0I\0\0\0\0\0word/document.xml�X�n7��;{j�ZɊ����n� Xɥ�b�K���H�����ȋ�d�W��\')Rd+A�B( h�g>�g���?\'95�)9:�a@��T�d2>��:\r�u c�J�ApKm����^����2A�#!m��A0uN��mM�\0{(Xd�Uw)�V�	�h{�L��x�FE�Z��d6���:��T�^e8{�L�`�L�]�ccƙ�E��Q� 3�_	�j�K��@գ^aִذo��b�رm(G��S�j|-\Z�8�Eʷ)�^ϛ�Nom�F姜���9�p\rnq�H���S��nS�:���V��%�d�u�,���-�}iT�q4�6�+�6X�1w�,<.<oY5���뎦�i@DԿJ�20�(Ѽ�#�\"�3c���&�>��f��۰s��$����za����4�tw~��Q������C��L��}��!P|tO����~��A&u�5�kp�u3���>k���}���}w����0}/�+�*��\Z!���TU#���鑻�&�Y7�=-���(	f<�������N�_��:���^���u����b6�)#�0A���ֿ٪=aW�x��� gtg����mn�<�٭�Y|��,��̀����\'�\\����\Z��E���:f��դ���J���<�T�Qj��B��dyv�f4g$U�=|�������*�X��X�EI9X���$K]f�8c�{��?J�,��2�9��B!�q�3`.��q��rZ�:�n��Ύ�|���%�\\�����R����!W�sY���dhh�iL�=]s����P�7_s�x�K  ���=�l��K���#�a��bL�}�\"A`��ǥ���̒빿J�+�3�Rc=�_������)��#�وKW��7��5����QIK#74U�[Ա��߬hZm��צs�����\n[����S|/\nU������^9Űd�uo�+�X�9�,�N)���n?Q\nuh�I�f�]������\r�/)��z��yC�L�!sJyt\\�bX/�.JѲ�Ǿ���?\0\0\0��\0PK\0\0\0\0\0!\00�C)�\0\0�\0\0\0\0\0word/theme/theme1.xml�YOo�6��w toc\'v\Zu�ر�-M�n�i���P�@�I}��úa��m�a[�إ�4�:lЯ�GR��X^�6؊�>$���������!)O�^�r�C$�y@�����/�yH*��񄴽)�޵��߻��UDb�`}\"�qۋ�Jח���X^�)I`n�E���p)���li�V[]�1M<����\Z��O�P��6r�=���z�gb�Ig��u��S�eb���O������R�D۫����qu	�g��Z����o~ٺlAp�lx�pT0���+[}`j�����zA�\0�V�2�F���i�@�q�v�֬5\\|��ʜ̭N��le�X�ds���jcs����7����f����\r��W���+�Ն�7����`���g�Ș��J�\Z��j|��h(�K��D-����\0\rdX��iJ�؇(��x$(��:��;�˹!�I_�T��S1�������?E��?������?ZBΪm���U/������?�~����xY����\'���y5�g&΋/����ɋ�>���G�M�Ge���D�����3Vq%\'#q�����$�8��K�����)f�w9:ĵ��\nx}r�x����w���r�:\\TZaG�*�y8I�j�bR��c|XŻ�ǿ�I\nu3KG�nD1�NIB�s���\n��R��u���K>V�.EL+M2�#\'�f��i~�V��vl�{u8��z��H�\n�*���:�(W�☕\r~��J��T�e\\O*�tHG��HY��\0}KN��P�*ݾ˦���TѼ�9/#��A7�qZ��$*c?���qU��n��w�N��%��O��i�4=3��N���)cbJ\ru�V�4����(Tn���\n7��_?���m-ٛ�{U����B�w�<w���_���$�#��[Ի���8{���(�/�$Ϫ0h݋�F۴��®{L�)#7�i�%�=A�:s�$�),��Qg20pp��f\r\\}DU4�p\nM{��DB��%J��â������+{�l�C���]��=��5\n2F��hsF+��Y��\\Ɉ�n�ì��:3���E�[��6�9����`��&45Z!��*��5k8�`Fmw��-��\"�d>�z���n���ʜ\"Z��x��J�Z��p;����\Z���{/�<�P;��,)\'\'K�Q�k5���q���pN��8�K�Gb�e���\r�S��d�̛�\\17	�p�a�>��SR!���\r\r3��\0K4\'+�r�zQ\nTT��I����Ivt]K�c⫲�K#�v�5+�|��D�\Z�����~��O@%\\w���_�nN[�L��9K����q��g�V�h��n\nR!�y+��U�n�;�*&�/H�r��T��	�>��>\\\r�t��=.Tġ\n���\ZS; Z�~�!������P��9gi���C�ڧ!�#	B��,��;�X=ۻ,I�2UW�V�9$l�k���=A��j���;�{�A�P79�|s*Y�����;�̠�[�MC�ۿ�hf��]o��{oY=1k�\ZyV\0��V����5E8�Vk+֜���\\8���0X4D)�!!��?*|f�v�\ru����\"�x��A�@T_������q��6�4)kڬu�V�7��t�\'��%;���i�9s�9�x���,��ڎ-45x�d���8?�ǘ�d�/Y|t��&LIL�J`�& �-G�t�/\0\0\0��\0PK\0\0\0\0\0!\0��\n�\0\0�\0\0\0\0\0word/settings.xml�V[o�6~��`蹎$[v!J�&��\"^�)��tl�\r$e���;$ŸA� X�\'������><r6ك6T�*�ϲd���*�v��^$c�����\0&�p��4`-��	BS�Jv֪2MM�N̙T �����W�M9�����+biC��t�e�d��U�kQ�SN[-��X�R�͆�0~��~�ݠy+۞���b���R�U&�����!�\"��� ��E�!�^����4��SPZ�`��.\'T<�����T�a��`;uP��g�t�ܰ�\'��xGMt(36���筐�4�jȋ�\Z;껔|2�\nt�E���,Ic����5\n���2 �5�[M86V����`Czf�IS[�PhO������&�]+�\"ڍVK�:���7ؤ\Zs�-��	�:�?j�1�@[z-;p��������)x/1>�ӆ$���`hj{`�B�k�>��Ko,�!����\0g�+��A�\n��1M�Ș�ĊQ��ZK�Yt�\Z?k,�Et���יx�GJːe�r�,�C.�؛8��g����b^�\\ܞ�\\d緋S��\"�OqVY~~�}�h�x�����*�\\cLxh��M�d���/�����o\0�4�ȩ�&2���0�0��ɉ?N��Q���lM���;J�T��/OXn�A��e���A\n��E1�Qa�(�t�7u��k~`�����0=�g(->Q~p��ƺ��~��(�ӵ{�`M���\"�6�F�;��f�x��9�f;y3�Û��i]d(=�@8��x8��6?�pY��H[D��H[F\Z>�C���Ը*pţ�o$cr���H�����#\n��n������j&�qMCG-�%(�q�?�l��GiF���d�	�g�IG,Au_�g�X:���}�Z��Xxs\\�g�qF��AᎷRc�~�������\0\0��\0PK\0\0\0\0\0!\0�d���\0\0b;\0\0\0\0\0word/styles.xml��]s�:��������Ҹ���I{��~�u2�Z9���&�?�V�\r�*1�}V�ջ8ѾywG�/�fJ\'�b�{2	t��ۅs����e�HB�D.�������כ��,�d恁$;��������h�����n�u\Z�>���X�?wۣ@�[����T�0���\'~a&�X��\n�v�Lr?Jeu�m�6�[��X��i�Mu �&G�^,T��L�k�b�:���Lfd=\ZS0|2���������6ѩXE�xw�c�-�\\����(����*->���G��ww*�@�kXR0+���,ɔw���L��77橃w�,/Y{�B�1�\r6�h�O��+�ƃ\'�\"������fY�d�K+���Ez�<3�F8����t�O&�Е� ��\\BR@�N�LN�/�Ï�YW��uA\0+�����\\��Y���r�Y?e�����G\\���J�N!I��׆	�2V�TJ�_�k7�F��ߍLn2>^������]���\'ŝ(?�rk�L\'�D��\0��(qС�z��^�P��{���� e#�����\n�Y�z��fF�	�]����&���x��&o�����t�oDln����\\6���0{ݒ�fD-�:GԒ�sD-G:G�R�sD-:G��9����p��\nW5�f�\Z��}��H��4�)uE��D*nS��x��V�n��n��\\E9}�X.�T\'��+��l�gk�x���������\\�k���������&_mN�br��]E\"��2��彍(c�W�-�[F�s=��Y�nro����	;iX�数�?�נu3�4L��8)�\'\ry�l���.�/\r�m���9#��ؾD�&D���9\0�l��O���Ņo�Ę�-EϴO���g���h�/[i.�K�G�^s��=בN׻h�:�a���A�{;�$���w���΂\0��Q��GeP���l����R��	cF�\0UXS���2@l��!)�71n1@�v�yְP�H���w:�~��6h�r���K2��h���G��d�#��\nԯ2@�J!Ԑ��<�&�!��#�ŖeW�0���<g+��J�@u���հ{�s�^7	v��u�@aG�R�\\�$���VC�h�QYS9�b��2Ƚ	f4�x@È74�x@�Ż2�xXlmp�Zo�|�w��x@lm�jW��h_��J���ě@a�.�\n;:M�M`�#�L����XÈ74�x@È74�x@È7�_��!É7�����e�&����@e�&���6o��\\�	v���M���ST��J`�Ta9�&��N2,LnΤ�o�oh�&��o��xwC�o��\rNS��M\0������M\0���x�f���M��To����:�#�����xX�/�ś\0�G���h�&�h�&��o��xwC�o��\rNS��M\0������M\0���x����M��To����:�&������XÈ7���[�	 |� �E�0\r#ބ\r#�P��\'�[���ś\0b˃�ś\0bk�9g�E��S\'\rI@=g�?�@N�D�!�2�&+�}:�\'p?C�!=�S|��O�v�{֐ d�ZEJ��<�SjD��[:	���{�lLm��ӓ7�=Tn��$�8~�[h���O�k� d��� l��������6}>� 6U����~\"���\r��jA��$<�^7��GG[2�n��ߡ�sO�h������->�I��5��պ�М�.uy![E��~�LB�!4	��l0�{aM��sE_6��z��h$׹�;c��Z�<�q����\'�@:����$��$��+�B�W˚զr`\'�Ӕ�g]R���;=�.n�_\\�֜�\Z�x}[	h��f:�j[�� p�=n2�G���s1z<~9;>ua�*�應�C3Z�{�\rv\"*��*Lv�wXl������\0\0��\0PK\0\0\0\0\0!\0`?�\0\0S>\0\0\Z\0\0\0word/stylesWithEffects.xml��[s�:������/I�6S��&�d���N�<� ǚ\0�p�����J�1��>%��]��đ�}x�\'���ܝ�\Z��<��a���}>y�:i�\"�2�s�������ns�f/O0��؛��,�/F��[󐥯B�%2���\'Ñ\\���G����x2ֿŉ�x��EO,usaӚ�y��LB���d�0\nY��\'`=f�X�@d/`{|^��s7O��¡�\Zra*~�#�F{�f���G�&��2J�\"ކq�5q]��t(��0(��ē�φ���u�6������=��Aa`�A�w�պ���P0EF�	�ƅ]f�I�Dd�75�Ʌ�Ч��$2��;��g�&z��Բ$x6>�+�\ZZJ2�X��5������C$������Q���w�W,�T}Ln��c�I��,�,u6,���	+�\0�_/�T�p��4�L�{s���{�K������H������tZ^�R�\\X�P^�������ܵ��`w��dq���t���J��N��I�3Vp�*� B�b�����|����ey&�6\0��Y�X�q�&P��Ql��Wߤ���E7�f�����D�dt�}��pq�C�U�>W\r��v����Y��>������Z���̣�?��*R�ӳ�c%�`:b*�?�\0�0HG�����s�F��-��ý�5g��9��� u�4UU�vI���7q�����&t����Y/�E�oFLmT���Lz����p��@ɪ�*��(���\Z��(���\n��Hx�F~;G4�yp�Ǵpի�T�ja߉,�>١t��RW�\Z�%�!a��Q����!�\\��窖���r�%R�nv�tg�t���Oa�f����.Pϩ�S�>ΗD��k�)�FL��do�\r���2�y���g�Q���Y���N�z���xXg����	;o����0���T���n~�J�qT�[���w�<,��6rn����\ZB�xx��T����3\n�\0L�]�C�����B��r��ߴ�#�#�7��H��>痬4�𵊃Z^3�ڽ��LVyP��Ny��W�E�B /bk%3�\nޑO����/7L��s��Q��Cы\r9)5ٛ\"\"\'�ƚX���\0\"��o�$ԗ��f�Uھkv.�Ӗ��z���ˬ�zڢyX�M_�����N[V�Vԓ�w��k|P�H\0�k�PK}���؞���o�Y�m�e�V�Y�-��ꛈ�����^;�����\n9;�^f�&�5X�D�Z�F{���J	��7� �&��h�F��oh�F���w7d8�F���`5�*��~��U�\"k�Q��;���i+���@�r��⍠���&��~�R	5��:k�F��oh�F��oh�F���w7d8�F���`5�*�Y,�*��~��\r{�[��?.�\n9AM�FP�٩	�}IE��	���x#X�J1,]ܔ��oDDÈ74�x#@È7�_��!É7�E���U�F���`AU�F��ڰW��b��⍠��o�����Z�C��	���x#X�^z�7�9D�h�FD4�x#@È7�_��!É7�E���U�F���`AU�F��ڰW��\Z��⍠��o�����Z�F��	����!XÈ7���x#@��#@zQ�4�x#\"\ZF�����\rN�,�6XM��7D���7D��������NZ�\0�Ϡ�ՀN[����+���B޽;�\'���@l)l��|tp�O[\n��@H���E�ҩD8�8Ip����j�4����y���ǅ��$up��^b8��;˕58 ��uG����8T�Q��9xP�*.���T��z`孁�����bû݃�����-��#�#������;�yng��A�3����z���9r�#&�M�p�v��CH�20G����ȇ7��,�L��Sp���w��e2n4��ܝ�u��Z�,�a��Doמ�3\0�Pu�|TA��I��K���[KRu}m�$�^זR��t�o;��.�-نS��mokߖ���T\'�\ZK�Y ��N�.28���b�x�����͵y�8�(t}�����tl�ypz��,(��]�<wX,�2����\0\0\0��\0PK\0\0\0\0\0!\0q�M�\0\0�\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�SMo�0��0|o��v(FŐb�a[�mϚL\'�dI�ؠٯe7���4�?D>=Rp����1�V�l2-t����V�S���,)W+���#��N~�\0��F2�\n.�Ҫ���I�Ui�aǑ��V�q\'|���^���Ḩ�O�]��U\n�}����h�u旞�c`�*l�U��{�c\'�����ʓ��iQ���?X�Q;Lr���c���-��z����\n�ł�F6|�\Z����ߌ�>����N�\"�1NVf��5\Z:�)��	_�c\"L�L,�]Ta��n�`���5?_6�&qv��<ڍ2��<�&�d~�p�e�C%̢�ʃ�F9b�rZot؆DQV�,��Xowp�6��:Kȹ.�����Kv]����K�dgc�����=����mP�����LO���ya�5�t���bh�\rJ�p�����\"��-��z�wv��mn�w��S�߁�Q��g���ɔO�B\'�����o\0\0\0��\0PK\0\0\0\0\0!\0�2��z\0\0�\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�RQO�0~7�?,}ߺ\r0�l#�!1c��T֮i�o��`��z�}���wM�;Qx[І�2CQ\"$-���ͧ�5�%������=4�//R�Zjx֥m9�)I�P����*���bǐ\\�Z�B�Ċ�5Y���\n��Kp-�N$�$�F�\0�\n ��Q�ׂ�ς9c\nn���t�\\����;�;bUUA5h�p�G�c��ڬ�sY{E�)��嶀<ŧ�{���7Pۦ��T���g����ISuL�f�a_��W؋\\%C5W֝���%� ���M�����i���7�qө�F����<gI�\ZxD�w��)��0���k?\ZͣA2��0������	q퟊�d8�+Zo��2�\0\0��\0PK\0\0\0\0\0!\0\'5�i6\0\0�\0\0\0\0\0word/fontTable.xml��Ks�0�����h,��2-\r3�tѦӵ2h��G8��^�6$�iq���u,}�{�x�\":0c�Vs�0���z��v�~>��&(���\rZ�9:2�?�W�B+g#X��L�9�9W������t�L�H���ƒ����jY��\\pw�S�G��1׸���}�t/�ra}l�\0G�쎗�u��q��ٔFSf-�Y��O�N6Iva$95���\r�0q���[���OR�H��׭҆����-\ZpQ5SD���(�Z�$J[��ԁ�9�9�	��c<�1�c{�#�2wz0��H.��j�$��(���V?��~�)˷0��k/l.T+	��k%�xf�Z��g�b(�sr���u�\\�X�׆w�H�\nN��;�C�n�������H<�O�ՙ��+��s��IL��D8wR�\\O�Kf�o�����Уz[��H�8d������@��-��$�	���Όg�N}���4ԇ���\r�7�t�J����O�c�\roQ� �|<�Ny�j类S:3����(�[΍r�Ȑ���/��i�(�\"��\Z�^6H�livR|d��G�4D�_\"�IQ��\0\0��\0PK\0\0\0\0\0!\0�N\0\0�\0\0\0\0\0word/webSettings.xml���J1��;,��ٕ\"�t� R�\"��\0ivv�d�Lj�Ooڪ ^z�$�����@_���Щf^�\n�����S�/�ٍ�$�0O:�Q���b���gH����(AZ��ڦ[��n��)B(�#1�TJ�4\Z~�ř%�&���.��U]_�o��Qh��;�;��������l]�-��e�!2Y)��?yh\\�e��?�e\ZӼ,�O�Uڛ�xB�*�����Ɨs�P}��br�>aM|˔X������K��d�\0\0��\0PK\0\0\0\0\0!\0����Y\0\0�\0\0\0\0\0word/numbering.xml�W�n�@�W�; ߃m0�����Цj�J��y����X�k�y�>B+��Y�ap�&.�3;���7.���l�TD���v���/����b~6�:J# *8�X[���ϟ.�1��KP���I�O�P�hl��1C�ˈ/�+����jE|l\'Bv�q��-���J���7HY�;V�&\"�!�JH���\n����qt�#�ɒP����n�Ċ%�	��	�q�P�(,d��W�f�3��s�F�%����*$Ѯ��ޠİHi�VF�$r�Z������L��b���0�̈�s��[=��:o�߈qQ���c�0Dx�4Up����W)�L\'\"�y�㏥/���9Ôy��T#5�>�(�V���5-)d��^�t�u�-�����1���wL,\'U�p�Atb�ߺ�;���m�YL5��7�.�.t��R��9��,��,���l4�����n�����:�0dn��7�ϦY1�3]�/cJ�.���<zy�Wʿ��ū\\=�%M愛��j�QC���x���Nƹ��l�\\p��)�@�<l�R\0Ǔ1FJOA��\00#���)�fC�R�����}!A�F8�����i`��1IW�rw@9�s�8N?��ԃa��,�8�H������>0ES(]�k�午%��s��\nfR�p \n��֫�6�x�^��6ŭ�Bϙ^iڃ�c�R\0ߵ���e�\0ʚ(�_�VY�}h[��ho4jЎ�56���;��8V�9$R6���3.�W��N�q^����gW�ھ��`#.�x\'Ÿd�j$}��kМ��-g���yt =�q���N�qC���gW��\nU�s�*+�͚�mJ�;���n�	�f��3�q}�\0\0��\0PK-\0\0\0\0\0\0!\0�!�}�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�\Z��\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0�DӇ,\0\0>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0�]��\0\0I\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Y	\0\0word/document.xmlPK-\0\0\0\0\0\0!\00�C)�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\r\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0��\n�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0v\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0�d���\0\0b;\0\0\0\0\0\0\0\0\0\0\0\0\0\0\06\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0`?�\0\0S>\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/stylesWithEffects.xmlPK-\0\0\0\0\0\0!\0q�M�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0A(\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0�2��z\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0W+\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0\'5�i6\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0�N\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0n0\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0����Y\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�1\0\0word/numbering.xmlPK\0\0\0\0\r\0\r\0I\0\0+5\0\0\0\0','Masters work plan.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','Tamplaet');

/*Table structure for table `template_audit_log` */

DROP TABLE IF EXISTS `template_audit_log`;

CREATE TABLE `template_audit_log` (
  `template_id` bigint(20) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `template_file` longblob,
  `template_file_name` varchar(255) DEFAULT NULL,
  `template_file_type` varchar(255) DEFAULT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`template_id`,`REV`),
  KEY `FK5hhn7kpyhv6rxeoq0785fxavr` (`REV`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `template_audit_log` */

insert  into `template_audit_log`(`template_id`,`REV`,`REVTYPE`,`template_file`,`template_file_name`,`template_file_type`,`template_name`) values 
(1,1,0,'https://dl.acm.org/citation.cfm?id=599797\r\nhttps://ieeexplore.ieee.org/abstract/document/591650','Potential books master.txt','text/plain','Tamplaet'),
(1,2,1,'https://dl.acm.org/citation.cfm?id=599797\r\nhttps://ieeexplore.ieee.org/abstract/document/591650','Potential books master.txt','text/plain','Tamplaetaa'),
(2,3,0,'PK\0\0\0\0\0!\0�!�}�\0\0\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��MO�@��&��f��]�`��pP<*���v\n��Y����\Z4@Q�Ҥ�}������+]D�IY7����2Ӕ����{a&�5��5 ���z��Hm0e���(g�&ց���z-��)wB~�)��N�Kk��҃�{O��y��>�$\nd�c���J�p�PR\"���H�7		)�=8So��	��ဍ�J�U�H��\"4a��Ϭ�k:Cr�f��s%�їn�[	�Ts]$͊�l�r����\'��A\Z�V������*̆y����K���O�m{\Z�@�>%�{�m7��V�%L���bǼ$���I\'T���h�[!\r�ճ{6Ges,��s�C\Zb���N�RS�;�AA3���y�H���A9b3��d�j���\0\0\0��\0PK\0\0\0\0\0!\0�\Z��\0\0\0N\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���JA���a�}7�\n\"���H�w\"����w̤ھ�� �P�^����O֛���;�<�aYՠ؛`G�kxm��PY�[��g\rGΰino�/<���<�1��ⳆA$>\"f3��\\�ȾT��I	S����������W����Y\rig�@��X6_�]7\Z~\nf��ˉ�ao�.b*lI�r�j)�,\Zl0�%��b�\n6�i���D�_���,	�	���|u�Z^t٢yǯ;!Y,}{�C��/h>\0\0��\0PK\0\0\0\0\0!\0�DӇ,\0\0>\0\0\0word/_rels/document.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���N�0��H�C�;M;`Ch�.��+qNS��h�*���=Ѫ�-+=�����ώ����:���5	�È`��+S$�}�r��$arQ[	;\0�Mz}�~�Z�/²j0�.V5���,Am�g�uZ�]�!?E|EK��,x�<an�߲`wh|�?޺�΢UJ��U��G��Е#j����g�@z?�\n��]�B��8����[�\'+�\Z�����:�c؊��bN�v������s�7{���g���)���\Zډ���Y������7 ���fO���/(N�	�~}�\0\0��\0PK\0\0\0\0\0!\0�]��\0\0I\0\0\0\0\0word/document.xml�X�n7��;{j�ZɊ����n� Xɥ�b�K���H�����ȋ�d�W��\')Rd+A�B( h�g>�g���?\'95�)9:�a@��T�d2>��:\r�u c�J�ApKm����^����2A�#!m��A0uN��mM�\0{(Xd�Uw)�V�	�h{�L��x�FE�Z��d6���:��T�^e8{�L�`�L�]�ccƙ�E��Q� 3�_	�j�K��@գ^aִذo��b�رm(G��S�j|-\Z�8�Eʷ)�^ϛ�Nom�F姜���9�p\rnq�H���S��nS�:���V��%�d�u�,���-�}iT�q4�6�+�6X�1w�,<.<oY5���뎦�i@DԿJ�20�(Ѽ�#�\"�3c���&�>��f��۰s��$����za����4�tw~��Q������C��L��}��!P|tO����~��A&u�5�kp�u3���>k���}���}w����0}/�+�*��\Z!���TU#���鑻�&�Y7�=-���(	f<�������N�_��:���^���u����b6�)#�0A���ֿ٪=aW�x��� gtg����mn�<�٭�Y|��,��̀����\'�\\����\Z��E���:f��դ���J���<�T�Qj��B��dyv�f4g$U�=|�������*�X��X�EI9X���$K]f�8c�{��?J�,��2�9��B!�q�3`.��q��rZ�:�n��Ύ�|���%�\\�����R����!W�sY���dhh�iL�=]s����P�7_s�x�K  ���=�l��K���#�a��bL�}�\"A`��ǥ���̒빿J�+�3�Rc=�_������)��#�وKW��7��5����QIK#74U�[Ա��߬hZm��צs�����\n[����S|/\nU������^9Űd�uo�+�X�9�,�N)���n?Q\nuh�I�f�]������\r�/)��z��yC�L�!sJyt\\�bX/�.JѲ�Ǿ���?\0\0\0��\0PK\0\0\0\0\0!\00�C)�\0\0�\0\0\0\0\0word/theme/theme1.xml�YOo�6��w toc\'v\Zu�ر�-M�n�i���P�@�I}��úa��m�a[�إ�4�:lЯ�GR��X^�6؊�>$���������!)O�^�r�C$�y@�����/�yH*��񄴽)�޵��߻��UDb�`}\"�qۋ�Jח���X^�)I`n�E���p)���li�V[]�1M<����\Z��O�P��6r�=���z�gb�Ig��u��S�eb���O������R�D۫����qu	�g��Z����o~ٺlAp�lx�pT0���+[}`j�����zA�\0�V�2�F���i�@�q�v�֬5\\|��ʜ̭N��le�X�ds���jcs����7����f����\r��W���+�Ն�7����`���g�Ș��J�\Z��j|��h(�K��D-����\0\rdX��iJ�؇(��x$(��:��;�˹!�I_�T��S1�������?E��?������?ZBΪm���U/������?�~����xY����\'���y5�g&΋/����ɋ�>���G�M�Ge���D�����3Vq%\'#q�����$�8��K�����)f�w9:ĵ��\nx}r�x����w���r�:\\TZaG�*�y8I�j�bR��c|XŻ�ǿ�I\nu3KG�nD1�NIB�s���\n��R��u���K>V�.EL+M2�#\'�f��i~�V��vl�{u8��z��H�\n�*���:�(W�☕\r~��J��T�e\\O*�tHG��HY��\0}KN��P�*ݾ˦���TѼ�9/#��A7�qZ��$*c?���qU��n��w�N��%��O��i�4=3��N���)cbJ\ru�V�4����(Tn���\n7��_?���m-ٛ�{U����B�w�<w���_���$�#��[Ի���8{���(�/�$Ϫ0h݋�F۴��®{L�)#7�i�%�=A�:s�$�),��Qg20pp��f\r\\}DU4�p\nM{��DB��%J��â������+{�l�C���]��=��5\n2F��hsF+��Y��\\Ɉ�n�ì��:3���E�[��6�9����`��&45Z!��*��5k8�`Fmw��-��\"�d>�z���n���ʜ\"Z��x��J�Z��p;����\Z���{/�<�P;��,)\'\'K�Q�k5���q���pN��8�K�Gb�e���\r�S��d�̛�\\17	�p�a�>��SR!���\r\r3��\0K4\'+�r�zQ\nTT��I����Ivt]K�c⫲�K#�v�5+�|��D�\Z�����~��O@%\\w���_�nN[�L��9K����q��g�V�h��n\nR!�y+��U�n�;�*&�/H�r��T��	�>��>\\\r�t��=.Tġ\n���\ZS; Z�~�!������P��9gi���C�ڧ!�#	B��,��;�X=ۻ,I�2UW�V�9$l�k���=A��j���;�{�A�P79�|s*Y�����;�̠�[�MC�ۿ�hf��]o��{oY=1k�\ZyV\0��V����5E8�Vk+֜���\\8���0X4D)�!!��?*|f�v�\ru����\"�x��A�@T_������q��6�4)kڬu�V�7��t�\'��%;���i�9s�9�x���,��ڎ-45x�d���8?�ǘ�d�/Y|t��&LIL�J`�& �-G�t�/\0\0\0��\0PK\0\0\0\0\0!\0��\n�\0\0�\0\0\0\0\0word/settings.xml�V[o�6~��`蹎$[v!J�&��\"^�)��tl�\r$e���;$ŸA� X�\'������><r6ك6T�*�ϲd���*�v��^$c�����\0&�p��4`-��	BS�Jv֪2MM�N̙T �����W�M9�����+biC��t�e�d��U�kQ�SN[-��X�R�͆�0~��~�ݠy+۞���b���R�U&�����!�\"��� ��E�!�^����4��SPZ�`��.\'T<�����T�a��`;uP��g�t�ܰ�\'��xGMt(36���筐�4�jȋ�\Z;껔|2�\nt�E���,Ic����5\n���2 �5�[M86V����`Czf�IS[�PhO������&�]+�\"ڍVK�:���7ؤ\Zs�-��	�:�?j�1�@[z-;p��������)x/1>�ӆ$���`hj{`�B�k�>��Ko,�!����\0g�+��A�\n��1M�Ș�ĊQ��ZK�Yt�\Z?k,�Et���יx�GJːe�r�,�C.�؛8��g����b^�\\ܞ�\\d緋S��\"�OqVY~~�}�h�x�����*�\\cLxh��M�d���/�����o\0�4�ȩ�&2���0�0��ɉ?N��Q���lM���;J�T��/OXn�A��e���A\n��E1�Qa�(�t�7u��k~`�����0=�g(->Q~p��ƺ��~��(�ӵ{�`M���\"�6�F�;��f�x��9�f;y3�Û��i]d(=�@8��x8��6?�pY��H[D��H[F\Z>�C���Ը*pţ�o$cr���H�����#\n��n������j&�qMCG-�%(�q�?�l��GiF���d�	�g�IG,Au_�g�X:���}�Z��Xxs\\�g�qF��AᎷRc�~�������\0\0��\0PK\0\0\0\0\0!\0�d���\0\0b;\0\0\0\0\0word/styles.xml��]s�:��������Ҹ���I{��~�u2�Z9���&�?�V�\r�*1�}V�ջ8ѾywG�/�fJ\'�b�{2	t��ۅs����e�HB�D.�������כ��,�d恁$;��������h�����n�u\Z�>���X�?wۣ@�[����T�0���\'~a&�X��\n�v�Lr?Jeu�m�6�[��X��i�Mu �&G�^,T��L�k�b�:���Lfd=\ZS0|2���������6ѩXE�xw�c�-�\\����(����*->���G��ww*�@�kXR0+���,ɔw���L��77橃w�,/Y{�B�1�\r6�h�O��+�ƃ\'�\"������fY�d�K+���Ez�<3�F8����t�O&�Е� ��\\BR@�N�LN�/�Ï�YW��uA\0+�����\\��Y���r�Y?e�����G\\���J�N!I��׆	�2V�TJ�_�k7�F��ߍLn2>^������]���\'ŝ(?�rk�L\'�D��\0��(qС�z��^�P��{���� e#�����\n�Y�z��fF�	�]����&���x��&o�����t�oDln����\\6���0{ݒ�fD-�:GԒ�sD-G:G�R�sD-:G��9����p��\nW5�f�\Z��}��H��4�)uE��D*nS��x��V�n��n��\\E9}�X.�T\'��+��l�gk�x���������\\�k���������&_mN�br��]E\"��2��彍(c�W�-�[F�s=��Y�nro����	;iX�数�?�נu3�4L��8)�\'\ry�l���.�/\r�m���9#��ؾD�&D���9\0�l��O���Ņo�Ę�-EϴO���g���h�/[i.�K�G�^s��=בN׻h�:�a���A�{;�$���w���΂\0��Q��GeP���l����R��	cF�\0UXS���2@l��!)�71n1@�v�yְP�H���w:�~��6h�r���K2��h���G��d�#��\nԯ2@�J!Ԑ��<�&�!��#�ŖeW�0���<g+��J�@u���հ{�s�^7	v��u�@aG�R�\\�$���VC�h�QYS9�b��2Ƚ	f4�x@È74�x@�Ż2�xXlmp�Zo�|�w��x@lm�jW��h_��J���ě@a�.�\n;:M�M`�#�L����XÈ74�x@È74�x@È7�_��!É7�����e�&����@e�&���6o��\\�	v���M���ST��J`�Ta9�&��N2,LnΤ�o�oh�&��o��xwC�o��\rNS��M\0������M\0���x�f���M��To����:�#�����xX�/�ś\0�G���h�&�h�&��o��xwC�o��\rNS��M\0������M\0���x����M��To����:�&������XÈ7���[�	 |� �E�0\r#ބ\r#�P��\'�[���ś\0b˃�ś\0bk�9g�E��S\'\rI@=g�?�@N�D�!�2�&+�}:�\'p?C�!=�S|��O�v�{֐ d�ZEJ��<�SjD��[:	���{�lLm��ӓ7�=Tn��$�8~�[h���O�k� d��� l��������6}>� 6U����~\"���\r��jA��$<�^7��GG[2�n��ߡ�sO�h������->�I��5��պ�М�.uy![E��~�LB�!4	��l0�{aM��sE_6��z��h$׹�;c��Z�<�q����\'�@:����$��$��+�B�W˚զr`\'�Ӕ�g]R���;=�.n�_\\�֜�\Z�x}[	h��f:�j[�� p�=n2�G���s1z<~9;>ua�*�應�C3Z�{�\rv\"*��*Lv�wXl������\0\0��\0PK\0\0\0\0\0!\0`?�\0\0S>\0\0\Z\0\0\0word/stylesWithEffects.xml��[s�:������/I�6S��&�d���N�<� ǚ\0�p�����J�1��>%��]��đ�}x�\'���ܝ�\Z��<��a���}>y�:i�\"�2�s�������ns�f/O0��؛��,�/F��[󐥯B�%2���\'Ñ\\���G����x2ֿŉ�x��EO,usaӚ�y��LB���d�0\nY��\'`=f�X�@d/`{|^��s7O��¡�\Zra*~�#�F{�f���G�&��2J�\"ކq�5q]��t(��0(��ē�φ���u�6������=��Aa`�A�w�պ���P0EF�	�ƅ]f�I�Dd�75�Ʌ�Ч��$2��;��g�&z��Բ$x6>�+�\ZZJ2�X��5������C$������Q���w�W,�T}Ln��c�I��,�,u6,���	+�\0�_/�T�p��4�L�{s���{�K������H������tZ^�R�\\X�P^�������ܵ��`w��dq���t���J��N��I�3Vp�*� B�b�����|����ey&�6\0��Y�X�q�&P��Ql��Wߤ���E7�f�����D�dt�}��pq�C�U�>W\r��v����Y��>������Z���̣�?��*R�ӳ�c%�`:b*�?�\0�0HG�����s�F��-��ý�5g��9��� u�4UU�vI���7q�����&t����Y/�E�oFLmT���Lz����p��@ɪ�*��(���\Z��(���\n��Hx�F~;G4�yp�Ǵpի�T�ja߉,�>١t��RW�\Z�%�!a��Q����!�\\��窖���r�%R�nv�tg�t���Oa�f����.Pϩ�S�>ΗD��k�)�FL��do�\r���2�y���g�Q���Y���N�z���xXg����	;o����0���T���n~�J�qT�[���w�<,��6rn����\ZB�xx��T����3\n�\0L�]�C�����B��r��ߴ�#�#�7��H��>痬4�𵊃Z^3�ڽ��LVyP��Ny��W�E�B /bk%3�\nޑO����/7L��s��Q��Cы\r9)5ٛ\"\"\'�ƚX���\0\"��o�$ԗ��f�Uھkv.�Ӗ��z���ˬ�zڢyX�M_�����N[V�Vԓ�w��k|P�H\0�k�PK}���؞���o�Y�m�e�V�Y�-��ꛈ�����^;�����\n9;�^f�&�5X�D�Z�F{���J	��7� �&��h�F��oh�F���w7d8�F���`5�*��~��U�\"k�Q��;���i+���@�r��⍠���&��~�R	5��:k�F��oh�F��oh�F���w7d8�F���`5�*�Y,�*��~��\r{�[��?.�\n9AM�FP�٩	�}IE��	���x#X�J1,]ܔ��oDDÈ74�x#@È7�_��!É7�E���U�F���`AU�F��ڰW��b��⍠��o�����Z�C��	���x#X�^z�7�9D�h�FD4�x#@È7�_��!É7�E���U�F���`AU�F��ڰW��\Z��⍠��o�����Z�F��	����!XÈ7���x#@��#@zQ�4�x#\"\ZF�����\rN�,�6XM��7D���7D��������NZ�\0�Ϡ�ՀN[����+���B޽;�\'���@l)l��|tp�O[\n��@H���E�ҩD8�8Ip����j�4����y���ǅ��$up��^b8��;˕58 ��uG����8T�Q��9xP�*.���T��z`孁�����bû݃�����-��#�#������;�yng��A�3����z���9r�#&�M�p�v��CH�20G����ȇ7��,�L��Sp���w��e2n4��ܝ�u��Z�,�a��Doמ�3\0�Pu�|TA��I��K���[KRu}m�$�^זR��t�o;��.�-نS��mokߖ���T\'�\ZK�Y ��N�.28���b�x�����͵y�8�(t}�����tl�ypz��,(��]�<wX,�2����\0\0\0��\0PK\0\0\0\0\0!\0q�M�\0\0�\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�SMo�0��0|o��v(FŐb�a[�mϚL\'�dI�ؠٯe7���4�?D>=Rp����1�V�l2-t����V�S���,)W+���#��N~�\0��F2�\n.�Ҫ���I�Ui�aǑ��V�q\'|���^���Ḩ�O�]��U\n�}����h�u旞�c`�*l�U��{�c\'�����ʓ��iQ���?X�Q;Lr���c���-��z����\n�ł�F6|�\Z����ߌ�>����N�\"�1NVf��5\Z:�)��	_�c\"L�L,�]Ta��n�`���5?_6�&qv��<ڍ2��<�&�d~�p�e�C%̢�ʃ�F9b�rZot؆DQV�,��Xowp�6��:Kȹ.�����Kv]����K�dgc�����=����mP�����LO���ya�5�t���bh�\rJ�p�����\"��-��z�wv��mn�w��S�߁�Q��g���ɔO�B\'�����o\0\0\0��\0PK\0\0\0\0\0!\0�2��z\0\0�\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�RQO�0~7�?,}ߺ\r0�l#�!1c��T֮i�o��`��z�}���wM�;Qx[І�2CQ\"$-���ͧ�5�%������=4�//R�Zjx֥m9�)I�P����*���bǐ\\�Z�B�Ċ�5Y���\n��Kp-�N$�$�F�\0�\n ��Q�ׂ�ς9c\nn���t�\\����;�;bUUA5h�p�G�c��ڬ�sY{E�)��嶀<ŧ�{���7Pۦ��T���g����ISuL�f�a_��W؋\\%C5W֝���%� ���M�����i���7�qө�F����<gI�\ZxD�w��)��0���k?\ZͣA2��0������	q퟊�d8�+Zo��2�\0\0��\0PK\0\0\0\0\0!\0\'5�i6\0\0�\0\0\0\0\0word/fontTable.xml��Ks�0�����h,��2-\r3�tѦӵ2h��G8��^�6$�iq���u,}�{�x�\":0c�Vs�0���z��v�~>��&(���\rZ�9:2�?�W�B+g#X��L�9�9W������t�L�H���ƒ����jY��\\pw�S�G��1׸���}�t/�ra}l�\0G�쎗�u��q��ٔFSf-�Y��O�N6Iva$95���\r�0q���[���OR�H��׭҆����-\ZpQ5SD���(�Z�$J[��ԁ�9�9�	��c<�1�c{�#�2wz0��H.��j�$��(���V?��~�)˷0��k/l.T+	��k%�xf�Z��g�b(�sr���u�\\�X�׆w�H�\nN��;�C�n�������H<�O�ՙ��+��s��IL��D8wR�\\O�Kf�o�����Уz[��H�8d������@��-��$�	���Όg�N}���4ԇ���\r�7�t�J����O�c�\roQ� �|<�Ny�j类S:3����(�[΍r�Ȑ���/��i�(�\"��\Z�^6H�livR|d��G�4D�_\"�IQ��\0\0��\0PK\0\0\0\0\0!\0�N\0\0�\0\0\0\0\0word/webSettings.xml���J1��;,��ٕ\"�t� R�\"��\0ivv�d�Lj�Ooڪ ^z�$�����@_���Щf^�\n�����S�/�ٍ�$�0O:�Q���b���gH����(AZ��ڦ[��n��)B(�#1�TJ�4\Z~�ř%�&���.��U]_�o��Qh��;�;��������l]�-��e�!2Y)��?yh\\�e��?�e\ZӼ,�O�Uڛ�xB�*�����Ɨs�P}��br�>aM|˔X������K��d�\0\0��\0PK\0\0\0\0\0!\0����Y\0\0�\0\0\0\0\0word/numbering.xml�W�n�@�W�; ߃m0�����Цj�J��y����X�k�y�>B+��Y�ap�&.�3;���7.���l�TD���v���/����b~6�:J# *8�X[���ϟ.�1��KP���I�O�P�hl��1C�ˈ/�+����jE|l\'Bv�q��-���J���7HY�;V�&\"�!�JH���\n����qt�#�ɒP����n�Ċ%�	��	�q�P�(,d��W�f�3��s�F�%����*$Ѯ��ޠİHi�VF�$r�Z������L��b���0�̈�s��[=��:o�߈qQ���c�0Dx�4Up����W)�L\'\"�y�㏥/���9Ôy��T#5�>�(�V���5-)d��^�t�u�-�����1���wL,\'U�p�Atb�ߺ�;���m�YL5��7�.�.t��R��9��,��,���l4�����n�����:�0dn��7�ϦY1�3]�/cJ�.���<zy�Wʿ��ū\\=�%M愛��j�QC���x���Nƹ��l�\\p��)�@�<l�R\0Ǔ1FJOA��\00#���)�fC�R�����}!A�F8�����i`��1IW�rw@9�s�8N?��ԃa��,�8�H������>0ES(]�k�午%��s��\nfR�p \n��֫�6�x�^��6ŭ�Bϙ^iڃ�c�R\0ߵ���e�\0ʚ(�_�VY�}h[��ho4jЎ�56���;��8V�9$R6���3.�W��N�q^����gW�ھ��`#.�x\'Ÿd�j$}��kМ��-g���yt =�q���N�qC���gW��\nU�s�*+�͚�mJ�;���n�	�f��3�q}�\0\0��\0PK-\0\0\0\0\0\0!\0�!�}�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�\Z��\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0�DӇ,\0\0>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0�]��\0\0I\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Y	\0\0word/document.xmlPK-\0\0\0\0\0\0!\00�C)�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\r\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0��\n�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0v\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0�d���\0\0b;\0\0\0\0\0\0\0\0\0\0\0\0\0\0\06\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0`?�\0\0S>\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/stylesWithEffects.xmlPK-\0\0\0\0\0\0!\0q�M�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0A(\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0�2��z\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0W+\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0\'5�i6\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0�N\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0n0\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0����Y\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�1\0\0word/numbering.xmlPK\0\0\0\0\r\0\r\0I\0\0+5\0\0\0\0','Masters work plan.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','Tamplaet');

/*Table structure for table `template_field` */

DROP TABLE IF EXISTS `template_field`;

CREATE TABLE `template_field` (
  `template_field_id` int(11) NOT NULL,
  `template_id_fk` bigint(20) NOT NULL,
  `template_field_name` varchar(255) DEFAULT NULL,
  `template_field_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`template_field_id`,`template_id_fk`),
  KEY `FK83qenu6ey4hnws1k82ke1y39l` (`template_id_fk`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `template_field` */

insert  into `template_field`(`template_field_id`,`template_id_fk`,`template_field_name`,`template_field_type`) values 
(1,1,'ytfytyfyt','STRING'),
(2,1,'hkgugjli','STRING'),
(1,2,'ytfytyfyt','STRING');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
