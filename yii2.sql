-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: yii2
-- ------------------------------------------------------
-- Server version	5.7.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `text` text,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (2,2,'Значимость этих проблем настолько очевидна, что высококачественный прототип будущего проекта играет важную роль в формировании переосмысления внешнеэкономических политик.','2021-09-27 13:06:23',1),(3,1,'Внезапно, явные признаки победы институционализации и по сей день остаются уделом либералов, которые жаждут быть преданы социально-демократической анафеме!','2021-09-27 13:06:39',1),(4,1,'Предварительные выводы неутешительны: социально-экономическое развитие способствует повышению качества укрепления моральных ценностей. ','2021-09-27 13:05:32',0),(10,1,'А также явные признаки победы институционализации своевременно верифицированы. В своём стремлении повысить качество жизни, они забывают, ','2021-10-01 04:34:41',1),(11,2,'Приятно, граждане, наблюдать, как предприниматели в сети интернет призваны к ответу. И нет сомнений, что диаграммы связей,','2021-10-01 04:48:43',0),(12,2,'Внезапно, элементы политического процесса формируют глобальную экономическую сеть и при этом - объединены в целые кластеры себе подобных. ','2021-10-01 04:48:43',1),(13,8,'Но внедрение современных методик способствует подготовке и реализации дальнейших направлений развития. Но базовые сценарии поведения пользователей','2021-10-01 06:16:48',1),(14,8,'Лишь базовые сценарии поведения пользователей, которые представляют собой яркий пример континентально-европейского типа политической культуры','2021-10-01 06:16:48',0),(15,8,'Мы вынуждены отталкиваться от того, что новая модель организационной деятельности однозначно фиксирует необходимость модели развития!','2021-10-01 06:16:48',0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1632736538),('m130524_201442_init',1632736541),('m190124_110200_add_verification_token_column_to_user_table',1632736541);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'alex','ZZuCo-EgGaiNEKh3e9u5ssIdu8dt7mcI','$2y$13$EzZ90II4MK/.KDNdLLB4XeDH7DGeV1kCX0ROcPh7BA77410dKW7gq','','alex@test.com',10,1632736947,1633068557,'wyd-o1sblWTm-pz08p2rT3RKkgcSd_F4_1632736947','8p5gLS3H_K-DywONPgEfFdp2AfwTlsO3','Александр','Михайлов','Александрович',1988,'Санкт-Петербург','8-911-014-13-79','https://cspromogame.ru//storage/upload_images/avatars/3683.jpg'),(2,'ivan','GDSn5wFoK-S1QPAW6BrQ6pdhVcxi0mbr','$2y$13$EzZ90II4MK/.KDNdLLB4XeDH7DGeV1kCX0ROcPh7BA77410dKW7gq',NULL,'ivan@gmail.com',10,1632737161,1633064278,'dIeRQbTBhJE6rIXMj8fcoKW2VI8FLhBQ_1632737161','cT-sHW1_-TVBJMqKRqcQwAj3l2KDGZmn','Иван','Иванов','Иванович',1989,'Москва','8-123-123-22-33','https://cspromogame.ru//storage/upload_images/avatars/932.jpg'),(8,'tanya','oeGeaj59TsJGQ_5gWXMYI6j7syBt90nz','$2y$13$97DADQ9/DvqJ14ogljmj9.yKUfkCiHZkc.MTMtjfbced6/lP/wzAq',NULL,'tanya@test.com',10,1633068876,1633068889,'xynCcWLNmik71TVVNMUs05rkM3bgosjl_1633068876','LEvFcksHmwU1LQfSAdIGvJSZ0QiDvSVY','Татьяна','Пыжова','Александровна',1990,'Санкт-Петербруг','8-911-014-13-12','https://cspromogame.ru//storage/upload_images/avatars/747.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-01  7:08:29
