/*
Navicat MySQL Data Transfer

Source Server         : localhostConnect
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : jjwebdb

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2021-05-19 09:05:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cartitem`
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `cartID` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `commodityid` int NOT NULL,
  `commodityNum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES ('jj', '1003', '1');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `Subcalss` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Majorcategories` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`Subcalss`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('12 key', 'electronic organ');
INSERT INTO `category` VALUES ('120 Beth', 'accordion');
INSERT INTO `category` VALUES ('60 Beth', 'accordion');
INSERT INTO `category` VALUES ('61 key', 'electronic organ');
INSERT INTO `category` VALUES ('71 key', 'electronic organ');
INSERT INTO `category` VALUES ('76 key', 'electronic organ');
INSERT INTO `category` VALUES ('85 key', 'piano');
INSERT INTO `category` VALUES ('88 key', 'piano');
INSERT INTO `category` VALUES ('96 Beth', 'accordion');

-- ----------------------------
-- Table structure for `commodity`
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `commodityid` int NOT NULL,
  `commodityname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `Subcalss` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `explain` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Inventory` int DEFAULT NULL,
  `businessid` int NOT NULL,
  `status` int DEFAULT NULL,
  `img` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`commodityid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1001', 'YAMAHA black electronic piano', '698', '61 key', 'It has single key mode, follow play mode and ensemble mode. It has 72 hours charging range', '200', '101', '1', '201.jpg');
INSERT INTO `commodity` VALUES ('1002', 'YAMAHA silver electronic piano', '699', '76 key', 'LK series, intelligent three-step teaching, metronome, virtual music hall, 100 rhythms', '150', '102', '1', '202.jpg');
INSERT INTO `commodity` VALUES ('1003', 'Multi functional electronic piano', '1299', '71 key', 'Recommended for all ages, fun is not expensive, children and adults are beginning to learn professional piano teaching', '100', '103', '1', '203.jpg');
INSERT INTO `commodity` VALUES ('1004', 'Kindergarten electronic piano', '349', '61 key', 'Learn a variety of combination learning mode, inherit the original piano timbre, and sample the sound source of performance level grand piano', '50', '104', '1', '204.jpg');
INSERT INTO `commodity` VALUES ('1005', 'Rabbit electronic piano', '799', '71 key', 'Select high-quality materials, and refine the perfect quality and timbre with rigorous and rigorous technology. Ensure that every piano will let the music player bloom with passion', '200', '111', '1', '205.jpg');
INSERT INTO `commodity` VALUES ('1006', 'Hand-made electronic piano', '239999', '12 key', 'The most exquisite hand-made electronic piano', '1', '101', '1', '206.jpg');
INSERT INTO `commodity` VALUES ('2001', 'YAMAHA Grand Piano C3X', '24000', '88 key', 'A clear, even, and elegant tone. After sales director of behistein and chief piano maker visited Casio R &amp; D center to guide the whole process of timbre development', '100', '105', '1', '101.jpg');
INSERT INTO `commodity` VALUES ('2002', 'Kaiserburg KA Artist Series Piano KA 160', '32400', '85 key', 'Vacuum casting iron bar, ebony black key, weight plus lead, spruce solid wood soundboard', '150', '106', '1', '102.jpg');
INSERT INTO `commodity` VALUES ('2003', 'German Graf Grand Piano TF160SM', '23999', '88 key', 'Lightweight fashion, easy to operate, a new generation of intelligent electric piano', '200', '107', '1', '103.jpg');
INSERT INTO `commodity` VALUES ('2004', 'KAWAI Piano Koto KU-C3', '899', '85 key', 'Simple and easy to learn full age professional entry-level piano newly upgraded imported sound source', '300', '112', '1', '104.jpg');
INSERT INTO `commodity` VALUES ('2005', 'YAMAHA upright PIANO YUX series YU1X', '699', '85 key', 'The sound from fingertips is like a butterfly flying with wings. Its wings are bright and bright. It is like the distant sky outside the Great Wall with clear light', '100', '113', '1', '105.jpg');
INSERT INTO `commodity` VALUES ('2006', 'Roland piano LX708', '1099', '88 key', 'Luxurious eight-speaker piano with strong tone and auditorium atmosphere', '200', '113', '1', '106.jpg');
INSERT INTO `commodity` VALUES ('3001', 'American Neptune accordion', '5280', '60 Beth', 'A good piano can be used for a lifetime', '200', '108', '1', '301.jpg');
INSERT INTO `commodity` VALUES ('3002', 'Parrot accordion Ebony', '5780', '120 Beth', 'The bellows is made of lambskin. The Basso is flexible and durable, and the accessories are durable', '100', '109', '1', '302.jpg');
INSERT INTO `commodity` VALUES ('3003', 'Golden cup accordion', '430', '96 Beth', 'Black and white non slip keyboard key, multi group voice transformer, lambskin bellows, sensitive bass key', '200', '110', '1', '303.jpg');
INSERT INTO `commodity` VALUES ('3004', 'Borovini accordion mini', '777', '96 Beth', 'Rose wood products professional manufacturing entry level essential', '200', '114', '1', '304.jpg');
INSERT INTO `commodity` VALUES ('3005', 'Borrovini accordion PC120P echo', '889', '120 Beth', 'Contemporary retro electric Beisi nanmu manufacturing professional level learning necessary', '300', '115', '1', '305.jpg');
INSERT INTO `commodity` VALUES ('3006', 'Baidi accordion bass', '444', '96 Beth', 'Beginners must be easy to understand, free teacher guidance', '400', '116', '1', '306.jpg');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerid` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `country` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `detailedAddress` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`customerid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('10000', 'jj', '123', '123', 'China', 'Beijing', 'Changping', 'BUPT Nanfeng Rd.1 Shahe town', '1');

-- ----------------------------
-- Table structure for `suborder`
-- ----------------------------
DROP TABLE IF EXISTS `suborder`;
CREATE TABLE `suborder` (
  `SubOrderid` int NOT NULL,
  `commodityid` int NOT NULL,
  `number` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `spend` int DEFAULT NULL,
  `Shippingaddress` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `totalorderid` int NOT NULL,
  PRIMARY KEY (`SubOrderid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of suborder
-- ----------------------------
INSERT INTO `suborder` VALUES ('10000', '1000', '1', '1', '1', 'addr', 'state', '10000');
INSERT INTO `suborder` VALUES ('10001', '1006', '1', '239999', '239999', 'addr', 'Ordered', '10001');
INSERT INTO `suborder` VALUES ('10002', '1001', '1', '698', '698', 'addr', 'cancelled', '10001');
INSERT INTO `suborder` VALUES ('10003', '2006', '1', '1099', '1099', 'addr', 'completed', '10001');
INSERT INTO `suborder` VALUES ('10004', '3005', '1', '889', '889', 'addr', 'shipped', '10001');

-- ----------------------------
-- Table structure for `totalorder`
-- ----------------------------
DROP TABLE IF EXISTS `totalorder`;
CREATE TABLE `totalorder` (
  `totalorderid` int NOT NULL,
  `customerid` int NOT NULL,
  `totalcost` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `shippingCountry` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shippingState` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shippingCity` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shippingDetalAd` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`totalorderid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of totalorder
-- ----------------------------
INSERT INTO `totalorder` VALUES ('10000', '1', '1', '2000-01-01 00:00:00', 'country', 'state', 'city', 'addr');
INSERT INTO `totalorder` VALUES ('10001', '10000', '242685', '2021-05-18 23:41:13', 'China', 'Beijing', 'Changping', 'BUPT Nanfeng Rd.1 Shahe town');
