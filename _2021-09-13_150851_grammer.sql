-- MySQL dump 10.13  Distrib 8.0.26, for macos11.3 (x86_64)
--
-- Host: 127.0.0.1    Database: grammer
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(63) DEFAULT '' COMMENT '分类项名称',
  `info` varchar(255) DEFAULT '' COMMENT '分类项说明',
  `rank` mediumint DEFAULT '0' COMMENT '分类项等级',
  `sequence` mediumint DEFAULT '0' COMMENT '分类顶的排序',
  `progress` tinyint DEFAULT '0' COMMENT '进度，0～100',
  `collect` tinyint DEFAULT '0' COMMENT '是否被收藏，0为不',
  `understand` tinyint DEFAULT '0' COMMENT '是否已理解，0为不',
  `status` tinyint DEFAULT '1' COMMENT '是否可用，0为不',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3 COMMENT='语法项分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'词的分类','词分十大类',0,0,0,0,0,1),(2,'名词','表示人、事物名称',1,1,0,0,0,1),(3,'代词','代替名词或一句话',1,2,0,0,0,1),(4,'动词','表示行为、状态或关系',1,3,0,0,0,1),(5,'形容词','修饰名词或代词',1,4,0,0,0,1),(6,'副词','修饰动词、形容词、句子或其它副词',1,5,0,0,0,1),(7,'介词','表示两者关系',1,6,0,0,0,1),(8,'连词','连接词与词、句子与句子',1,7,0,0,0,1),(9,'冠词','限定名词',1,8,0,0,0,1),(10,'数词','表示数量或顺序',1,9,0,0,0,1),(11,'感叹词','表示情感',1,10,0,0,0,1),(12,'句的成分','句分八大成分',0,11,0,0,0,1),(13,'主语','句子的主体对象',1,12,0,0,0,1),(14,'谓语','主体对象的动作、状态和特征',1,13,0,0,0,1),(15,'宾语','句子的客体对象',1,14,0,0,0,1),(16,'表语','谓语中的状态和特征',1,15,0,0,0,1),(17,'定语','限定主语或宾语',1,16,0,0,0,1),(18,'状语','限定句子或谓语',1,17,0,0,0,1),(19,'补语','对主语宾语的补充',1,18,0,0,0,1),(20,'同位语','主体、客体对象的多重身份',1,19,0,0,0,1),(21,'句的结构','句的组织结构',0,20,0,0,0,1),(22,'主谓','主语 + 谓语',1,21,0,0,0,1),(23,'主系表','主语 + 谓语（系动词 + 表语）',1,22,0,0,0,1),(24,'主谓宾','主语 + 谓语 + 宾语',1,23,0,0,0,1),(25,'主谓宾宾','主语 + 谓语 + 直接宾语 + 间接宾语',1,24,0,0,0,1),(26,'主谓宾补','主语 + 谓语 + 宾语 + 补足语',1,25,0,0,0,1),(27,'句的种类','句子按使用目的分类',0,26,0,0,0,1),(28,'陈述句','表达一个事实或一种看法',1,27,0,0,0,1),(29,'疑问句','提出问题',1,28,0,0,0,1),(30,'祈使句','请求、建议或命令',1,29,0,0,0,1),(31,'感叹句','情感表达',1,30,0,0,0,1),(32,'时态','动作发生的时间及所处的状态',0,31,0,0,0,1),(33,'一般现在时','时：现在；态：一般',1,32,0,0,0,1),(34,'一般过去时','时：过去；态：一般',1,33,0,0,0,1),(35,'一般将来时','时：将来；态：一般',1,34,0,0,0,1),(36,'一般过去将来时','时：过去将来；态：一般',1,35,0,0,0,1),(37,'现在进行时','时：现在；态：进行',1,36,0,0,0,1),(38,'过去进行时','时：过去；态：进行',1,37,0,0,0,1),(39,'将来进行时','时：将来；态：进行',1,38,0,0,0,1),(40,'过去将来进行时','时：过去将来；态：进行',1,39,0,0,0,1),(41,'现在完成时','时：现在；态：完成',1,40,0,0,0,1),(42,'过去完成时','时：过去；态：完成',1,41,0,0,0,1),(43,'将来完成时','时：将来；态：完成',1,42,0,0,0,1),(44,'过去将来完成时','时：过去将来；态：完成',1,43,0,0,0,1),(45,'现在完成进行时','时：现在；态：完成进行',1,44,0,0,0,1),(46,'过去完成进行时','时：过去；态：完成进行',1,45,0,0,0,1),(47,'将来完成进行时','时：将来；态：完成进行',1,46,0,0,0,1),(48,'过去将来完成进行时','时：过去将来；态：完成进行',1,47,0,0,0,1),(49,'被动语态','被动语态',0,48,0,0,0,1),(50,'一般现在时','时：现在；态：一般',1,49,0,0,0,1),(51,'一般过去时','时：过去；态：一般',1,50,0,0,0,1),(52,'一般将来时','时：将来；态：一般',1,51,0,0,0,1),(53,'一般过去将来时','时：过去将来；态：一般',1,52,0,0,0,1),(54,'现在进行时','时：现在；态：进行',1,53,0,0,0,1),(55,'过去进行时','时：过去；态：进行',1,54,0,0,0,1),(56,'现在完成时','时：现在；态：完成',1,55,0,0,0,1),(57,'过去完成时','时：过去；态：完成',1,56,0,0,0,1),(58,'句的语气','句子表现出来的语气',0,57,0,0,0,1),(59,'陈述语气','表客观事实',1,58,0,0,0,1),(60,'祈使语气','表请求、警告、建议或命令',1,59,0,0,0,1),(61,'虚拟语气','表主观需要',1,60,0,0,0,1),(62,'疑问语气','表咨询提问',1,61,0,0,0,1),(63,'感叹语气','表情感传达',1,62,0,0,0,1),(64,'非限定动词','又称非谓语动词',0,63,0,0,0,1),(65,'动名词','动词 + ing，具名词性',1,64,0,0,0,1),(66,'现在分词','动词 + ing，具形容词、副词性',1,65,0,0,0,1),(67,'过去分词','动词 + ed，具形容词、副词性',1,66,0,0,0,1),(68,'不定式','to + 动词，具名词、形容词、副性',1,67,0,0,0,1),(69,'句的修辞','特殊句子表现形式',0,68,0,0,0,1),(70,'There Be句形，倒装句的一种形式','There Be...',1,69,0,0,0,1),(71,'倒装句','因修辞改变句子自然语序',1,70,0,0,0,1),(72,'强调句','因修辞，独立出强调的部分',1,71,0,0,0,1),(73,'省略句','因修辞，省略句中某些成份',1,72,0,0,0,1),(74,'常见语法','特殊语法',0,73,0,0,0,1),(75,'IT的用法','IT的用法',1,74,0,0,0,1),(76,'主谓一致','主谓一致',1,75,0,0,0,1),(77,'插入语','插入语',1,76,0,0,0,1),(78,'直接引用','直接引用',1,77,0,0,0,1),(79,'间接引用','间接引用',1,78,0,0,0,1),(80,'名词所有格规则','~ + \'s',1,81,0,0,0,1),(81,'可数名词复数规则','~ + s',1,82,0,0,0,1),(82,'形容词、副词比较级、最高级规则','~ + er；~ + est',1,86,0,0,0,1),(83,'动名词、现在分词规则','~ + ing',1,84,0,0,0,1),(84,'过去式、过去分词','~ + ed',1,85,0,0,0,1),(85,'附录','附录一些表',0,80,0,0,0,1),(86,'人称物主代词对应表','人称物主代词对应表',1,83,0,0,0,1),(87,'常用介词说明','常用介词说明',1,87,0,0,0,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `cid` int DEFAULT '0' COMMENT '分类ID',
  `name` varchar(64) DEFAULT '' COMMENT '项目名称',
  `info` varchar(511) DEFAULT '' COMMENT '项目说明',
  `image` varchar(64) DEFAULT '' COMMENT '项目图片',
  `sequence` tinyint DEFAULT NULL,
  `progress` tinyint DEFAULT NULL,
  `collect` tinyint DEFAULT NULL,
  `understand` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='各项语法知识表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,'item','iteminfo','itemimage',2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `iid` int DEFAULT '0' COMMENT '项目ID',
  `content` varchar(255) DEFAULT '' COMMENT '内容',
  `option` varchar(255) DEFAULT '' COMMENT '选项，多个选项用分号分割',
  `answer` varchar(255) DEFAULT '' COMMENT '答案，多个答案用分号分割',
  `status` tinyint DEFAULT '1' COMMENT '是否可用，0为不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='语法各项案例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'content','aption; appp; a','a',1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-13 15:09:03
