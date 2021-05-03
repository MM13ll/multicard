-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 03 2021 г., 14:13
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `multicard`
--

DELIMITER $$
--
-- Функции
--
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STRING` (`str` VARCHAR(255), `delim` VARCHAR(12), `pos` INT) RETURNS VARCHAR(255) CHARSET utf8 RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(str, delim, pos),
       CHAR_LENGTH(SUBSTRING_INDEX(str, delim, pos-1)) + 1),
       delim, '')$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `pwd_hash` varchar(32) NOT NULL,
  `active` int NOT NULL,
  `last_login_time` timestamp NULL DEFAULT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_log`
--

CREATE TABLE `admin_log` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `value` text,
  `admin_id` int NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `card`
--

CREATE TABLE `card` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '1',
  `token` varchar(50) DEFAULT NULL,
  `pan` varchar(16) DEFAULT NULL,
  `expiry` decimal(4,0) DEFAULT NULL,
  `holder` varchar(255) DEFAULT NULL,
  `phone` decimal(12,0) DEFAULT NULL,
  `last_balance` bigint DEFAULT NULL,
  `otp_hash` varchar(32) DEFAULT NULL,
  `otp_attempts` int NOT NULL DEFAULT '0',
  `is_confirmed` int NOT NULL DEFAULT '0',
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `card`
--

INSERT INTO `card` (`id`, `user_id`, `title`, `priority`, `token`, `pan`, `expiry`, `holder`, `phone`, `last_balance`, `otp_hash`, `otp_attempts`, `is_confirmed`, `added_on`, `deleted`, `updated_on`) VALUES
(107, 167, 'узкард 2', 1, '5ba39133ca57d70aec502919', '860031******4650', '2309', 'IDIEV ILKHOM AMINOVICH', '998973333929', 6986542, NULL, 0, 0, '2020-07-23 23:18:29', 1, '2021-04-22 06:17:14'),
(108, 167, 'нбу', 1, '5a8d4dc4ca57d702c42d86b1', '860002******7767', '2008', 'IDIEV ILKHOM AMINOVICH', '998973333929', NULL, NULL, 0, 0, '2020-07-23 23:19:52', 0, '2021-04-22 06:17:14'),
(111, 167, 'зарплата', 1, '8B431A6A1057EB41E0530100007FEA67', '860031******7001', '2302', 'IDIEV ILKHOM AMINOVICH', '998973333929', 93448349, NULL, 0, 1, '2020-07-24 00:41:44', 0, '2021-04-22 06:17:14'),
(119, 167, 'хумо алока', 1, 'bb1d5755-105b-3e7b-b81f-d398a85126e5', '986019******6346', '2406', 'ILHOM IDIEV', '998973333929', 0, NULL, 0, 1, '2020-11-26 19:57:50', 1, '2021-04-22 06:17:14'),
(123, 335, 'uzcard', 1, 'B58CE9174A2D1758E0530100007F3C87', '860057******4753', '2412', 'SAYDAMINOV KAMOLBEK', '998998185650', 9485, NULL, 0, 1, '2020-12-03 14:45:09', 0, '2021-04-22 06:17:14'),
(124, 335, 'узкарт', 2, 'B5F1C4F69EC25C43E0530100007FEE59', '860057******7169', '2508', 'SAYDAMINOV KAMOLBEK', '998998185650', 130040374, NULL, 0, 1, '2020-12-08 14:44:18', 0, '2021-04-22 06:17:14'),
(128, 167, '', 4, 'B615AECB3FE0018EE0530100007F2D5E', '860014******7400', '2310', 'MAXMUDOV BEHRUZ TOLQIN OGL', '998997025670', 700100, '86ecfcbc1e9f1ae5ee2d71910877da36', 5, 0, '2020-12-10 09:43:01', 0, '2021-04-22 06:17:14'),
(135, 739, 'shipox salary', 1, 'B61B7DD44184056CE0530100007F0F45', '860014******4107', '2509', 'MAHMUDOV BEHRUZ TOLQIN OGL', '998997025670', 815296466, NULL, 5, 1, '2020-12-10 16:34:30', 0, '2021-04-22 06:17:14'),
(157, 167, 'foobar', 3, 'A6A07182D4E5041AE0530100007FA3E7', '860031******7066', '2503', 'MIRNOVA ANNA VIKTOROVNA', '998909976886', 6918295, 'f3e52c300b822a8123e7ace55fe15c08', 0, 0, '2020-12-14 12:45:41', 1, '2021-04-22 06:17:14'),
(188, 593, 'жена', 2, 'B86874FE19F6FD59E053D30811ACE09B', '860055******5531', '2310', 'ZOKIRXO`JAYEVA FERUZAXON', '998998090309', 81247, '0f0d67e214f9fef69b278e3d08114da9', 0, 1, '2021-01-08 23:14:20', 0, '2021-04-22 06:17:14'),
(192, 739, 'ofb', 2, 'B877F512C4E034AFE053D30811AC6776', '860057******2823', '2512', 'MAHMUDOV BEHRUZ', '998997025670', 306800, NULL, 2, 1, '2021-01-09 17:42:13', 0, '2021-04-22 06:17:14'),
(197, 427, 'HUMO', 1, '61845a20-9a04-3832-b092-8eb21e1cdf41', '986027******7882', '2203', 'MUMINBOY SAIDOV', '998981372017', 190430, NULL, 5, 1, '2021-01-28 16:55:28', 0, '2021-04-22 06:17:14'),
(205, 436, 'OFB', 1, '9D54E51E4C4415E5E055000000000001', '860057******6265', '2311', 'KHASANJONOV MAKHMUDJAN', '998935082228', 206547475, NULL, 0, 1, '2021-02-03 11:56:57', 0, '2021-04-22 06:17:14'),
(207, 167, 'test name', 1, '9CB5BCA5771968DAE055000000000001', '860006******2278', '2411', 'IDIYEV ILXOM AMINOVICH', '998973333929', 595000, NULL, 0, 0, '2021-02-03 14:05:47', 1, '2021-04-22 06:17:14'),
(244, 167, 'islomda card', 4, 'BB147EC4C618EC05E053D30811ACCC9E', '860014******4525', '2311', 'TOSHEV ISLOMBEK TOHIR OGLI', '998339732053', 2, 'a084f26f690dbc23a52e67027693f2b2', 5, 0, '2021-02-11 23:10:07', 0, '2021-04-22 06:17:14'),
(261, 596, '', 1, 'BCC7CDBC19B790EAE053D30811ACC546', '860033******3234', '2410', 'SHERIYAZDANOVA  NODIRA', '998911912727', 59283, NULL, 0, 1, '2021-03-05 14:36:14', 0, '2021-04-22 06:17:14'),
(262, 596, '', 2, 'BCC7CDC1024490F0E053D30811AC7E95', '860003******7971', '2512', 'SHERIYAZDANOVA NODIRA', '998911912727', 0, NULL, 0, 1, '2021-03-05 14:36:48', 0, '2021-04-22 06:17:14'),
(263, 600, 'UNIVERSALBANK', 1, '9FE042D753E22109E0530100007F13C5', '860048******0831', '2309', 'ABDUSAMADOV ABDUKHOLID', '998977514307', 1084862, NULL, 0, 1, '2021-03-05 16:53:35', 0, '2021-04-22 06:17:14'),
(264, 627, '', 1, 'BCCE2FBE5A18C9D9E053D30811ACD630', '860006******8092', '2511', 'RUZUMOV BAXRIDDIN', '998901784910', 16388973, NULL, 0, 1, '2021-03-05 22:10:51', 0, '2021-04-22 06:17:14'),
(265, 597, 'SQB UZCARD', 1, 'BCDC855F746752A9E053D30811ACBC19', '860003******5975', '2512', 'SARIDJANOVA FARIDA', '998998571147', 7000000, NULL, 0, 1, '2021-03-06 15:21:17', 0, '2021-04-22 06:17:14'),
(266, 674, '', 1, 'A5E8F20F5D2142A1E0530100007F153E', '860057******8727', '2304', 'SHAFIKOV ASFER RESHADOVICH', '998909195056', 214045032, NULL, 0, 1, '2021-03-11 12:58:46', 0, '2021-04-22 06:17:14'),
(267, 674, '', 2, '7a6743d0-2550-316c-9a30-2b14717a8ac9', '986027******9678', '2204', 'ASFER SHAFIKOV', '998909195056', 379501887, NULL, 0, 1, '2021-03-11 12:59:20', 0, '2021-04-22 06:17:14'),
(270, 553, 'кап', 1, 'BD4689D0014C4816E053D30811ACD046', '860049******8799', '2304', 'KABIROV  ABDURAUF', '998935869109', 20, NULL, 0, 1, '2021-03-11 21:38:46', 0, '2021-04-22 06:17:14'),
(271, 682, '', 1, 'BD5360B42632C671E053D30811ACB4DF', '860033******9241', '2512', 'RUZUMOVA GUZAL', '998903284975', 1914242, NULL, 0, 1, '2021-03-12 13:02:42', 0, '2021-04-22 06:17:14'),
(272, 553, 'хумо', 2, 'f24d5984-f9aa-3985-8df0-352ea31aa327', '986027******0803', '2204', 'ABDURAUF KABIROV', '998981372017', 89400, 'a4c42bfd5f5130ddf96e34a036c75e0a', 0, 0, '2021-03-12 13:56:36', 0, '2021-04-22 06:17:14'),
(276, 685, '', 1, 'BD574E195E45EA84E053D30811ACF817', '860014******6176', '2408', 'ISAYEVA NILUFAR BAXTIYOROV', '998998282856', 39934594, NULL, 0, 1, '2021-03-12 17:41:53', 0, '2021-04-22 06:17:14'),
(277, 685, '', 2, '270ce7df-6c9c-3926-b118-a180fafc5ca9', '986017******6555', '2406', 'NILUFAR ISAEVA', '998998282856', 53077500, NULL, 0, 1, '2021-03-12 17:42:50', 0, '2021-04-22 06:17:14'),
(278, 686, '', 1, 'BD57A2FE446CEDC8E053D30811AC19C0', '860057******4691', '2406', 'IRMATOV RAVSHAN', '998935400080', 4490000, NULL, 0, 1, '2021-03-12 18:02:25', 0, '2021-04-22 06:17:14'),
(279, 686, '', 2, '7adc1188-9dae-3e94-92c2-c674511bc097', '986027******8844', '2204', 'RAVSHAN IRMATOV', '998935400080', 8540702, NULL, 0, 1, '2021-03-12 18:03:40', 0, '2021-04-22 06:17:14'),
(281, 687, '', 2, 'BD6F0223875CD44FE053D30811AC78E8', '860013******3727', '2412', 'XUDOYBERDIYEV LAZIZ', '998993341516', 4354742, NULL, 0, 1, '2021-03-13 21:55:58', 0, '2021-04-22 06:17:14'),
(282, 681, 'Anor TRIA', 1, '5e9955b1-7de8-33ab-a914-05e4b63eb305', '986060******1052', '2601', 'FARRUH/ABDUJABBOROV', '998909947987', 100000, NULL, 0, 0, '2021-03-13 22:14:36', 1, '2021-04-22 06:17:14'),
(283, 681, 'OFB Uzcard', 1, 'BCC57C4F87287B72E053D30811AC5B5B', '860057******1843', '2410', 'ABDUJABBOROV FARRUKH', '998909947987', 167650083, NULL, 0, 0, '2021-03-13 22:16:09', 1, '2021-04-22 06:17:14'),
(284, 681, 'Hamkor Uzcard', 1, 'BD6F5161F436D718E053D30811ACC464', '860012******8385', '2412', 'ABDUJABBOROV FARRUH', '998909947987', 47750, NULL, 0, 0, '2021-03-13 22:17:28', 1, '2021-04-22 06:17:14'),
(286, 688, '', 2, '3a414447-85a0-3737-9fd8-5eb4f3ef4783', '986027******8362', '2602', 'ISMATILLO MAKHMUDJONOV', '998993019796', 0, NULL, 0, 1, '2021-03-13 22:19:40', 0, '2021-04-22 06:17:14'),
(287, 688, '', 3, 'BD6F511F4147D716E053D30811AC63AC', '860012******6174', '2502', 'MAXMUDJONOV ISMATILLO', '998993019796', 1750387, NULL, 0, 1, '2021-03-13 22:20:25', 0, '2021-04-22 06:17:14'),
(288, 593, 'карта', 1, 'A3E51A103ADD6635E0530100007FDF02', '860055******3551', '2411', 'ZOKIRKHUJAEV AZIZKHUJA', '998909969699', 292347, NULL, 0, 1, '2021-03-15 19:08:38', 0, '2021-04-22 06:17:14'),
(291, 696, '', 1, '9D54DB6055611527E055000000000001', '860057******3541', '2311', 'BEKIROVA ELNARA ASANOVNA', '998935759396', 9021515, NULL, 0, 1, '2021-03-17 14:54:51', 0, '2021-04-22 06:17:14'),
(292, 696, '', 2, 'aedc0c5f-9732-327b-8242-7f8cb84c62ff', '986027******6020', '2204', 'ELNARA BEKIROVA', '998935759396', 0, NULL, 0, 1, '2021-03-17 14:55:48', 0, '2021-04-22 06:17:14'),
(293, 696, '', 3, 'B8516566F49FA728E053D30811ACD9C0', '860014******3595', '2406', 'BOYKOBILOV KAMRONBEK TOKHI', '998935759396', 153702, NULL, 0, 1, '2021-03-17 14:58:25', 0, '2021-04-22 06:17:14'),
(294, 696, '', 4, 'BDB9AC0DFBC39D3BE053D30811ACB452', '860049******9081', '2509', 'KARIMOV RAFIK OPERU', '998903583956', 12102825, 'e5a90182cc81e12ab5e72d66e0b46fe3', 0, 0, '2021-03-17 14:59:09', 0, '2021-04-22 06:17:14'),
(295, 663, '', 1, 'BC7D0FD25399B7F4E053D30811AC3E0A', '860057******2418', '2601', 'SOROKIN VALERIY DENISOVICH', '998946015447', 2460980, NULL, 0, 1, '2021-03-18 11:34:10', 0, '2021-04-22 06:17:14'),
(296, 663, 'Asia Alliance Bank', 1, 'BDCAEC9BE3ED4416E053D30811ACA15A', '860055******5697', '2511', 'SAFARYAN VAZGEN KAMOVICH', '998909722676', 292687129, 'e1021d43911ca2c1845910d84f40aeae', 0, 0, '2021-03-18 11:38:00', 1, '2021-04-22 06:17:14'),
(300, 704, '', 1, 'B31A14AEAA287957E0530100007F3F7D', '860002******3500', '2411', 'VAKKASOV DILSHOD', '998998349349', 286188613, NULL, 0, 1, '2021-03-23 09:15:50', 0, '2021-04-22 06:17:14'),
(301, 705, 'зарплата', 1, 'BDC8CF2B0D7D30FCE053D30811ACFC7B', '860057******5043', '2603', 'LI DMITRIY OLEGOVICH', '998977299900', 56281000, NULL, 0, 1, '2021-03-24 16:56:42', 0, '2021-04-22 06:17:14'),
(302, 705, 'вкладная', 2, 'BE47F79BDF32AFF0E053D30811ACB882', '860049******5968', '2503', 'DMITRIY LI OPERU', '998977299900', 3109297, NULL, 0, 1, '2021-03-24 16:57:55', 0, '2021-04-22 06:17:14'),
(303, 705, 'основная', 3, 'BE47F7D3E9E8AFFAE053D30811AC91B7', '860049******3920', '2501', 'LI   DMITRIY  OLEGOVICH', '998977299900', 18552505, NULL, 0, 1, '2021-03-24 17:00:04', 0, '2021-04-22 06:17:14'),
(304, 705, 'хумо офб', 4, '18e468c2-94cf-3de3-828a-6cccc464a47a', '986027******0236', '2603', 'DMITRIY LI', '998981372017', 0, '00989c20ff1386dc386d8124ebcba1a5', 3, 0, '2021-03-24 17:02:09', 0, '2021-04-22 06:17:14'),
(309, 723, '', 2, '0b0315c6-b98d-3088-b0b8-88b89adf3558', '986012******6981', '2512', 'BEHRUZ MAHMUDOV', '998914599224', 955300, NULL, 0, 1, '2021-03-25 12:36:27', 0, '2021-04-22 06:17:14'),
(311, 669, '', 1, 'BF3545A494B01485E053D30811AC28D3', '860057******7971', '2405', 'AKHMADOV ADKHAMJON', '998911344448', 22110429, NULL, 0, 1, '2021-04-05 12:03:39', 0, '2021-04-22 06:17:14'),
(313, 736, 'OFB Uzcard', 1, 'BE5A6DED78D9410DE053D30811AC011E', '860057******7939', '2506', 'BEKNAZAROV KAMOLIDDIN', '998998730003', 59227772, NULL, 0, 1, '2021-04-06 18:16:56', 0, '2021-04-22 06:17:14'),
(314, 739, 'Tuit aloqabank', 3, 'BF5DE6C9D6946596E053D30811ACBCEF', '860031******0562', '2502', 'MAKHMUDOV BEKHRUZ', '998997025670', 37989450, NULL, 0, 1, '2021-04-07 12:40:45', 0, '2021-04-22 06:17:14'),
(321, 741, '', 1, '5ba8a93dca57d70aec5bafc7', '860031******9658', '2309', 'ZAKIROV RUSTAM RINATOVICH', '998909822311', 569719799, NULL, 0, 1, '2021-04-07 14:19:14', 0, '2021-04-22 06:17:14'),
(325, 745, '', 1, 'BF895204FBAFB4A7E053D30811ACB6CE', '860057******0055', '2407', 'VOLKOV ARTYOM YEVGENEVICH', '998909166017', 107570089, NULL, 0, 1, '2021-04-09 16:29:33', 0, '2021-04-22 06:17:14'),
(326, 745, '', 2, 'BF897D2D8CC6B5B6E053D30811AC4563', '860014******6764', '2507', 'ABDULLAYEVA NARGIZA RUSTAM', '998901899219', 71109475, 'c9e37c28ce5852218032aae6f5632b13', 0, 1, '2021-04-09 16:31:36', 0, '2021-04-22 06:17:14'),
(327, 746, '', 1, 'BF902F14B4EBF428E053D30811AC4FAE', '860033******1682', '2311', 'TURDIEVA NATALYA', '998971560337', 23, 'c7c46d4baf816bfb07c7f3bf96d88544', 0, 1, '2021-04-10 00:32:02', 0, '2021-04-22 06:17:14'),
(332, 741, 'капитал', 2, 'A960104BBDC860F8E0530100007F0DC7', '860049******9578', '2503', 'RUSTAM ZAKIROV TGF', '998909822311', 188288324, NULL, 0, 1, '2021-04-16 16:06:56', 0, '2021-04-22 06:17:14'),
(333, 739, 'tbc', 4, 'dc4c5e47-5e3c-35e7-9a92-8e3e87dcb7b0', '986035******3916', '2604', 'BEKHRUZ MAKHMUDOV', '998997025670', 10000000, NULL, 0, 1, '2021-04-19 10:53:25', 0, '2021-04-22 06:17:14');

-- --------------------------------------------------------

--
-- Структура таблицы `card_debit`
--

CREATE TABLE `card_debit` (
  `id` int NOT NULL,
  `card_id` int UNSIGNED NOT NULL,
  `multicard_id` int UNSIGNED NOT NULL,
  `card_hold_id` int UNSIGNED DEFAULT NULL,
  `amount` bigint NOT NULL,
  `refnum` varchar(50) DEFAULT NULL,
  `request` mediumtext,
  `response` mediumtext,
  `status` enum('ERROR','OK') DEFAULT NULL,
  `sync_finished` int NOT NULL DEFAULT '0' COMMENT '0 - новое списание, 1 - отправлена заявка на установку лимита, мультикарт пополнена',
  `cl_history_id` int DEFAULT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `card_debit`
--

INSERT INTO `card_debit` (`id`, `card_id`, `multicard_id`, `card_hold_id`, `amount`, `refnum`, `request`, `response`, `status`, `sync_finished`, `cl_history_id`, `added_on`, `updated_on`) VALUES
(18, 107, 166, 286, 314060, '009980470591', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":863448,\"params\":{\"hold\":{\"holdId\":\"136049\",\"ext\":\"multicard_hold_286\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":314060,\"stan\":\"524662\",\"date12\":\"201203213010\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":863448,\"result\":{\"id\":\"433835907\",\"username\":\"ipsh\",\"refNum\":\"009980470591\",\"ext\":\"multicard_hold_286\",\"pan\":\"860031******4650\",\"pan2\":\"\",\"expiry\":\"2309\",\"tranType\":\"DEBIT\",\"date7\":\"1203213010\",\"date12\":\"201203213010\",\"amount\":314060,\"currency\":860,\"stan\":524662,\"field38\":\"470591\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, NULL, '2020-12-03 21:30:10', '2020-12-04 02:04:16'),
(19, 123, 333, 306, 500000, '010082147748', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":35424,\"params\":{\"hold\":{\"holdId\":\"152252\",\"ext\":\"multicard_hold_306\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":500000,\"stan\":\"408474\",\"date12\":\"201216143003\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":35424,\"result\":{\"id\":\"453124686\",\"username\":\"ipsh\",\"refNum\":\"010082147748\",\"ext\":\"multicard_hold_306\",\"pan\":\"860057******4753\",\"pan2\":\"\",\"expiry\":\"2412\",\"tranType\":\"DEBIT\",\"date7\":\"1216143003\",\"date12\":\"201216143003\",\"amount\":500000,\"currency\":860,\"stan\":408474,\"field38\":\"147748\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 331, '2020-12-16 14:30:03', '2020-12-18 17:10:03'),
(20, 111, 166, 339, 29500000, '010453549924', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":78385,\"params\":{\"hold\":{\"holdId\":\"196758\",\"ext\":\"multicard_hold_339\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":29500000,\"stan\":\"514615\",\"date12\":\"210202200119\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":78385,\"result\":{\"id\":\"530450986\",\"username\":\"ipsh\",\"refNum\":\"010453549924\",\"ext\":\"multicard_hold_339\",\"pan\":\"860031******7001\",\"pan2\":\"\",\"expiry\":\"2302\",\"tranType\":\"DEBIT\",\"date7\":\"0202200119\",\"date12\":\"210202200119\",\"amount\":29500000,\"currency\":860,\"stan\":514615,\"field38\":\"549924\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 358, '2021-02-02 20:01:19', '2021-02-03 05:10:01'),
(21, 111, 166, 340, 100, '010459744420', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":126531,\"params\":{\"hold\":{\"holdId\":\"197805\",\"ext\":\"multicard_hold_340\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":100,\"stan\":\"121804\",\"date12\":\"210203151003\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":126531,\"result\":{\"id\":\"531822700\",\"username\":\"ipsh\",\"refNum\":\"010459744420\",\"ext\":\"multicard_hold_340\",\"pan\":\"860031******7001\",\"pan2\":\"\",\"expiry\":\"2302\",\"tranType\":\"DEBIT\",\"date7\":\"0203151003\",\"date12\":\"210203151003\",\"amount\":100,\"currency\":860,\"stan\":121804,\"field38\":\"744420\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 359, '2021-02-03 15:10:03', '2021-02-03 15:40:01'),
(22, 111, 166, 351, 9723900, '010526799336', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":824043,\"params\":{\"hold\":{\"holdId\":\"207440\",\"ext\":\"multicard_hold_351\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":9723900,\"stan\":\"870260\",\"date12\":\"210211134550\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":824043,\"result\":{\"id\":\"545149485\",\"username\":\"ipsh\",\"refNum\":\"010526799336\",\"ext\":\"multicard_hold_351\",\"pan\":\"860031******7001\",\"pan2\":\"\",\"expiry\":\"2302\",\"tranType\":\"DEBIT\",\"date7\":\"0211134551\",\"date12\":\"210211134550\",\"amount\":9723900,\"currency\":860,\"stan\":870260,\"field38\":\"799336\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 372, '2021-02-11 13:45:52', '2021-02-12 05:12:02'),
(23, 124, 333, NULL, 10200, '2050615', NULL, '{\"create\":{\"result\":{\"code\":\"OK\",\"description\":\"\\u041d\\u0435\\u0442 \\u043e\\u0448\\u0438\\u0431\\u043e\\u043a\"},\"transaction_id\":14578999,\"store_transaction\":{\"success_trans_id\":null,\"trans_id\":14578999,\"store\":{\"id\":417,\"name\":\"MULTICARD\",\"desc\":\"\",\"logo\":null,\"ga_id\":null},\"terminal_id\":null,\"account\":\"333\",\"amount\":10200,\"confirmed\":false,\"prepay_time\":null,\"confirm_time\":null,\"label\":{\"type_id\":49,\"label_ru\":\"\\u041d\\u043e\\u043c\\u0435\\u0440 \\u0438\\u043d\\u0432\\u043e\\u0439\\u0441\\u0430\",\"label_uz\":\"Invoys raqami\",\"label_en\":\"Invoice number\"},\"details\":\"333\",\"commission_value\":\"0\",\"commission_type\":\"0\",\"total\":10200,\"card_id\":null,\"status_code\":null,\"status_message\":null}},\"pre_confirm\":{\"result\":{\"code\":\"OK\",\"description\":\"\\u041d\\u0435\\u0442 \\u043e\\u0448\\u0438\\u0431\\u043e\\u043a\"}},\"confirm\":{\"result\":{\"code\":\"OK\",\"description\":\"\\u041d\\u0435\\u0442 \\u043e\\u0448\\u0438\\u0431\\u043e\\u043a\"},\"store_transaction\":{\"success_trans_id\":2050615,\"trans_id\":14578999,\"store\":{\"id\":417,\"name\":\"MULTICARD\",\"desc\":\"\",\"logo\":null,\"ga_id\":null},\"terminal_id\":\"92800562\",\"account\":\"333\",\"amount\":10200,\"confirmed\":true,\"prepay_time\":1614969501000,\"confirm_time\":1614969502042,\"label\":{\"type_id\":49,\"label_ru\":\"\\u041d\\u043e\\u043c\\u0435\\u0440 \\u0438\\u043d\\u0432\\u043e\\u0439\\u0441\\u0430\",\"label_uz\":\"Invoys raqami\",\"label_en\":\"Invoice number\"},\"details\":\"333\",\"commission_value\":\"0\",\"commission_type\":\"0\",\"total\":10200,\"card_id\":\"B5F1C4F69EC25C43E0530100007FEE59\",\"status_code\":\"0\",\"status_message\":\"Success\"}}}', 'OK', 1, 390, '2021-03-05 23:38:22', '2021-03-10 05:10:01'),
(24, 263, 598, 372, 40000, '010714423844', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":408329,\"params\":{\"hold\":{\"holdId\":\"232696\",\"ext\":\"multicard_hold_372\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":40000,\"stan\":\"212148\",\"date12\":\"210306134004\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":408329,\"result\":{\"id\":\"586959522\",\"username\":\"ipsh\",\"refNum\":\"010714423844\",\"ext\":\"multicard_hold_372\",\"pan\":\"860048******0831\",\"pan2\":\"\",\"expiry\":\"2309\",\"tranType\":\"DEBIT\",\"date7\":\"0306134004\",\"date12\":\"210306134004\",\"amount\":40000,\"currency\":860,\"stan\":212148,\"field38\":\"423844\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 388, '2021-03-06 13:40:04', '2021-03-07 05:10:02'),
(25, 263, 598, 374, 140000, '010777513489', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":780239,\"params\":{\"hold\":{\"holdId\":\"233510\",\"ext\":\"multicard_hold_374\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":140000,\"stan\":\"705444\",\"date12\":\"210315101007\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":780239,\"result\":{\"id\":\"602256551\",\"username\":\"ipsh\",\"refNum\":\"010777513489\",\"ext\":\"multicard_hold_374\",\"pan\":\"860048******0831\",\"pan2\":\"\",\"expiry\":\"2309\",\"tranType\":\"DEBIT\",\"date7\":\"0315101007\",\"date12\":\"210315101007\",\"amount\":140000,\"currency\":860,\"stan\":705444,\"field38\":\"513489\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 398, '2021-03-15 10:10:07', '2021-03-16 05:20:04'),
(26, 188, 591, 383, 33748, '010787470470', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":748411,\"params\":{\"hold\":{\"holdId\":\"242512\",\"ext\":\"multicard_hold_383\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":\"33748\",\"stan\":\"813157\",\"date12\":\"210316112328\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":748411,\"result\":{\"id\":\"604279802\",\"username\":\"ipsh\",\"refNum\":\"010787470470\",\"ext\":\"multicard_hold_383\",\"pan\":\"860055******5531\",\"pan2\":\"\",\"expiry\":\"2310\",\"tranType\":\"DEBIT\",\"date7\":\"0316112328\",\"date12\":\"210316112328\",\"amount\":33748,\"currency\":860,\"stan\":813157,\"field38\":\"470470\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 399, '2021-03-16 11:23:28', '2021-03-17 05:10:02'),
(27, 288, 591, 384, 1365752, '010787470493', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":765421,\"params\":{\"hold\":{\"holdId\":\"242513\",\"ext\":\"multicard_hold_384\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":1365752,\"stan\":\"404468\",\"date12\":\"210316120632\"}}}', '{\n  \"result\" : {\n                \"utrnno\": 10787470493,\n                \"transType\": \"683\",\n                \"hpan\": \"860055***3551\",\n                \"utime\": 112328,\n                \"udate\": 20210316,\n                \"bankDate\": null,\n                \"reqamt\": 1365752,\n                \"resp\": -1,\n                \"reversal\": false,\n                \"orgdev\": 990930,\n                \"merchant\": \"10718009\",\n                \"terminal\": \"92800562\",\n                \"merchantName\": \"TOSHKENT SH., ORIENT FINANS KHAT BANKI\",\n                \"street\": \"M ULUGBEK T OSIYO 5\",\n                \"city\": \"Toshkent\",\n                \"isCredit\": false,\n                \"credit\": false,\n                \"mcc\": 6010,\n                \"currency\": 860,\n                \"actamt\": 1365752,\n                \"acctbal\": 56325743,\n                \"conamt\": 1365752\n            },\n  \"jsonrpc\" : \"2.0\",\n  \"id\" : 765421\n}', 'OK', 1, 399, '2021-03-16 12:06:32', '2021-03-17 05:10:02'),
(29, 263, 598, 382, 60000, '010793738556', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":533196,\"params\":{\"hold\":{\"holdId\":\"241899\",\"ext\":\"multicard_hold_382\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":60000,\"stan\":\"757810\",\"date12\":\"210317022009\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":533196,\"result\":{\"id\":\"605743178\",\"username\":\"ipsh\",\"refNum\":\"010793738556\",\"ext\":\"multicard_hold_382\",\"pan\":\"860048******0831\",\"pan2\":\"\",\"expiry\":\"2309\",\"tranType\":\"DEBIT\",\"date7\":\"0317022009\",\"date12\":\"210317022009\",\"amount\":60000,\"currency\":860,\"stan\":757810,\"field38\":\"738556\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 400, '2021-03-17 02:20:10', '2021-03-17 05:10:02'),
(30, 295, 657, 387, 590000, '010805571464', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":143905,\"params\":{\"hold\":{\"holdId\":\"245317\",\"ext\":\"multicard_hold_387\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":590000,\"stan\":\"113569\",\"date12\":\"210318122229\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":143905,\"result\":{\"id\":\"608405218\",\"username\":\"ipsh\",\"refNum\":\"010805571464\",\"ext\":\"multicard_hold_387\",\"pan\":\"860057******2418\",\"pan2\":\"\",\"expiry\":\"2601\",\"tranType\":\"DEBIT\",\"date7\":\"0318122229\",\"date12\":\"210318122229\",\"amount\":590000,\"currency\":860,\"stan\":113569,\"field38\":\"571464\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 404, '2021-03-18 12:22:29', '2021-03-19 05:10:01'),
(31, 295, 657, 388, 590000, '010805634041', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":26697,\"params\":{\"hold\":{\"holdId\":\"245335\",\"ext\":\"multicard_hold_388\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":590000,\"stan\":\"109205\",\"date12\":\"210318122753\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":26697,\"result\":{\"id\":\"608414833\",\"username\":\"ipsh\",\"refNum\":\"010805634041\",\"ext\":\"multicard_hold_388\",\"pan\":\"860057******2418\",\"pan2\":\"\",\"expiry\":\"2601\",\"tranType\":\"DEBIT\",\"date7\":\"0318122753\",\"date12\":\"210318122753\",\"amount\":590000,\"currency\":860,\"stan\":109205,\"field38\":\"634041\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 404, '2021-03-18 12:27:53', '2021-03-19 05:10:01'),
(32, 278, 680, 398, 6200000, '010893555054', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":36685,\"params\":{\"hold\":{\"holdId\":\"284590\",\"ext\":\"multicard_hold_398\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":6200000,\"stan\":\"595913\",\"date12\":\"210330135640\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":36685,\"result\":{\"id\":\"628936899\",\"username\":\"ipsh\",\"refNum\":\"010893555054\",\"ext\":\"multicard_hold_398\",\"pan\":\"860057******4691\",\"pan2\":\"\",\"expiry\":\"2406\",\"tranType\":\"DEBIT\",\"date7\":\"0330135640\",\"date12\":\"210330135640\",\"amount\":6200000,\"currency\":860,\"stan\":595913,\"field38\":\"555054\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 414, '2021-03-30 13:56:40', '2021-03-31 05:10:03'),
(33, 263, 598, 386, 250000, '010905791713', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":820317,\"params\":{\"hold\":{\"holdId\":\"243982\",\"ext\":\"multicard_hold_386\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":\"250000\",\"stan\":\"664274\",\"date12\":\"210401002010\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":820317,\"result\":{\"id\":\"632020909\",\"username\":\"ipsh\",\"refNum\":\"010905791713\",\"ext\":\"multicard_hold_386\",\"pan\":\"860048******0831\",\"pan2\":\"\",\"expiry\":\"2309\",\"tranType\":\"DEBIT\",\"date7\":\"0401002010\",\"date12\":\"210401002010\",\"amount\":250000,\"currency\":860,\"stan\":664274,\"field38\":\"791713\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 427, '2021-04-01 00:20:10', '2021-04-10 14:14:44'),
(34, 321, 735, 402, 13000000, '010986838749', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":192592,\"params\":{\"hold\":{\"holdId\":\"350556\",\"ext\":\"multicard_hold_402\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":13000000,\"stan\":\"637781\",\"date12\":\"210409164011\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":192592,\"result\":{\"id\":\"650300807\",\"username\":\"ipsh\",\"refNum\":\"010986838749\",\"ext\":\"multicard_hold_402\",\"pan\":\"860031******9658\",\"pan2\":\"\",\"expiry\":\"2309\",\"tranType\":\"DEBIT\",\"date7\":\"0409164011\",\"date12\":\"210409164011\",\"amount\":13000000,\"currency\":860,\"stan\":637781,\"field38\":\"838749\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 425, '2021-04-09 16:40:11', '2021-04-10 05:10:04'),
(35, 278, 680, 404, 2000000, '010989574970', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":858370,\"params\":{\"hold\":{\"holdId\":\"362706\",\"ext\":\"multicard_hold_404\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":2000000,\"stan\":\"346708\",\"date12\":\"210409221011\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":858370,\"result\":{\"id\":\"650916775\",\"username\":\"ipsh\",\"refNum\":\"010989574970\",\"ext\":\"multicard_hold_404\",\"pan\":\"860057******4691\",\"pan2\":\"\",\"expiry\":\"2406\",\"tranType\":\"DEBIT\",\"date7\":\"0409221011\",\"date12\":\"210409221011\",\"amount\":2000000,\"currency\":860,\"stan\":346708,\"field38\":\"574970\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 424, '2021-04-09 22:10:11', '2021-04-10 05:10:03'),
(36, 266, 668, 412, 29892000, '010997575630', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":366184,\"params\":{\"hold\":{\"holdId\":\"377632\",\"ext\":\"multicard_hold_412\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":29892000,\"stan\":\"831197\",\"date12\":\"210410223012\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":366184,\"result\":{\"id\":\"652721652\",\"username\":\"ipsh\",\"refNum\":\"010997575630\",\"ext\":\"multicard_hold_412\",\"pan\":\"860057******8727\",\"pan2\":\"\",\"expiry\":\"2304\",\"tranType\":\"DEBIT\",\"date7\":\"0410223012\",\"date12\":\"210410223012\",\"amount\":29892000,\"currency\":860,\"stan\":831197,\"field38\":\"575630\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 430, '2021-04-10 22:30:12', '2021-04-11 05:10:02'),
(37, 111, 166, 411, 1535000, '011000945476', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":585179,\"params\":{\"hold\":{\"holdId\":\"373341\",\"ext\":\"multicard_hold_411\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":1535000,\"stan\":\"505601\",\"date12\":\"210411124926\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":585179,\"result\":{\"id\":\"653419710\",\"username\":\"ipsh\",\"refNum\":\"011000945476\",\"ext\":\"multicard_hold_411\",\"pan\":\"860031******7001\",\"pan2\":\"\",\"expiry\":\"2302\",\"tranType\":\"DEBIT\",\"date7\":\"0411124926\",\"date12\":\"210411124926\",\"amount\":1535000,\"currency\":860,\"stan\":505601,\"field38\":\"945476\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 437, '2021-04-11 12:49:26', '2021-04-12 05:20:02'),
(38, 321, 735, 414, 3818000, '011002379256', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":845895,\"params\":{\"hold\":{\"holdId\":\"378898\",\"ext\":\"multicard_hold_414\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":3818000,\"stan\":\"335584\",\"date12\":\"210411170013\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":845895,\"result\":{\"id\":\"653757019\",\"username\":\"ipsh\",\"refNum\":\"011002379256\",\"ext\":\"multicard_hold_414\",\"pan\":\"860031******9658\",\"pan2\":\"\",\"expiry\":\"2309\",\"tranType\":\"DEBIT\",\"date7\":\"0411170013\",\"date12\":\"210411170013\",\"amount\":3818000,\"currency\":860,\"stan\":335584,\"field38\":\"379256\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 438, '2021-04-11 17:00:13', '2021-04-12 05:20:10'),
(39, 111, 166, 415, 8400000, '011007720278', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":591571,\"params\":{\"hold\":{\"holdId\":\"380790\",\"ext\":\"multicard_hold_415\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":8400000,\"stan\":\"793720\",\"date12\":\"210412124958\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":591571,\"result\":{\"id\":\"655094321\",\"username\":\"ipsh\",\"refNum\":\"011007720278\",\"ext\":\"multicard_hold_415\",\"pan\":\"860031******7001\",\"pan2\":\"\",\"expiry\":\"2302\",\"tranType\":\"DEBIT\",\"date7\":\"0412124958\",\"date12\":\"210412124958\",\"amount\":8400000,\"currency\":860,\"stan\":793720,\"field38\":\"720278\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 445, '2021-04-12 12:49:58', '2021-04-13 05:20:02'),
(41, 278, 680, 409, 3050000, '011008391658', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":939983,\"params\":{\"hold\":{\"holdId\":\"370722\",\"ext\":\"multicard_hold_409\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":3050000,\"stan\":\"305888\",\"date12\":\"210412142011\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":939983,\"result\":{\"id\":\"655259337\",\"username\":\"ipsh\",\"refNum\":\"011008391658\",\"ext\":\"multicard_hold_409\",\"pan\":\"860057******4691\",\"pan2\":\"\",\"expiry\":\"2406\",\"tranType\":\"DEBIT\",\"date7\":\"0412142011\",\"date12\":\"210412142011\",\"amount\":3050000,\"currency\":860,\"stan\":305888,\"field38\":\"391658\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 446, '2021-04-12 14:20:11', '2021-04-13 05:20:07'),
(42, 314, 733, 424, 1430000, '011010383444', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":28043,\"params\":{\"hold\":{\"holdId\":\"387696\",\"ext\":\"multicard_hold_424\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":1430000,\"stan\":\"612857\",\"date12\":\"210412181410\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":28043,\"result\":{\"id\":\"655699656\",\"username\":\"ipsh\",\"refNum\":\"011010383444\",\"ext\":\"multicard_hold_424\",\"pan\":\"860031******0562\",\"pan2\":\"\",\"expiry\":\"2502\",\"tranType\":\"DEBIT\",\"date7\":\"0412181410\",\"date12\":\"210412181410\",\"amount\":1430000,\"currency\":860,\"stan\":612857,\"field38\":\"383444\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 447, '2021-04-12 18:14:10', '2021-04-13 05:20:12'),
(43, 327, 740, 410, 1454057, '011011659666', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":164658,\"params\":{\"hold\":{\"holdId\":\"371464\",\"ext\":\"multicard_hold_410\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":1454057,\"stan\":\"55978\",\"date12\":\"210412211011\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":164658,\"result\":{\"id\":\"656001218\",\"username\":\"ipsh\",\"refNum\":\"011011659666\",\"ext\":\"multicard_hold_410\",\"pan\":\"860033******1682\",\"pan2\":\"\",\"expiry\":\"2311\",\"tranType\":\"DEBIT\",\"date7\":\"0412211011\",\"date12\":\"210412211011\",\"amount\":1454057,\"currency\":860,\"stan\":55978,\"field38\":\"659666\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 448, '2021-04-12 21:10:11', '2021-04-13 05:20:13'),
(44, 278, 680, 426, 16500000, '011012082177', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":359852,\"params\":{\"hold\":{\"holdId\":\"388150\",\"ext\":\"multicard_hold_426\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":16500000,\"stan\":\"769861\",\"date12\":\"210412224011\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":359852,\"result\":{\"id\":\"656108788\",\"username\":\"ipsh\",\"refNum\":\"011012082177\",\"ext\":\"multicard_hold_426\",\"pan\":\"860057******4691\",\"pan2\":\"\",\"expiry\":\"2406\",\"tranType\":\"DEBIT\",\"date7\":\"0412224012\",\"date12\":\"210412224011\",\"amount\":16500000,\"currency\":860,\"stan\":769861,\"field38\":\"082177\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 446, '2021-04-12 22:40:12', '2021-04-13 05:20:07'),
(45, 314, 733, 428, 1700000, '011012385407', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":831599,\"params\":{\"hold\":{\"holdId\":\"389667\",\"ext\":\"multicard_hold_428\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":1700000,\"stan\":\"665549\",\"date12\":\"210413000014\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":831599,\"result\":{\"id\":\"656175071\",\"username\":\"ipsh\",\"refNum\":\"011012385407\",\"ext\":\"multicard_hold_428\",\"pan\":\"860031******0562\",\"pan2\":\"\",\"expiry\":\"2502\",\"tranType\":\"DEBIT\",\"date7\":\"0413000014\",\"date12\":\"210413000014\",\"amount\":1700000,\"currency\":860,\"stan\":665549,\"field38\":\"385407\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 447, '2021-04-13 00:00:14', '2021-04-13 05:20:12'),
(46, 321, 735, 417, 4600000, '011016143274', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":262295,\"params\":{\"hold\":{\"holdId\":\"382268\",\"ext\":\"multicard_hold_417\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":4600000,\"stan\":\"987513\",\"date12\":\"210413133011\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":262295,\"result\":{\"id\":\"656988993\",\"username\":\"ipsh\",\"refNum\":\"011016143274\",\"ext\":\"multicard_hold_417\",\"pan\":\"860031******9658\",\"pan2\":\"\",\"expiry\":\"2309\",\"tranType\":\"DEBIT\",\"date7\":\"0413133012\",\"date12\":\"210413133011\",\"amount\":4600000,\"currency\":860,\"stan\":987513,\"field38\":\"143274\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 450, '2021-04-13 13:30:12', '2021-04-14 05:10:03'),
(47, 325, 739, 416, 1200000, '011026674154', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":832970,\"params\":{\"hold\":{\"holdId\":\"381556\",\"ext\":\"multicard_hold_416\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":1200000,\"stan\":\"881967\",\"date12\":\"210414192446\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":832970,\"result\":{\"id\":\"659346732\",\"username\":\"ipsh\",\"refNum\":\"011026674154\",\"ext\":\"multicard_hold_416\",\"pan\":\"860057******0055\",\"pan2\":\"\",\"expiry\":\"2407\",\"tranType\":\"DEBIT\",\"date7\":\"0414192446\",\"date12\":\"210414192446\",\"amount\":1200000,\"currency\":860,\"stan\":881967,\"field38\":\"674154\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 454, '2021-04-14 19:24:46', '2021-04-15 06:00:11'),
(48, 325, 739, 436, 3300000, '011026795583', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":878388,\"params\":{\"hold\":{\"holdId\":\"405546\",\"ext\":\"multicard_hold_436\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":3300000,\"stan\":\"710057\",\"date12\":\"210414194601\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":878388,\"result\":{\"id\":\"659383015\",\"username\":\"ipsh\",\"refNum\":\"011026795583\",\"ext\":\"multicard_hold_436\",\"pan\":\"860057******0055\",\"pan2\":\"\",\"expiry\":\"2407\",\"tranType\":\"DEBIT\",\"date7\":\"0414194601\",\"date12\":\"210414194601\",\"amount\":3300000,\"currency\":860,\"stan\":710057,\"field38\":\"795583\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 454, '2021-04-14 19:46:01', '2021-04-15 06:00:11'),
(49, 325, 739, 437, 1800000, '011027173883', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":864746,\"params\":{\"hold\":{\"holdId\":\"405708\",\"ext\":\"multicard_hold_437\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":1800000,\"stan\":\"446118\",\"date12\":\"210414204723\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":864746,\"result\":{\"id\":\"659484630\",\"username\":\"ipsh\",\"refNum\":\"011027173883\",\"ext\":\"multicard_hold_437\",\"pan\":\"860057******0055\",\"pan2\":\"\",\"expiry\":\"2407\",\"tranType\":\"DEBIT\",\"date7\":\"0414204723\",\"date12\":\"210414204723\",\"amount\":1800000,\"currency\":860,\"stan\":446118,\"field38\":\"173883\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 454, '2021-04-14 20:47:23', '2021-04-15 06:00:11'),
(50, 111, 166, 427, 3100000, '011040809306', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":777066,\"params\":{\"hold\":{\"holdId\":\"388377\",\"ext\":\"multicard_hold_427\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":3100000,\"stan\":\"36502\",\"date12\":\"210416142018\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":777066,\"result\":{\"id\":\"662581092\",\"username\":\"ipsh\",\"refNum\":\"011040809306\",\"ext\":\"multicard_hold_427\",\"pan\":\"860031******7001\",\"pan2\":\"\",\"expiry\":\"2302\",\"tranType\":\"DEBIT\",\"date7\":\"0416142018\",\"date12\":\"210416142018\",\"amount\":3100000,\"currency\":860,\"stan\":36502,\"field38\":\"809306\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 461, '2021-04-16 14:20:18', '2021-04-17 05:20:01'),
(51, 278, 680, 430, 2060000, '011045115465', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":988028,\"params\":{\"hold\":{\"holdId\":\"391457\",\"ext\":\"multicard_hold_430\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":2060000,\"stan\":\"111741\",\"date12\":\"210416213013\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":988028,\"result\":{\"id\":\"663409855\",\"username\":\"ipsh\",\"refNum\":\"011045115465\",\"ext\":\"multicard_hold_430\",\"pan\":\"860057******4691\",\"pan2\":\"\",\"expiry\":\"2406\",\"tranType\":\"DEBIT\",\"date7\":\"0416213013\",\"date12\":\"210416213013\",\"amount\":2060000,\"currency\":860,\"stan\":111741,\"field38\":\"115465\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 462, '2021-04-16 21:30:13', '2021-04-17 05:20:06'),
(52, 111, 166, NULL, 50000, '2439713', NULL, '{\"create\":{\"result\":{\"code\":\"OK\",\"description\":\"\\u041d\\u0435\\u0442 \\u043e\\u0448\\u0438\\u0431\\u043e\\u043a\"},\"transaction_id\":19504693,\"store_transaction\":{\"success_trans_id\":null,\"trans_id\":19504693,\"store\":{\"id\":417,\"name\":\"MULTICARD\",\"desc\":\"\",\"logo\":null,\"ga_id\":null},\"terminal_id\":null,\"account\":\"166\",\"amount\":50000,\"confirmed\":false,\"prepay_time\":null,\"confirm_time\":null,\"label\":{\"type_id\":49,\"label_ru\":\"\\u041d\\u043e\\u043c\\u0435\\u0440 \\u0438\\u043d\\u0432\\u043e\\u0439\\u0441\\u0430\",\"label_uz\":\"Invoys raqami\",\"label_en\":\"Invoice number\"},\"details\":\"166\",\"commission_value\":\"0\",\"commission_type\":\"0\",\"total\":50000,\"card_id\":null,\"status_code\":null,\"status_message\":null}},\"pre_confirm\":{\"result\":{\"code\":\"OK\",\"description\":\"\\u041d\\u0435\\u0442 \\u043e\\u0448\\u0438\\u0431\\u043e\\u043a\"}},\"confirm\":{\"result\":{\"code\":\"OK\",\"description\":\"\\u041d\\u0435\\u0442 \\u043e\\u0448\\u0438\\u0431\\u043e\\u043a\"},\"store_transaction\":{\"success_trans_id\":2439713,\"trans_id\":19504693,\"store\":{\"id\":417,\"name\":\"MULTICARD\",\"desc\":\"\",\"logo\":null,\"ga_id\":null},\"terminal_id\":\"92800562\",\"account\":\"166\",\"amount\":50000,\"confirmed\":true,\"prepay_time\":1618686136000,\"confirm_time\":1618686136875,\"label\":{\"type_id\":49,\"label_ru\":\"\\u041d\\u043e\\u043c\\u0435\\u0440 \\u0438\\u043d\\u0432\\u043e\\u0439\\u0441\\u0430\",\"label_uz\":\"Invoys raqami\",\"label_en\":\"Invoice number\"},\"details\":\"166\",\"commission_value\":\"0\",\"commission_type\":\"0\",\"total\":50000,\"card_id\":\"8B431A6A1057EB41E0530100007FEA67\",\"status_code\":\"0\",\"status_message\":\"Success\"}}}', 'OK', 1, 465, '2021-04-18 00:02:16', '2021-04-19 05:20:02'),
(53, 111, 166, NULL, 60000, '2439717', NULL, '{\"create\":{\"result\":{\"code\":\"OK\",\"description\":\"\\u041d\\u0435\\u0442 \\u043e\\u0448\\u0438\\u0431\\u043e\\u043a\"},\"transaction_id\":19505989,\"store_transaction\":{\"success_trans_id\":null,\"trans_id\":19505989,\"store\":{\"id\":417,\"name\":\"MULTICARD\",\"desc\":\"\",\"logo\":null,\"ga_id\":null},\"terminal_id\":null,\"account\":\"166\",\"amount\":60000,\"confirmed\":false,\"prepay_time\":null,\"confirm_time\":null,\"label\":{\"type_id\":49,\"label_ru\":\"\\u041d\\u043e\\u043c\\u0435\\u0440 \\u0438\\u043d\\u0432\\u043e\\u0439\\u0441\\u0430\",\"label_uz\":\"Invoys raqami\",\"label_en\":\"Invoice number\"},\"details\":\"166\",\"commission_value\":\"0\",\"commission_type\":\"0\",\"total\":60000,\"card_id\":null,\"status_code\":null,\"status_message\":null}},\"pre_confirm\":{\"result\":{\"code\":\"OK\",\"description\":\"\\u041d\\u0435\\u0442 \\u043e\\u0448\\u0438\\u0431\\u043e\\u043a\"}},\"confirm\":{\"result\":{\"code\":\"OK\",\"description\":\"\\u041d\\u0435\\u0442 \\u043e\\u0448\\u0438\\u0431\\u043e\\u043a\"},\"store_transaction\":{\"success_trans_id\":2439717,\"trans_id\":19505989,\"store\":{\"id\":417,\"name\":\"MULTICARD\",\"desc\":\"\",\"logo\":null,\"ga_id\":null},\"terminal_id\":\"92800562\",\"account\":\"166\",\"amount\":60000,\"confirmed\":true,\"prepay_time\":1618686867000,\"confirm_time\":1618686868170,\"label\":{\"type_id\":49,\"label_ru\":\"\\u041d\\u043e\\u043c\\u0435\\u0440 \\u0438\\u043d\\u0432\\u043e\\u0439\\u0441\\u0430\",\"label_uz\":\"Invoys raqami\",\"label_en\":\"Invoice number\"},\"details\":\"166\",\"commission_value\":\"0\",\"commission_type\":\"0\",\"total\":60000,\"card_id\":\"8B431A6A1057EB41E0530100007FEA67\",\"status_code\":\"0\",\"status_message\":\"Success\"}}}', 'OK', 1, 465, '2021-04-18 00:14:28', '2021-04-19 05:20:02'),
(54, 321, 735, 446, 795000, '011064729055', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":459359,\"params\":{\"hold\":{\"holdId\":\"420279\",\"ext\":\"multicard_hold_446\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":795000,\"stan\":\"695287\",\"date12\":\"210419134507\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":459359,\"result\":{\"id\":\"667888100\",\"username\":\"ipsh\",\"refNum\":\"011064729055\",\"ext\":\"multicard_hold_446\",\"pan\":\"860031******9658\",\"pan2\":\"\",\"expiry\":\"2309\",\"tranType\":\"DEBIT\",\"date7\":\"0419134507\",\"date12\":\"210419134507\",\"amount\":795000,\"currency\":860,\"stan\":695287,\"field38\":\"729055\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 1, 467, '2021-04-19 13:45:07', '2021-04-20 05:10:03'),
(55, 111, 166, 455, 6480000, '011087159822', '{\"jsonrpc\":\"2.0\",\"method\":\"hold.dismiss.charge\",\"id\":200988,\"params\":{\"hold\":{\"holdId\":\"463505\",\"ext\":\"multicard_hold_455\",\"terminalId\":\"92800562\",\"merchantId\":\"10718009\",\"port\":\"16050\",\"amount\":6480000,\"stan\":\"876498\",\"date12\":\"210422104833\"}}}', '{\"jsonrpc\":\"2.0\",\"id\":200988,\"result\":{\"id\":\"672769407\",\"username\":\"ipsh\",\"refNum\":\"011087159822\",\"ext\":\"multicard_hold_455\",\"pan\":\"860031******7001\",\"pan2\":\"\",\"expiry\":\"2302\",\"tranType\":\"DEBIT\",\"date7\":\"0422104833\",\"date12\":\"210422104833\",\"amount\":6480000,\"currency\":860,\"stan\":876498,\"field38\":\"159822\",\"field48\":null,\"field91\":null,\"merchantId\":\"10718009\",\"terminalId\":\"92800562\",\"resp\":0,\"respText\":\"Successful transaction\",\"respSV\":\"00\",\"status\":\"OK\"}}', 'OK', 0, NULL, '2021-04-22 10:48:33', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `card_hold`
--

CREATE TABLE `card_hold` (
  `id` int UNSIGNED NOT NULL,
  `card_id` int UNSIGNED NOT NULL,
  `amount` int NOT NULL,
  `active_till` datetime NOT NULL,
  `pc_hold_id` int NOT NULL,
  `credit_limit_history_id` bigint DEFAULT NULL,
  `canceled` tinyint(1) NOT NULL DEFAULT '0',
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `card_hold`
--

INSERT INTO `card_hold` (`id`, `card_id`, `amount`, `active_till`, `pc_hold_id`, `credit_limit_history_id`, `canceled`, `added_on`, `updated_on`) VALUES
(130, 111, 200000, '2020-10-18 00:00:00', 61260, 112, 2, '2020-09-18 18:16:43', '2021-03-05 15:03:11'),
(138, 111, 4600000, '2020-10-18 00:00:00', 61297, 133, 2, '2020-09-18 18:54:13', '2021-03-05 15:03:11'),
(140, 111, 12500000, '2020-10-18 00:00:00', 61436, 136, 2, '2020-09-18 23:08:59', '2021-03-05 15:03:11'),
(141, 111, 5400000, '2020-10-22 00:00:00', 63964, 138, 2, '2020-09-22 22:54:05', '2021-03-05 15:03:11'),
(142, 111, 34160000, '2020-10-23 00:00:00', 64594, 140, 2, '2020-09-23 20:50:10', '2021-03-05 15:03:11'),
(143, 111, 26160000, '2020-10-23 00:00:00', 64640, 141, 2, '2020-09-23 22:15:07', '2021-03-05 15:03:11'),
(145, 111, 3060000, '2020-10-24 00:00:00', 64810, 144, 2, '2020-09-24 10:30:07', '2021-03-05 15:03:11'),
(146, 111, 60000, '2020-10-24 00:00:00', 65394, 146, 2, '2020-09-24 23:38:13', '2021-03-05 15:03:11'),
(147, 111, 65000, '2020-10-25 00:00:00', 65955, 147, 2, '2020-09-25 17:36:59', '2021-03-05 15:03:11'),
(148, 111, 70000, '2020-10-25 00:00:00', 65991, 148, 2, '2020-09-25 18:17:36', '2021-03-05 15:03:11'),
(149, 111, 100000, '2020-10-26 00:00:00', 66269, 151, 2, '2020-09-26 09:30:02', '2021-03-05 15:03:11'),
(150, 111, 760000, '2020-10-26 00:00:00', 66392, 152, 2, '2020-09-26 13:02:09', '2021-03-05 15:03:11'),
(151, 111, 160000, '2020-10-26 00:00:00', 66701, 153, 2, '2020-09-26 23:14:55', '2021-03-05 15:03:11'),
(152, 111, 260000, '2020-10-27 00:00:00', 67125, 154, 2, '2020-09-27 23:03:24', '2021-03-05 15:03:11'),
(153, 111, 460000, '2020-10-29 00:00:00', 67920, 155, 2, '2020-09-29 02:21:33', '2021-03-05 15:03:11'),
(154, 111, 10000, '2020-10-30 00:00:00', 68736, 157, 2, '2020-09-30 00:03:28', '2021-03-05 15:03:11'),
(155, 111, 1660000, '2020-10-30 00:00:00', 69021, 158, 2, '2020-09-30 12:00:06', '2021-03-05 15:03:11'),
(156, 111, 260000, '2020-10-30 00:00:00', 69519, 160, 2, '2020-09-30 20:05:58', '2021-03-05 15:03:11'),
(157, 111, 12360000, '2020-11-01 00:00:00', 70023, 161, 2, '2020-10-01 13:35:40', '2021-03-05 15:03:11'),
(158, 111, 512168, '2020-11-01 00:00:00', 70066, 162, 2, '2020-10-01 14:30:06', '2021-03-05 15:03:11'),
(159, 107, 1447832, '2020-11-01 00:00:00', 70067, 162, 2, '2020-10-01 14:30:06', '2021-03-05 15:03:11'),
(160, 111, 10000, '2020-11-01 00:00:00', 70186, 163, 2, '2020-10-01 17:34:11', '2021-03-05 15:03:11'),
(166, 111, 2660000, '2020-11-18 00:00:00', 84533, 177, 2, '2020-10-18 11:02:08', '2021-03-05 15:03:11'),
(167, 111, 50000, '2020-12-01 00:00:00', 95063, 179, 2, '2020-11-01 23:06:25', '2021-03-05 15:03:11'),
(168, 111, 8160000, '2020-12-01 00:00:00', 95089, 180, 2, '2020-11-01 23:50:43', '2021-03-05 15:03:11'),
(169, 111, 7560000, '2020-12-02 00:00:00', 95141, 181, 2, '2020-11-02 07:38:47', '2021-03-05 15:03:11'),
(170, 111, 6860600, '2020-12-02 00:00:00', 95157, 182, 2, '2020-11-02 08:44:21', '2021-03-05 15:03:11'),
(171, 111, 6960600, '2020-12-02 00:00:00', 95733, 183, 2, '2020-11-02 22:44:28', '2021-03-05 15:03:11'),
(172, 111, 7060600, '2020-12-02 00:00:00', 95765, 184, 2, '2020-11-02 23:24:42', '2021-03-05 15:03:11'),
(173, 111, 6760600, '2020-12-03 00:00:00', 95803, 185, 2, '2020-11-03 00:22:55', '2021-03-05 15:03:11'),
(174, 111, 6260600, '2020-12-03 00:00:00', 96046, 186, 2, '2020-11-03 10:01:20', '2021-03-05 15:03:11'),
(175, 111, 5549000, '2020-12-03 00:00:00', 96053, 187, 2, '2020-11-03 10:11:00', '2021-03-05 15:03:11'),
(176, 111, 4831600, '2020-12-03 00:00:00', 96071, 188, 2, '2020-11-03 10:38:28', '2021-03-05 15:03:11'),
(177, 111, 4109000, '2020-12-03 00:00:00', 96101, 189, 2, '2020-11-03 11:07:05', '2021-03-05 15:03:11'),
(178, 111, 3381900, '2020-12-03 00:00:00', 96197, 190, 2, '2020-11-03 12:58:47', '2021-03-05 15:03:11'),
(179, 111, 60000, '2020-12-03 00:00:00', 96331, 191, 2, '2020-11-03 14:35:55', '2021-03-05 15:03:11'),
(180, 111, 260000, '2020-12-03 00:00:00', 96339, 192, 2, '2020-11-03 14:39:37', '2021-03-05 15:03:11'),
(181, 111, 878100, '2020-12-03 00:00:00', 96357, 193, 2, '2020-11-03 14:50:02', '2021-03-05 15:03:11'),
(182, 111, 10000, '2020-11-30 23:59:59', 97280, 195, 2, '2020-11-03 23:22:30', '2021-03-05 15:03:11'),
(183, 111, 60000, '2020-11-30 23:59:59', 97283, 196, 2, '2020-11-03 23:24:05', '2021-03-05 15:03:11'),
(184, 111, 160000, '2020-11-30 23:59:59', 97288, 197, 2, '2020-11-03 23:26:48', '2021-03-05 15:03:11'),
(185, 111, 60000, '2020-11-30 23:59:59', 97292, 198, 2, '2020-11-03 23:29:41', '2021-03-05 15:03:11'),
(186, 111, 160000, '2020-11-30 23:59:59', 97303, 199, 2, '2020-11-03 23:35:58', '2021-03-05 15:03:11'),
(187, 111, 60000, '2020-11-30 23:59:59', 97317, 200, 2, '2020-11-03 23:41:32', '2021-03-05 15:03:11'),
(188, 111, 160000, '2020-11-30 23:59:59', 97321, 201, 2, '2020-11-03 23:46:09', '2021-03-05 15:03:11'),
(189, 111, 60000, '2020-11-30 23:59:59', 97324, 202, 2, '2020-11-03 23:49:37', '2021-03-05 15:03:11'),
(190, 111, 160000, '2020-11-30 23:59:59', 97330, 203, 2, '2020-11-03 23:53:42', '2021-03-05 15:03:11'),
(191, 111, 60000, '2020-11-30 23:59:59', 97334, 204, 2, '2020-11-03 23:55:04', '2021-03-05 15:03:11'),
(192, 111, 150000, '2020-11-30 23:59:59', 97338, 205, 2, '2020-11-03 23:57:25', '2021-03-05 15:03:11'),
(193, 111, 140000, '2020-11-30 23:59:59', 97345, 206, 2, '2020-11-03 23:59:51', '2021-03-05 15:03:11'),
(194, 111, 150000, '2020-11-30 23:59:59', 97349, 207, 2, '2020-11-04 00:01:45', '2021-03-05 15:03:11'),
(195, 111, 250000, '2020-11-30 23:59:59', 97352, 208, 2, '2020-11-04 00:03:09', '2021-03-05 15:03:11'),
(196, 111, 240000, '2020-11-30 23:59:59', 97354, 209, 2, '2020-11-04 00:04:42', '2021-03-05 15:03:11'),
(197, 111, 140000, '2020-11-30 23:59:59', 97357, 210, 2, '2020-11-04 00:05:56', '2021-03-05 15:03:11'),
(198, 111, 240000, '2020-11-30 23:59:59', 97364, 211, 2, '2020-11-04 00:08:38', '2021-03-05 15:03:11'),
(199, 111, 250000, '2020-11-30 23:59:59', 97366, 212, 2, '2020-11-04 00:11:44', '2021-03-05 15:03:11'),
(200, 111, 150000, '2020-11-30 23:59:59', 97369, 213, 2, '2020-11-04 00:14:20', '2021-03-05 15:03:11'),
(201, 111, 250000, '2020-11-30 23:59:59', 97370, 214, 2, '2020-11-04 00:15:38', '2021-03-05 15:03:11'),
(202, 111, 150000, '2020-11-30 23:59:59', 97372, 215, 2, '2020-11-04 00:17:03', '2021-03-05 15:03:11'),
(203, 111, 150000, '2020-11-30 23:59:59', 97375, 216, 2, '2020-11-04 00:19:10', '2021-03-05 15:03:11'),
(204, 111, 250000, '2020-11-30 23:59:59', 97377, 217, 2, '2020-11-04 00:21:41', '2021-03-05 15:03:11'),
(205, 111, 258000, '2020-11-30 23:59:59', 97381, 218, 2, '2020-11-04 00:23:34', '2021-03-05 15:03:11'),
(206, 111, 259000, '2020-11-30 23:59:59', 97386, 219, 2, '2020-11-04 00:25:34', '2021-03-05 15:03:11'),
(207, 111, 259900, '2020-11-30 23:59:59', 97390, 220, 2, '2020-11-04 00:27:03', '2021-03-05 15:03:11'),
(208, 111, 148800, '2020-11-30 23:59:59', 97392, 221, 2, '2020-11-04 00:29:30', '2021-03-05 15:03:11'),
(209, 111, 148700, '2020-11-30 23:59:59', 97396, 222, 2, '2020-11-04 00:30:41', '2021-03-05 15:03:11'),
(210, 111, 148700, '2020-11-30 23:59:59', 97399, 223, 2, '2020-11-04 00:34:06', '2021-03-05 15:03:11'),
(211, 111, 148700, '2020-11-30 23:59:59', 97401, 224, 2, '2020-11-04 00:35:14', '2021-03-05 15:03:11'),
(212, 111, 148800, '2020-11-30 23:59:59', 97406, 225, 2, '2020-11-04 00:40:29', '2021-03-05 15:03:11'),
(213, 111, 148900, '2020-11-30 23:59:59', 97407, 226, 2, '2020-11-04 00:42:42', '2021-03-05 15:03:11'),
(214, 111, 149900, '2020-11-30 23:59:59', 97415, 227, 2, '2020-11-04 00:47:07', '2021-03-05 15:03:11'),
(215, 111, 149900, '2020-11-30 23:59:59', 97417, 228, 2, '2020-11-04 00:49:27', '2021-03-05 15:03:11'),
(216, 111, 149800, '2020-11-30 23:59:59', 97419, 229, 2, '2020-11-04 00:50:47', '2021-03-05 15:03:11'),
(217, 111, 149900, '2020-11-30 23:59:59', 97420, 230, 2, '2020-11-04 00:52:14', '2021-03-05 15:03:11'),
(218, 111, 149900, '2020-11-30 23:59:59', 97421, 231, 2, '2020-11-04 00:54:25', '2021-03-05 15:03:11'),
(219, 111, 43060000, '2020-11-30 23:59:59', 97431, 232, 2, '2020-11-04 01:04:01', '2021-03-05 15:03:11'),
(220, 111, 43160000, '2020-11-30 23:59:59', 97432, 233, 2, '2020-11-04 01:06:55', '2021-03-05 15:03:11'),
(221, 111, 43160000, '2020-11-30 23:59:59', 97436, 234, 2, '2020-11-04 01:08:18', '2021-03-05 15:03:11'),
(222, 111, 27060000, '2020-11-30 23:59:59', 97714, 237, 2, '2020-11-04 09:18:15', '2021-03-05 15:03:11'),
(223, 111, 68260000, '2020-11-30 23:59:59', 97722, 239, 2, '2020-11-04 09:22:37', '2021-03-05 15:03:11'),
(224, 111, 32360000, '2020-11-30 23:59:59', 97725, 240, 2, '2020-11-04 09:24:16', '2021-03-05 15:03:11'),
(225, 111, 17860000, '2020-11-30 23:59:59', 97732, 242, 2, '2020-11-04 09:27:49', '2021-03-05 15:03:11'),
(226, 111, 17960000, '2020-11-30 23:59:59', 97737, 243, 2, '2020-11-04 09:30:07', '2021-03-05 15:03:11'),
(227, 111, 16960000, '2020-11-30 23:59:59', 97743, 244, 2, '2020-11-04 09:34:01', '2021-03-05 15:03:11'),
(228, 111, 15860000, '2020-11-30 23:59:59', 97746, 245, 2, '2020-11-04 09:35:15', '2021-03-05 15:03:11'),
(229, 111, 32360000, '2020-11-30 23:59:59', 97747, 246, 2, '2020-11-04 09:36:39', '2021-03-05 15:03:11'),
(230, 111, 21760000, '2020-11-30 23:59:59', 97752, 247, 2, '2020-11-04 09:38:26', '2021-03-05 15:03:11'),
(231, 111, 10000, '2020-11-30 23:59:59', 97758, 249, 2, '2020-11-04 09:41:52', '2021-03-05 15:03:11'),
(232, 111, 27060000, '2020-11-30 23:59:59', 97767, 250, 2, '2020-11-04 09:48:06', '2021-03-05 15:03:11'),
(233, 111, 29260000, '2020-11-30 23:59:59', 97778, 251, 2, '2020-11-04 09:50:05', '2021-03-05 15:03:11'),
(234, 111, 57560000, '2020-11-30 23:59:59', 97796, 252, 2, '2020-11-04 09:55:36', '2021-03-05 15:03:11'),
(235, 111, 21760000, '2020-11-30 23:59:59', 97799, 253, 2, '2020-11-04 09:58:04', '2021-03-05 15:03:11'),
(236, 111, 29260000, '2020-11-30 23:59:59', 97805, 254, 2, '2020-11-04 09:59:47', '2021-03-05 15:03:11'),
(237, 111, 61260000, '2020-11-30 23:59:59', 98308, 256, 2, '2020-11-04 13:55:38', '2021-03-05 15:03:11'),
(238, 111, 11260000, '2020-11-30 23:59:59', 98314, 257, 2, '2020-11-04 13:57:38', '2021-03-05 15:03:11'),
(239, 111, 12260000, '2020-11-30 23:59:59', 98318, 258, 2, '2020-11-04 13:59:11', '2021-03-05 15:03:11'),
(240, 111, 172160000, '2020-11-30 23:59:59', 98320, 259, 2, '2020-11-04 14:00:37', '2021-03-05 15:03:11'),
(241, 111, 111160000, '2020-11-30 23:59:59', 99242, 260, 2, '2020-11-04 22:12:32', '2021-03-05 15:03:11'),
(242, 111, 271360000, '2020-11-30 23:59:59', 99244, 261, 2, '2020-11-04 22:15:32', '2021-03-05 15:03:11'),
(243, 111, 281360000, '2020-11-30 23:59:59', 99261, 262, 2, '2020-11-04 22:23:50', '2021-03-05 15:03:11'),
(244, 111, 781260000, '2020-11-30 23:59:59', 99272, 264, 2, '2020-11-04 22:32:00', '2021-03-05 15:03:11'),
(245, 111, 123360000, '2020-11-30 23:59:59', 99283, 265, 2, '2020-11-04 22:37:24', '2021-03-05 15:03:11'),
(246, 111, 7260000, '2020-11-30 23:59:59', 99287, 266, 2, '2020-11-04 22:40:03', '2021-03-05 15:03:11'),
(247, 111, 672860000, '2020-11-30 23:59:59', 99301, 267, 2, '2020-11-04 22:50:04', '2021-03-05 15:03:11'),
(248, 111, 251460000, '2020-11-30 23:59:59', 99304, 268, 2, '2020-11-04 22:52:28', '2021-03-05 15:03:11'),
(249, 111, 413960000, '2020-11-30 23:59:59', 99307, 269, 2, '2020-11-04 22:53:57', '2021-03-05 15:03:11'),
(250, 111, 119460000, '2020-11-30 23:59:59', 99311, 270, 2, '2020-11-04 22:59:10', '2021-03-05 15:03:11'),
(251, 111, 260760000, '2020-11-30 23:59:59', 99312, 271, 2, '2020-11-04 23:00:29', '2021-03-05 15:03:11'),
(252, 111, 160000, '2020-11-30 23:59:59', 99386, 272, 2, '2020-11-05 00:01:53', '2021-03-05 15:03:11'),
(253, 111, 846760000, '2020-11-30 23:59:59', 99388, 273, 2, '2020-11-05 00:03:07', '2021-03-05 15:03:11'),
(254, 111, 225360000, '2020-11-30 23:59:59', 99672, 274, 2, '2020-11-05 09:36:15', '2021-03-05 15:03:11'),
(255, 111, 752060000, '2020-11-30 23:59:59', 100877, 275, 2, '2020-11-05 19:46:36', '2021-03-05 15:03:11'),
(256, 111, 132560000, '2020-11-30 23:59:59', 103722, 276, 2, '2020-11-07 17:08:04', '2021-03-05 15:03:11'),
(257, 111, 11260000, '2020-11-30 23:59:59', 111907, 278, 2, '2020-11-14 06:24:17', '2021-03-05 15:03:11'),
(262, 107, 275400, '2020-11-30 23:59:59', 119477, 281, 2, '2020-11-20 16:53:31', '2021-03-05 15:03:11'),
(263, 107, 225400, '2020-11-30 23:59:59', 119481, 281, 2, '2020-11-20 18:59:44', '2021-03-05 15:03:11'),
(264, 107, 275457, '2020-11-30 23:59:59', 121952, 282, 2, '2020-11-23 16:51:45', '2021-03-05 15:03:11'),
(265, 111, 27024143, '2020-11-30 23:59:59', 121953, 282, 2, '2020-11-23 16:51:45', '2021-03-05 15:03:11'),
(266, 107, 61397, '2020-11-30 23:59:59', 123729, 282, 2, '2020-11-24 18:58:18', '2021-03-05 15:03:11'),
(267, 107, 214060, '2020-11-30 23:59:59', 123743, 283, 2, '2020-11-24 19:09:44', '2021-03-05 15:03:11'),
(268, 107, 61397, '2020-11-30 23:59:59', 123818, 284, 2, '2020-11-24 20:12:33', '2021-03-05 15:03:11'),
(269, 111, 28552663, '2020-11-30 23:59:59', 123819, 284, 2, '2020-11-24 20:12:33', '2021-03-05 15:03:11'),
(270, 111, 26014060, '2020-12-01 05:00:00', 125239, 284, 2, '2020-11-25 22:17:07', '2021-03-05 15:03:11'),
(271, 107, 275457, '2020-12-01 05:00:00', 125262, 285, 2, '2020-11-25 22:31:10', '2021-03-05 15:03:11'),
(272, 111, 2538603, '2020-12-01 05:00:00', 125263, 285, 2, '2020-11-25 22:31:10', '2021-03-05 15:03:11'),
(273, 119, 614060, '2020-12-01 05:00:00', 84317426, 286, 2, '2020-11-26 20:34:36', '2021-03-05 15:03:11'),
(274, 119, 2814060, '2020-12-01 05:00:00', 84335133, 286, 2, '2020-11-26 21:31:55', '2021-03-05 15:03:11'),
(275, 119, 2814060, '2020-12-01 05:00:00', 84337647, 293, 2, '2020-11-26 21:40:47', '2021-03-05 15:03:11'),
(276, 107, 275457, '2020-12-01 05:00:00', 127186, 294, 2, '2020-11-27 13:25:46', '2021-03-05 15:03:11'),
(277, 119, 1238603, '2020-12-01 05:00:00', 84537671, 294, 2, '2020-11-27 13:25:47', '2021-03-05 15:03:11'),
(278, 107, 1523457, '2021-01-01 05:00:00', 132087, 295, 2, '2020-12-01 07:46:43', '2021-03-05 15:03:11'),
(279, 119, 690603, '2021-01-01 05:00:00', 86024329, 295, 2, '2020-12-01 07:46:44', '2021-03-05 15:03:11'),
(280, 107, 0, '2021-01-01 05:00:00', 0, 296, 2, '2020-12-01 20:16:18', '2021-03-05 15:03:11'),
(281, 119, 5114060, '2021-01-01 05:00:00', 86521389, 296, 2, '2020-12-01 20:16:18', '2021-03-05 15:03:11'),
(282, 107, 714060, '2021-01-01 05:00:00', 133038, 297, 2, '2020-12-01 20:36:21', '2021-03-05 15:03:11'),
(283, 119, 3214060, '2021-01-01 05:00:00', 86554338, 298, 2, '2020-12-01 21:19:40', '2021-03-05 15:03:11'),
(284, 119, 5814060, '2021-01-01 05:00:00', 86591658, 299, 2, '2020-12-01 22:58:24', '2021-03-05 15:03:11'),
(285, 119, 8214060, '2021-01-01 05:00:00', 86593328, 300, 2, '2020-12-01 23:07:03', '2021-03-05 15:03:11'),
(286, 107, 1523457, '2021-01-01 05:00:00', 136049, 301, 2, '2020-12-03 15:18:09', '2021-03-05 15:03:11'),
(287, 119, 1190603, '2021-01-01 05:00:00', 87474097, 301, 2, '2020-12-03 15:18:09', '2021-03-05 15:03:11'),
(288, 107, 100000, '2021-01-01 05:00:00', 136998, 302, 2, '2020-12-03 22:46:43', '2021-03-05 15:03:11'),
(289, 107, 1109397, '2021-01-01 05:00:00', 137241, 303, 2, '2020-12-04 02:23:47', '2021-03-05 15:03:11'),
(290, 119, 1490603, '2021-01-01 05:00:00', 87718370, 303, 2, '2020-12-04 02:23:47', '2021-03-05 15:03:11'),
(291, 107, 600000, '2021-01-01 05:00:00', 137586, 304, 2, '2020-12-04 10:31:19', '2021-03-05 15:03:11'),
(292, 107, 609397, '2021-01-01 05:00:00', 137994, 305, 2, '2020-12-04 15:07:47', '2021-03-05 15:03:11'),
(293, 119, 90603, '2021-01-01 05:00:00', 88023096, 305, 2, '2020-12-04 15:07:47', '2021-03-05 15:03:11'),
(294, 119, 2300000, '2021-01-01 05:00:00', 89150808, 306, 2, '2020-12-06 16:27:24', '2021-03-05 15:03:11'),
(295, 119, 700000, '2021-01-01 05:00:00', 89191099, 307, 2, '2020-12-06 17:52:59', '2021-03-05 15:03:11'),
(296, 119, 3200000, '2021-01-01 05:00:00', 89252951, 308, 2, '2020-12-06 20:17:12', '2021-03-05 15:03:11'),
(297, 119, 9100000, '2021-01-01 05:00:00', 89307205, 309, 2, '2020-12-06 23:53:57', '2021-03-05 15:03:11'),
(298, 119, 2500000, '2021-01-01 05:00:00', 89417117, 310, 2, '2020-12-07 09:22:30', '2021-03-05 15:03:11'),
(301, 107, 1209397, '2021-01-01 05:00:00', 144936, 315, 2, '2020-12-09 22:00:14', '2021-03-05 15:03:11'),
(302, 119, 1790603, '2021-01-01 05:00:00', 90976115, 315, 2, '2020-12-09 22:00:15', '2021-03-05 15:03:11'),
(303, 123, 17700000, '2021-01-01 05:00:00', 146754, 318, 2, '2020-12-11 10:11:38', '2021-03-05 15:03:11'),
(304, 123, 10500000, '2021-01-01 05:00:00', 146854, 319, 2, '2020-12-11 11:24:42', '2021-03-05 15:03:11'),
(305, 111, 3000000, '2021-01-01 05:00:00', 152250, 321, 2, '2020-12-16 12:35:32', '2021-03-05 15:03:11'),
(306, 123, 10020296, '2021-01-01 05:00:00', 152252, 322, 2, '2020-12-16 12:36:12', '2021-03-05 15:03:11'),
(307, 124, 17404, '2021-01-01 05:00:00', 152253, 322, 2, '2020-12-16 12:36:12', '2021-03-05 15:03:11'),
(308, 111, 100000, '2021-01-01 05:00:00', 154410, 327, 2, '2020-12-18 10:37:42', '2021-03-05 15:03:11'),
(309, 111, 1800000, '2021-01-01 05:00:00', 156382, 332, 2, '2020-12-20 14:39:20', '2021-03-05 15:03:11'),
(310, 111, 3317017, '2021-01-01 05:00:00', 156704, 333, 2, '2020-12-20 23:21:24', '2021-03-05 15:03:11'),
(311, 157, 4382983, '2021-01-01 05:00:00', 156705, 333, 2, '2020-12-20 23:21:24', '2021-03-05 15:03:11'),
(313, 123, 3556, '2021-01-01 05:00:00', 160738, NULL, 2, '2020-12-25 10:31:35', '2021-03-05 15:03:11'),
(314, 124, 46844, '2021-01-01 05:00:00', 160739, NULL, 2, '2020-12-25 10:31:35', '2021-03-05 15:03:11'),
(315, 111, 49500000, '2021-02-01 05:00:00', 169467, NULL, 2, '2021-01-04 18:49:45', '2021-03-05 15:03:11'),
(316, 157, 2500000, '2021-02-01 05:00:00', 171963, NULL, 2, '2021-01-06 20:02:11', '2021-03-05 15:03:11'),
(317, 157, 4200000, '2021-02-01 05:00:00', 171966, NULL, 2, '2021-01-06 20:03:25', '2021-03-05 15:03:11'),
(318, 157, 2500000, '2021-02-01 05:00:00', 171973, NULL, 2, '2021-01-06 20:08:03', '2021-03-05 15:03:11'),
(319, 157, 2500000, '2021-02-01 05:00:00', 171976, NULL, 2, '2021-01-06 20:12:01', '2021-03-05 15:03:11'),
(320, 157, 2500000, '2021-02-01 05:00:00', 171981, NULL, 2, '2021-01-06 20:16:47', '2021-03-05 15:03:11'),
(321, 157, 2500000, '2021-02-01 05:00:00', 171982, NULL, 2, '2021-01-06 20:18:19', '2021-03-05 15:03:11'),
(322, 157, 2500000, '2021-02-01 05:00:00', 171983, NULL, 2, '2021-01-06 20:18:54', '2021-03-05 15:03:11'),
(323, 157, 2500000, '2021-02-01 05:00:00', 171987, 338, 2, '2021-01-06 20:24:25', '2021-03-05 15:03:11'),
(324, 157, 3000000, '2021-02-01 05:00:00', 172583, 339, 2, '2021-01-07 13:37:27', '2021-03-05 15:03:11'),
(325, 157, 500000, '2021-02-01 05:00:00', 174805, 340, 2, '2021-01-09 15:24:42', '2021-03-05 15:03:11'),
(326, 157, 200000, '2021-02-01 05:00:00', 174853, 341, 2, '2021-01-09 16:18:11', '2021-03-05 15:03:11'),
(327, 157, 300000, '2021-02-01 05:00:00', 175545, 342, 2, '2021-01-10 13:45:00', '2021-03-05 15:03:11'),
(328, 157, 100000, '2021-02-01 05:00:00', 175569, 343, 2, '2021-01-10 14:05:31', '2021-03-05 15:03:11'),
(329, 157, 200000, '2021-02-01 05:00:00', 175681, 344, 2, '2021-01-10 16:51:03', '2021-03-05 15:03:11'),
(330, 111, 295900000, '2021-02-01 05:00:00', 177847, 346, 2, '2021-01-12 18:28:53', '2021-03-05 15:03:11'),
(331, 111, 57400000, '2021-02-01 05:00:00', 179865, 347, 2, '2021-01-14 18:54:53', '2021-03-05 15:03:11'),
(333, 188, 346623, '2021-02-01 05:00:00', 179916, 348, 2, '2021-01-14 19:46:16', '2021-03-05 15:03:11'),
(334, 111, 100000, '2021-02-01 05:00:00', 188040, 351, 2, '2021-01-23 22:08:50', '2021-03-05 15:03:11'),
(335, 111, 299900, '2021-02-01 05:00:00', 190313, 352, 2, '2021-01-26 15:37:05', '2021-03-05 15:03:11'),
(336, 111, 9000000, '2021-02-01 05:00:00', 190693, 353, 2, '2021-01-26 23:16:57', '2021-03-05 15:03:11'),
(337, 111, 14800000, '2021-02-01 05:00:00', 191268, 354, 2, '2021-01-27 15:35:25', '2021-03-05 15:03:11'),
(338, 197, 500000, '2021-02-01 05:00:00', 117395774, 355, 2, '2021-01-28 17:31:53', '2021-03-05 15:03:11'),
(339, 111, 69100000, '2021-03-01 05:00:00', 196758, 357, 2, '2021-02-02 17:46:55', '2021-03-05 15:03:11'),
(340, 111, 39600000, '2021-03-01 05:00:00', 197805, 357, 2, '2021-02-03 14:57:50', '2021-03-05 15:03:11'),
(341, 111, 39599900, '2021-03-01 05:00:00', 197828, 357, 2, '2021-02-03 15:10:03', '2021-03-05 15:03:11'),
(342, 107, 99800, '2021-03-01 05:00:00', 199099, 361, 2, '2021-02-04 15:16:56', '2021-03-05 15:03:11'),
(343, 207, 95000, '2021-03-01 05:00:00', 206184, 362, 2, '2021-02-10 15:06:10', '2021-03-05 15:03:11'),
(344, 107, 3704900, '2021-03-01 05:00:00', 206185, 362, 2, '2021-02-10 15:06:10', '2021-03-05 15:03:11'),
(345, 207, 95000, '2021-03-01 05:00:00', 206488, 363, 2, '2021-02-10 18:08:29', '2021-03-05 15:03:11'),
(346, 107, 1004900, '2021-03-01 05:00:00', 206489, 363, 2, '2021-02-10 18:08:29', '2021-03-05 15:03:11'),
(347, 107, 499900, '2021-03-01 05:00:00', 206705, 364, 2, '2021-02-10 21:18:13', '2021-03-05 15:03:11'),
(348, 107, 1299900, '2021-03-01 05:00:00', 206844, 365, 2, '2021-02-10 23:16:52', '2021-03-05 15:03:11'),
(349, 123, 9452, '2021-03-01 05:00:00', 206908, 366, 2, '2021-02-11 00:53:17', '2021-03-05 15:03:11'),
(350, 124, 748, '2021-03-01 05:00:00', 206909, 366, 2, '2021-02-11 00:53:17', '2021-03-05 15:03:11'),
(351, 111, 19399900, '2021-03-01 05:00:00', 207440, 367, 2, '2021-02-11 13:25:56', '2021-03-05 15:03:11'),
(352, 111, 9676000, '2021-03-01 05:00:00', 207465, 367, 2, '2021-02-11 13:45:52', '2021-03-05 15:03:11'),
(353, 111, 34191396, '2021-03-01 05:00:00', 207495, 368, 2, '2021-02-11 14:10:37', '2021-03-05 15:03:11'),
(354, 107, 332504, '2021-03-01 05:00:00', 207496, 368, 2, '2021-02-11 14:10:37', '2021-03-05 15:03:11'),
(355, 111, 9723900, '2021-03-01 05:00:00', 207672, 369, 2, '2021-02-11 16:19:04', '2021-03-05 15:03:11'),
(356, 111, 10523900, '2021-03-01 05:00:00', 207772, 370, 2, '2021-02-11 17:12:15', '2021-03-05 15:03:11'),
(357, 111, 9723900, '2021-03-01 05:00:00', 208043, 371, 2, '2021-02-11 21:03:00', '2021-03-05 15:03:11'),
(359, 188, 829, '2021-03-01 05:00:00', 209417, 373, 2, '2021-02-12 23:06:24', '2021-03-05 15:03:11'),
(360, 111, 8900000, '2021-03-01 05:00:00', 209429, 374, 2, '2021-02-12 23:19:23', '2021-03-05 15:03:11'),
(361, 111, 2600000, '2021-03-01 05:00:00', 209464, 375, 2, '2021-02-13 00:11:02', '2021-03-05 15:03:11'),
(362, 111, 250000, '2021-03-01 05:00:00', 209728, 376, 2, '2021-02-13 11:43:34', '2021-03-05 15:03:11'),
(363, 111, 255900, '2021-03-01 05:00:00', 210727, 378, 2, '2021-02-14 18:54:32', '2021-03-05 15:03:11'),
(364, 119, 2563800, '2021-03-01 05:00:00', 132749529, 379, 2, '2021-02-17 21:33:44', '2021-03-05 15:03:11'),
(365, 111, 36200, '2021-03-01 05:00:00', 214406, 379, 2, '2021-02-17 21:33:44', '2021-03-05 15:03:11'),
(366, 119, 1200000, '2021-03-01 05:00:00', 133435437, 380, 2, '2021-02-18 18:36:13', '2021-03-05 15:03:11'),
(367, 119, 100000, '2021-03-01 05:00:00', 135266121, 382, 2, '2021-02-21 12:41:53', '2021-03-05 15:03:11'),
(368, 119, 252300, '2021-03-01 05:00:00', 136663534, 383, 2, '2021-02-23 15:35:54', '2021-03-05 15:03:11'),
(369, 107, 547700, '2021-03-01 05:00:00', 219624, 383, 2, '2021-02-23 15:35:54', '2021-03-05 15:03:11'),
(370, 119, 252300, '2021-03-01 05:00:00', 136666174, 384, 2, '2021-02-23 15:40:11', '2021-03-05 15:03:11'),
(371, 107, 147700, '2021-03-01 05:00:00', 219628, 384, 2, '2021-02-23 15:40:11', '2021-03-05 15:03:11'),
(372, 263, 490000, '2021-04-01 05:00:00', 232696, 385, 1, '2021-03-05 19:37:00', '2021-03-06 13:40:04'),
(373, 107, 3000000, '2021-04-01 05:00:00', 232995, 386, 1, '2021-03-05 23:50:10', '2021-03-06 14:23:34'),
(374, 263, 450000, '2021-04-01 05:00:00', 233510, 385, 1, '2021-03-06 13:40:04', '2021-03-15 10:10:07'),
(375, 107, 3100000, '2021-04-01 05:00:00', 233551, 387, 1, '2021-03-06 14:23:35', '2021-03-08 18:48:58'),
(376, 107, 500000, '2021-04-01 05:00:00', 235553, 389, 1, '2021-03-08 18:48:58', '2021-03-11 01:10:01'),
(377, 266, 1100000, '2021-04-01 05:00:00', 238626, 392, 1, '2021-03-11 13:30:50', '2021-03-11 14:17:56'),
(378, 266, 800000, '2021-04-01 05:00:00', 238671, 393, 2, '2021-03-11 14:18:00', '2021-04-01 05:04:25'),
(379, 270, 500000, '2021-04-01 05:00:00', 239737, 394, 1, '2021-03-12 13:57:36', '2021-03-12 17:05:57'),
(380, 270, 5000, '2021-04-01 05:00:00', 239930, 395, 1, '2021-03-12 17:05:57', '2021-03-13 10:45:49'),
(381, 270, 300000, '2021-04-01 05:00:00', 240529, 396, 1, '2021-03-13 10:45:50', '2021-03-19 12:10:03'),
(382, 263, 310000, '2021-04-01 05:00:00', 241899, 385, 1, '2021-03-15 10:10:07', '2021-03-17 02:20:10'),
(383, 188, 33748, '2021-04-01 05:00:00', 242512, 397, 1, '2021-03-15 19:08:54', '2021-03-16 11:23:28'),
(384, 288, 8965752, '2021-04-01 05:00:00', 242513, 397, 1, '2021-03-15 19:08:55', '2021-03-16 12:23:12'),
(385, 288, 7600000, '2021-04-01 05:00:00', 243228, 397, 1, '2021-03-16 12:26:46', '2021-03-22 11:51:16'),
(386, 263, 250000, '2021-04-01 05:00:00', 243982, 385, 1, '2021-03-17 02:20:10', '2021-04-01 00:20:10'),
(387, 295, 9200000, '2021-04-01 05:00:00', 245317, 401, 1, '2021-03-18 12:02:43', '2021-03-18 12:22:29'),
(388, 295, 8610000, '2021-04-01 05:00:00', 245335, 401, 1, '2021-03-18 12:22:29', '2021-03-18 12:27:53'),
(389, 295, 8020000, '2021-04-01 05:00:00', 245341, 401, 1, '2021-03-18 12:27:53', '2021-03-18 16:32:12'),
(390, 296, 46880000, '2021-04-01 05:00:00', 245709, 402, 1, '2021-03-18 16:32:12', '2021-03-18 16:43:37'),
(391, 296, 1180000, '2021-04-01 05:00:00', 245721, 403, 1, '2021-03-18 16:43:37', '2021-03-19 05:10:01'),
(392, 207, 595000, '2021-04-01 05:00:00', 247625, 406, 2, '2021-03-19 22:23:16', '2021-04-01 05:04:25'),
(393, 157, 405000, '2021-04-01 05:00:00', 247626, 406, 2, '2021-03-19 22:23:16', '2021-04-01 05:04:25'),
(394, 270, 105150700, '2021-04-01 05:00:00', 247850, 407, 1, '2021-03-20 09:30:12', '2021-03-20 10:10:03'),
(395, 188, 0, '2021-04-01 05:00:00', 0, 409, 1, '2021-03-22 11:51:16', '2021-03-23 17:40:04'),
(396, 288, 2800000, '2021-04-01 05:00:00', 249512, 409, 1, '2021-03-22 11:51:16', '2021-03-23 17:40:04'),
(397, 261, 10100000, '2021-04-01 05:00:00', 0, 410, 1, '2021-03-23 10:24:56', '2021-03-23 22:40:05'),
(398, 278, 10000000, '2021-04-01 05:00:00', 284590, 413, 1, '2021-03-29 20:57:56', '2021-03-30 13:56:40'),
(399, 278, 3800000, '2021-04-01 05:00:00', 287652, 413, 2, '2021-03-30 13:56:40', '2021-04-01 05:04:25'),
(400, 107, 19300000, '2021-05-01 05:00:00', 307494, 415, 1, '2021-04-02 16:38:18', '2021-04-09 12:10:01'),
(401, 314, 2000000, '2021-05-01 05:00:00', 349721, 416, 1, '2021-04-07 12:43:20', '2021-04-08 16:57:11'),
(402, 321, 50000000, '2021-05-01 05:00:00', 350556, 417, 1, '2021-04-07 14:21:55', '2021-04-09 16:40:11'),
(403, 295, 800000, '2021-05-01 05:00:00', 360465, 418, 1, '2021-04-08 17:59:35', '2021-04-21 11:50:05'),
(404, 278, 7800677, '2021-05-01 05:00:00', 362706, 419, 1, '2021-04-08 22:50:20', '2021-04-09 22:10:11'),
(405, 279, 582923, '2021-05-01 05:00:00', 173420976, 419, 1, '2021-04-08 22:50:20', '2021-04-12 14:10:12'),
(406, 111, 77200000, '2021-05-01 05:00:00', 366253, 421, 1, '2021-04-09 13:02:27', '2021-04-09 14:37:23'),
(407, 111, 105000000, '2021-05-01 05:00:00', 366929, 422, 1, '2021-04-09 14:37:23', '2021-04-10 11:07:12'),
(408, 321, 37000000, '2021-05-01 05:00:00', 367874, 417, 1, '2021-04-09 16:40:11', '2021-04-10 23:38:13'),
(409, 278, 5800677, '2021-05-01 05:00:00', 370722, 419, 1, '2021-04-09 22:10:11', '2021-04-12 14:20:11'),
(410, 327, 1488520, '2021-05-01 05:00:00', 371464, 423, 1, '2021-04-10 00:32:45', '2021-04-12 21:10:11'),
(411, 111, 30600000, '2021-05-01 05:00:00', 373341, 426, 1, '2021-04-10 11:07:12', '2021-04-11 12:49:26'),
(412, 266, 85000000, '2021-05-01 05:00:00', 377632, 428, 1, '2021-04-10 20:08:48', '2021-04-10 22:30:12'),
(413, 266, 55108000, '2021-05-01 05:00:00', 378555, 428, 1, '2021-04-10 22:30:12', '2021-04-11 11:40:05'),
(414, 321, 50000000, '2021-05-01 05:00:00', 378898, 429, 1, '2021-04-10 23:38:13', '2021-04-11 17:00:13'),
(415, 111, 29065000, '2021-05-01 05:00:00', 380790, 426, 1, '2021-04-11 12:49:26', '2021-04-12 12:49:58'),
(416, 325, 50000000, '2021-05-01 05:00:00', 381556, 432, 1, '2021-04-11 15:02:16', '2021-04-14 19:24:46'),
(417, 321, 46182000, '2021-05-01 05:00:00', 382268, 429, 1, '2021-04-11 17:00:13', '2021-04-13 13:30:12'),
(418, 314, 2200000, '2021-05-01 05:00:00', 383149, 433, 1, '2021-04-11 19:22:59', '2021-04-11 19:58:48'),
(419, 314, 1500000, '2021-05-01 05:00:00', 383322, 434, 1, '2021-04-11 19:58:48', '2021-04-11 21:39:49'),
(420, 314, 5700000, '2021-05-01 05:00:00', 383913, 435, 1, '2021-04-11 21:39:49', '2021-04-11 23:50:11'),
(421, 314, 100000, '2021-05-01 05:00:00', 386589, 439, 1, '2021-04-12 11:04:21', '2021-04-12 11:43:14'),
(422, 314, 10000000, '2021-05-01 05:00:00', 386885, 440, 1, '2021-04-12 11:43:15', '2021-04-12 12:40:10'),
(423, 111, 20665000, '2021-05-01 05:00:00', 387430, 426, 1, '2021-04-12 12:49:58', '2021-04-12 15:00:30'),
(424, 314, 7200000, '2021-05-01 05:00:00', 387696, 442, 1, '2021-04-12 13:24:38', '2021-04-12 18:14:10'),
(425, 278, 2750677, '2021-05-01 05:00:00', 388095, 419, 1, '2021-04-12 14:20:11', '2021-04-12 14:26:58'),
(426, 278, 23050000, '2021-05-01 05:00:00', 388150, 443, 1, '2021-04-12 14:27:01', '2021-04-12 22:40:12'),
(427, 111, 23600000, '2021-05-01 05:00:00', 388377, 444, 1, '2021-04-12 15:00:30', '2021-04-16 14:20:18'),
(428, 314, 5770000, '2021-05-01 05:00:00', 389667, 442, 1, '2021-04-12 18:14:10', '2021-04-13 00:00:14'),
(429, 327, 34463, '2021-05-01 05:00:00', 390964, 423, 1, '2021-04-12 21:10:11', '2021-04-18 20:13:24'),
(430, 278, 6550000, '2021-05-01 05:00:00', 391457, 443, 1, '2021-04-12 22:40:12', '2021-04-16 21:30:13'),
(431, 314, 4070000, '2021-05-01 05:00:00', 391714, 442, 1, '2021-04-13 00:00:14', '2021-04-13 11:40:03'),
(432, 192, 306800, '2021-05-01 05:00:00', 394159, 449, 1, '2021-04-13 11:40:19', '2021-04-14 11:10:12'),
(433, 314, 4693200, '2021-05-01 05:00:00', 394160, 449, 1, '2021-04-13 11:40:19', '2021-04-14 11:10:12'),
(434, 321, 41582000, '2021-05-01 05:00:00', 395106, 429, 1, '2021-04-13 13:30:12', '2021-04-15 13:10:11'),
(435, 314, 13700000, '2021-05-01 05:00:00', 404342, 452, 1, '2021-04-14 17:07:37', '2021-04-14 20:40:12'),
(436, 325, 48800000, '2021-05-01 05:00:00', 405546, 432, 1, '2021-04-14 19:24:46', '2021-04-14 19:46:01'),
(437, 325, 45500000, '2021-05-01 05:00:00', 405708, 432, 1, '2021-04-14 19:46:01', '2021-04-14 20:47:23'),
(438, 192, 306800, '2021-05-01 05:00:00', 406137, 453, 1, '2021-04-14 20:40:12', '2021-04-15 15:11:24'),
(439, 314, 5793200, '2021-05-01 05:00:00', 406138, 453, 1, '2021-04-14 20:40:12', '2021-04-15 15:11:24'),
(440, 325, 43700000, '2021-05-01 05:00:00', 406192, 432, 0, '2021-04-14 20:47:23', '2021-04-14 20:47:23'),
(441, 321, 55100000, '2021-05-01 05:00:00', 410620, 456, 1, '2021-04-15 14:07:35', '2021-04-16 16:07:54'),
(442, 135, 5913466, '2021-05-01 05:00:00', 0, 457, 1, '2021-04-15 15:11:25', '2021-04-16 13:40:11'),
(443, 192, 0, '2021-05-01 05:00:00', 0, 457, 1, '2021-04-15 15:11:25', '2021-04-16 13:40:11'),
(444, 314, 4086534, '2021-05-01 05:00:00', 411153, 457, 1, '2021-04-15 15:11:25', '2021-04-16 13:40:11'),
(445, 111, 20500000, '2021-05-01 05:00:00', 419398, 444, 1, '2021-04-16 14:20:18', '2021-04-17 23:59:43'),
(446, 321, 60000000, '2021-05-01 05:00:00', 420279, 459, 1, '2021-04-16 16:07:54', '2021-04-19 13:45:07'),
(447, 278, 4490000, '2021-05-01 05:00:00', 423179, 443, 1, '2021-04-16 21:30:13', '2021-04-16 21:41:25'),
(448, 278, 677, '2021-05-01 05:00:00', 423256, 460, 0, '2021-04-16 21:41:29', '2021-04-16 21:41:30'),
(449, 279, 12059323, '2021-05-01 05:00:00', 180096321, 460, 0, '2021-04-16 21:41:29', '2021-04-16 21:41:30'),
(450, 111, 5410000, '2021-05-01 05:00:00', 432153, 463, 1, '2021-04-18 00:33:01', '2021-04-19 10:55:50'),
(451, 313, 94500, '2021-05-01 05:00:00', 437042, 464, 1, '2021-04-18 20:57:29', '2021-04-20 22:10:11'),
(452, 111, 124500000, '2021-05-01 05:00:00', 440197, 466, 1, '2021-04-19 10:55:51', '2021-04-22 01:30:52'),
(453, 321, 59205000, '2021-05-01 05:00:00', 441593, 459, 0, '2021-04-19 13:45:08', '2021-04-19 13:45:08'),
(454, 327, 7223000, '2021-05-01 05:00:00', 448284, 468, 0, '2021-04-20 10:40:41', '2021-04-20 10:40:41'),
(455, 111, 37700000, '2021-05-01 05:00:00', 463505, 471, 1, '2021-04-22 01:31:08', '2021-04-22 10:48:33'),
(456, 111, 31220000, '2021-05-01 05:00:00', 465692, 471, 0, '2021-04-22 10:48:33', '2021-04-22 10:48:33');

-- --------------------------------------------------------

--
-- Структура таблицы `cashback_history`
--

CREATE TABLE `cashback_history` (
  `id` int UNSIGNED NOT NULL,
  `multicard_id` int UNSIGNED DEFAULT NULL,
  `transaction_id` int UNSIGNED DEFAULT NULL,
  `partner_id` int UNSIGNED DEFAULT NULL,
  `location_id` int UNSIGNED DEFAULT NULL,
  `terminal_id` varchar(10) DEFAULT NULL,
  `cashback_percent` int DEFAULT NULL,
  `cashback_percent_interest` int DEFAULT NULL,
  `cashback_amount` int DEFAULT NULL,
  `cashback_amount_interest` int DEFAULT NULL,
  `ox_transaction_id` varchar(255) DEFAULT NULL,
  `ox_details` mediumtext,
  `casback_accrued` int NOT NULL DEFAULT '0' COMMENT 'кешбэк зачислен'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cashback_history`
--

INSERT INTO `cashback_history` (`id`, `multicard_id`, `transaction_id`, `partner_id`, `location_id`, `terminal_id`, `cashback_percent`, `cashback_percent_interest`, `cashback_amount`, `cashback_amount_interest`, `ox_transaction_id`, `ox_details`, `casback_accrued`) VALUES
(15, 668, 56346, 195, 284, '01116377', 10, 2, 2391360, 597840, '3', '[{\"product\":\"new Variation\",\"qty\":\"1.00\",\"price\":29892000,\"total_price\":29892000,\"cashback_amount\":2391360}]', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `cashback_monthly_funding`
--

CREATE TABLE `cashback_monthly_funding` (
  `id` int UNSIGNED NOT NULL,
  `multicard_id` int UNSIGNED DEFAULT NULL,
  `transaction_id` int UNSIGNED DEFAULT NULL,
  `month` date DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ежемесячные начисления кешбэка';

-- --------------------------------------------------------

--
-- Структура таблицы `credit_limit_history`
--

CREATE TABLE `credit_limit_history` (
  `id` int UNSIGNED NOT NULL,
  `multicard_id` int UNSIGNED NOT NULL,
  `credit_limit` int NOT NULL,
  `aproved` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - not aproved yet, 1 - aproved, 2 - canceled',
  `init` enum('manual','sync') DEFAULT 'manual',
  `humo_accrual_payment_id` int DEFAULT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `credit_limit_history`
--

INSERT INTO `credit_limit_history` (`id`, `multicard_id`, `credit_limit`, `aproved`, `init`, `humo_accrual_payment_id`, `added_on`, `updated_on`) VALUES
(112, 166, 200000, 1, 'manual', NULL, '2020-09-18 18:16:43', '2020-09-18 18:36:25'),
(133, 166, 4600000, 1, 'manual', NULL, '2020-09-18 18:54:14', '2020-09-18 22:25:17'),
(134, 166, 0, 1, 'manual', NULL, '2020-09-18 22:46:25', '2020-09-18 23:04:46'),
(135, 166, 12500000, 0, 'manual', NULL, '2020-09-18 23:09:00', '0000-00-00 00:00:00'),
(136, 166, 12500000, 1, 'manual', NULL, '2020-09-18 23:09:00', '2020-09-18 23:35:37'),
(137, 166, 0, 1, 'manual', NULL, '2020-09-18 23:39:21', '2020-09-19 09:02:15'),
(138, 166, 5400000, 1, 'manual', NULL, '2020-09-22 22:54:07', '2020-09-22 23:08:52'),
(139, 166, 0, 1, 'manual', NULL, '2020-09-23 20:00:28', '2020-09-23 20:49:09'),
(140, 166, 34160000, 1, 'manual', NULL, '2020-09-23 20:50:11', '2020-09-23 22:04:22'),
(141, 166, 26160000, 1, 'manual', NULL, '2020-09-23 22:15:08', '2020-09-23 22:44:49'),
(142, 166, 0, 1, 'manual', NULL, '2020-09-24 00:04:32', '2020-09-24 10:29:21'),
(144, 166, 3060000, 1, 'manual', NULL, '2020-09-24 10:30:08', '2020-09-24 17:42:57'),
(145, 166, 0, 1, 'manual', NULL, '2020-09-24 23:21:44', '2020-09-24 23:34:58'),
(146, 166, 60000, 1, 'manual', NULL, '2020-09-24 23:38:14', '2020-09-25 17:36:24'),
(147, 166, 65000, 1, 'manual', NULL, '2020-09-25 17:37:00', '2020-09-25 18:09:36'),
(148, 166, 70000, 1, 'manual', NULL, '2020-09-25 18:17:37', '2020-09-25 18:38:27'),
(149, 166, 0, 1, 'manual', NULL, '2020-09-25 19:26:58', '2020-09-26 09:28:39'),
(151, 166, 100000, 1, 'manual', NULL, '2020-09-26 09:30:02', '2020-09-26 10:24:58'),
(152, 166, 760000, 1, 'manual', NULL, '2020-09-26 13:02:10', '2020-09-26 13:05:41'),
(153, 166, 160000, 1, 'manual', NULL, '2020-09-26 23:14:56', '2020-09-27 22:59:05'),
(154, 166, 260000, 1, 'manual', NULL, '2020-09-27 23:03:25', '2020-09-28 12:24:17'),
(155, 166, 460000, 1, 'manual', NULL, '2020-09-29 02:21:34', '2020-09-29 07:56:59'),
(156, 166, 0, 1, 'manual', NULL, '2020-09-29 07:57:13', '2020-09-29 23:49:57'),
(157, 166, 10000, 1, 'manual', NULL, '2020-09-30 00:03:28', '2020-09-30 11:59:10'),
(158, 166, 1660000, 1, 'manual', NULL, '2020-09-30 12:00:06', '2020-09-30 19:25:25'),
(159, 166, 0, 1, 'manual', NULL, '2020-09-30 19:25:45', '2020-09-30 20:05:21'),
(160, 166, 260000, 1, 'manual', NULL, '2020-09-30 20:05:59', '2020-10-01 13:35:29'),
(161, 166, 12360000, 1, 'manual', NULL, '2020-10-01 13:35:41', '2020-10-01 14:29:42'),
(162, 166, 1960000, 1, 'manual', NULL, '2020-10-01 14:30:06', '2020-10-01 17:33:30'),
(163, 166, 10000, 1, 'manual', NULL, '2020-10-01 17:34:12', '2020-10-02 11:58:16'),
(167, 166, 0, 0, 'manual', NULL, '2020-10-07 14:58:28', '0000-00-00 00:00:00'),
(168, 166, 0, 1, 'manual', NULL, '2020-10-07 14:58:28', '2020-10-07 19:53:18'),
(177, 166, 2660000, 1, 'manual', NULL, '2020-10-18 11:02:10', '2020-10-18 11:03:23'),
(178, 166, 0, 1, 'manual', NULL, '2020-10-26 17:06:17', '2020-10-26 18:25:12'),
(179, 166, 50000, 1, 'manual', NULL, '2020-11-01 23:06:26', '2020-11-01 23:39:07'),
(180, 166, 8160000, 1, 'manual', NULL, '2020-11-01 23:50:44', '2020-11-02 07:37:57'),
(181, 166, 7560000, 1, 'manual', NULL, '2020-11-02 07:38:48', '2020-11-02 08:43:57'),
(182, 166, 6860600, 1, 'manual', NULL, '2020-11-02 08:44:21', '2020-11-02 09:10:47'),
(183, 166, 6960600, 1, 'manual', NULL, '2020-11-02 22:44:28', '2020-11-02 23:23:05'),
(184, 166, 7060600, 1, 'manual', NULL, '2020-11-02 23:24:42', '2020-11-03 00:16:52'),
(185, 166, 6760600, 1, 'manual', NULL, '2020-11-03 00:22:56', '2020-11-03 10:00:56'),
(186, 166, 6260600, 1, 'manual', NULL, '2020-11-03 10:01:20', '2020-11-03 10:10:16'),
(187, 166, 5549000, 1, 'manual', NULL, '2020-11-03 10:11:00', '2020-11-03 10:37:35'),
(188, 166, 4831600, 1, 'manual', NULL, '2020-11-03 10:38:30', '2020-11-03 11:06:47'),
(189, 166, 4109000, 1, 'manual', NULL, '2020-11-03 11:07:06', '2020-11-03 12:56:04'),
(190, 166, 3381900, 1, 'manual', NULL, '2020-11-03 12:58:48', '2020-11-03 14:32:54'),
(191, 166, 60000, 1, 'manual', NULL, '2020-11-03 14:35:55', '2020-11-03 14:37:23'),
(192, 166, 260000, 1, 'manual', NULL, '2020-11-03 14:39:38', '2020-11-03 14:41:53'),
(193, 166, 878100, 1, 'manual', NULL, '2020-11-03 14:50:02', '2020-11-03 14:51:02'),
(194, 166, 0, 1, 'manual', NULL, '2020-11-03 14:52:10', '2020-11-03 14:53:10'),
(195, 166, 10000, 1, 'manual', NULL, '2020-11-03 23:22:31', '2020-11-03 23:23:43'),
(196, 166, 60000, 1, 'manual', NULL, '2020-11-03 23:24:05', '2020-11-03 23:25:33'),
(197, 166, 160000, 1, 'manual', NULL, '2020-11-03 23:26:48', '2020-11-03 23:29:06'),
(198, 166, 60000, 1, 'manual', NULL, '2020-11-03 23:29:41', '2020-11-03 23:31:05'),
(199, 166, 160000, 1, 'manual', NULL, '2020-11-03 23:35:58', '2020-11-03 23:40:47'),
(200, 166, 60000, 1, 'manual', NULL, '2020-11-03 23:41:33', '2020-11-03 23:45:53'),
(201, 166, 160000, 1, 'manual', NULL, '2020-11-03 23:46:10', '2020-11-03 23:47:52'),
(202, 166, 60000, 1, 'manual', NULL, '2020-11-03 23:49:37', '2020-11-03 23:50:39'),
(203, 166, 160000, 1, 'manual', NULL, '2020-11-03 23:53:42', '2020-11-03 23:54:54'),
(204, 166, 60000, 1, 'manual', NULL, '2020-11-03 23:55:05', '2020-11-03 23:57:10'),
(205, 166, 150000, 1, 'manual', NULL, '2020-11-03 23:57:25', '2020-11-03 23:59:32'),
(206, 166, 140000, 1, 'manual', NULL, '2020-11-03 23:59:51', '2020-11-04 00:01:10'),
(207, 166, 150000, 1, 'manual', NULL, '2020-11-04 00:01:46', '2020-11-04 00:02:58'),
(208, 166, 250000, 1, 'manual', NULL, '2020-11-04 00:03:10', '2020-11-04 00:04:29'),
(209, 166, 240000, 1, 'manual', NULL, '2020-11-04 00:04:42', '2020-11-04 00:05:45'),
(210, 166, 140000, 1, 'manual', NULL, '2020-11-04 00:05:57', '2020-11-04 00:07:07'),
(211, 166, 240000, 1, 'manual', NULL, '2020-11-04 00:08:38', '2020-11-04 00:09:51'),
(212, 166, 250000, 1, 'manual', NULL, '2020-11-04 00:11:44', '2020-11-04 00:12:46'),
(213, 166, 150000, 1, 'manual', NULL, '2020-11-04 00:14:20', '2020-11-04 00:15:25'),
(214, 166, 250000, 1, 'manual', NULL, '2020-11-04 00:15:39', '2020-11-04 00:16:41'),
(215, 166, 150000, 1, 'manual', NULL, '2020-11-04 00:17:04', '2020-11-04 00:18:09'),
(216, 166, 150000, 1, 'manual', NULL, '2020-11-04 00:19:10', '2020-11-04 00:20:40'),
(217, 166, 250000, 1, 'manual', NULL, '2020-11-04 00:21:41', '2020-11-04 00:23:00'),
(218, 166, 258000, 1, 'manual', NULL, '2020-11-04 00:23:35', '2020-11-04 00:24:52'),
(219, 166, 259000, 1, 'manual', NULL, '2020-11-04 00:25:34', '2020-11-04 00:26:48'),
(220, 166, 259900, 1, 'manual', NULL, '2020-11-04 00:27:03', '2020-11-04 00:28:09'),
(221, 166, 148800, 1, 'manual', NULL, '2020-11-04 00:29:30', '2020-11-04 00:30:30'),
(222, 166, 148700, 1, 'manual', NULL, '2020-11-04 00:30:42', '2020-11-04 00:31:42'),
(223, 166, 148700, 1, 'manual', NULL, '2020-11-04 00:34:06', '2020-11-04 00:35:06'),
(224, 166, 148700, 1, 'manual', NULL, '2020-11-04 00:35:15', '2020-11-04 00:38:54'),
(225, 166, 148800, 1, 'manual', NULL, '2020-11-04 00:40:29', '2020-11-04 00:41:33'),
(226, 166, 148900, 1, 'manual', NULL, '2020-11-04 00:42:42', '2020-11-04 00:43:50'),
(227, 166, 149900, 1, 'manual', NULL, '2020-11-04 00:47:08', '2020-11-04 00:48:08'),
(228, 166, 149900, 1, 'manual', NULL, '2020-11-04 00:49:28', '2020-11-04 00:50:34'),
(229, 166, 149800, 1, 'manual', NULL, '2020-11-04 00:50:48', '2020-11-04 00:51:52'),
(230, 166, 149900, 1, 'manual', NULL, '2020-11-04 00:52:14', '2020-11-04 00:53:27'),
(231, 166, 149900, 1, 'manual', NULL, '2020-11-04 00:54:25', '2020-11-04 00:55:34'),
(232, 166, 43060000, 1, 'manual', NULL, '2020-11-04 01:04:02', '2020-11-04 01:05:15'),
(233, 166, 43160000, 1, 'manual', NULL, '2020-11-04 01:06:55', '2020-11-04 01:08:03'),
(234, 166, 43160000, 1, 'manual', NULL, '2020-11-04 01:08:18', '2020-11-04 01:09:19'),
(235, 166, 0, 1, 'manual', NULL, '2020-11-04 01:09:42', '2020-11-04 01:10:49'),
(236, 166, 0, 1, 'manual', NULL, '2020-11-04 01:10:54', '2020-11-04 01:12:01'),
(237, 166, 27060000, 1, 'manual', NULL, '2020-11-04 09:18:16', '2020-11-04 09:19:53'),
(238, 166, 0, 1, 'manual', NULL, '2020-11-04 09:20:41', '2020-11-04 09:22:19'),
(239, 166, 68260000, 1, 'manual', NULL, '2020-11-04 09:22:37', '2020-11-04 09:23:44'),
(240, 166, 32360000, 1, 'manual', NULL, '2020-11-04 09:24:17', '2020-11-04 09:25:25'),
(241, 166, 0, 1, 'manual', NULL, '2020-11-04 09:26:26', '2020-11-04 09:27:34'),
(242, 166, 17860000, 1, 'manual', NULL, '2020-11-04 09:27:50', '2020-11-04 09:29:05'),
(243, 166, 17960000, 1, 'manual', NULL, '2020-11-04 09:30:08', '2020-11-04 09:31:28'),
(244, 166, 16960000, 1, 'manual', NULL, '2020-11-04 09:34:02', '2020-11-04 09:35:02'),
(245, 166, 15860000, 1, 'manual', NULL, '2020-11-04 09:35:15', '2020-11-04 09:36:31'),
(246, 166, 32360000, 1, 'manual', NULL, '2020-11-04 09:36:40', '2020-11-04 09:37:41'),
(247, 166, 21760000, 1, 'manual', NULL, '2020-11-04 09:38:26', '2020-11-04 09:39:37'),
(248, 166, 0, 1, 'manual', NULL, '2020-11-04 09:40:21', '2020-11-04 09:41:28'),
(249, 166, 10000, 1, 'manual', NULL, '2020-11-04 09:41:53', '2020-11-04 09:44:33'),
(250, 166, 27060000, 1, 'manual', NULL, '2020-11-04 09:48:06', '2020-11-04 09:49:23'),
(251, 166, 29260000, 1, 'manual', NULL, '2020-11-04 09:50:05', '2020-11-04 09:51:52'),
(252, 166, 57560000, 1, 'manual', NULL, '2020-11-04 09:55:36', '2020-11-04 09:56:59'),
(253, 166, 21760000, 1, 'manual', NULL, '2020-11-04 09:58:05', '2020-11-04 09:59:05'),
(254, 166, 29260000, 1, 'manual', NULL, '2020-11-04 09:59:47', '2020-11-04 10:00:48'),
(255, 166, 0, 1, 'manual', NULL, '2020-11-04 10:01:10', '2020-11-04 10:02:41'),
(256, 166, 61260000, 1, 'manual', NULL, '2020-11-04 13:55:39', '2020-11-04 13:56:40'),
(257, 166, 11260000, 1, 'manual', NULL, '2020-11-04 13:57:38', '2020-11-04 13:58:53'),
(258, 166, 12260000, 1, 'manual', NULL, '2020-11-04 13:59:12', '2020-11-04 14:00:15'),
(259, 166, 172160000, 1, 'manual', NULL, '2020-11-04 14:00:37', '2020-11-04 14:01:56'),
(260, 166, 111160000, 1, 'manual', NULL, '2020-11-04 22:12:32', '2020-11-04 22:14:11'),
(261, 166, 271360000, 1, 'manual', NULL, '2020-11-04 22:15:32', '2020-11-04 22:17:19'),
(262, 166, 281360000, 1, 'manual', NULL, '2020-11-04 22:23:51', '2020-11-04 22:25:17'),
(263, 166, 0, 1, 'manual', NULL, '2020-11-04 22:30:27', '2020-11-04 22:31:39'),
(264, 166, 781260000, 1, 'manual', NULL, '2020-11-04 22:32:00', '2020-11-04 22:33:03'),
(265, 166, 123360000, 1, 'manual', NULL, '2020-11-04 22:37:25', '2020-11-04 22:38:56'),
(266, 166, 7260000, 1, 'manual', NULL, '2020-11-04 22:40:04', '2020-11-04 22:41:39'),
(267, 166, 672860000, 1, 'manual', NULL, '2020-11-04 22:50:04', '2020-11-04 22:52:09'),
(268, 166, 251460000, 1, 'manual', NULL, '2020-11-04 22:52:28', '2020-11-04 22:53:33'),
(269, 166, 413960000, 1, 'manual', NULL, '2020-11-04 22:53:57', '2020-11-04 22:55:07'),
(270, 166, 119460000, 1, 'manual', NULL, '2020-11-04 22:59:10', '2020-11-04 23:00:20'),
(271, 166, 260760000, 1, 'manual', NULL, '2020-11-04 23:00:29', '2020-11-04 23:02:47'),
(272, 166, 160000, 1, 'manual', NULL, '2020-11-05 00:01:54', '2020-11-05 00:02:55'),
(273, 166, 846760000, 1, 'manual', NULL, '2020-11-05 00:03:08', '2020-11-05 00:04:57'),
(274, 166, 225360000, 1, 'manual', NULL, '2020-11-05 09:36:16', '2020-11-05 09:37:16'),
(275, 166, 752060000, 1, 'manual', NULL, '2020-11-05 19:46:37', '2020-11-05 19:48:00'),
(276, 166, 132560000, 1, 'manual', NULL, '2020-11-07 17:08:04', '2020-11-07 18:11:15'),
(277, 166, 0, 1, 'manual', NULL, '2020-11-14 06:22:00', '2020-11-14 06:23:03'),
(278, 166, 11260000, 1, 'manual', NULL, '2020-11-14 06:24:18', '2020-11-14 06:29:32'),
(279, 166, 0, 1, 'manual', NULL, '2020-11-14 06:30:03', '2020-11-14 06:32:17'),
(280, 166, 0, 1, 'manual', NULL, '2020-11-18 19:17:22', '2020-11-18 19:18:23'),
(281, 166, 275400, 1, 'manual', NULL, '2020-11-20 16:53:32', '2020-11-20 17:10:03'),
(282, 166, 27299600, 1, 'manual', NULL, '2020-11-23 16:51:45', '2020-11-23 18:30:04'),
(283, 166, 214060, 1, 'manual', NULL, '2020-11-24 19:09:45', '2020-11-24 19:51:29'),
(284, 166, 28614060, 1, 'manual', NULL, '2020-11-24 20:12:34', '2020-11-24 20:40:03'),
(285, 166, 0, 1, 'manual', NULL, '2020-11-25 22:31:11', '2020-11-25 23:10:02'),
(286, 166, 614060, 1, 'manual', NULL, '2020-11-26 20:34:37', '2020-11-26 20:47:44'),
(291, 166, 0, 1, 'manual', NULL, '2020-11-26 20:50:43', '2020-11-26 21:39:55'),
(293, 166, 2814060, 1, 'manual', NULL, '2020-11-26 21:40:48', '2020-11-26 22:10:02'),
(294, 166, 1514060, 1, 'manual', NULL, '2020-11-27 13:25:47', '2020-11-27 13:40:02'),
(295, 166, 2214060, 1, 'manual', NULL, '2020-12-01 07:46:44', '2020-12-01 08:10:02'),
(296, 166, 5114060, 1, 'manual', NULL, '2020-12-01 20:16:19', '2020-12-01 20:36:01'),
(297, 166, 714060, 1, 'manual', NULL, '2020-12-01 20:36:22', '2020-12-01 21:10:03'),
(298, 166, 3214060, 1, 'manual', NULL, '2020-12-01 21:19:41', '2020-12-01 21:40:04'),
(299, 166, 5814060, 1, 'manual', NULL, '2020-12-01 22:58:25', '2020-12-01 23:06:46'),
(300, 166, 8214060, 1, 'manual', NULL, '2020-12-01 23:07:04', '2020-12-01 23:40:04'),
(301, 166, 2714060, 1, 'manual', NULL, '2020-12-03 15:18:09', '2020-12-03 15:40:03'),
(302, 166, 100000, 1, 'manual', NULL, '2020-12-03 22:46:44', '2020-12-03 23:10:02'),
(303, 166, 2600000, 1, 'manual', NULL, '2020-12-04 02:23:48', '2020-12-04 05:10:02'),
(304, 166, 600000, 1, 'manual', NULL, '2020-12-04 10:31:19', '2020-12-04 10:40:02'),
(305, 166, 700000, 1, 'manual', NULL, '2020-12-04 15:07:47', '2020-12-04 15:40:04'),
(306, 166, 2300000, 1, 'manual', NULL, '2020-12-06 16:27:25', '2020-12-06 16:40:02'),
(307, 166, 700000, 1, 'manual', NULL, '2020-12-06 17:52:59', '2020-12-06 18:10:01'),
(308, 166, 3200000, 1, 'manual', NULL, '2020-12-06 20:17:12', '2020-12-06 20:40:03'),
(309, 166, 9100000, 1, 'manual', NULL, '2020-12-06 23:53:58', '2020-12-07 05:10:01'),
(310, 166, 2500000, 1, 'manual', NULL, '2020-12-07 09:22:31', '2020-12-07 09:40:02'),
(311, 166, 0, 1, 'manual', NULL, '2020-12-07 13:20:23', '2020-12-07 20:06:13'),
(315, 166, 3000000, 1, 'manual', NULL, '2020-12-09 22:00:15', '2020-12-09 22:20:40'),
(316, 166, 0, 1, 'manual', NULL, '2020-12-10 08:59:56', '2020-12-10 09:27:10'),
(318, 333, 17700000, 1, 'manual', NULL, '2020-12-11 10:11:38', '2020-12-11 11:17:02'),
(319, 333, 10500000, 1, 'manual', NULL, '2020-12-11 11:24:42', '2020-12-11 13:30:21'),
(320, 333, 0, 1, 'manual', NULL, '2020-12-11 13:30:33', '2020-12-11 13:46:47'),
(321, 166, 3000000, 1, 'manual', NULL, '2020-12-16 12:35:32', '2020-12-16 13:07:20'),
(322, 333, 10037700, 1, 'manual', NULL, '2020-12-16 12:36:12', '2020-12-16 13:14:21'),
(323, 166, 0, 1, 'manual', NULL, '2020-12-16 13:38:27', '2020-12-17 01:10:01'),
(327, 166, 100000, 1, 'manual', NULL, '2020-12-18 10:37:44', '2020-12-18 11:08:05'),
(331, 333, 8037700, 1, 'sync', 95215029, '2020-12-18 17:03:05', '2020-12-18 17:10:03'),
(332, 166, 1800000, 1, 'manual', NULL, '2020-12-20 14:39:20', '2020-12-20 15:05:03'),
(333, 166, 7700000, 1, 'manual', NULL, '2020-12-20 23:21:24', '2020-12-21 01:10:01'),
(334, 333, 0, 1, 'manual', NULL, '2020-12-21 00:00:44', '2020-12-21 04:10:01'),
(335, 166, 0, 1, 'manual', NULL, '2020-12-21 11:08:33', '2020-12-21 12:19:02'),
(338, 166, 2500000, 1, 'manual', NULL, '2021-01-06 20:24:26', '2021-01-06 23:05:13'),
(339, 166, 3000000, 1, 'manual', NULL, '2021-01-07 13:37:28', '2021-01-07 16:56:33'),
(340, 166, 500000, 1, 'manual', NULL, '2021-01-09 15:24:43', '2021-01-09 15:35:55'),
(341, 166, 200000, 1, 'manual', NULL, '2021-01-09 16:18:12', '2021-01-09 16:39:19'),
(342, 166, 300000, 1, 'manual', NULL, '2021-01-10 13:45:00', '2021-01-10 14:04:58'),
(343, 166, 100000, 1, 'manual', NULL, '2021-01-10 14:05:31', '2021-01-10 16:45:56'),
(344, 166, 200000, 1, 'manual', NULL, '2021-01-10 16:51:04', '2021-01-11 01:10:01'),
(345, 166, 0, 1, 'manual', NULL, '2021-01-11 14:03:20', '2021-01-11 14:06:06'),
(346, 166, 295900000, 1, 'manual', NULL, '2021-01-12 18:28:54', '2021-01-12 23:33:05'),
(347, 166, 57400000, 1, 'manual', NULL, '2021-01-14 18:54:54', '2021-01-14 20:10:41'),
(350, 166, 0, 1, 'manual', NULL, '2021-01-18 13:52:35', '2021-01-18 14:43:35'),
(351, 166, 100000, 1, 'manual', NULL, '2021-01-23 22:08:50', '2021-01-23 22:45:02'),
(352, 166, 299900, 1, 'manual', NULL, '2021-01-26 15:37:06', '2021-01-26 17:10:16'),
(353, 166, 9000000, 1, 'manual', NULL, '2021-01-26 23:16:58', '2021-01-27 01:10:01'),
(354, 166, 14800000, 1, 'manual', NULL, '2021-01-27 15:35:26', '2021-01-27 15:58:10'),
(355, 425, 500000, 1, 'manual', NULL, '2021-01-28 17:31:54', '2021-01-29 01:10:02'),
(356, 166, 0, 1, 'manual', NULL, '2021-01-30 11:04:53', '2021-01-30 11:39:54'),
(357, 166, 69100000, 1, 'manual', NULL, '2021-02-02 17:46:56', '2021-02-02 18:18:34'),
(358, 166, 39600000, 1, 'sync', 121168380, '2021-02-03 01:10:02', '2021-02-03 05:10:02'),
(359, 166, 39599900, 1, 'sync', 121527643, '2021-02-03 15:14:11', '2021-02-03 15:40:01'),
(360, 166, 0, 1, 'manual', NULL, '2021-02-03 16:19:28', '2021-02-03 16:40:02'),
(361, 166, 99800, 1, 'manual', NULL, '2021-02-04 15:16:57', '2021-02-04 15:40:01'),
(362, 166, 3799900, 1, 'manual', NULL, '2021-02-10 15:06:10', '2021-02-10 15:10:20'),
(363, 166, 1099900, 1, 'manual', NULL, '2021-02-10 18:08:30', '2021-02-10 18:37:16'),
(364, 166, 499900, 1, 'manual', NULL, '2021-02-10 21:18:14', '2021-02-10 21:40:02'),
(365, 166, 1299900, 1, 'manual', NULL, '2021-02-10 23:16:53', '2021-02-10 23:40:02'),
(366, 333, 10200, 1, 'manual', NULL, '2021-02-11 00:53:18', '2021-02-11 05:20:04'),
(367, 166, 19399900, 1, 'manual', NULL, '2021-02-11 13:25:56', '2021-02-11 13:38:43'),
(368, 166, 34523900, 1, 'manual', NULL, '2021-02-11 14:10:38', '2021-02-11 14:40:02'),
(369, 166, 9723900, 1, 'manual', NULL, '2021-02-11 16:19:05', '2021-02-11 16:37:28'),
(370, 166, 10523900, 1, 'manual', NULL, '2021-02-11 17:12:15', '2021-02-11 17:40:01'),
(371, 166, 9723900, 1, 'manual', NULL, '2021-02-11 21:03:01', '2021-02-11 21:10:02'),
(372, 166, 0, 1, 'sync', 128340126, '2021-02-12 01:10:04', '2021-02-12 05:12:02'),
(374, 166, 8900000, 1, 'manual', NULL, '2021-02-12 23:19:23', '2021-02-12 23:38:42'),
(375, 166, 2600000, 1, 'manual', NULL, '2021-02-13 00:11:02', '2021-02-13 05:10:02'),
(376, 166, 250000, 1, 'manual', NULL, '2021-02-13 11:43:34', '2021-02-13 12:50:05'),
(378, 166, 255900, 1, 'manual', NULL, '2021-02-14 18:54:33', '2021-02-14 20:15:32'),
(379, 166, 2600000, 1, 'manual', NULL, '2021-02-17 21:33:44', '2021-02-17 21:37:44'),
(380, 166, 1200000, 1, 'manual', NULL, '2021-02-18 18:36:14', '2021-02-18 18:48:07'),
(381, 166, 0, 1, 'manual', NULL, '2021-02-19 23:21:57', '2021-02-19 23:49:26'),
(382, 166, 100000, 1, 'manual', NULL, '2021-02-21 12:41:53', '2021-02-22 01:10:01'),
(383, 166, 800000, 1, 'manual', NULL, '2021-02-23 15:35:55', '2021-02-23 15:38:52'),
(384, 166, 400000, 1, 'manual', NULL, '2021-02-23 15:40:12', '2021-02-23 16:41:19'),
(385, 598, 490000, 1, 'manual', NULL, '2021-03-05 19:37:00', '2021-03-05 19:57:41'),
(386, 166, 3000000, 1, 'manual', NULL, '2021-03-05 23:50:10', '2021-03-06 05:10:01'),
(387, 166, 3100000, 1, 'manual', NULL, '2021-03-06 14:23:35', '2021-03-06 19:50:36'),
(388, 598, 450000, 1, 'sync', 148495964, '2021-03-07 01:10:05', '2021-03-07 05:10:02'),
(389, 166, 500000, 1, 'manual', NULL, '2021-03-08 18:48:59', '2021-03-08 23:44:00'),
(390, 333, 0, 1, 'sync', 150571940, '2021-03-10 01:10:02', '2021-03-10 05:10:01'),
(391, 166, 0, 1, 'manual', NULL, '2021-03-10 23:30:11', '2021-03-11 01:10:01'),
(392, 668, 1100000, 1, 'manual', NULL, '2021-03-11 13:30:51', '2021-03-11 14:17:08'),
(393, 668, 800000, 1, 'manual', NULL, '2021-03-11 14:18:01', '2021-03-11 14:43:25'),
(394, 551, 500000, 1, 'manual', NULL, '2021-03-12 13:57:36', '2021-03-12 16:55:08'),
(395, 551, 5000, 1, 'manual', NULL, '2021-03-12 17:05:57', '2021-03-12 17:19:27'),
(396, 551, 300000, 1, 'manual', NULL, '2021-03-13 10:45:50', '2021-03-14 01:10:02'),
(397, 591, 8999500, 1, 'manual', NULL, '2021-03-15 19:08:55', '2021-03-15 20:00:05'),
(398, 598, 310000, 1, 'sync', 154731424, '2021-03-16 01:10:03', '2021-03-16 05:20:05'),
(399, 591, 7600000, 1, 'sync', 155701400, '2021-03-17 01:10:02', '2021-03-17 05:10:02'),
(400, 598, 250000, 1, 'sync', 155701402, '2021-03-17 03:10:03', '2021-03-17 05:10:02'),
(401, 657, 9200000, 1, 'manual', NULL, '2021-03-18 12:02:44', '2021-03-18 12:10:06'),
(402, 657, 46880000, 1, 'manual', NULL, '2021-03-18 16:32:13', '2021-03-18 16:42:27'),
(403, 657, 1180000, 1, 'manual', NULL, '2021-03-18 16:43:38', '2021-03-18 17:10:04'),
(404, 657, 0, 1, 'sync', 157508567, '2021-03-19 01:10:02', '2021-03-19 05:10:02'),
(405, 551, 0, 1, 'manual', NULL, '2021-03-19 11:53:22', '2021-03-19 12:10:03'),
(406, 166, 1000000, 1, 'manual', NULL, '2021-03-19 22:23:17', '2021-03-19 22:40:01'),
(407, 551, 105150700, 1, 'manual', NULL, '2021-03-20 09:30:13', '2021-03-20 09:40:03'),
(408, 551, 0, 1, 'manual', NULL, '2021-03-20 09:54:41', '2021-03-20 10:10:03'),
(409, 591, 2800000, 1, 'manual', NULL, '2021-03-22 11:51:17', '2021-03-22 12:30:04'),
(410, 594, 10100000, 1, 'manual', NULL, '2021-03-23 10:24:56', '2021-03-23 10:40:04'),
(411, 591, 0, 1, 'manual', NULL, '2021-03-23 16:36:26', '2021-03-23 17:40:04'),
(412, 594, 0, 1, 'manual', NULL, '2021-03-23 21:45:34', '2021-03-23 22:40:05'),
(413, 680, 10000000, 1, 'manual', NULL, '2021-03-29 20:57:57', '2021-03-29 21:10:07'),
(414, 680, 3800000, 1, 'sync', 165410377, '2021-03-31 01:10:02', '2021-03-31 05:10:03'),
(415, 166, 19300000, 1, 'manual', NULL, '2021-04-02 16:38:19', '2021-04-02 17:10:01'),
(416, 733, 2000000, 1, 'manual', NULL, '2021-04-07 12:43:21', '2021-04-07 13:10:09'),
(417, 735, 50000000, 1, 'manual', NULL, '2021-04-07 14:21:55', '2021-04-07 14:40:10'),
(418, 657, 800000, 1, 'manual', NULL, '2021-04-08 17:59:35', '2021-04-08 18:20:05'),
(419, 680, 8383600, 1, 'manual', NULL, '2021-04-08 22:50:20', '2021-04-08 23:40:06'),
(420, 166, 0, 1, 'manual', NULL, '2021-04-09 11:44:46', '2021-04-09 12:10:01'),
(421, 166, 77200000, 1, 'manual', NULL, '2021-04-09 13:02:27', '2021-04-09 13:10:02'),
(422, 166, 105000000, 1, 'manual', NULL, '2021-04-09 14:37:24', '2021-04-09 14:40:01'),
(423, 740, 1488520, 1, 'manual', NULL, '2021-04-10 00:32:48', '2021-04-10 05:40:11'),
(424, 680, 6383600, 1, 'sync', 174472771, '2021-04-10 01:10:05', '2021-04-10 05:10:03'),
(425, 735, 37000000, 1, 'sync', 174472772, '2021-04-10 01:10:08', '2021-04-10 05:10:04'),
(426, 166, 30600000, 1, 'manual', NULL, '2021-04-10 11:07:13', '2021-04-10 11:40:01'),
(427, 598, 0, 1, 'sync', 174852229, '2021-03-10 14:13:58', '2021-04-10 14:14:44'),
(428, 668, 85000000, 1, 'manual', NULL, '2021-04-10 20:08:48', '2021-04-10 20:40:06'),
(429, 735, 50000000, 1, 'manual', NULL, '2021-04-10 23:38:14', '2021-04-11 05:10:04'),
(430, 668, 55108000, 1, 'sync', 175313854, '2021-04-11 01:10:04', '2021-04-11 05:10:02'),
(431, 668, 0, 1, 'manual', NULL, '2021-04-11 11:13:13', '2021-04-11 11:40:05'),
(432, 739, 50000000, 1, 'manual', NULL, '2021-04-11 15:02:16', '2021-04-11 15:10:11'),
(433, 733, 2200000, 1, 'manual', NULL, '2021-04-11 19:22:59', '2021-04-11 19:39:57'),
(434, 733, 1500000, 1, 'manual', NULL, '2021-04-11 19:58:48', '2021-04-11 20:08:27'),
(435, 733, 5700000, 1, 'manual', NULL, '2021-04-11 21:39:50', '2021-04-11 22:10:11'),
(436, 733, 0, 1, 'manual', NULL, '2021-04-11 23:12:03', '2021-04-11 23:50:11'),
(437, 166, 29065000, 1, 'sync', 176009553, '2021-04-12 01:10:03', '2021-04-12 05:20:02'),
(438, 735, 46182000, 1, 'sync', 176009585, '2021-04-12 01:10:06', '2021-04-12 05:20:10'),
(439, 733, 100000, 1, 'manual', NULL, '2021-04-12 11:04:21', '2021-04-12 11:10:11'),
(440, 733, 10000000, 1, 'manual', NULL, '2021-04-12 11:43:15', '2021-04-12 12:10:10'),
(441, 733, 0, 1, 'manual', NULL, '2021-04-12 12:16:27', '2021-04-12 12:40:10'),
(442, 733, 7200000, 1, 'manual', NULL, '2021-04-12 13:24:38', '2021-04-12 13:40:09'),
(443, 680, 23050000, 1, 'manual', NULL, '2021-04-12 14:27:02', '2021-04-12 14:40:05'),
(444, 166, 23600000, 1, 'manual', NULL, '2021-04-12 15:00:31', '2021-04-12 15:20:01'),
(445, 166, 15200000, 1, 'sync', 176859892, '2021-04-13 01:10:06', '2021-04-13 05:20:02'),
(446, 680, 3500000, 1, 'sync', 176859904, '2021-04-13 01:10:10', '2021-04-13 05:20:07'),
(447, 733, 4070000, 1, 'sync', 176859927, '2021-04-13 01:10:14', '2021-04-13 05:20:12'),
(448, 740, 34463, 1, 'sync', 176859936, '2021-04-13 01:10:17', '2021-04-13 05:20:13'),
(449, 733, 5000000, 1, 'manual', NULL, '2021-04-13 11:40:20', '2021-04-13 12:10:10'),
(450, 735, 41582000, 1, 'sync', 177613738, '2021-04-14 01:10:03', '2021-04-14 05:10:03'),
(451, 733, 0, 1, 'manual', NULL, '2021-04-14 11:03:34', '2021-04-14 11:10:12'),
(452, 733, 13700000, 1, 'manual', NULL, '2021-04-14 17:07:38', '2021-04-14 17:40:11'),
(453, 733, 6100000, 1, 'manual', NULL, '2021-04-14 20:40:13', '2021-04-14 21:10:10'),
(454, 739, 43700000, 1, 'sync', 178352730, '2021-04-15 01:10:04', '2021-04-15 06:00:11'),
(455, 735, 0, 1, 'manual', NULL, '2021-04-15 13:00:40', '2021-04-15 13:10:11'),
(456, 735, 55100000, 1, 'manual', NULL, '2021-04-15 14:07:35', '2021-04-15 14:40:12'),
(457, 733, 10000000, 1, 'manual', NULL, '2021-04-15 15:11:25', '2021-04-15 15:40:11'),
(458, 733, 0, 1, 'manual', NULL, '2021-04-16 13:17:42', '2021-04-16 13:40:11'),
(459, 735, 60000000, 1, 'manual', NULL, '2021-04-16 16:07:55', '2021-04-16 16:20:12'),
(460, 680, 12060000, 1, 'manual', NULL, '2021-04-16 21:41:30', '2021-04-16 22:10:05'),
(461, 166, 12100000, 1, 'sync', 180246088, '2021-04-17 01:10:04', '2021-04-17 05:20:01'),
(462, 680, 10000000, 1, 'sync', 180246099, '2021-04-17 01:10:09', '2021-04-17 05:20:06'),
(463, 166, 5410000, 1, 'manual', NULL, '2021-04-18 00:33:02', '2021-04-18 05:20:02'),
(464, 730, 94500, 1, 'manual', NULL, '2021-04-18 20:57:29', '2021-04-18 21:20:10'),
(465, 166, 5300000, 1, 'sync', 181836353, '2021-04-19 01:10:07', '2021-04-19 05:20:02'),
(466, 166, 124500000, 1, 'manual', NULL, '2021-04-19 10:55:51', '2021-04-19 11:20:01'),
(467, 735, 59205000, 1, 'sync', 182665441, '2021-04-20 01:10:06', '2021-04-20 05:10:03'),
(468, 740, 7223000, 1, 'manual', NULL, '2021-04-20 10:40:41', '2021-04-20 11:20:18'),
(469, 730, 0, 1, 'manual', NULL, '2021-04-20 21:41:16', '2021-04-20 22:10:11'),
(470, 657, 0, 1, 'manual', NULL, '2021-04-21 11:21:22', '2021-04-21 11:50:05'),
(471, 166, 37700000, 1, 'manual', NULL, '2021-04-22 01:31:08', '2021-04-22 06:00:01');

-- --------------------------------------------------------

--
-- Структура таблицы `multicard`
--

CREATE TABLE `multicard` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `pan` varchar(16) DEFAULT NULL,
  `expiry` decimal(4,0) DEFAULT NULL,
  `card_token` varchar(100) DEFAULT NULL,
  `last_balance` bigint DEFAULT NULL,
  `credit_limit` bigint DEFAULT NULL,
  `debtor` int NOT NULL DEFAULT '0',
  `account_id` bigint DEFAULT NULL,
  `last_check_time` datetime DEFAULT NULL,
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `multicard`
--

INSERT INTO `multicard` (`id`, `user_id`, `pan`, `expiry`, `card_token`, `last_balance`, `credit_limit`, `debtor`, `account_id`, `last_check_time`, `added_on`, `updated_on`) VALUES
(166, 167, '986027******9347', '2506', '38dba6da-b42d-3bbe-900d-ef2c0712969b', 31220000, 37700000, 0, 4531813, '2021-04-22 11:10:12', '2020-07-23 21:51:08', '2021-04-22 06:17:29'),
(329, 331, '986027******4686', '2506', '547f8ebb-6220-37af-88e7-002f3022082f', 0, 0, 0, 4530630, '2021-04-22 11:10:01', '2020-12-01 15:56:44', '2021-04-22 06:17:29'),
(333, 335, '986027******8999', '2511', 'f8d67052-36a0-36cb-9389-ef5e862515c6', 0, 0, 0, 5198285, '2021-04-22 11:10:02', '2020-12-02 14:10:41', '2021-04-22 06:17:29'),
(425, 427, '986027******0656', '2601', '42c9c251-75c7-3f95-a4b7-89dc4fcb386b', 100000, 0, 0, 5561996, '2021-04-22 11:10:02', '2021-01-28 16:54:06', '2021-04-22 06:17:29'),
(426, 428, '986027******5958', '2601', 'f60f0f2f-ca6b-3449-a84c-c6001720d8f4', 0, 0, 0, 5571074, '2021-04-22 11:10:02', '2021-02-02 19:48:13', '2021-04-22 06:17:29'),
(434, 436, '986027******0108', '2602', '28865574-935e-3052-9d5a-3a78d6422955', 0, 0, 0, 5601970, '2021-04-22 11:10:02', '2021-02-03 11:56:17', '2021-04-22 06:17:29'),
(551, 553, '986027******5154', '2602', 'dfca2a53-3bfe-325c-83ed-4cb04354a665', 0, 0, 0, 5797934, '2021-04-22 11:10:02', '2021-03-02 18:01:30', '2021-04-22 06:17:29'),
(572, 574, '986027******2985', '2603', 'ee39a873-dc7b-3c8e-bba9-17a461412769', 0, 0, 0, 5826610, '2021-04-22 11:10:03', '2021-03-03 18:24:34', '2021-04-22 06:17:29'),
(585, 587, '986027******1255', '2603', '017b7d03-8dcd-319c-87bb-58d1a98f399c', 0, 0, 0, 5851094, '2021-04-22 11:10:03', '2021-03-05 11:59:36', '2021-04-22 06:17:29'),
(591, 593, '986027******7990', '2506', '7f67ceba-3e60-3bff-9dfb-7d79d6e9cac7', 0, 0, 0, 4531798, '2021-04-22 11:10:03', '2021-03-05 13:56:47', '2021-04-22 06:17:29'),
(594, 596, '986027******7964', '2603', '4b4a2fbc-d535-354a-94c6-3c439580e42c', 0, 0, 0, 5829477, '2021-04-22 11:10:03', '2021-03-05 14:35:14', '2021-04-22 06:17:29'),
(595, 597, '986027******2464', '2603', '9bf62e11-3f76-39ac-90f4-67985cf4fd6f', 0, 0, 0, 5829330, '2021-04-22 11:10:04', '2021-03-05 14:42:58', '2021-04-22 06:17:29'),
(598, 600, '986027******4234', '2603', '', 0, 0, 0, 5849649, '2021-04-22 11:10:04', '2021-03-05 16:51:05', '2021-04-22 06:17:29'),
(625, 627, '986027******3910', '2602', '', 0, 0, 0, 5811787, '2021-04-22 11:10:04', '2021-03-05 22:07:34', '2021-04-22 06:17:29'),
(657, 663, '986027******1171', '2603', 'dbf64398-bde6-306c-8260-9d968b7292c4', 0, 0, 0, 5900831, '2021-04-22 11:10:04', '2021-03-11 12:23:43', '2021-04-22 06:17:29'),
(663, 669, '986027******6347', '2603', 'c4029c0c-a511-3590-b894-0469d02dd004', 0, 0, 0, 5915672, '2021-04-22 11:10:04', '2021-03-11 12:40:27', '2021-04-22 06:17:29'),
(668, 674, '986027******2335', '2603', 'fcfd0e6d-150a-3706-a647-4336a3943189', 0, 0, 0, 5915627, '2021-04-22 11:10:05', '2021-03-11 12:57:50', '2021-04-22 06:17:29'),
(675, 681, '986027******0477', '2602', 'bf908207-9823-30fe-8021-c2b8173a588d', 0, 0, 0, 5643104, '2021-04-22 11:10:05', '2021-03-11 17:56:56', '2021-04-22 06:17:29'),
(676, 682, '986027******1639', '2603', 'f0c34973-680b-379c-92c1-cb6589dcbcc4', 0, 0, 0, 5829966, '2021-04-22 11:10:05', '2021-03-12 13:01:20', '2021-04-22 06:17:29'),
(679, 685, '986027******0501', '2603', '9fa8e17e-39ec-3998-b8c9-be2d4a47596c', 526750000, 0, 0, 5893268, '2021-04-22 11:10:05', '2021-03-12 17:38:48', '2021-04-22 06:17:29'),
(680, 686, '986027******5294', '2603', '88c7da29-2522-3b7b-8818-59c16baddefb', 10000000, 10000000, 0, 5932300, '2021-04-22 11:10:06', '2021-03-12 18:00:45', '2021-04-22 06:17:29'),
(681, 687, '986027******9663', '2603', '5f625483-af9e-3107-ad48-266a569a85bd', 0, 0, 0, 5900549, '2021-04-22 11:10:06', '2021-03-13 21:49:56', '2021-04-22 06:17:29'),
(682, 688, '986027******9671', '2603', '5082c1c5-ea77-3ab3-9bba-3861ae948370', 0, 0, 0, 5909228, '2021-04-22 11:10:06', '2021-03-13 22:16:30', '2021-04-22 06:17:29'),
(687, 693, '986027******5848', '2603', '8539e1c8-7a89-391f-bc10-13ca48180484', 0, 0, 0, 5901490, '2021-04-22 11:10:06', '2021-03-16 12:36:19', '2021-04-22 06:17:29'),
(688, 694, '986027******5579', '2603', '9b767e08-1e88-3dc3-9980-8c3f201076d3', 0, 0, 0, 5900485, '2021-04-22 11:10:07', '2021-03-16 12:36:59', '2021-04-22 06:17:29'),
(690, 696, '986027******0456', '2603', 'ba56a2c3-ec06-3904-b1fc-7f6b1a7bc928', 0, 0, 0, 5957742, '2021-04-22 11:10:07', '2021-03-17 14:53:39', '2021-04-22 06:17:29'),
(692, 698, '986027******9691', '2603', '121e54ef-8dc8-3bab-8bee-6c8be592b9ce', 1937000, 0, 0, 5982444, '2021-04-22 11:10:08', '2021-03-18 14:02:34', '2021-04-22 06:17:29'),
(698, 704, '986027******8511', '2603', '59e1afbd-1510-3ad0-840e-2d1fef55b4cc', 0, 0, 0, 5989576, '2021-04-22 11:10:08', '2021-03-23 09:14:26', '2021-04-22 06:17:29'),
(699, 705, '986027******3856', '2603', '320f1fad-183c-3055-9135-743051b35a8a', 0, 0, 0, 6016992, '2021-04-22 11:10:08', '2021-03-24 11:35:58', '2021-04-22 06:17:29'),
(717, 723, '986027******9013', '2603', '442cc366-9bf2-3e34-a4a1-4f64c6e492f0', 0, 0, 0, 5954116, '2021-04-22 11:10:08', '2021-03-25 12:34:25', '2021-04-22 06:17:29'),
(718, 724, '986027******0155', '2603', '240859b7-6203-3678-b2f6-5fc982fbf3fa', 3412000, 0, 0, 5930616, '2021-04-22 11:10:08', '2021-03-26 06:33:11', '2021-04-22 06:17:29'),
(720, 726, '986027******9499', '2603', '91e36000-cc28-3d27-b413-ccfd2e3685c6', 0, 0, 0, 6054816, '2021-04-22 11:10:09', '2021-03-27 14:34:30', '2021-04-22 06:17:29'),
(721, 727, '986027******4257', '2603', '98e734ff-16c7-364c-8a37-a4513482c783', 0, 0, 0, 6013737, '2021-04-22 11:10:09', '2021-03-27 14:47:30', '2021-04-22 06:17:29'),
(725, 731, '986027******1140', '2603', '0a0efb6b-9f85-3a41-8d5a-26de618ab68b', 900000, 0, 0, 6091094, '2021-04-22 11:10:09', '2021-03-31 19:05:44', '2021-04-22 06:17:29'),
(728, 734, '986027******6613', '2602', '6412fbb9-93cc-3345-96a2-b93c5cc0e79c', 71866100, 0, 0, 5773786, '2021-04-22 11:10:10', '2021-04-01 20:57:03', '2021-04-22 06:17:29'),
(730, 736, '986027******1248', '2604', '69537015-086a-312e-aa9e-bb683600feee', 1205500, 0, 0, 6100426, '2021-04-22 11:10:10', '2021-04-06 18:13:34', '2021-04-22 06:17:29'),
(731, 737, '986027******1266', '2603', '5fc3ae55-9451-35bf-bf90-516efba111c1', 0, 0, 0, 5867426, '2021-04-22 11:10:10', '2021-04-06 22:03:53', '2021-04-22 06:17:29'),
(733, 739, '986027******0891', '2603', 'fa0b6379-995d-3b45-9aff-10a8e5da9bb7', 0, 0, 0, 6039303, '2021-04-22 11:10:11', '2021-04-07 12:38:21', '2021-04-22 06:17:29'),
(735, 741, '986027******2853', '2604', 'f7cf0914-149f-30dd-b3c1-d355fcdbd054', 59205000, 59205000, 0, 6144038, '2021-04-22 11:10:11', '2021-04-07 14:18:17', '2021-04-22 06:17:29'),
(739, 745, '986027******2875', '2604', '77201b7e-b053-3389-94d2-e49a00ba57f6', 43700000, 43700000, 0, 6132586, '2021-04-22 11:10:11', '2021-04-09 16:26:50', '2021-04-22 06:17:29'),
(740, 746, '986027******9737', '2604', 'fd2d57c4-d8f2-3088-8c8d-a8d92c719837', 7223000, 7223000, 0, 6152596, '2021-04-22 11:10:11', '2021-04-10 00:30:15', '2021-04-22 06:17:29'),
(747, 753, '986027******1729', '2604', '63eef983-308a-3bc3-a4b9-d6908afe4991', 10920000, 0, 0, 6206084, '2021-04-22 11:10:11', '2021-04-13 16:04:04', '2021-04-22 06:17:29'),
(755, 761, '986027******1049', '2604', '99228c93-abe0-3392-afb6-13e15b5ddc39', 38500000, 0, 0, 6197633, '2021-04-22 11:10:12', '2021-04-14 12:59:45', '2021-04-22 06:17:29');

-- --------------------------------------------------------

--
-- Структура таблицы `multicard_callback`
--

CREATE TABLE `multicard_callback` (
  `id` int NOT NULL,
  `card` varchar(4) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'payment',
  `amount` int NOT NULL,
  `merchant_name` varchar(40) NOT NULL,
  `datetime` datetime NOT NULL,
  `balance` int NOT NULL,
  `full_message` varchar(255) NOT NULL,
  `multicard_ids` varchar(100) DEFAULT NULL,
  `terminal_ids` varchar(100) DEFAULT 'NULL',
  `checked` int NOT NULL DEFAULT '0',
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `multicard_callback`
--

INSERT INTO `multicard_callback` (`id`, `card`, `type`, `amount`, `merchant_name`, `datetime`, `balance`, `full_message`, `multicard_ids`, `terminal_ids`, `checked`, `added_on`) VALUES
(10, '9347', 'payment', 50000, 'PAYNET -PAYMO.UZ', '2020-07-23 22:44:00', 3850000, 'HUMOCARD *9347: oplata 500.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-07-23 22:44; Dostupno: 38500.00 UZS', '[\"166\"]', '', 0, '2020-07-23 22:44:47'),
(11, '9347', 'payment', 50000, 'PAYNET -PAYMO.UZ', '2020-07-23 22:44:00', 3850000, 'HUMOCARD *9347: oplata 500.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-07-23 22:44; Dostupno: 38500.00 UZS', '[\"166\"]', '', 0, '2020-07-23 22:45:18'),
(12, '9347', 'payment', 50000, 'PAYNET -PAYMO.UZ', '2020-07-23 22:44:00', 3850000, 'HUMOCARD *9347: oplata 500.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-07-23 22:44; Dostupno: 38500.00 UZS', '[\"166\"]', '', 0, '2020-07-23 22:45:47'),
(13, '9347', 'payment', 50000, 'PAYNET -PAYMO.UZ', '2020-07-27 19:48:00', 1500000, 'HUMOCARD *9347: oplata 500.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-07-27 19:48; Dostupno: 15000.00 UZS', '[\"166\"]', '', 0, '2020-07-27 19:48:52'),
(14, '9347', 'payment', 50000, 'PAYNET -PAYMO.UZ', '2020-07-27 19:48:00', 1500000, 'HUMOCARD *9347: oplata 500.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-07-27 19:48; Dostupno: 15000.00 UZS', '[\"166\"]', '', 0, '2020-07-27 19:49:23'),
(15, '9347', 'payment', 50000, 'PAYNET -PAYMO.UZ', '2020-07-27 19:48:00', 1500000, 'HUMOCARD *9347: oplata 500.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-07-27 19:48; Dostupno: 15000.00 UZS', '[\"166\"]', '', 0, '2020-07-27 19:49:53'),
(16, '9347', 'payment', 60000, 'PAYNET -PAYMO.UZ', '2020-09-23 19:33:00', 6140000, 'HUMOCARD *9347: oplata 600.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-09-23 19:33; Dostupno: 61400.00 UZS', '[\"166\"]', '', 0, '2020-09-23 19:34:05'),
(19, '9347', 'payment', 100000, 'TOSHKENT SH., \"ORIEN', '2020-11-03 21:29:00', 640000, 'HUMOCARD *9347: oplata 1000.00 UZS; TOSHKENT SH., \"ORIEN; 20-11-03 21:29; Dostupno: 6400.00 UZS', '[\"166\"]', '', 0, '2020-11-03 21:33:04'),
(20, '9347', 'payment', 50000, 'PAYNET -PAYMO.UZ', '2020-11-17 17:37:00', 49690000, 'HUMOCARD *9347: oplata 500.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-11-17 17:37; Dostupno: 496900.00 UZS', '[\"166\"]', '', 0, '2020-11-17 17:38:39'),
(21, '9347', 'payment', 25889600, 'ANGLESEY FOOD DP', '2020-11-21 16:23:00', 24075800, 'HUMOCARD *9347: oplata 258896.00 UZS; ANGLESEY FOOD DP>Tos; 20-11-21 16:23; Dostupno: 240758.00 UZS', '[\"166\"]', '', 0, '2020-11-21 16:24:50'),
(22, '9347', 'payment', 6368460, 'PAYMO POPOLNENIE HUM', '2020-11-23 18:20:00', 44731540, 'HUMOCARD *9347: oplata 63684.60 UZS; PAYMO POPOLNENIE HUM; 20-11-23 18:20; Dostupno: 447315.40 UZS', '[\"166\"]', '', 0, '2020-11-23 18:20:01'),
(23, '9347', 'payment', 2646000, 'PAYMO POPOLNENIE HUM', '2020-11-23 18:23:00', 42085540, 'HUMOCARD *9347: oplata 26460.00 UZS; PAYMO POPOLNENIE HUM; 20-11-23 18:23; Dostupno: 420855.40 UZS', '[\"166\"]', '', 0, '2020-11-23 18:23:24'),
(26, '9347', 'payment', 100000, 'PAYNET -PAYMO.UZ', '2020-11-24 20:02:00', 400000, 'HUMOCARD *9347: oplata 1000.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-11-24 20:02; Dostupno: 4000.00 UZS', '[\"166\"]', '', 0, '2020-11-24 20:02:18'),
(27, '9347', 'payment', 200000, 'PAYNET -PAYMO.UZ', '2020-11-24 20:03:00', 200000, 'HUMOCARD *9347: oplata 2000.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-11-24 20:03; Dostupno: 2000.00 UZS', '[\"166\"]', '', 0, '2020-11-24 20:04:01'),
(28, '9347', 'payment', 2800000, 'OOOMURODILLA AND ABD', '2020-11-25 22:17:00', 25800000, 'HUMOCARD *9347: oplata 28000.00 UZS; OOOMURODILLA AND ABD; 20-11-25 22:17; Dostupno: 258000.00 UZS', '[\"166\"]', '', 0, '2020-11-25 22:17:07'),
(29, '9347', 'payment', 50000, 'OOO \"NATIONAL INNOVA', '2020-11-27 12:45:00', 2950000, 'HUMOCARD *9347: oplata 500.00 UZS; OOO \"NATIONAL INNOVA; 20-11-27 12:45; Dostupno: 29500.00 UZS', '[\"166\"]', '', 0, '2020-11-27 12:46:00'),
(30, '9347', 'payment', 50000, 'OOO \"NATIONAL INNOVA', '2020-11-27 16:21:00', 1650000, 'HUMOCARD *9347: oplata 500.00 UZS; OOO \"NATIONAL INNOVA; 20-11-27 16:21; Dostupno: 16500.00 UZS', '[\"166\"]', '', 0, '2020-11-27 16:21:18'),
(31, '9347', 'payment', 50000, 'OOO \"NATIONAL INNOVA', '2020-11-27 16:46:00', 1650000, 'HUMOCARD *9347: oplata 500.00 UZS; OOO \"NATIONAL INNOVA; 20-11-27 16:46; Dostupno: 16500.00 UZS', '[\"166\"]', '', 0, '2020-11-27 16:46:19'),
(32, '9347', 'payment', 50000, 'OOO \"NATIONAL INNOVA', '2020-11-27 16:47:00', 1650000, 'HUMOCARD *9347: oplata 500.00 UZS; OOO \"NATIONAL INNOVA; 20-11-27 16:47; Dostupno: 16500.00 UZS', '[\"166\"]', '', 0, '2020-11-27 16:47:01'),
(33, '9347', 'payment', 50000, 'OOO \"NATIONAL INNOVA', '2020-11-27 16:55:00', 1600000, 'HUMOCARD *9347: oplata 500.00 UZS; OOO \"NATIONAL INNOVA; 20-11-27 16:55; Dostupno: 16000.00 UZS', '[\"166\"]', '', 0, '2020-11-27 16:55:28'),
(34, '9347', 'payment', 50000, 'OOO \"NATIONAL INNOVA', '2020-11-27 16:58:00', 1650000, 'HUMOCARD *9347: oplata 500.00 UZS; OOO \"NATIONAL INNOVA; 20-11-27 16:58; Dostupno: 16500.00 UZS', '[\"166\"]', '', 0, '2020-11-27 16:58:32'),
(35, '9347', 'payment', 50000, 'OOO \"NATIONAL INNOVA', '2020-11-27 16:59:00', 1600000, 'HUMOCARD *9347: oplata 500.00 UZS; OOO \"NATIONAL INNOVA; 20-11-27 16:59; Dostupno: 16000.00 UZS', '[\"166\"]', '', 0, '2020-11-27 16:59:12'),
(36, '9347', 'payment', 500000, 'PAYNET -PAYMO.UZ', '2020-12-03 21:30:00', 2400000, 'HUMOCARD *9347: oplata 5000.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-12-03 21:30; Dostupno: 24000.00 UZS', '[\"166\"]', '', 0, '2020-12-03 21:30:10'),
(37, '9347', 'payment', 500000, 'PAYNET -PAYMO.UZ', '2020-12-03 21:30:00', 2400000, 'HUMOCARD *9347: oplata 5000.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-12-03 21:30; Dostupno: 24000.00 UZS', '[\"166\"]', '', 0, '2020-12-03 21:30:41'),
(38, '4059', 'payment', 10000000, '\"ORIENT FINANS\" KHAT', '2020-12-04 23:06:00', 40000047, 'HUMOCARD *4059: oplata 100000.00 UZS; \"ORIENT FINANS\" KHAT; 20-12-04 23:06; Dostupno: 400000.47 UZS', '', '', 0, '2020-12-04 23:07:07'),
(39, '4059', 'payment', 10000000, '\"ORIENT FINANS\" KHAT', '2020-12-04 23:34:00', 30000047, 'HUMOCARD *4059: oplata 100000.00 UZS; \"ORIENT FINANS\" KHAT; 20-12-04 23:34; Dostupno: 300000.47 UZS', '', '', 0, '2020-12-04 23:34:58'),
(40, '4059', 'payment', 10000000, '\"ORIENT FINANS\" KHAT', '2020-12-04 23:45:00', 20000047, 'HUMOCARD *4059: oplata 100000.00 UZS; \"ORIENT FINANS\" KHAT; 20-12-04 23:45; Dostupno: 200000.47 UZS', '', '', 0, '2020-12-04 23:45:50'),
(41, '4059', 'payment', 10000000, '\"ORIENT FINANS\" KHAT', '2020-12-04 23:53:00', 10000047, 'HUMOCARD *4059: oplata 100000.00 UZS; \"ORIENT FINANS\" KHAT; 20-12-04 23:53; Dostupno: 100000.47 UZS', '', '', 0, '2020-12-04 23:53:40'),
(42, '4059', 'payment', 10000000, '\"ORIENT FINANS\" KHAT', '2020-12-05 00:02:00', 47, 'HUMOCARD *4059: oplata 100000.00 UZS; \"ORIENT FINANS\" KHAT; 20-12-05 00:02; Dostupno: 0.47 UZS', '', '', 0, '2020-12-05 00:02:44'),
(43, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-02 20:01:19'),
(44, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-02 20:01:49'),
(45, '9347', 'payment', 100, 'PAYMO POPOLNENIE HUM', '2021-02-03 14:46:00', 39599900, 'HUMOCARD *9347: oplata 1.00 UZS; PAYMO POPOLNENIE HUM; 21-02-03 14:46; Dostupno: 395999.00 UZS', '[\"166\"]', '', 0, '2021-02-03 14:48:20'),
(46, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-04 23:56:31'),
(47, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-04 23:56:47'),
(48, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-04 23:59:43'),
(49, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-05 00:00:07'),
(50, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-05 00:00:48'),
(51, '9347', 'payment', 9724000, 'XK \"RAYHON LAZZATLI', '2021-02-11 13:43:00', 9676000, 'HUMOCARD *9347: oplata 97240.00 UZS; XK \"RAYHON LAZZATLI; 21-02-11 13:43; Dostupno: 96760.00 UZS', '[\"166\"]', '', 0, '2021-02-11 13:45:48'),
(52, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 16:53:59'),
(53, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 17:36:17'),
(54, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 17:39:24'),
(55, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 17:46:00'),
(56, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 17:46:07'),
(57, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 17:58:02'),
(58, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:11:56'),
(59, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:12:05'),
(60, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:21:40'),
(61, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:23:26'),
(62, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:23:59'),
(63, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:26:31'),
(64, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:26:49'),
(65, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:27:22'),
(66, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:29:27'),
(67, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:29:49'),
(68, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:30:12'),
(69, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:30:26'),
(70, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:30:41'),
(71, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:33:56'),
(72, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:34:08'),
(73, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:34:15'),
(74, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:34:19'),
(75, '6346', 'payment', 10000, 'PAYNET -PAYMO.UZ', '2020-04-24 02:33:00', 5126850, 'HUMOCARD *6346: oplata 100.00 UZS; PAYNET -PAYMO.UZ>Tos; 20-04-24 02:33; Dostupno: 51268.50 UZS', '', '', 0, '2021-02-18 18:42:33'),
(76, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:50:23'),
(77, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-18 18:50:29'),
(78, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-23 15:21:26'),
(79, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-23 15:21:49'),
(80, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-23 15:30:45'),
(81, '9347', 'payment', 30000000, 'AYOQSH MCHJ', '2021-02-02 19:59:00', 39600000, 'HUMOCARD *9347: oplata 300000.00 UZS; AYOQSH MCHJ>Toshkent; 21-02-02 19:59; Dostupno: 396000.00 UZS', '[\"166\"]', '', 0, '2021-02-23 15:31:21'),
(82, '0803', 'payment', 1400000, 'XK ORIENT FOOD', '2021-03-05 12:52:00', 27429400, 'HUMOCARD *0803: oplata 14000.00 UZS; XK ORIENT FOOD>TASHK; 21-03-05 12:52; Dostupno: 274294.00 UZS', '', '', 0, '2021-03-05 12:58:12'),
(83, '0803', 'payment', 27200000, 'TOSHKENT SH., \"ORIEN', '2021-03-05 19:13:00', 89400, 'HUMOCARD *0803: oplata 272000.00 UZS; TOSHKENT SH., \"ORIEN; 21-03-05 19:13; Dostupno: 894.00 UZS', '', '', 0, '2021-03-05 19:14:06'),
(84, '0803', 'payment', 88000000, 'TOSHKENT SH ORIENT F', '2021-03-16 11:00:00', 40089400, 'HUMOCARD *0803: oplata 880000.00 UZS; TOSHKENT SH ORIENT F; 21-03-16 11:00; Dostupno: 400894.00 UZS', '', '', 0, '2021-03-16 11:12:18'),
(85, '7990', 'payment', 2400000, 'SP MUQIMIY BARAKA', '2021-03-16 11:20:00', 7600000, 'HUMOCARD *7990: oplata 24000.00 UZS; SP MUQIMIY BARAKA>To; 21-03-16 11:20; Dostupno: 76000.00 UZS', '[\"591\"]', '', 0, '2021-03-16 11:23:28'),
(86, '7990', 'payment', 2400000, 'SP MUQIMIY BARAKA', '2021-03-16 11:20:00', 7600000, 'HUMOCARD *7990: oplata 24000.00 UZS; SP MUQIMIY BARAKA>To; 21-03-16 11:20; Dostupno: 76000.00 UZS', '[\"591\"]', '', 0, '2021-03-16 11:23:59'),
(87, '7990', 'payment', 2400000, 'SP MUQIMIY BARAKA', '2021-03-16 11:20:00', 7600000, 'HUMOCARD *7990: oplata 24000.00 UZS; SP MUQIMIY BARAKA>To; 21-03-16 11:20; Dostupno: 76000.00 UZS', '[\"591\"]', '', 0, '2021-03-16 11:24:30'),
(88, '8844', 'payment', 13000000, 'MChDj LABZAK LIDER P', '2021-03-16 20:17:00', 207463348, 'HUMOCARD *8844: oplata 130000.00 UZS; MChDj LABZAK LIDER P; 21-03-16 20:17; Dostupno: 2074633.48 UZS', '', '', 0, '2021-03-16 20:20:01'),
(89, '1171', 'payment', 590000, 'OOO EURASIA FASHION', '2021-03-18 12:15:00', 8610000, 'HUMOCARD *1171: oplata 5900.00 UZS; OOO EURASIA FASHION; 21-03-18 12:15; Dostupno: 86100.00 UZS', '[\"657\"]', '', 0, '2021-03-18 12:22:29'),
(90, '1171', 'payment', 590000, 'OOO EURASIA FASHION', '2021-03-18 12:26:00', 8020000, 'HUMOCARD *1171: oplata 5900.00 UZS; OOO EURASIA FASHION; 21-03-18 12:26; Dostupno: 80200.00 UZS', '[\"657\"]', '', 0, '2021-03-18 12:27:52'),
(91, '8844', 'payment', 26200000, 'TOSHKENT SH ORIENT F', '2021-03-19 10:14:00', 111763348, 'HUMOCARD *8844: oplata 262000.00 UZS; TOSHKENT SH ORIENT F; 21-03-19 10:14; Dostupno: 1117633.48 UZS', '', '', 0, '2021-03-19 10:15:43'),
(92, '0803', 'payment', 30500000, 'ORIENT FINANS KHAT B', '2021-03-19 15:36:00', 89400, 'HUMOCARD *0803: oplata 305000.00 UZS; ORIENT FINANS KHAT B; 21-03-19 15:36; Dostupno: 894.00 UZS', '', '', 0, '2021-03-19 15:38:27'),
(93, '8844', 'payment', 110000000, 'ORIENT FINANS KHAT B', '2021-03-19 19:28:00', 1763348, 'HUMOCARD *8844: oplata 1100000.00 UZS; ORIENT FINANS KHAT B; 21-03-19 19:28; Dostupno: 17633.48 UZS', '', '', 0, '2021-03-19 19:29:53'),
(94, '4883', 'payment', 15000000, 'TOSHKENT SH ORIENT F', '2021-03-19 22:07:00', 115526165, 'HUMOCARD *4883: oplata 150000.00 UZS; TOSHKENT SH ORIENT F; 21-03-19 22:07; Dostupno: 1155261.65 UZS', '', '', 0, '2021-03-19 22:09:36'),
(95, '4883', 'payment', 105400000, 'ORIENT FINANS KHAT B', '2021-03-20 12:33:00', 10126165, 'HUMOCARD *4883: oplata 1054000.00 UZS; ORIENT FINANS KHAT B; 21-03-20 12:33; Dostupno: 101261.65 UZS', '', '', 0, '2021-03-20 12:40:05'),
(96, '4883', 'payment', 2020000, 'PAYME', '2021-03-23 09:54:00', 1036165, 'HUMOCARD *4883: oplata 20200.00 UZS; PAYME>Tashkent; 21-03-23 09:54; Dostupno: 10361.65 UZS', '', '', 0, '2021-03-23 09:55:30'),
(97, '0803', 'payment', 140000, 'OOO AVTOMATLASHTIRIL', '2021-03-23 18:57:00', 449400, 'HUMOCARD *0803: oplata 1400.00 UZS; OOO AVTOMATLASHTIRIL; 21-03-23 18:57; Dostupno: 4494.00 UZS', '', '', 0, '2021-03-23 18:57:39'),
(98, '8844', 'payment', 1180400, 'ANGLESEY FOOD TTZ', '2021-03-25 21:12:00', 582948, 'HUMOCARD *8844: oplata 11804.00 UZS; ANGLESEY FOOD TTZ>TA; 21-03-25 21:12; Dostupno: 5829.48 UZS', '', '', 0, '2021-03-25 21:14:22'),
(99, '0803', 'payment', 100000, 'TOSHKENT SH ORIENT F', '2021-03-27 16:21:00', 349400, 'HUMOCARD *0803: oplata 1000.00 UZS; TOSHKENT SH ORIENT F; 21-03-27 16:21; Dostupno: 3494.00 UZS', '', '', 0, '2021-03-27 16:23:13'),
(100, '4883', 'payment', 100, 'CHP BREND TEKSTIL 7', '2021-03-29 14:02:00', 1036065, 'HUMOCARD *4883: oplata 1.00 UZS; CHP BREND TEKSTIL 7>; 21-03-29 14:02; Dostupno: 10360.65 UZS', '', '', 0, '2021-03-29 14:04:18'),
(101, '5294', 'payment', 6200000, 'FOODS BUSINESS YSD', '2021-03-30 13:55:00', 3800000, 'HUMOCARD *5294: oplata 62000.00 UZS; FOODS BUSINESS YSD>T; 21-03-30 13:55; Dostupno: 38000.00 UZS', '[\"680\"]', '', 0, '2021-03-30 13:56:39'),
(102, '0803', 'payment', 100000, 'ORIENT FINANS', '2021-04-01 09:34:00', 249400, 'HUMOCARD *0803: oplata 1000.00 UZS; ORIENT FINANS>Toshke; 21-04-01 09:34; Dostupno: 2494.00 UZS', '', '', 0, '2021-04-01 09:36:27'),
(103, '4883', 'payment', 100, 'YATT AXMEDOV BURXONJ', '2021-04-01 16:08:00', 535965, 'HUMOCARD *4883: oplata 1.00 UZS; YATT AXMEDOV BURXONJ; 21-04-01 16:08; Dostupno: 5359.65 UZS', '', '', 0, '2021-04-01 16:10:04'),
(104, '4883', 'payment', 300, 'YATT SADIKOV BOBIR S', '2021-04-01 18:40:00', 535665, 'HUMOCARD *4883: oplata 3.00 UZS; YATT SADIKOV BOBIR S; 21-04-01 18:40; Dostupno: 5356.65 UZS', '', '', 0, '2021-04-01 18:41:36'),
(105, '0803', 'payment', 83500, 'TOSHKENT SH ORIENT F', '2021-04-02 12:33:00', 265900, 'HUMOCARD *0803: oplata 835.00 UZS; TOSHKENT SH ORIENT F; 21-04-02 12:33; Dostupno: 2659.00 UZS', '', '', 0, '2021-04-02 12:35:19'),
(106, '4883', 'payment', 140000, 'OOO AVTOMATLASHTIRIL', '2021-04-04 18:07:00', 395665, 'HUMOCARD *4883: oplata 1400.00 UZS; OOO AVTOMATLASHTIRIL; 21-04-04 18:07; Dostupno: 3956.65 UZS', '', '', 0, '2021-04-04 18:08:54'),
(107, '4883', 'payment', 100, 'CHP OSPANOV ALIM SAV', '2021-04-05 14:01:00', 395565, 'HUMOCARD *4883: oplata 1.00 UZS; CHP OSPANOV ALIM SAV; 21-04-05 14:01; Dostupno: 3955.65 UZS', '', '', 0, '2021-04-05 14:03:39'),
(108, '4883', 'payment', 100, 'YOSHLIK SAVDO RR N1', '2021-04-05 15:47:00', 395465, 'HUMOCARD *4883: oplata 1.00 UZS; YOSHLIK SAVDO RR N1>; 21-04-05 15:47; Dostupno: 3954.65 UZS', '', '', 0, '2021-04-05 16:07:16'),
(109, '4883', 'payment', 100, 'YATT MIRZAYEV BAXODI', '2021-04-05 17:16:00', 395265, 'HUMOCARD *4883: oplata 1.00 UZS; YATT MIRZAYEV BAXODI; 21-04-05 17:16; Dostupno: 3952.65 UZS', '', '', 0, '2021-04-05 17:21:23'),
(110, '4883', 'payment', 13120000, 'OOO WE ARE ROOTS', '2021-04-10 16:22:00', 161290165, 'HUMOCARD *4883: oplata 131200.00 UZS; OOO WE ARE ROOTS>TOS; 21-04-10 16:22; Dostupno: 1612901.65 UZS', '', '', 0, '2021-04-10 16:25:06'),
(111, '0803', 'payment', 8100000, 'TOSHKENT SH ORIENT F', '2021-04-10 10:45:00', 465900, 'HUMOCARD *0803: oplata 81000.00 UZS; TOSHKENT SH ORIENT F; 21-04-10 10:45; Dostupno: 4659.00 UZS', '', '', 0, '2021-04-11 08:10:49'),
(112, '9347', 'payment', 1935000, 'MCHJ DARVOZA SAVDO M', '2021-04-11 12:47:00', 29065000, 'HUMOCARD *9347: oplata 19350.00 UZS; MCHJ DARVOZA SAVDO M; 21-04-11 12:47; Dostupno: 290650.00 UZS', '[\"166\"]', '', 0, '2021-04-11 12:49:24'),
(113, '4883', 'payment', 140000, 'OOO AVTOMATLASHTIRIL', '2021-04-11 18:03:00', 156100165, 'HUMOCARD *4883: oplata 1400.00 UZS; OOO AVTOMATLASHTIRIL; 21-04-11 18:03; Dostupno: 1561001.65 UZS', '', '', 0, '2021-04-11 18:04:21'),
(114, '4883', 'payment', 9780000, 'ZAYNS COFFEE AND ICE', '2021-04-11 22:11:00', 146320165, 'HUMOCARD *4883: oplata 97800.00 UZS; ZAYNS COFFEE AND ICE; 21-04-11 22:11; Dostupno: 1463201.65 UZS', '', '', 0, '2021-04-11 22:13:24'),
(115, '4883', 'payment', 140000, 'OOO AVTOMATLASHTIRIL', '2021-04-11 22:24:00', 146180165, 'HUMOCARD *4883: oplata 1400.00 UZS; OOO AVTOMATLASHTIRIL; 21-04-11 22:24; Dostupno: 1461801.65 UZS', '', '', 0, '2021-04-11 22:26:26'),
(116, '4883', 'payment', 30805000, 'PAYME', '2021-04-09 18:32:00', 184290165, 'HUMOCARD *4883: oplata 308050.00 UZS; PAYME>Tashkent; 21-04-09 18:32; Dostupno: 1842901.65 UZS', '', '', 0, '2021-04-12 03:27:45'),
(117, '4883', 'payment', 20200000, 'PAYME', '2021-04-09 18:29:00', 215095165, 'HUMOCARD *4883: oplata 202000.00 UZS; PAYME>Tashkent; 21-04-09 18:29; Dostupno: 2150951.65 UZS', '', '', 0, '2021-04-12 03:34:28'),
(118, '2853', 'payment', 13000000, 'MCHJ SHOX MED CENTER', '2021-04-09 16:20:00', 37000000, 'HUMOCARD *2853: oplata 130000.00 UZS; MCHJ SHOX MED CENTER; 21-04-09 16:20; Dostupno: 370000.00 UZS', '[\"735\"]', '', 0, '2021-04-12 07:48:48'),
(119, '9347', 'payment', 8400000, 'EKONOMA', '2021-04-12 12:48:00', 20665000, 'HUMOCARD *9347: oplata 84000.00 UZS; EKONOMA>Tashkent; 21-04-12 12:48; Dostupno: 206650.00 UZS', '[\"166\"]', '', 0, '2021-04-12 12:49:57'),
(120, '0891', 'payment', 1430000, 'OOO ODINAJAXON', '2021-04-12 18:12:00', 5770000, 'HUMOCARD *0891: oplata 14300.00 UZS; OOO ODINAJAXON>Tashk; 21-04-12 18:12; Dostupno: 57700.00 UZS', '[\"733\"]', '', 0, '2021-04-12 18:14:07'),
(121, '0891', 'payment', 1700000, 'OOO HIKMAT TIJORATI', '2021-04-12 23:50:00', 4070000, 'HUMOCARD *0891: oplata 17000.00 UZS; OOO HIKMAT TIJORATI>; 21-04-12 23:50; Dostupno: 40700.00 UZS', '[\"733\"]', '', 0, '2021-04-13 00:15:41'),
(122, '4883', 'payment', 1000000, 'TULKUNOV BUSINESS PA', '2021-04-12 12:29:00', 75180165, 'HUMOCARD *4883: oplata 10000.00 UZS; TULKUNOV BUSINESS PA; 21-04-12 12:29; Dostupno: 751801.65 UZS', '', '', 0, '2021-04-13 07:42:36'),
(123, '4883', 'payment', 70000000, 'TOSHKENT SH ORIENT F', '2021-04-12 12:28:00', 76180165, 'HUMOCARD *4883: oplata 700000.00 UZS; TOSHKENT SH ORIENT F; 21-04-12 12:28; Dostupno: 761801.65 UZS', '', '', 0, '2021-04-13 07:44:36'),
(124, '4883', 'payment', 1899000, 'MCHJ DARVOZA SAVDO', '2021-04-13 18:22:00', 73281165, 'HUMOCARD *4883: oplata 18990.00 UZS; MCHJ DARVOZA SAVDO>C; 21-04-13 18:22; Dostupno: 732811.65 UZS', '', '', 0, '2021-04-13 18:44:57'),
(125, '2853', 'payment', 4600000, 'MCHJ AMBROSIA GASTRO', '2021-04-13 13:10:00', 41582000, 'HUMOCARD *2853: oplata 46000.00 UZS; MCHJ AMBROSIA GASTRO; 21-04-13 13:10; Dostupno: 415820.00 UZS', '[\"735\"]', '', 0, '2021-04-14 03:19:28'),
(126, '4883', 'payment', 100, 'OOO SEVER SENTR', '2021-04-14 10:48:00', 48031065, 'HUMOCARD *4883: oplata 1.00 UZS; OOO SEVER SENTR>Tosh; 21-04-14 10:48; Dostupno: 480310.65 UZS', '', '', 0, '2021-04-14 10:49:58'),
(127, '4883', 'payment', 100, 'XK SREDSTVO INDIVIDU', '2021-04-14 14:26:00', 48030965, 'HUMOCARD *4883: oplata 1.00 UZS; XK SREDSTVO INDIVIDU; 21-04-14 14:26; Dostupno: 480309.65 UZS', '', '', 0, '2021-04-14 14:22:50'),
(128, '4883', 'payment', 10100000, 'PAYME', '2021-04-14 16:37:00', 12680965, 'HUMOCARD *4883: oplata 101000.00 UZS; PAYME>Tashkent; 21-04-14 16:37; Dostupno: 126809.65 UZS', '', '', 0, '2021-04-14 16:39:51'),
(129, '2875', 'payment', 1200000, 'XK AL JAYNAR', '2021-04-14 19:23:00', 48800000, 'HUMOCARD *2875: oplata 12000.00 UZS; XK AL JAYNAR>TOSHKEN; 21-04-14 19:23; Dostupno: 488000.00 UZS', '[\"739\"]', '', 0, '2021-04-14 19:24:45'),
(130, '2875', 'payment', 3300000, 'OOO GLOBAL BRAWERY G', '2021-04-14 19:44:00', 45500000, 'HUMOCARD *2875: oplata 33000.00 UZS; OOO GLOBAL BRAWERY G; 21-04-14 19:44; Dostupno: 455000.00 UZS', '[\"739\"]', '', 0, '2021-04-14 19:45:59'),
(131, '2875', 'payment', 1800000, 'OOO GLOBAL BRAWERY G', '2021-04-14 20:45:00', 43700000, 'HUMOCARD *2875: oplata 18000.00 UZS; OOO GLOBAL BRAWERY G; 21-04-14 20:45; Dostupno: 437000.00 UZS', '[\"739\"]', '', 0, '2021-04-14 20:47:23'),
(132, '4883', 'payment', 100, 'OOO STUDY FIRST', '2021-04-15 15:55:00', 12680865, 'HUMOCARD *4883: oplata 1.00 UZS; OOO STUDY FIRST>Tosh; 21-04-15 15:55; Dostupno: 126808.65 UZS', '', '', 0, '2021-04-15 16:09:49'),
(133, '0803', 'payment', 32643000, 'ORIENT FINANS KHAT B', '2021-04-16 15:56:00', 95822900, 'HUMOCARD *0803: oplata 326430.00 UZS; ORIENT FINANS KHAT B; 21-04-16 15:56; Dostupno: 958229.00 UZS', '', '', 0, '2021-04-16 16:22:28'),
(134, '0803', 'payment', 40000000, 'TOSHKENT SH ORIENT F', '2021-04-16 18:55:00', 2172900, 'HUMOCARD *0803: oplata 400000.00 UZS; TOSHKENT SH ORIENT F; 21-04-16 18:55; Dostupno: 21729.00 UZS', '', '', 0, '2021-04-16 19:07:58'),
(135, '0803', 'payment', 1000000, 'TOSHKENT SH ORIENT F', '2021-04-16 17:28:00', 42172900, 'HUMOCARD *0803: oplata 10000.00 UZS; TOSHKENT SH ORIENT F; 21-04-16 17:28; Dostupno: 421729.00 UZS', '', '', 0, '2021-04-17 01:07:49'),
(136, '0803', 'payment', 52650000, 'ORIENT FINANS KHAT B', '2021-04-16 15:58:00', 43172900, 'HUMOCARD *0803: oplata 526500.00 UZS; ORIENT FINANS KHAT B; 21-04-16 15:58; Dostupno: 431729.00 UZS', '', '', 0, '2021-04-17 01:22:15'),
(152, '9347', 'oplata', 50000, 'PAYNET PAYMOUZ', '2021-04-17 23:59:00', 12050000, 'HUMOCARD *9347: oplata 500.00 UZS; PAYNET PAYMOUZ>Tosh; 21-04-17 23:59; Dostupno: 120500.00 UZS', '[\"166\"]', '', 0, '2021-04-18 00:01:47'),
(153, '9347', 'oplata', 50000, 'PAYNET PAYMOUZ', '2021-04-17 23:59:00', 12050000, 'HUMOCARD *9347: oplata 500.00 UZS; PAYNET PAYMOUZ>Tosh; 21-04-17 23:59; Dostupno: 120500.00 UZS', '[\"166\"]', '', 0, '2021-04-18 00:02:47'),
(155, '9347', 'oplata', 60000, 'PAYNET PAYMOUZ', '2021-04-18 00:10:00', 11990000, 'HUMOCARD *9347: oplata 600.00 UZS; PAYNET PAYMOUZ>Tosh; 21-04-18 00:10; Dostupno: 119900.00 UZS', '[\"166\"]', '', 0, '2021-04-18 03:04:40'),
(156, '0803', 'oplata', 2000000, 'TOSHKENT SH ORIENT F', '2021-04-18 14:02:00', 172900, 'HUMOCARD *0803: oplata 20000.00 UZS; TOSHKENT SH ORIENT F; 21-04-18 14:02; Dostupno: 1729.00 UZS', '', '', 0, '2021-04-18 14:29:49'),
(157, '9347', 'popolnenie', 110000, 'TOSHKENT SH ORIENT F', '2021-04-19 05:18:00', 5300000, 'HUMOCARD *9347: popolnenie 1100.00 UZS; TOSHKENT SH ORIENT F; 21-04-19 05:18; Dostupno: 53000.00 UZS', '[\"166\"]', '', 0, '2021-04-19 05:20:24'),
(158, '2853', 'oplata', 795000, 'SP OOO HAVAS FOOD', '2021-04-19 13:42:00', 59205000, 'HUMOCARD *2853: oplata 7950.00 UZS; SP OOO HAVAS FOOD>TO; 21-04-19 13:42; Dostupno: 592050.00 UZS', '[\"735\"]', '', 0, '2021-04-19 13:45:07'),
(159, '2853', 'popolnenie', 795000, 'TOSHKENT SH ORIENT F', '2021-04-20 05:08:00', 59205000, 'HUMOCARD *2853: popolnenie 7950.00 UZS; TOSHKENT SH ORIENT F; 21-04-20 05:08; Dostupno: 592050.00 UZS', '[\"735\"]', '', 0, '2021-04-20 05:10:24'),
(160, '9347', 'oplata', 6480000, 'OOO ECO MED', '2021-04-22 10:45:00', 31220000, 'HUMOCARD *9347: oplata 64800.00 UZS; OOO ECO MED>Toshkent; 21-04-22 10:45; Dostupno: 312200.00 UZS', '[\"166\"]', '', 0, '2021-04-22 10:48:31');

-- --------------------------------------------------------

--
-- Структура таблицы `multicard_transaction`
--

CREATE TABLE `multicard_transaction` (
  `id` int UNSIGNED NOT NULL,
  `multicard_id` int UNSIGNED DEFAULT NULL,
  `partner_id` int UNSIGNED DEFAULT NULL,
  `sync_with_ox` int NOT NULL DEFAULT '0',
  `terminal_id` varchar(10) NOT NULL DEFAULT '',
  `merchant_id` varchar(20) DEFAULT '',
  `merchant_name` varchar(100) DEFAULT NULL,
  `pc_uniq_id` varchar(32) NOT NULL DEFAULT '',
  `amount` bigint NOT NULL,
  `cashback_percent` tinyint DEFAULT NULL,
  `cashback_amount` int DEFAULT NULL,
  `type` enum('debit','credit') DEFAULT 'debit',
  `time` datetime NOT NULL,
  `mcc` varchar(10) DEFAULT NULL,
  `reversed` tinyint(1) NOT NULL DEFAULT '0',
  `reversed_time` datetime DEFAULT NULL,
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `multicard_transaction`
--

INSERT INTO `multicard_transaction` (`id`, `multicard_id`, `partner_id`, `sync_with_ox`, `terminal_id`, `merchant_id`, `merchant_name`, `pc_uniq_id`, `amount`, `cashback_percent`, `cashback_amount`, `type`, `time`, `mcc`, `reversed`, `reversed_time`, `added_on`, `updated_on`) VALUES
(396, 166, NULL, 0, '196104ON', '00401000004016Y', 'PAYNET -PAYMO.UZ', '14564260000', 60000, NULL, NULL, 'debit', '2020-09-23 19:33:26', '5999', 0, NULL, '2020-11-17 17:42:45', '2020-12-07 13:00:26'),
(397, 166, NULL, 0, '2761054B', '01071000010712R', 'TOSHKENT SH., \"ORIENT FINAN', '1757361000000', 1000000, NULL, NULL, 'debit', '2020-11-03 19:01:36', '5999', 1, '2020-11-03 19:09:51', '2020-11-17 17:42:45', '2020-12-07 13:00:26'),
(399, 166, NULL, 0, '2761054B', '01071000010712R', 'TOSHKENT SH., \"ORIENT FINAN', '917861100000', 100000, NULL, NULL, 'debit', '2020-11-03 21:29:17', '5999', 1, '2020-11-03 21:29:39', '2020-11-17 17:42:45', '2020-12-07 13:00:26'),
(5755, 166, NULL, 0, '196101CV', '00401000004013Y', 'P2P BOSHQA BANK PAYMO', '32325149000000', 49000000, NULL, NULL, 'credit', '2020-11-16 16:00:32', '5999', 0, NULL, '2020-11-17 17:42:45', '2020-12-07 13:00:26'),
(7244, 166, NULL, 0, '196104ON', '00401000004016Y', 'PAYNET -PAYMO.UZ', '37878550000', 50000, NULL, NULL, 'debit', '2020-11-17 17:37:40', '5999', 0, NULL, '2020-11-20 18:24:22', '2020-12-07 13:00:26'),
(7302, 166, NULL, 0, '021109CH', '00424005789020C', 'ANGLESEY FOOD DP', '96582525889600', 25889600, NULL, NULL, 'debit', '2020-11-21 16:23:20', '5999', 0, NULL, '2020-11-23 00:10:02', '2020-12-07 13:00:26'),
(7626, 166, NULL, 0, '196108C6', '0040100000401C6', 'PAYMO POPOLNENIE HUMO', '9368396368460', 6368460, NULL, NULL, 'debit', '2020-11-23 18:20:05', '5999', 0, NULL, '2020-11-23 18:30:03', '2020-12-07 13:00:26'),
(7671, 166, NULL, 0, '196108C6', '0040100000401C6', 'PAYMO POPOLNENIE HUMO', '7167512646000', 2646000, NULL, NULL, 'debit', '2020-11-23 18:23:16', '5999', 0, NULL, '2020-11-23 20:43:11', '2020-12-07 13:00:26'),
(7688, 166, NULL, 0, '196101CU', '00401000004013X', 'P2P ALOQABANK PAYMOUZ', '67235915000000', 15000000, NULL, NULL, 'debit', '2020-11-24 18:54:15', '5999', 0, NULL, '2020-11-24 19:00:36', '2020-12-07 13:00:26'),
(7699, 166, NULL, 0, '196101CV', '00401000004013Y', 'P2P BOSHQA BANK PAYMO', '857894500000', 500000, NULL, NULL, 'credit', '2020-11-24 19:56:55', '5999', 0, NULL, '2020-11-24 20:40:03', '2020-12-07 13:00:26'),
(7700, 166, NULL, 0, '196104ON', '00401000004016Y', 'PAYNET -PAYMO.UZ', '397886100000', 100000, NULL, NULL, 'debit', '2020-11-24 20:02:11', '5999', 0, NULL, '2020-11-24 20:40:03', '2020-12-07 13:00:26'),
(7701, 166, NULL, 0, '196104ON', '00401000004016Y', 'PAYNET -PAYMO.UZ', '215176200000', 200000, NULL, NULL, 'debit', '2020-11-24 20:03:54', '5999', 0, NULL, '2020-11-24 20:40:03', '2020-12-07 13:00:26'),
(8535, 166, NULL, 0, '17114831', '011010049804801', 'OOOMURODILLA AND ABDULLA B', '1225112800000', 2800000, NULL, NULL, 'debit', '2020-11-25 22:17:01', '5999', 0, NULL, '2020-11-25 23:10:02', '2020-12-07 13:00:26'),
(8857, 166, NULL, 0, '196101CV', '00401000004013Y', 'P2P BOSHQA BANK PAYMO', '3282853000000', 3000000, NULL, NULL, 'credit', '2020-11-26 16:47:40', '5999', 0, NULL, '2020-11-26 17:20:02', '2020-12-07 13:00:26'),
(9215, 166, NULL, 0, '196104NC', '004010080868202', 'OOO \"NATIONAL INNOVATIVE PA', '73936650000', 50000, NULL, NULL, 'debit', '2020-11-27 12:45:47', '5999', 1, '2020-11-27 12:46:02', '2020-11-27 13:00:03', '2020-12-07 13:00:26'),
(9299, 166, NULL, 0, '196104NC', '004010080868202', 'OOO \"NATIONAL INNOVATIVE PA', '61351550000', 50000, NULL, NULL, 'debit', '2020-11-27 16:21:16', '5999', 1, '2020-11-27 16:21:57', '2020-11-27 16:30:02', '2020-12-07 13:00:26'),
(9311, 166, NULL, 0, '196104NC', '004010080868202', 'OOO \"NATIONAL INNOVATIVE PA', '99745150000', 50000, NULL, NULL, 'debit', '2020-11-27 16:46:07', '5999', 1, '2020-11-27 16:46:33', '2020-11-27 17:00:02', '2020-12-07 13:00:26'),
(9321, 166, NULL, 0, '196104NC', '004010080868202', 'OOO \"NATIONAL INNOVATIVE PA', '41821350000', 50000, NULL, NULL, 'debit', '2020-11-27 16:47:00', '5999', 1, '2020-11-27 16:55:45', '2020-11-27 17:20:03', '2020-12-07 13:00:26'),
(9322, 166, NULL, 0, '196104NC', '004010080868202', 'OOO \"NATIONAL INNOVATIVE PA', '55526950000', 50000, NULL, NULL, 'debit', '2020-11-27 16:55:27', '5999', 1, '2020-11-27 16:56:02', '2020-11-27 17:20:03', '2020-12-07 13:00:26'),
(9325, 166, NULL, 0, '196104NC', '004010080868202', 'OOO \"NATIONAL INNOVATIVE PA', '66264350000', 50000, NULL, NULL, 'debit', '2020-11-27 16:58:27', '5999', 1, '2020-11-27 17:46:49', '2020-11-27 17:20:03', '2020-12-07 13:00:26'),
(9326, 166, NULL, 0, '196104NC', '004010080868202', 'OOO \"NATIONAL INNOVATIVE PA', '44465750000', 50000, NULL, NULL, 'debit', '2020-11-27 16:59:00', '5999', 1, '2020-11-27 17:47:10', '2020-11-27 17:20:03', '2020-12-07 13:00:26'),
(18198, 166, NULL, 0, '196104ON', '00401000004016Y', 'PAYNET -PAYMO.UZ', '579433500000', 500000, NULL, NULL, 'debit', '2020-12-03 21:30:05', '5999', 0, NULL, '2020-12-03 21:50:02', '2020-12-07 13:00:26'),
(18199, 166, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH., \"ORIENT FINAN', '868891314060', 314060, NULL, NULL, 'credit', '2020-12-03 21:30:56', '5999', 0, NULL, '2020-12-03 21:50:02', '2020-12-07 13:00:26'),
(22707, 333, NULL, 0, '271100E0', '010710089074501', 'XK ORIENT FOOD', '764677500000', 500000, NULL, NULL, 'debit', '2020-12-16 14:15:14', '4900', 0, NULL, '2020-12-16 14:30:03', NULL),
(23464, 333, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH., \"ORIENT FINAN', '135526500000', 500000, NULL, NULL, 'credit', '2020-12-18 17:09:42', '5999', 0, NULL, '2020-12-18 17:30:03', NULL),
(27536, 333, NULL, 0, '276103Q6', '01071000010711P', 'TOSHKENT SH., \"ORIENT FINAN', '747546100000', 100000, NULL, NULL, 'credit', '2021-01-15 11:47:16', '5999', 0, NULL, '2021-01-15 12:10:03', NULL),
(32743, 166, NULL, 0, '196101CV', '00401000004013Y', 'P2P BOSHQA BANK PAYMO', '352237500000', 500000, NULL, NULL, 'credit', '2020-12-17 17:30:06', '5999', 0, NULL, '2021-02-02 21:44:15', NULL),
(32864, 166, NULL, 0, '276105UE', '01071000010712Z', 'POPOLNENIE', '36961229500000', 29500000, NULL, NULL, 'credit', '2021-02-03 05:08:44', '5999', 0, NULL, '2021-02-03 05:30:02', '2021-02-05 00:56:18'),
(33023, 166, NULL, 0, '196108C6', '0040100000401C6', 'XK ORIENT FOOD', '795498100', 100, NULL, NULL, 'debit', '2021-02-03 14:46:48', '5999', 1, '2021-02-03 14:49:39', '2021-02-03 15:10:02', '2021-02-11 14:00:03'),
(33037, 166, NULL, 0, '2761054', '01071000010712S', 'TOSHKENT SH., \"ORIENT FINAN', '659633100', 100, NULL, NULL, 'credit', '2021-02-03 15:38:43', '5999', 0, NULL, '2021-02-03 15:50:01', '2021-02-05 00:54:43'),
(36869, 333, NULL, 0, '276103Q6', '01071000010711P', 'TOSHKENT SH., \"ORIENT FINAN', '89759780000000', 80000000, NULL, NULL, 'credit', '2021-02-09 15:50:08', '5999', 0, NULL, '2021-02-09 16:20:03', NULL),
(36870, 333, NULL, 0, '276103Q6', '01071000010711P', 'TOSHKENT SH., \"ORIENT FINAN', '842165200000000', 200000000, NULL, NULL, 'credit', '2021-02-09 15:51:50', '5999', 0, NULL, '2021-02-09 16:20:03', NULL),
(36871, 333, NULL, 0, '276103N9', '01071000010711L', 'ORIENT FINANS KHAT BANKI', '31931640000000', 40000000, NULL, NULL, 'debit', '2021-02-09 15:54:59', '5999', 0, NULL, '2021-02-09 16:20:03', NULL),
(36872, 333, NULL, 0, '272105WJ', '01071000010713D', 'ORIENT FINANS', '748677240000000', 240000000, NULL, NULL, 'debit', '2021-02-09 16:03:38', '6010', 0, NULL, '2021-02-09 16:20:03', NULL),
(39163, 166, NULL, 0, '0411018I', '009690070366801', 'XK \"RAYHON LAZZATLI TAOM\"', '2125519724000', 9724000, NULL, NULL, 'debit', '2021-02-11 13:43:58', '5812', 0, NULL, '2021-02-11 14:00:03', NULL),
(39936, 333, NULL, 0, '276103N9', '01071000010711L', 'ORIENT FINANS KHAT BANKI', '897756100000', 100000, NULL, NULL, 'debit', '2021-02-12 10:19:34', '5999', 0, NULL, '2021-02-12 10:40:03', NULL),
(39976, 333, NULL, 0, '276103Q6', '01071000010711P', 'TOSHKENT SH., \"ORIENT FINAN', '6719892500000', 2500000, NULL, NULL, 'credit', '2021-02-12 12:22:19', '5999', 0, NULL, '2021-02-12 12:50:03', NULL),
(39977, 333, NULL, 0, '271100E0', '010710089074501', 'XK ORIENT FOOD', '1134421300000', 1300000, NULL, NULL, 'debit', '2021-02-12 12:30:12', '4900', 0, NULL, '2021-02-12 12:50:03', NULL),
(40066, 166, NULL, 0, '196109MS', '0040100000401DS', 'POPOLNENIE', '13374610500000', 10500000, NULL, NULL, 'credit', '2021-02-25 06:47:10', '5999', 0, NULL, '2021-03-05 15:30:02', NULL),
(40067, 166, NULL, 0, '087A0506', '00820000008200I', 'TOSHKENT SH., AT KHALK BANK', '41356210000000', 10000000, NULL, NULL, 'debit', '2021-02-25 06:47:53', '6011', 0, NULL, '2021-03-05 15:30:02', NULL),
(40068, 333, NULL, 0, '276103N9', '01071000010711L', 'ORIENT FINANS KHAT BANKI', '3135531210200', 1210200, NULL, NULL, 'debit', '2021-02-12 18:22:51', '5999', 0, NULL, '2021-03-05 15:30:03', NULL),
(40069, 333, NULL, 0, '', '', '', '0000003000000', 3000000, NULL, NULL, 'credit', '2021-02-26 12:25:46', '', 0, NULL, '2021-03-05 15:30:03', NULL),
(40070, 333, NULL, 0, '271100E0', '010710089074501', 'XK ORIENT FOOD', '2916392300000', 2300000, NULL, NULL, 'debit', '2021-02-26 12:29:14', '4900', 0, NULL, '2021-03-05 15:30:03', NULL),
(40071, 333, NULL, 0, '', '', '', '000000500000', 500000, NULL, NULL, 'credit', '2021-02-26 12:42:58', '', 0, NULL, '2021-03-05 15:30:03', NULL),
(40072, 333, NULL, 0, '271100E0', '010710089074501', 'XK ORIENT FOOD', '8646421200000', 1200000, NULL, NULL, 'debit', '2021-02-26 12:47:26', '4900', 0, NULL, '2021-03-05 15:30:03', NULL),
(40349, 598, NULL, 0, '25610013', '009810000098137', 'OOO MAROQAND', '34368850000', 50000, NULL, NULL, 'debit', '2021-03-06 13:19:59', '5999', 0, NULL, '2021-03-06 13:40:04', NULL),
(40607, 598, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH., \"ORIENT FINAN', '86684240000', 40000, NULL, NULL, 'credit', '2021-03-07 05:09:05', '5999', 0, NULL, '2021-03-07 05:20:04', NULL),
(42402, 598, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '741387140000', 140000, NULL, NULL, 'debit', '2021-03-15 10:07:50', '5999', 0, NULL, '2021-03-15 10:20:10', NULL),
(42403, 598, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '347786140000', 140000, NULL, NULL, 'credit', '2021-03-16 05:18:57', '5999', 0, NULL, '2021-03-16 05:30:05', NULL),
(42440, 591, NULL, 0, '041108PH', '004170096610502', 'SP MUQIMIY BARAKA', '5672112400000', 2400000, NULL, NULL, 'debit', '2021-03-16 11:20:51', '5999', 0, NULL, '2021-03-16 11:40:07', NULL),
(42560, 598, NULL, 0, '25610013', '009810000098137', 'OOO MAROQAND', '317293100000', 100000, NULL, NULL, 'debit', '2021-03-17 01:57:35', '5999', 0, NULL, '2021-03-17 02:20:06', NULL),
(42561, 598, NULL, 0, '2561001G', '00981000009810W', 'UPAY P2P c HUMO na HUMO', '64522740000', 40000, NULL, NULL, 'credit', '2021-03-17 02:03:02', '5999', 0, NULL, '2021-03-17 02:20:06', NULL),
(42577, 591, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '7361611399500', 1399500, NULL, NULL, 'credit', '2021-03-17 05:08:53', '5999', 0, NULL, '2021-03-17 05:30:05', NULL),
(42580, 598, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '32925560000', 60000, NULL, NULL, 'credit', '2021-03-17 05:08:54', '5999', 0, NULL, '2021-03-17 05:30:06', NULL),
(42749, 692, NULL, 0, '12610J58', '00450000004500E', 'P2P HUMO UZCARD', '65248779100000', 79100000, NULL, NULL, 'credit', '2021-03-19 15:03:09', '5999', 0, NULL, '2021-03-19 15:20:10', NULL),
(43586, 692, NULL, 0, '1961002A', '004010407483802', 'OAJ OZBEKTELEKOM AK UzMob', '5932751500000', 1500000, NULL, NULL, 'debit', '2021-03-25 11:04:57', '5999', 0, NULL, '2021-03-25 11:30:07', NULL),
(43608, 692, NULL, 0, '196109UM', '0040100000401E8', 'C2C PAYNET POPOLNENIE', '75523240000000', 40000000, NULL, NULL, 'credit', '2021-03-25 20:11:54', '5999', 0, NULL, '2021-03-25 20:30:11', NULL),
(43718, 692, NULL, 0, '1961086H', '0040100000401C3', 'CLICK P2P2UZCARD', '847241505000', 505000, NULL, NULL, 'debit', '2021-03-26 14:48:13', '5999', 0, NULL, '2021-03-26 15:00:09', NULL),
(43725, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '17128740320000', 40320000, NULL, NULL, 'debit', '2021-03-26 17:42:13', '5999', 0, NULL, '2021-03-26 17:50:08', NULL),
(43848, 692, NULL, 0, '1961086H', '0040100000401C3', 'CLICK P2P2UZCARD', '9546658080000', 8080000, NULL, NULL, 'debit', '2021-03-27 14:08:23', '5999', 0, NULL, '2021-03-27 14:20:07', NULL),
(43862, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '19285968544000', 68544000, NULL, NULL, 'debit', '2021-03-27 16:43:55', '5999', 0, NULL, '2021-03-27 17:10:07', NULL),
(43956, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '653712140000', 140000, NULL, NULL, 'debit', '2021-03-28 08:19:12', '5999', 0, NULL, '2021-03-28 08:40:09', NULL),
(44050, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '19285968000000', 68000000, NULL, NULL, 'debit', '2021-03-27 16:43:55', '5999', 0, NULL, '2021-03-28 17:00:08', NULL),
(44084, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '168987140000', 140000, NULL, NULL, 'debit', '2021-03-28 19:23:29', '5999', 0, NULL, '2021-03-28 19:40:10', NULL),
(44253, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '661614140000', 140000, NULL, NULL, 'debit', '2021-03-29 09:22:34', '5999', 0, NULL, '2021-03-29 09:40:10', NULL),
(44294, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '695687140000', 140000, NULL, NULL, 'debit', '2021-03-29 12:37:25', '5999', 0, NULL, '2021-03-29 13:00:09', NULL),
(44381, 718, NULL, 0, '0111639R', '004190095763812', 'MCHJ NAZOKAT EXCLUSIVE GOLD', '9493781000000', 1000000, NULL, NULL, 'debit', '2021-03-29 19:57:26', '5999', 0, NULL, '2021-03-29 20:20:10', NULL),
(44390, 718, NULL, 0, '1511008Z', '011540503481201', 'FIRDAVS EMERALD INVEST MCHJ', '677697300000', 300000, NULL, NULL, 'debit', '2021-03-29 20:42:05', '5999', 0, NULL, '2021-03-29 21:00:10', NULL),
(44678, 680, NULL, 0, '12110R2M', '004510508696502', 'FOODS BUSINESS YSD', '2885766200000', 6200000, NULL, NULL, 'debit', '2021-03-30 13:55:00', '5999', 0, NULL, '2021-03-30 14:20:06', NULL),
(44792, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '429557140000', 140000, NULL, NULL, 'debit', '2021-03-30 17:01:05', '5999', 0, NULL, '2021-03-30 17:20:09', NULL),
(44823, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '698494140000', 140000, NULL, NULL, 'debit', '2021-03-30 18:41:02', '5999', 0, NULL, '2021-03-30 19:00:09', NULL),
(44856, 692, NULL, 0, '236102J0', '00996000009960F', 'PAYME', '14422942500000', 42500000, NULL, NULL, 'credit', '2021-03-30 20:30:04', '5999', 0, NULL, '2021-03-30 20:50:08', NULL),
(44863, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '27466340320000', 40320000, NULL, NULL, 'debit', '2021-03-30 20:46:39', '5999', 0, NULL, '2021-03-30 21:10:09', NULL),
(44873, 692, NULL, 0, '1961002A', '004010407483802', 'OAJ OZBEKTELEKOM AK UzMob', '2657562000000', 2000000, NULL, NULL, 'debit', '2021-03-30 21:15:40', '5999', 0, NULL, '2021-03-30 21:40:09', NULL),
(44985, 680, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '3488136200000', 6200000, NULL, NULL, 'credit', '2021-03-31 05:08:37', '5999', 0, NULL, '2021-03-31 05:20:06', NULL),
(45171, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '569566140000', 140000, NULL, NULL, 'debit', '2021-03-31 13:49:05', '5999', 0, NULL, '2021-03-31 14:00:10', NULL),
(45175, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '27466340000000', 40000000, NULL, NULL, 'debit', '2021-03-30 20:46:39', '5999', 0, NULL, '2021-03-31 14:30:08', NULL),
(45237, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '197741140000', 140000, NULL, NULL, 'debit', '2021-03-31 17:15:18', '5999', 0, NULL, '2021-03-31 18:00:22', NULL),
(45274, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '699263140000', 140000, NULL, NULL, 'debit', '2021-03-31 19:13:37', '5999', 0, NULL, '2021-03-31 19:30:07', NULL),
(45314, 692, NULL, 0, '1961002A', '004010407483802', 'OAJ OZBEKTELEKOM AK UzMob', '859115300000', 300000, NULL, NULL, 'debit', '2021-03-31 20:50:08', '5999', 0, NULL, '2021-03-31 21:10:09', NULL),
(45316, 718, NULL, 0, '271105NN', '01115002889088O', 'MCHJ DARVOZA SAVDO', '525462868000', 868000, NULL, NULL, 'debit', '2021-03-31 20:47:55', '5311', 0, NULL, '2021-03-31 21:10:10', NULL),
(45351, 598, NULL, 0, '25610013', '009810000098137', 'OOO MAROQAND', '233469250000', 250000, NULL, NULL, 'debit', '2021-03-21 19:53:21', '5999', 0, NULL, '2021-04-01 00:20:05', NULL),
(45352, 598, NULL, 0, '2561001Y', '00981000009811O', 'HUMO Account2Card', '4674961040490', 1040490, NULL, NULL, 'credit', '2021-03-27 19:40:20', '5999', 1, '2021-03-27 19:42:49', '2021-04-01 00:20:05', '2021-04-10 14:10:04'),
(45495, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '358345140000', 140000, NULL, NULL, 'debit', '2021-03-30 09:49:57', '5999', 0, NULL, '2021-04-01 06:10:10', NULL),
(45496, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '557648140000', 140000, NULL, NULL, 'debit', '2021-03-31 09:26:29', '5999', 0, NULL, '2021-04-01 06:10:10', NULL),
(46183, 725, NULL, 0, '19610314', '004010097132502', 'MCHJ UNITEL PAYME', '332869700000', 700000, NULL, NULL, 'debit', '2021-04-01 18:42:52', '5999', 0, NULL, '2021-04-01 19:00:22', NULL),
(47365, 728, NULL, 0, '276103Q6', '01071000010711P', 'TOSHKENT SH ORIENT FINAN', '29934250000000', 50000000, NULL, NULL, 'debit', '2021-04-01 17:49:45', '5999', 0, NULL, '2021-04-02 10:10:12', NULL),
(47366, 728, NULL, 0, '276103Q6', '01071000010711P', 'TOSHKENT SH ORIENT FINAN', '96797515800000', 15800000, NULL, NULL, 'debit', '2021-04-01 18:36:02', '5999', 0, NULL, '2021-04-02 10:10:12', NULL),
(47367, 728, NULL, 0, '276103Q6', '01071000010711P', 'TOSHKENT SH ORIENT FINAN', '56345350000000', 50000000, NULL, NULL, 'debit', '2021-04-01 20:01:49', '5999', 0, NULL, '2021-04-02 10:10:12', NULL),
(47624, 728, NULL, 0, '276103WS', '01071000010711T', 'TOSHKENT SH ORIENT FINAN', '22427910000000', 10000000, NULL, NULL, 'debit', '2021-04-02 12:22:47', '5999', 0, NULL, '2021-04-02 12:50:11', NULL),
(47679, 718, NULL, 0, '196106G0', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '521281140000', 140000, NULL, NULL, 'debit', '2021-04-02 13:11:09', '5999', 0, NULL, '2021-04-02 13:30:11', NULL),
(47698, 718, NULL, 0, '1961002A', '004010407483802', 'OAJ OZBEKTELEKOM AK UzMob', '997128800000', 800000, NULL, NULL, 'debit', '2021-04-02 13:39:50', '5999', 0, NULL, '2021-04-02 14:00:10', NULL),
(47737, 728, NULL, 0, '276103WQ', '01071000010711R', 'TOSHKENT SH ORIENT FINAN', '583316280395000', 280395000, NULL, NULL, 'debit', '2021-04-02 14:39:24', '5999', 0, NULL, '2021-04-02 15:00:11', NULL),
(47824, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '147458140000', 140000, NULL, NULL, 'debit', '2021-04-02 17:08:26', '5999', 0, NULL, '2021-04-02 17:40:08', NULL),
(47826, 728, NULL, 0, '236104XS', '009960492427509', 'INSPIRED MCHJ QK', '19387710000000', 10000000, NULL, NULL, 'debit', '2021-04-02 17:12:53', '5999', 0, NULL, '2021-04-02 17:40:09', NULL),
(47827, 728, NULL, 0, '236104XS', '009960492427509', 'INSPIRED MCHJ QK', '43526810000000', 10000000, NULL, NULL, 'debit', '2021-04-02 17:13:11', '5999', 0, NULL, '2021-04-02 17:40:09', NULL),
(47890, 718, NULL, 0, '236102J0', '00996000009960F', 'PAYME', '54188710000000', 10000000, NULL, NULL, 'credit', '2021-04-02 19:07:42', '5999', 0, NULL, '2021-04-02 19:20:09', NULL),
(47912, 718, NULL, 0, '2461001A', '009800510897301', 'OOO HUMANS', '9986821500000', 1500000, NULL, NULL, 'debit', '2021-04-02 19:32:55', '5999', 0, NULL, '2021-04-02 19:50:11', NULL),
(47948, 718, NULL, 0, '0111639R', '004190095763812', 'MCHJ NAZOKAT EXCLUSIVE GOLD', '722668700000', 700000, NULL, NULL, 'debit', '2021-04-02 20:23:43', '5999', 0, NULL, '2021-04-02 20:40:08', NULL),
(47954, 718, NULL, 0, '1511008Z', '011540503481201', 'FIRDAVS EMERALD INVEST MCHJ', '495257100000', 100000, NULL, NULL, 'debit', '2021-04-02 20:40:12', '5999', 0, NULL, '2021-04-02 20:50:09', NULL),
(47979, 728, NULL, 0, '276103WQ', '01071000010711R', 'TOSHKENT SH ORIENT FINAN', '32883820100000', 20100000, NULL, NULL, 'debit', '2021-04-02 20:58:32', '5999', 0, NULL, '2021-04-02 21:20:11', NULL),
(47989, 692, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '56136880000000', 80000000, NULL, NULL, 'credit', '2021-04-02 21:26:44', '5999', 0, NULL, '2021-04-02 21:40:08', NULL),
(48359, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '8144143500000', 3500000, NULL, NULL, 'debit', '2021-04-03 07:23:45', '5999', 0, NULL, '2021-04-03 07:50:10', NULL),
(48414, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '5743323500000', 3500000, NULL, NULL, 'debit', '2021-04-03 09:01:06', '5999', 0, NULL, '2021-04-03 09:20:10', NULL),
(48463, 728, NULL, 0, '021102ML', '004400451123215', 'OOO DIYOR BIZNES', '9214563630000', 3630000, NULL, NULL, 'debit', '2021-04-03 10:23:51', '5999', 0, NULL, '2021-04-03 10:40:10', NULL),
(48506, 728, NULL, 0, '121109JP', '004310020784238', 'ANGLESEY FOOD SHEDEVR', '31182916835000', 16835000, NULL, NULL, 'debit', '2021-04-03 11:25:14', '5411', 0, NULL, '2021-04-03 11:50:10', NULL),
(48553, 718, NULL, 0, '196105SZ', '004010015526802', 'OZBEKISTON TELEKOMMTARMOQL', '1959354900000', 4900000, NULL, NULL, 'debit', '2021-04-03 12:54:00', '5999', 0, NULL, '2021-04-03 13:10:09', NULL),
(48580, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '2449583500000', 3500000, NULL, NULL, 'debit', '2021-04-03 13:33:29', '5999', 0, NULL, '2021-04-03 13:50:10', NULL),
(48635, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '6724133500000', 3500000, NULL, NULL, 'debit', '2021-04-03 15:04:51', '5999', 0, NULL, '2021-04-03 15:20:10', NULL),
(48636, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '5145553500000', 3500000, NULL, NULL, 'debit', '2021-04-03 15:08:04', '5999', 0, NULL, '2021-04-03 15:20:10', NULL),
(48651, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '4692493500000', 3500000, NULL, NULL, 'debit', '2021-04-03 15:15:07', '5999', 0, NULL, '2021-04-03 15:40:10', NULL),
(48658, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '5363583500000', 3500000, NULL, NULL, 'debit', '2021-04-03 15:40:34', '5999', 0, NULL, '2021-04-03 15:50:11', NULL),
(48689, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '9218613500000', 3500000, NULL, NULL, 'debit', '2021-04-03 16:19:15', '5999', 0, NULL, '2021-04-03 16:40:11', NULL),
(48690, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '6493623500000', 3500000, NULL, NULL, 'debit', '2021-04-03 16:26:04', '5999', 0, NULL, '2021-04-03 16:40:11', NULL),
(48698, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '6367233500000', 3500000, NULL, NULL, 'debit', '2021-04-03 16:31:46', '5999', 0, NULL, '2021-04-03 16:50:13', NULL),
(48744, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '5462373500000', 3500000, NULL, NULL, 'debit', '2021-04-03 17:22:24', '5999', 0, NULL, '2021-04-03 18:10:10', NULL),
(48745, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '4473253500000', 3500000, NULL, NULL, 'debit', '2021-04-03 17:46:58', '5999', 0, NULL, '2021-04-03 18:10:10', NULL),
(48746, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '6746733500000', 3500000, NULL, NULL, 'debit', '2021-04-03 17:49:31', '5999', 0, NULL, '2021-04-03 18:10:10', NULL),
(48747, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '2851573500000', 3500000, NULL, NULL, 'debit', '2021-04-03 17:52:12', '5999', 0, NULL, '2021-04-03 18:10:10', NULL),
(48748, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '9564133500000', 3500000, NULL, NULL, 'debit', '2021-04-03 17:53:49', '5999', 0, NULL, '2021-04-03 18:10:10', NULL),
(48749, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '4412773500000', 3500000, NULL, NULL, 'debit', '2021-04-03 17:55:48', '5999', 0, NULL, '2021-04-03 18:10:10', NULL),
(48750, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '1748753500000', 3500000, NULL, NULL, 'debit', '2021-04-03 17:57:08', '5999', 0, NULL, '2021-04-03 18:10:10', NULL),
(48773, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '3219643500000', 3500000, NULL, NULL, 'debit', '2021-04-03 18:00:52', '5999', 0, NULL, '2021-04-03 18:30:11', NULL),
(48774, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '2295413500000', 3500000, NULL, NULL, 'debit', '2021-04-03 18:03:11', '5999', 0, NULL, '2021-04-03 18:30:11', NULL),
(48775, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '7561373500000', 3500000, NULL, NULL, 'debit', '2021-04-03 18:05:13', '5999', 0, NULL, '2021-04-03 18:30:11', NULL),
(48776, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '2125983500000', 3500000, NULL, NULL, 'debit', '2021-04-03 18:08:01', '5999', 0, NULL, '2021-04-03 18:30:11', NULL),
(48880, 718, NULL, 0, '1961086H', '0040100000401C3', 'CLICK P2P2UZCARD', '2217573030000', 3030000, NULL, NULL, 'debit', '2021-04-03 20:02:50', '5999', 0, NULL, '2021-04-03 20:30:10', NULL),
(48881, 718, NULL, 0, '0111639R', '004190095763812', 'MCHJ NAZOKAT EXCLUSIVE GOLD', '5114561600000', 1600000, NULL, NULL, 'debit', '2021-04-03 20:11:48', '5999', 0, NULL, '2021-04-03 20:30:10', NULL),
(48987, 728, NULL, 0, '25111011', '011220043268101', 'MCHJ GIJDUVON TANSIQ TAOMLA', '44926712300000', 12300000, NULL, NULL, 'debit', '2021-04-03 21:55:46', '5999', 0, NULL, '2021-04-03 22:10:10', NULL),
(49044, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '256599100000', 100000, NULL, NULL, 'debit', '2021-04-03 23:18:42', '5999', 0, NULL, '2021-04-03 23:30:10', NULL),
(49059, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '577645200000', 200000, NULL, NULL, 'debit', '2021-04-03 23:20:39', '5999', 0, NULL, '2021-04-03 23:50:11', NULL),
(49060, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '789319200000', 200000, NULL, NULL, 'debit', '2021-04-03 23:23:01', '5999', 0, NULL, '2021-04-03 23:50:11', NULL),
(49061, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '756775200000', 200000, NULL, NULL, 'debit', '2021-04-03 23:26:03', '5999', 0, NULL, '2021-04-03 23:50:11', NULL),
(49062, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '957749200000', 200000, NULL, NULL, 'debit', '2021-04-03 23:30:03', '5999', 0, NULL, '2021-04-03 23:50:11', NULL),
(49063, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '162947200000', 200000, NULL, NULL, 'debit', '2021-04-03 23:32:02', '5999', 0, NULL, '2021-04-03 23:50:11', NULL),
(49064, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '589845200000', 200000, NULL, NULL, 'debit', '2021-04-03 23:34:03', '5999', 0, NULL, '2021-04-03 23:50:11', NULL),
(49200, 692, NULL, 0, '1961086H', '0040100000401C3', 'CLICK P2P2UZCARD', '12348410100000', 10100000, NULL, NULL, 'debit', '2021-04-04 01:24:09', '5999', 0, NULL, '2021-04-04 01:50:09', NULL),
(49852, 725, NULL, 0, '1961015E', '004010407483809', 'OAJ  OZBEKTELEKOM PAYME', '8621561500000', 1500000, NULL, NULL, 'debit', '2021-04-04 13:35:26', '5999', 0, NULL, '2021-04-04 14:00:11', NULL),
(49961, 725, NULL, 0, '1961081K', '00401040748384D', 'OAJ  OZBEKTELEKOM AK', '8481322500000', 2500000, NULL, NULL, 'debit', '2021-04-04 15:17:54', '5999', 0, NULL, '2021-04-04 15:40:10', NULL),
(50208, 728, NULL, 0, '1011825B', '009740512375901', 'SP OOO TATNEFTUNG', '63385662000000', 62000000, NULL, NULL, 'debit', '2021-04-04 18:42:04', '5999', 0, NULL, '2021-04-04 19:00:11', NULL),
(50379, 728, NULL, 0, '276103WQ', '01071000010711R', 'TOSHKENT SH ORIENT FINAN', '166211255310200', 255310200, NULL, NULL, 'debit', '2021-04-04 22:57:44', '5999', 0, NULL, '2021-04-04 23:20:10', NULL),
(51275, 718, NULL, 0, '196106G0', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '187517140000', 140000, NULL, NULL, 'debit', '2021-04-05 17:51:27', '5999', 0, NULL, '2021-04-05 18:00:09', NULL),
(51399, 728, NULL, 0, '25111011', '011220043268101', 'MCHJ GIJDUVON TANSIQ TAOMLA', '96633111500000', 11500000, NULL, NULL, 'debit', '2021-04-05 20:29:41', '5999', 0, NULL, '2021-04-05 20:50:09', NULL),
(51490, 728, NULL, 0, '276103WQ', '01071000010711R', 'TOSHKENT SH ORIENT FINAN', '24598822311000', 22311000, NULL, NULL, 'debit', '2021-04-05 23:02:33', '5999', 0, NULL, '2021-04-05 23:20:10', NULL),
(52048, 718, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '15426550000000', 50000000, NULL, NULL, 'credit', '2021-04-06 14:12:32', '5999', 0, NULL, '2021-04-06 14:30:10', NULL),
(52144, 728, NULL, 0, '276103NA', '01071000010711M', 'ORIENT FINANS KHAT BANKI', '86688510510000', 10510000, NULL, NULL, 'debit', '2021-04-06 16:05:29', '5999', 0, NULL, '2021-04-06 16:40:11', NULL),
(52192, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '861257140000', 140000, NULL, NULL, 'debit', '2021-04-06 17:43:40', '5999', 0, NULL, '2021-04-06 18:10:08', NULL),
(52217, 718, NULL, 0, '12110TMN', '00431005789026O', 'IP OOO ANGLESEY FOOD', '5552222823000', 2823000, NULL, NULL, 'debit', '2021-04-06 18:26:21', '5999', 0, NULL, '2021-04-06 18:50:08', NULL),
(52218, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '459722140000', 140000, NULL, NULL, 'debit', '2021-04-06 18:35:48', '5999', 0, NULL, '2021-04-06 18:50:08', NULL),
(52310, 718, NULL, 0, '0111639R', '004190095763812', 'MCHJ NAZOKAT EXCLUSIVE GOLD', '1457981100000', 1100000, NULL, NULL, 'debit', '2021-04-06 20:44:34', '5999', 0, NULL, '2021-04-06 21:10:09', NULL),
(52383, 718, NULL, 0, '1961086H', '0040100000401C3', 'CLICK P2P2UZCARD', '5247959797000', 9797000, NULL, NULL, 'debit', '2021-04-06 22:54:49', '5999', 0, NULL, '2021-04-06 23:10:10', NULL),
(52477, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '242473100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:23:22', '5999', 0, NULL, '2021-04-07 01:40:09', NULL),
(52478, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '533915100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:25:39', '5999', 0, NULL, '2021-04-07 01:40:09', NULL),
(52479, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '573926100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:26:57', '5999', 0, NULL, '2021-04-07 01:40:09', NULL),
(52480, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '193953100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:27:57', '5999', 0, NULL, '2021-04-07 01:40:09', NULL),
(52481, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '926897100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:29:17', '5999', 0, NULL, '2021-04-07 01:40:09', NULL),
(52502, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '227891100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:34:20', '5999', 0, NULL, '2021-04-07 02:00:09', NULL),
(52503, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '339291100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:35:39', '5999', 0, NULL, '2021-04-07 02:00:09', NULL),
(52504, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '861512100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:38:20', '5999', 0, NULL, '2021-04-07 02:00:09', NULL),
(52505, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '653592100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:39:39', '5999', 0, NULL, '2021-04-07 02:00:09', NULL),
(52506, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '567779100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:41:42', '5999', 0, NULL, '2021-04-07 02:00:09', NULL),
(52517, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '784611100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:46:00', '5999', 0, NULL, '2021-04-07 02:10:09', NULL),
(52518, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '392585100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:46:44', '5999', 0, NULL, '2021-04-07 02:10:09', NULL),
(52519, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '311524100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:49:11', '5999', 0, NULL, '2021-04-07 02:10:09', NULL),
(52520, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '446717100000', 100000, NULL, NULL, 'debit', '2021-04-07 01:50:04', '5999', 0, NULL, '2021-04-07 02:10:09', NULL),
(52823, 725, NULL, 0, '036100EF', '003940494271304', 'CLICK EWALLET HUMO', '977153500000', 500000, NULL, NULL, 'debit', '2021-04-07 07:30:15', '5999', 0, NULL, '2021-04-07 07:50:10', NULL),
(52971, 718, NULL, 0, '12710OV6', '004310000043104', 'AKADEMICHESKIY F L NB VED R', '85939320200000', 20200000, NULL, NULL, 'debit', '2021-04-07 10:07:03', '6011', 0, NULL, '2021-04-07 11:00:08', NULL),
(53036, 718, NULL, 0, '01111483', '004190027029401', 'MCHJ BEST QUALITY PRODUCTS', '2828311620000', 1620000, NULL, NULL, 'debit', '2021-04-07 11:58:31', '5999', 0, NULL, '2021-04-07 12:20:08', NULL),
(53412, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '877594100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:22:07', '5999', 0, NULL, '2021-04-08 02:40:11', NULL),
(53413, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '832658100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:24:30', '5999', 0, NULL, '2021-04-08 02:40:11', NULL),
(53414, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '464856100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:25:47', '5999', 0, NULL, '2021-04-08 02:40:11', NULL),
(53415, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '659845100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:29:08', '5999', 0, NULL, '2021-04-08 02:40:11', NULL),
(53430, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '641457100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:32:48', '5999', 0, NULL, '2021-04-08 03:00:10', NULL),
(53431, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '437718100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:34:28', '5999', 0, NULL, '2021-04-08 03:00:10', NULL),
(53432, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '398755100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:35:50', '5999', 0, NULL, '2021-04-08 03:00:10', NULL),
(53433, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '759575100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:37:29', '5999', 0, NULL, '2021-04-08 03:00:10', NULL),
(53434, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '767992100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:41:07', '5999', 0, NULL, '2021-04-08 03:00:10', NULL),
(53435, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '912161100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:43:32', '5999', 0, NULL, '2021-04-08 03:00:10', NULL),
(53436, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '128867100000', 100000, NULL, NULL, 'debit', '2021-04-08 02:44:49', '5999', 0, NULL, '2021-04-08 03:00:10', NULL),
(53527, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '487779367500000', 367500000, NULL, NULL, 'debit', '2021-04-08 04:10:32', '5999', 0, NULL, '2021-04-08 04:30:11', NULL),
(53552, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '386785100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:15:27', '5999', 0, NULL, '2021-04-08 05:30:11', NULL),
(53553, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '588957100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:17:04', '5999', 0, NULL, '2021-04-08 05:30:11', NULL),
(53554, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '469625100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:18:27', '5999', 0, NULL, '2021-04-08 05:30:11', NULL),
(53567, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '299684100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:19:49', '5999', 0, NULL, '2021-04-08 05:50:11', NULL),
(53568, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '868949100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:21:08', '5999', 0, NULL, '2021-04-08 05:50:11', NULL),
(53569, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '286592100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:25:26', '5999', 0, NULL, '2021-04-08 05:50:11', NULL),
(53570, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '152946100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:27:23', '5999', 0, NULL, '2021-04-08 05:50:11', NULL),
(53571, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '736357100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:29:27', '5999', 0, NULL, '2021-04-08 05:50:11', NULL),
(53572, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '489441100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:30:29', '5999', 0, NULL, '2021-04-08 05:50:11', NULL),
(53573, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '313841100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:32:07', '5999', 0, NULL, '2021-04-08 05:50:11', NULL),
(53584, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '677234100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:36:06', '5999', 0, NULL, '2021-04-08 06:00:11', NULL),
(53585, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '254333100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:37:46', '5999', 0, NULL, '2021-04-08 06:00:11', NULL),
(53586, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '628651100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:40:29', '5999', 0, NULL, '2021-04-08 06:00:11', NULL),
(53587, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '642854100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:42:10', '5999', 0, NULL, '2021-04-08 06:00:11', NULL),
(53588, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '512899100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:43:53', '5999', 0, NULL, '2021-04-08 06:00:11', NULL),
(53589, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '515671100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:46:51', '5999', 0, NULL, '2021-04-08 06:00:11', NULL),
(53590, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '854775100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:48:46', '5999', 0, NULL, '2021-04-08 06:00:11', NULL),
(53611, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '167116100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:51:49', '5999', 0, NULL, '2021-04-08 06:20:11', NULL),
(53612, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '253686100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:52:31', '5999', 0, NULL, '2021-04-08 06:20:11', NULL),
(53613, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '327724100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:54:10', '5999', 0, NULL, '2021-04-08 06:20:11', NULL),
(53614, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '299879100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:56:49', '5999', 0, NULL, '2021-04-08 06:20:11', NULL),
(53615, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '931618100000', 100000, NULL, NULL, 'debit', '2021-04-08 05:58:51', '5999', 0, NULL, '2021-04-08 06:20:11', NULL),
(53624, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '873223100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:05:48', '5999', 0, NULL, '2021-04-08 06:30:12', NULL),
(53625, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '362217100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:07:27', '5999', 0, NULL, '2021-04-08 06:30:12', NULL),
(53626, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '521699100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:09:12', '5999', 0, NULL, '2021-04-08 06:30:12', NULL),
(53627, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '682379100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:10:33', '5999', 0, NULL, '2021-04-08 06:30:12', NULL),
(53628, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '882975100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:11:32', '5999', 0, NULL, '2021-04-08 06:30:12', NULL),
(53629, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '524653100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:16:51', '5999', 0, NULL, '2021-04-08 06:30:12', NULL),
(53630, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '148179100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:18:32', '5999', 0, NULL, '2021-04-08 06:30:12', NULL),
(53631, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '947553100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:20:14', '5999', 0, NULL, '2021-04-08 06:30:12', NULL),
(53654, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '262846100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:21:51', '5999', 0, NULL, '2021-04-08 06:50:13', NULL),
(53655, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '472433100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:23:12', '5999', 0, NULL, '2021-04-08 06:50:13', NULL),
(53656, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '323213100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:27:11', '5999', 0, NULL, '2021-04-08 06:50:13', NULL),
(53657, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '318178100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:28:54', '5999', 0, NULL, '2021-04-08 06:50:13', NULL),
(53658, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '693473100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:31:11', '5999', 0, NULL, '2021-04-08 06:50:13', NULL),
(53659, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '724527100000', 100000, NULL, NULL, 'debit', '2021-04-08 06:33:12', '5999', 0, NULL, '2021-04-08 06:50:13', NULL),
(53930, 425, NULL, 0, '', '', '', '100000', 100000, NULL, NULL, 'credit', '2021-04-08 11:50:57', '', 0, NULL, '2021-04-08 12:00:02', NULL),
(54046, 728, NULL, 0, '236104XS', '009960492427509', 'INSPIRED MCHJ QK', '18811510000000', 10000000, NULL, NULL, 'debit', '2021-04-08 13:37:02', '5999', 0, NULL, '2021-04-08 13:50:11', NULL),
(54127, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '69276530240000', 30240000, NULL, NULL, 'debit', '2021-04-08 15:42:46', '5999', 0, NULL, '2021-04-08 16:10:07', NULL),
(54220, 657, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '6676121180000', 1180000, NULL, NULL, 'credit', '2021-03-19 05:08:50', '5999', 0, NULL, '2021-04-08 18:20:06', NULL),
(54772, 725, NULL, 0, '196102JV', '004010045791305', 'OOO COSCOM', '2921752300000', 2300000, NULL, NULL, 'debit', '2021-04-09 09:12:32', '5999', 0, NULL, '2021-04-09 09:30:10', NULL),
(54947, 718, NULL, 0, '10119AC1', '010380513202601', 'OOO STOLICHNAYA VODKA', '6594632900000', 2900000, NULL, NULL, 'debit', '2021-04-09 13:03:00', '5921', 0, NULL, '2021-04-09 13:20:09', NULL),
(55049, 735, NULL, 0, '191100U4', '010910486476002', 'MCHJ SHOX MED CENTER', '17299813000000', 13000000, NULL, NULL, 'debit', '2021-04-09 16:20:39', '4121', 0, NULL, '2021-04-09 16:40:11', NULL),
(55070, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '69276530000000', 30000000, NULL, NULL, 'debit', '2021-04-08 15:42:46', '5999', 0, NULL, '2021-04-09 17:30:07', NULL),
(55167, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '61174578750000', 78750000, NULL, NULL, 'debit', '2021-04-09 20:18:07', '5999', 0, NULL, '2021-04-09 20:40:08', NULL),
(55219, 680, NULL, 0, '25112312', '010720070680101', 'FAST MODERN BUSINESSMCHJ', '6662152000000', 2000000, NULL, NULL, 'debit', '2021-04-09 21:50:50', '5999', 0, NULL, '2021-04-09 22:10:06', NULL),
(55334, 718, NULL, 0, '0961003L', '010950000109511', 'CLICK BEELINE  ASIA ALLIANC', '7287722500000', 2500000, NULL, NULL, 'debit', '2021-04-10 00:31:23', '5999', 0, NULL, '2021-04-10 01:00:09', NULL),
(55335, 718, NULL, 0, '12110792', '008991363738801', 'OOO ASLZODA PLYUS SHOISTA', '9818151200000', 1200000, NULL, NULL, 'debit', '2021-04-10 00:32:38', '5999', 0, NULL, '2021-04-10 01:00:09', NULL),
(55495, 680, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '9511692000000', 2000000, NULL, NULL, 'credit', '2021-04-10 05:08:26', '5999', 0, NULL, '2021-04-10 05:30:06', NULL),
(55501, 735, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '67427513000000', 13000000, NULL, NULL, 'credit', '2021-04-10 05:08:26', '5999', 0, NULL, '2021-04-10 05:30:11', NULL),
(55510, 740, NULL, 0, '106100AU', '011840000118405', 'Humo P2P Beepul 03', '2269442677933', 2677933, NULL, NULL, 'debit', '2021-04-10 04:49:57', '5999', 0, NULL, '2021-04-10 05:40:12', NULL),
(56038, 730, NULL, 0, '17111901', '004210093266401', 'OOO ELIT NUR ISHONCH', '1933965455200', 5455200, NULL, NULL, 'debit', '2021-04-10 15:37:28', '5999', 0, NULL, '2021-04-10 15:50:10', NULL),
(56087, 730, NULL, 0, '17111901', '004210093266401', 'OOO ELIT NUR ISHONCH', '919134319300', 319300, NULL, NULL, 'debit', '2021-04-10 16:40:50', '5999', 0, NULL, '2021-04-10 16:50:10', NULL),
(56135, 728, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '45684578750000', 78750000, NULL, NULL, 'debit', '2021-04-10 17:37:47', '5999', 0, NULL, '2021-04-10 17:50:14', NULL),
(56177, 730, NULL, 0, '181107O8', '01074001854480J', 'AKMAL FARM MEDIKAL MCHJ', '3518862410000', 2410000, NULL, NULL, 'debit', '2021-04-10 18:12:17', '5912', 0, NULL, '2021-04-10 18:40:10', NULL),
(56178, 730, NULL, 0, '34110015', '011760023306904', 'MCHJ GAZ NEFT AVTO BENZIN 2', '22858519200000', 19200000, NULL, NULL, 'debit', '2021-04-10 18:16:38', '5992', 0, NULL, '2021-04-10 18:40:10', NULL),
(56257, 718, NULL, 0, '03111FFO', '001510428674201', 'YaTT  Otaev Gaibulla Sagd', '6951371000000', 1000000, NULL, NULL, 'debit', '2021-04-10 19:49:54', '5999', 0, NULL, '2021-04-10 20:10:08', NULL),
(56346, 668, 195, 1, '01116377', '004200425011401', 'MCHJ CHENSON', '92682529892000', 29892000, NULL, NULL, 'debit', '2021-04-10 22:07:32', '5994', 0, NULL, '2021-04-10 22:30:06', '2021-04-22 01:14:02'),
(56570, 668, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '97745429892000', 29892000, NULL, NULL, 'credit', '2021-04-11 05:08:23', '5999', 0, NULL, '2021-04-11 05:30:06', NULL),
(56835, 166, NULL, 0, '2711056P', '01115002889087W', 'MCHJ DARVOZA SAVDO M69', '9333671935000', 1935000, NULL, NULL, 'debit', '2021-04-11 12:47:19', '5311', 0, NULL, '2021-04-11 13:10:02', NULL),
(56865, 730, NULL, 0, '17111901', '004210093266401', 'OOO ELIT NUR ISHONCH', '1447665350000', 5350000, NULL, NULL, 'debit', '2021-04-11 13:41:19', '5999', 0, NULL, '2021-04-11 13:50:10', NULL),
(56936, 730, NULL, 0, '17111901', '004210093266401', 'OOO ELIT NUR ISHONCH', '8888912930000', 2930000, NULL, NULL, 'debit', '2021-04-11 15:54:48', '5999', 0, NULL, '2021-04-11 16:10:11', NULL),
(56962, 735, NULL, 0, '121109I3', '004310020784232', 'ANGLESEY FOOD QORASU', '2824113818000', 3818000, NULL, NULL, 'debit', '2021-04-11 16:38:02', '5411', 0, NULL, '2021-04-11 17:00:12', NULL),
(56978, 718, NULL, 0, '17118COU', '010670089997301', 'SP OOO HAVAS FOOD', '9861441270000', 1270000, NULL, NULL, 'debit', '2021-04-11 17:07:42', '5999', 0, NULL, '2021-04-11 17:30:08', NULL),
(57033, 718, NULL, 0, '19110BLX', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '373527140000', 140000, NULL, NULL, 'debit', '2021-04-11 18:42:10', '5999', 0, NULL, '2021-04-11 19:00:09', NULL),
(57090, 730, NULL, 0, '0173697P', '009010000090121', 'Ban t HUMO Olmazor f li ban', '38712313130000', 13130000, NULL, NULL, 'debit', '2021-04-11 20:16:08', '6011', 0, NULL, '2021-04-11 20:30:11', NULL),
(57350, 166, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '4879251535000', 1535000, NULL, NULL, 'credit', '2021-04-12 05:18:21', '5999', 0, NULL, '2021-04-12 06:20:03', NULL),
(57354, 728, NULL, 0, '276103WQ', '01071000010711R', 'TOSHKENT SH ORIENT FINAN', '786269104319000', 104319000, NULL, NULL, 'debit', '2021-04-12 00:26:09', '5999', 0, NULL, '2021-04-12 06:20:12', NULL),
(57357, 735, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '8497663818000', 3818000, NULL, NULL, 'credit', '2021-04-12 05:18:29', '5999', 0, NULL, '2021-04-12 06:20:14', NULL),
(57506, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '532124140000', 140000, NULL, NULL, 'debit', '2021-04-12 10:12:00', '5999', 0, NULL, '2021-04-12 10:50:09', NULL),
(57589, 166, NULL, 0, '2311000C', '009960428898101', 'EKONOMA', '9786688400000', 8400000, NULL, NULL, 'debit', '2021-04-12 12:48:17', '5999', 0, NULL, '2021-04-12 13:10:02', NULL),
(57623, 680, NULL, 0, '12110RTM', '004510508696503', 'FOODS BUSINESS YSD', '3264993050000', 3050000, NULL, NULL, 'debit', '2021-04-12 13:50:30', '5999', 0, NULL, '2021-04-12 14:10:06', NULL),
(57665, 718, NULL, 0, '196106G0', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '954553140000', 140000, NULL, NULL, 'debit', '2021-04-12 14:31:20', '5999', 0, NULL, '2021-04-12 15:00:09', NULL),
(57674, 718, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '92846220000000', 20000000, NULL, NULL, 'credit', '2021-04-12 14:48:57', '5999', 0, NULL, '2021-04-12 15:20:10', NULL),
(57683, 718, NULL, 0, '21110766', '008980082760601', 'XK SHAKHRUKH TRADE', '2294972950000', 2950000, NULL, NULL, 'debit', '2021-04-12 15:09:50', '5995', 0, NULL, '2021-04-12 15:30:09', NULL),
(57684, 718, NULL, 0, '1961086H', '0040100000401C3', 'CLICK P2P2UZCARD', '55117212120000', 12120000, NULL, NULL, 'debit', '2021-04-12 15:14:32', '5999', 0, NULL, '2021-04-12 15:30:09', NULL),
(57719, 730, NULL, 0, '0173697P', '009010000090121', 'Ban t HUMO Olmazor f li ban', '38712313000000', 13000000, NULL, NULL, 'debit', '2021-04-11 20:16:08', '6011', 0, NULL, '2021-04-12 16:10:10', NULL),
(57832, 733, NULL, 0, '10119C19', '010180516921101', 'OOO ODINAJAXON', '2644751430000', 1430000, NULL, NULL, 'debit', '2021-04-12 18:12:12', '5999', 0, NULL, '2021-04-12 18:30:11', NULL),
(57887, 740, NULL, 0, '10610017', '011580000115823', 'FRB KAPITALBANK epos', '7376545015000', 5015000, NULL, NULL, 'debit', '2021-04-12 19:08:07', '5999', 0, NULL, '2021-04-12 19:30:11', NULL);
INSERT INTO `multicard_transaction` (`id`, `multicard_id`, `partner_id`, `sync_with_ox`, `terminal_id`, `merchant_id`, `merchant_name`, `pc_uniq_id`, `amount`, `cashback_percent`, `cashback_amount`, `type`, `time`, `mcc`, `reversed`, `reversed_time`, `added_on`, `updated_on`) VALUES
(57998, 740, NULL, 0, '196101CQ', '00401000004013U', 'P2P PAYME', '3443231956804', 1956804, NULL, NULL, 'debit', '2021-04-12 21:01:13', '5999', 0, NULL, '2021-04-12 21:20:14', NULL),
(58091, 680, NULL, 0, '27110414', '010750473517208', 'UNG PETRO MCHJ', '97382516500000', 16500000, NULL, NULL, 'debit', '2021-04-12 22:35:08', '5999', 0, NULL, '2021-04-12 23:00:08', NULL),
(58159, 733, NULL, 0, '021103UE', '004280098147901', 'OOO HIKMAT TIJORATI', '2675511700000', 1700000, NULL, NULL, 'debit', '2021-04-12 23:50:16', '5999', 0, NULL, '2021-04-13 00:00:13', NULL),
(58384, 166, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '9789228400000', 8400000, NULL, NULL, 'credit', '2021-04-13 05:18:21', '5999', 0, NULL, '2021-04-13 05:40:01', NULL),
(58386, 680, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '29294419550000', 19550000, NULL, NULL, 'credit', '2021-04-13 05:18:25', '5999', 0, NULL, '2021-04-13 05:40:07', NULL),
(58394, 733, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '5943843130000', 3130000, NULL, NULL, 'credit', '2021-04-13 05:18:30', '5999', 0, NULL, '2021-04-13 05:40:11', NULL),
(58396, 740, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '4266131454057', 1454057, NULL, NULL, 'credit', '2021-04-13 05:18:32', '5999', 0, NULL, '2021-04-13 05:40:12', NULL),
(58840, 718, NULL, 0, '196106G0', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '889748140000', 140000, NULL, NULL, 'debit', '2021-04-13 12:40:03', '5999', 0, NULL, '2021-04-13 13:00:11', NULL),
(58872, 735, NULL, 0, '19110DB3', '010910533735602', 'MCHJ AMBROSIA GASTRO', '4486784600000', 4600000, NULL, NULL, 'debit', '2021-04-13 13:10:56', '5999', 0, NULL, '2021-04-13 13:30:11', NULL),
(58908, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '646762140000', 140000, NULL, NULL, 'debit', '2021-04-13 13:46:58', '5999', 0, NULL, '2021-04-13 14:10:10', NULL),
(58959, 718, NULL, 0, '25112234', '010720029321501', 'MCHJ SHER BIZNES KLASS', '4794262100000', 2100000, NULL, NULL, 'debit', '2021-04-13 14:35:31', '5999', 0, NULL, '2021-04-13 15:10:09', NULL),
(59009, 692, NULL, 0, '', '', '', '180000000', 180000000, NULL, NULL, 'credit', '2021-04-13 16:02:40', '', 0, NULL, '2021-04-13 16:10:07', NULL),
(59035, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '21123178750000', 78750000, NULL, NULL, 'debit', '2021-04-13 16:32:46', '5999', 0, NULL, '2021-04-13 17:00:09', NULL),
(59042, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '44522178750000', 78750000, NULL, NULL, 'debit', '2021-04-13 16:47:51', '5999', 0, NULL, '2021-04-13 17:10:07', NULL),
(59062, 718, NULL, 0, '0961003M', '010950000109513', 'CLICK UCELL M73', '5442422500000', 2500000, NULL, NULL, 'debit', '2021-04-13 17:06:13', '5999', 0, NULL, '2021-04-13 17:40:07', NULL),
(59079, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '42341978750000', 78750000, NULL, NULL, 'debit', '2021-04-13 17:34:43', '5999', 0, NULL, '2021-04-13 18:00:14', NULL),
(59109, 747, NULL, 0, '236102J0', '00996000009960F', 'PAYME', '73484778750000', 78750000, NULL, NULL, 'credit', '2021-04-13 18:24:08', '5999', 0, NULL, '2021-04-13 18:50:11', NULL),
(59112, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '233139140000', 140000, NULL, NULL, 'debit', '2021-04-13 18:45:23', '5999', 0, NULL, '2021-04-13 19:00:09', NULL),
(59183, 718, NULL, 0, '19110BLX', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '919646140000', 140000, NULL, NULL, 'debit', '2021-04-13 20:27:12', '5999', 0, NULL, '2021-04-13 20:50:08', NULL),
(59274, 692, NULL, 0, '236102J0', '00996000009960F', 'PAYME', '71444220000000', 20000000, NULL, NULL, 'credit', '2021-04-13 22:36:07', '5999', 0, NULL, '2021-04-13 23:00:08', NULL),
(59275, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '77172119656000', 19656000, NULL, NULL, 'debit', '2021-04-13 22:43:32', '5999', 0, NULL, '2021-04-13 23:00:08', NULL),
(59547, 735, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '9547224600000', 4600000, NULL, NULL, 'credit', '2021-04-14 05:08:21', '5999', 0, NULL, '2021-04-14 05:20:09', NULL),
(59896, 692, NULL, 0, '1961002A', '004010407483802', 'OAJ OZBEKTELEKOM AK UzMob', '269559400000', 400000, NULL, NULL, 'debit', '2021-04-14 12:04:49', '5999', 0, NULL, '2021-04-14 12:30:07', NULL),
(60051, 692, NULL, 0, '1961086H', '0040100000401C3', 'CLICK P2P2UZCARD', '9832745050000', 5050000, NULL, NULL, 'debit', '2021-04-14 14:46:06', '5999', 0, NULL, '2021-04-14 15:00:07', NULL),
(60104, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '17531178750000', 78750000, NULL, NULL, 'debit', '2021-04-14 15:23:36', '5999', 0, NULL, '2021-04-14 15:40:11', NULL),
(60105, 747, NULL, 0, '196101CQ', '00401000004013U', 'P2P PAYME', '346412249000000', 249000000, NULL, NULL, 'credit', '2021-04-14 15:25:18', '5999', 0, NULL, '2021-04-14 15:40:11', NULL),
(60161, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '43943478750000', 78750000, NULL, NULL, 'debit', '2021-04-14 16:03:39', '5999', 0, NULL, '2021-04-14 16:30:11', NULL),
(60162, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '76897478750000', 78750000, NULL, NULL, 'debit', '2021-04-14 16:07:18', '5999', 0, NULL, '2021-04-14 16:30:11', NULL),
(60163, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '18272478750000', 78750000, NULL, NULL, 'debit', '2021-04-14 16:10:40', '5999', 0, NULL, '2021-04-14 16:30:11', NULL),
(60164, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '29556778750000', 78750000, NULL, NULL, 'debit', '2021-04-14 16:14:10', '5999', 0, NULL, '2021-04-14 16:30:11', NULL),
(60369, 747, NULL, 0, '196109UM', '0040100000401E8', 'C2C PAYNET POPOLNENIE', '17559175000000', 75000000, NULL, NULL, 'credit', '2021-04-14 18:34:45', '5999', 0, NULL, '2021-04-14 19:00:12', NULL),
(60424, 739, NULL, 0, '0111920I', '004190522678707', 'XK AL JAYNAR', '5894681200000', 1200000, NULL, NULL, 'debit', '2021-04-14 19:23:02', '5999', 0, NULL, '2021-04-14 19:50:10', NULL),
(60437, 739, NULL, 0, '17118EO4', '004440527926101', 'OOO GLOBAL BRAWERY GOLD', '7811613300000', 3300000, NULL, NULL, 'debit', '2021-04-14 19:44:05', '5999', 0, NULL, '2021-04-14 20:00:11', NULL),
(60464, 692, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '29363270000000', 70000000, NULL, NULL, 'credit', '2021-04-14 20:05:33', '5999', 0, NULL, '2021-04-14 20:30:08', NULL),
(60476, 747, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '489949180000000', 180000000, NULL, NULL, 'credit', '2021-04-14 20:12:21', '5999', 0, NULL, '2021-04-14 20:30:12', NULL),
(60500, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '49715778750000', 78750000, NULL, NULL, 'debit', '2021-04-14 20:25:58', '5999', 0, NULL, '2021-04-14 20:50:11', NULL),
(60501, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '62773678750000', 78750000, NULL, NULL, 'debit', '2021-04-14 20:32:02', '5999', 0, NULL, '2021-04-14 20:50:11', NULL),
(60508, 718, NULL, 0, '0111639R', '004190095763812', 'MCHJ NAZOKAT EXCLUSIVE GOLD', '728295350000', 350000, NULL, NULL, 'debit', '2021-04-14 20:36:39', '5999', 0, NULL, '2021-04-14 21:00:08', NULL),
(60513, 739, NULL, 0, '17118EO4', '004440527926101', 'OOO GLOBAL BRAWERY GOLD', '2581321800000', 1800000, NULL, NULL, 'debit', '2021-04-14 20:45:25', '5999', 0, NULL, '2021-04-14 21:00:11', NULL),
(60516, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '77395878750000', 78750000, NULL, NULL, 'debit', '2021-04-14 20:36:22', '5999', 0, NULL, '2021-04-14 21:00:11', NULL),
(60535, 718, NULL, 0, '0111639R', '004190095763812', 'MCHJ NAZOKAT EXCLUSIVE GOLD', '484896300000', 300000, NULL, NULL, 'debit', '2021-04-14 21:17:10', '5999', 0, NULL, '2021-04-14 21:30:08', NULL),
(60551, 692, NULL, 0, '0161676U', '009370000093704', 'EPOS for Ipoteka bank p2p U', '78856620000000', 20000000, NULL, NULL, 'credit', '2021-04-14 21:34:50', '5999', 0, NULL, '2021-04-14 21:50:09', NULL),
(60560, 692, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '94724410000000', 10000000, NULL, NULL, 'credit', '2021-04-14 21:40:24', '5999', 0, NULL, '2021-04-14 22:00:06', NULL),
(60561, 692, NULL, 0, '0161676U', '009370000093704', 'EPOS for Ipoteka bank p2p U', '42619910000000', 10000000, NULL, NULL, 'credit', '2021-04-14 21:41:11', '5999', 0, NULL, '2021-04-14 22:00:06', NULL),
(60986, 739, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '5834996300000', 6300000, NULL, NULL, 'credit', '2021-04-15 05:58:27', '5999', 0, NULL, '2021-04-15 06:20:11', NULL),
(61189, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '486611140000', 140000, NULL, NULL, 'debit', '2021-04-15 09:56:07', '5999', 0, NULL, '2021-04-15 10:10:08', NULL),
(61235, 718, NULL, 0, '19110BN2', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '759546140000', 140000, NULL, NULL, 'debit', '2021-04-15 10:33:03', '5999', 0, NULL, '2021-04-15 11:00:09', NULL),
(61578, 692, NULL, 0, '', '', '', '480000000', 480000000, NULL, NULL, 'credit', '2021-04-15 14:32:45', '', 0, NULL, '2021-04-15 14:40:08', NULL),
(61658, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '91592978750000', 78750000, NULL, NULL, 'debit', '2021-04-15 15:15:31', '5999', 0, NULL, '2021-04-15 15:30:06', NULL),
(61660, 728, NULL, 0, '2561000L', '009810086684001', 'OOO MAROQAND', '7399628000000', 8000000, NULL, NULL, 'debit', '2021-04-15 15:13:18', '5999', 0, NULL, '2021-04-15 15:30:07', NULL),
(61676, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '84977478750000', 78750000, NULL, NULL, 'debit', '2021-04-15 15:18:37', '5999', 0, NULL, '2021-04-15 15:40:08', NULL),
(61677, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '37758178750000', 78750000, NULL, NULL, 'debit', '2021-04-15 15:20:46', '5999', 0, NULL, '2021-04-15 15:40:08', NULL),
(61678, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '73136178750000', 78750000, NULL, NULL, 'debit', '2021-04-15 15:22:54', '5999', 0, NULL, '2021-04-15 15:40:08', NULL),
(61679, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '33492478750000', 78750000, NULL, NULL, 'debit', '2021-04-15 15:24:47', '5999', 0, NULL, '2021-04-15 15:40:08', NULL),
(61680, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '62513278750000', 78750000, NULL, NULL, 'debit', '2021-04-15 15:26:50', '5999', 0, NULL, '2021-04-15 15:40:08', NULL),
(61745, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '87976578750000', 78750000, NULL, NULL, 'debit', '2021-04-15 15:49:28', '5999', 0, NULL, '2021-04-15 16:10:08', NULL),
(61746, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '87239978750000', 78750000, NULL, NULL, 'debit', '2021-04-15 15:56:12', '5999', 0, NULL, '2021-04-15 16:10:08', NULL),
(61804, 747, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '47932350000000', 50000000, NULL, NULL, 'credit', '2021-04-15 16:10:24', '5999', 0, NULL, '2021-04-15 16:30:11', NULL),
(61805, 747, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '89534530000000', 30000000, NULL, NULL, 'credit', '2021-04-15 16:10:42', '5999', 0, NULL, '2021-04-15 16:30:11', NULL),
(61817, 747, NULL, 0, '196101CQ', '00401000004013U', 'P2P PAYME', '13236940500000', 40500000, NULL, NULL, 'credit', '2021-04-15 16:21:01', '5999', 0, NULL, '2021-04-15 16:40:11', NULL),
(61818, 747, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '28334637500000', 37500000, NULL, NULL, 'credit', '2021-04-15 16:22:38', '5999', 0, NULL, '2021-04-15 16:40:11', NULL),
(61819, 747, NULL, 0, '0361008G', '011400000114018', 'UZCARD HUMO P2P XIZMATI', '32594166000000', 66000000, NULL, NULL, 'credit', '2021-04-15 16:25:18', '5999', 0, NULL, '2021-04-15 16:40:11', NULL),
(61820, 747, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '43517112000000', 12000000, NULL, NULL, 'credit', '2021-04-15 16:28:59', '5999', 0, NULL, '2021-04-15 16:40:11', NULL),
(61821, 755, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '76659478750000', 78750000, NULL, NULL, 'debit', '2021-04-15 16:24:34', '5999', 0, NULL, '2021-04-15 16:40:12', NULL),
(61862, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '286727140000', 140000, NULL, NULL, 'debit', '2021-04-15 16:58:23', '5999', 0, NULL, '2021-04-15 17:20:08', NULL),
(61872, 747, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '67549370000000', 70000000, NULL, NULL, 'credit', '2021-04-15 17:01:24', '5999', 0, NULL, '2021-04-15 17:20:11', NULL),
(61884, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '46153678750000', 78750000, NULL, NULL, 'debit', '2021-04-15 17:05:48', '5999', 0, NULL, '2021-04-15 17:30:14', NULL),
(61885, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '39719178750000', 78750000, NULL, NULL, 'debit', '2021-04-15 17:11:14', '5999', 0, NULL, '2021-04-15 17:30:14', NULL),
(61915, 692, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '28694426000000', 26000000, NULL, NULL, 'credit', '2021-04-15 18:01:21', '5999', 0, NULL, '2021-04-15 18:13:36', NULL),
(61916, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '82298326208000', 26208000, NULL, NULL, 'debit', '2021-04-15 18:03:01', '5999', 0, NULL, '2021-04-15 18:13:36', NULL),
(61933, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '16311278750000', 78750000, NULL, NULL, 'debit', '2021-04-15 17:18:36', '5999', 0, NULL, '2021-04-15 18:30:13', NULL),
(61934, 747, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '71618478750000', 78750000, NULL, NULL, 'debit', '2021-04-15 17:59:21', '5999', 0, NULL, '2021-04-15 18:30:13', NULL),
(61961, 692, NULL, 0, '0161676U', '009370000093704', 'EPOS for Ipoteka bank p2p U', '55317416000000', 16000000, NULL, NULL, 'credit', '2021-04-15 18:39:19', '5999', 0, NULL, '2021-04-15 19:00:08', NULL),
(61969, 747, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '2624444000000', 4000000, NULL, NULL, 'credit', '2021-04-15 18:46:03', '5999', 0, NULL, '2021-04-15 19:00:13', NULL),
(61993, 692, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '3331459000000', 9000000, NULL, NULL, 'credit', '2021-04-15 19:07:12', '5999', 0, NULL, '2021-04-15 19:30:06', NULL),
(62014, 692, NULL, 0, '0161676U', '009370000093704', 'EPOS for Ipoteka bank p2p U', '8273385500000', 5500000, NULL, NULL, 'credit', '2021-04-15 19:27:44', '5999', 0, NULL, '2021-04-15 20:00:08', NULL),
(62016, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '984897140000', 140000, NULL, NULL, 'debit', '2021-04-15 19:44:30', '5999', 0, NULL, '2021-04-15 20:00:09', NULL),
(62186, 692, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '17275214000000', 14000000, NULL, NULL, 'credit', '2021-04-15 22:25:26', '5999', 0, NULL, '2021-04-15 22:50:08', NULL),
(62197, 692, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '54262825000000', 25000000, NULL, NULL, 'credit', '2021-04-15 22:41:35', '5999', 0, NULL, '2021-04-15 23:00:07', NULL),
(62218, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '67216578750000', 78750000, NULL, NULL, 'debit', '2021-04-15 22:55:45', '5999', 0, NULL, '2021-04-15 23:20:07', NULL),
(63280, 755, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '145768840000000', 840000000, NULL, NULL, 'debit', '2021-04-16 12:52:10', '5999', 0, NULL, '2021-04-16 13:10:12', NULL),
(63365, 755, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '35856878750000', 78750000, NULL, NULL, 'debit', '2021-04-16 13:22:43', '5999', 0, NULL, '2021-04-16 13:40:15', NULL),
(63479, 166, NULL, 0, '19110DB3', '010910533735602', 'MCHJ AMBROSIA GASTRO', '6392343100000', 3100000, NULL, NULL, 'debit', '2021-04-16 14:13:53', '5999', 0, NULL, '2021-04-16 14:30:02', NULL),
(63676, 680, NULL, 0, '', '', '', '105300000', 105300000, NULL, NULL, 'credit', '2021-04-16 15:38:47', '', 0, NULL, '2021-04-16 15:40:07', NULL),
(63871, 680, NULL, 0, '276103Q6', '01071000010711P', 'TOSHKENT SH ORIENT FINAN', '156249105300000', 105300000, NULL, NULL, 'debit', '2021-04-16 16:16:48', '5999', 0, NULL, '2021-04-16 17:00:07', NULL),
(63872, 680, NULL, 0, '276103Q6', '01071000010711P', 'TOSHKENT SH ORIENT FINAN', '584399105300000', 105300000, NULL, NULL, 'credit', '2021-04-16 16:30:28', '5999', 0, NULL, '2021-04-16 17:00:07', NULL),
(63873, 680, NULL, 0, '276103Q6', '01071000010711P', 'TOSHKENT SH ORIENT FINAN', '711484105300000', 105300000, NULL, NULL, 'debit', '2021-04-16 16:33:48', '5999', 0, NULL, '2021-04-16 17:00:07', NULL),
(63883, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '82298326000000', 26000000, NULL, NULL, 'debit', '2021-04-15 18:03:01', '5999', 0, NULL, '2021-04-16 17:00:10', NULL),
(63890, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '1474515040000', 5040000, NULL, NULL, 'debit', '2021-04-16 16:21:49', '5999', 0, NULL, '2021-04-16 17:00:10', NULL),
(63891, 692, NULL, 0, '1961002A', '004010407483802', 'OAJ OZBEKTELEKOM AK UzMob', '595322500000', 500000, NULL, NULL, 'debit', '2021-04-16 16:23:59', '5999', 0, NULL, '2021-04-16 17:00:10', NULL),
(64663, 680, NULL, 0, '25112312', '010720070680101', 'FAST MODERN BUSINESSMCHJ', '1744942060000', 2060000, NULL, NULL, 'debit', '2021-04-16 21:25:37', '5999', 0, NULL, '2021-04-16 22:10:07', NULL),
(65740, 166, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '3336613100000', 3100000, NULL, NULL, 'credit', '2021-04-17 05:18:15', '5999', 0, NULL, '2021-04-17 05:40:01', NULL),
(65742, 680, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '7241792060000', 2060000, NULL, NULL, 'credit', '2021-04-17 05:18:20', '5999', 0, NULL, '2021-04-17 05:40:06', NULL),
(67975, 728, NULL, 0, '091104C1', '010570464010532', 'MCHJ NIKA FARM SERVIS', '5518243500000', 3500000, NULL, NULL, 'debit', '2021-04-17 20:08:15', '5912', 0, NULL, '2021-04-17 20:30:09', NULL),
(68036, 692, NULL, 0, '1961002A', '004010407483802', 'OAJ OZBEKTELEKOM AK UzMob', '7697582000000', 2000000, NULL, NULL, 'debit', '2021-04-17 23:01:15', '5999', 0, NULL, '2021-04-17 23:20:08', NULL),
(68227, 166, NULL, 0, '196104ON', '00401000004016Y', 'PAYNET  PAYMOUZ', '11316150000', 50000, NULL, NULL, 'debit', '2021-04-17 23:59:48', '5999', 0, NULL, '2021-04-18 00:20:03', '2021-04-18 22:43:05'),
(68897, 166, NULL, 0, '01111276', '00401000004016Y', 'PAYNET  PAYMOUZ', '84588260000', 60000, NULL, NULL, 'debit', '2021-04-18 00:10:03', '5999', 0, NULL, '2021-04-18 05:20:04', '2021-04-22 01:12:50'),
(69184, 692, NULL, 0, '03610088', '011400000114016', 'AGROBANK CLICK HUMO P2P', '1474515000000', 5000000, NULL, NULL, 'debit', '2021-04-16 16:21:49', '5999', 0, NULL, '2021-04-18 07:20:09', NULL),
(72016, 728, NULL, 0, '091104C1', '010570464010532', 'MCHJ NIKA FARM SERVIS', '5157453140000', 3140000, NULL, NULL, 'debit', '2021-04-18 23:32:47', '5912', 0, NULL, '2021-04-18 23:50:13', NULL),
(73020, 166, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '919726110000', 110000, NULL, NULL, 'credit', '2021-04-19 05:18:13', '5999', 0, NULL, '2021-04-19 05:40:02', NULL),
(74186, 747, NULL, 0, '236100VJ', '00996000009960B', 'PAYME', '8548888080000', 8080000, NULL, NULL, 'debit', '2021-04-19 11:45:17', '5999', 0, NULL, '2021-04-19 12:00:13', NULL),
(74392, 735, NULL, 0, '17118FRG', '010670089997301', 'SP OOO HAVAS FOOD', '363572795000', 795000, NULL, NULL, 'debit', '2021-04-19 13:42:58', '5999', 0, NULL, '2021-04-19 14:00:11', NULL),
(75065, 692, NULL, 0, '036100EE', '011400000114027', 'CLICK UZCARD HUMO P2P', '11868219500000', 19500000, NULL, NULL, 'credit', '2021-04-19 19:20:20', '5999', 0, NULL, '2021-04-19 19:50:08', NULL),
(75946, 692, NULL, 0, '1961086H', '0040100000401C3', 'CLICK P2P2UZCARD', '77331510100000', 10100000, NULL, NULL, 'debit', '2021-04-20 04:18:49', '5999', 0, NULL, '2021-04-20 04:40:09', NULL),
(76038, 735, NULL, 0, '2761054C', '01071000010712S', 'TOSHKENT SH ORIENT FINAN', '462948795000', 795000, NULL, NULL, 'credit', '2021-04-20 05:08:13', '5999', 0, NULL, '2021-04-20 05:30:11', NULL),
(76353, 692, NULL, 0, '1961002A', '004010407483802', 'OAJ OZBEKTELEKOM AK UzMob', '131258500000', 500000, NULL, NULL, 'debit', '2021-04-20 08:30:21', '5999', 0, NULL, '2021-04-20 08:40:08', NULL),
(76592, 692, NULL, 0, '08110XCT', '007600506993803', 'OOO BEGINNING GREAT STAIRS', '7845328300000', 8300000, NULL, NULL, 'debit', '2021-04-20 10:41:27', '5999', 0, NULL, '2021-04-20 11:10:07', NULL),
(76678, 692, NULL, 0, '10610018', '011580000115824', 'FRB KAPITALBANK epos', '21163980000000', 80000000, NULL, NULL, 'credit', '2021-04-20 11:36:21', '5999', 0, NULL, '2021-04-20 12:00:10', NULL),
(77036, 692, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '35646778750000', 78750000, NULL, NULL, 'debit', '2021-04-20 15:12:09', '5999', 0, NULL, '2021-04-20 15:30:07', NULL),
(77196, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '171561100000000', 100000000, NULL, NULL, 'credit', '2021-04-20 16:56:22', '6011', 0, NULL, '2021-04-20 17:20:05', NULL),
(77197, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '181218100000000', 100000000, NULL, NULL, 'credit', '2021-04-20 16:57:41', '6011', 0, NULL, '2021-04-20 17:20:05', NULL),
(77198, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '858466100000000', 100000000, NULL, NULL, 'credit', '2021-04-20 16:58:48', '6011', 0, NULL, '2021-04-20 17:20:05', NULL),
(77199, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '867241100000000', 100000000, NULL, NULL, 'credit', '2021-04-20 16:59:46', '6011', 0, NULL, '2021-04-20 17:20:05', NULL),
(77200, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '77493750000000', 50000000, NULL, NULL, 'credit', '2021-04-20 17:00:43', '6011', 0, NULL, '2021-04-20 17:20:05', NULL),
(77201, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '366272100000000', 100000000, NULL, NULL, 'credit', '2021-04-20 17:01:45', '6011', 0, NULL, '2021-04-20 17:20:05', NULL),
(77202, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '869377105000000', 105000000, NULL, NULL, 'credit', '2021-04-20 17:02:47', '6011', 0, NULL, '2021-04-20 17:20:05', NULL),
(77203, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '565588100000000', 100000000, NULL, NULL, 'credit', '2021-04-20 17:03:50', '6011', 0, NULL, '2021-04-20 17:20:05', NULL),
(77204, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '733961100000000', 100000000, NULL, NULL, 'credit', '2021-04-20 17:04:50', '6011', 0, NULL, '2021-04-20 17:20:05', NULL),
(77230, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '61252250000000', 50000000, NULL, NULL, 'credit', '2021-04-20 17:05:52', '6011', 0, NULL, '2021-04-20 17:30:07', NULL),
(77265, 679, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '54116178750000', 78750000, NULL, NULL, 'debit', '2021-04-20 17:30:35', '5999', 0, NULL, '2021-04-20 17:50:06', NULL),
(77436, 679, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '21833478750000', 78750000, NULL, NULL, 'debit', '2021-04-20 19:14:40', '5999', 0, NULL, '2021-04-20 19:30:06', NULL),
(77437, 679, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '31615678750000', 78750000, NULL, NULL, 'debit', '2021-04-20 19:18:47', '5999', 0, NULL, '2021-04-20 19:30:06', NULL),
(77738, 679, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '88872178750000', 78750000, NULL, NULL, 'debit', '2021-04-20 21:58:31', '5999', 0, NULL, '2021-04-20 22:20:08', NULL),
(77807, 679, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '71479878750000', 78750000, NULL, NULL, 'debit', '2021-04-20 22:41:34', '5999', 0, NULL, '2021-04-20 23:00:06', NULL),
(79953, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '724784105000000', 105000000, NULL, NULL, 'credit', '2021-04-21 17:38:30', '6011', 0, NULL, '2021-04-21 18:00:06', NULL),
(79954, 679, NULL, 0, '12710E4I', '001210000012107', 'MILLIY BANK JIZZAX BOLIMI', '92822868000000', 68000000, NULL, NULL, 'credit', '2021-04-21 17:40:32', '6011', 0, NULL, '2021-04-21 18:00:06', NULL),
(79955, 679, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '17533778750000', 78750000, NULL, NULL, 'debit', '2021-04-21 17:46:31', '5999', 0, NULL, '2021-04-21 18:00:06', NULL),
(79996, 679, NULL, 0, '19610D97', '004010532018202', 'OOO BEVERONE', '26289478750000', 78750000, NULL, NULL, 'debit', '2021-04-21 17:55:45', '5999', 0, NULL, '2021-04-21 18:20:06', NULL),
(81124, 725, NULL, 0, '08611EIB', '011320444593607', 'PAYME MOBILE TULOVLARI', '1882481600000', 1600000, NULL, NULL, 'debit', '2021-04-22 04:20:33', '5999', 0, NULL, '2021-04-22 04:40:12', NULL),
(81694, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '365927140000', 140000, NULL, NULL, 'debit', '2021-04-22 09:21:17', '5999', 0, NULL, '2021-04-22 09:40:09', NULL),
(81775, 718, NULL, 0, '19110A4V', '004010515554702', 'OOO AVTOMATLASHTIRILGAN TR', '294113140000', 140000, NULL, NULL, 'debit', '2021-04-22 10:16:07', '5999', 0, NULL, '2021-04-22 10:30:08', NULL),
(81828, 166, NULL, 0, '0411002T', '004170077676501', 'OOO ECO MED', '5569286480000', 6480000, NULL, NULL, 'debit', '2021-04-22 10:45:24', '5912', 0, NULL, '2021-04-22 11:10:01', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `partner`
--

CREATE TABLE `partner` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `ox_subdomain` varchar(20) DEFAULT NULL,
  `org_name` varchar(100) DEFAULT NULL,
  `tin` int DEFAULT NULL,
  `description_ru` text,
  `description_uz` text,
  `logo` blob,
  `color` varchar(10) DEFAULT NULL COMMENT 'Фирменный цвет бренда',
  `photo` text,
  `interest` int NOT NULL DEFAULT '2',
  `site_url` varchar(100) DEFAULT NULL,
  `active` int NOT NULL DEFAULT '0',
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `partner`
--

INSERT INTO `partner` (`id`, `category_id`, `ox_subdomain`, `org_name`, `tin`, `description_ru`, `description_uz`, `logo`, `color`, `photo`, `interest`, `site_url`, `active`, `added_on`, `updated_on`) VALUES
(5, 2, NULL, 'Sportshop', 444444444, 'Сеть мултибрендовых магазинов. Посетители смогут найти большой ассортимент спортивных инвентарей, спорт товаров, спортивного питания, надувные и каркасные бассейны, велосипеды и самокаты, также в магазине есть отдел массажеров, вело запчастей, детских игрушек и товаров для любителей рыбалки.\n\nКроме этого продажа тренажёров на примую со склада', NULL, 0x68747470733a2f2f6170692e6d756c7469636172642e757a2f706172746e65722d6c6f676f2f352e706e67, '000000', '[\n  \"https:\\/\\/api.multicard.uz\\/partner-photo\\/5-1.jpg\",\n  \"https:\\/\\/api.multicard.uz\\/partner-photo\\/5-2.jpg\",\n  \"https:\\/\\/api.multicard.uz\\/partner-photo\\/5-3.jpg\",\n  \"https:\\/\\/api.multicard.uz\\/partner-photo\\/5-4.jpg\",\n  \"https:\\/\\/api.multicard.uz\\/partner-photo\\/5-5.jpg\",\n  \"https:\\/\\/api.multicard.uz\\/partner-photo\\/5-6.jpg\"    \n]', 2, NULL, 1, '2021-01-20 19:34:43', '2021-01-20 14:37:37'),
(106, 2, 'avva', 'Ds damat', NULL, 'D’S Damat – турецкий бренд, который с 2002 года предлагает качество, комфорт и дизайн по конкурентно-способной цене. Основная миссия бренда – создание стильной одежды для сильной половины человечества, которая будет отвечать основным веяниям моды, сохраняя в себе индивидуальность и особый шарм. В Ташкенте уже два магазина мужской одежды D’S Damat, который однозначно уже успел снискать призвание у сильной половины человечества.', 'D\'S Damat - 2002 yildan beri sifatli, qulaylik va dizaynni raqobatbardosh narxlarda taqdim etib kelayotgan turk brendi. Brendning asosiy vazifasi insoniyatning kuchli yarmi uchun individuallik va o\'ziga xos jozibadorlikni saqlab, asosiy moda tendentsiyalariga javob beradigan zamonaviy kiyimlar yaratishdir. Toshkentda allaqachon D\'S Damat erkaklar kiyim-kechak do\'konlari mavjud bo\'lib, ular allaqachon insoniyatning kuchli yarmining talabiga sazovor bo\'lgan.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f64322f33622f37392f643233623739336238353737646332353239323036313932353661613763373338653934383437656664333732313932303339363633626335666634376562652e706e67, '15274F', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/5f\\/3c\\/14\\/5f3c14c86945f6e2c03533944033dbbd8b6bce9797d0eae98b1f7afaff819f38.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/32\\/04\\/9e\\/32049edbb315eab727a63098c5f1fd0727c9bfa146d294c5cfd94dd48462200d.jpg\"]', 2, NULL, 1, '2021-04-16 17:20:25', '2021-04-16 12:25:47'),
(107, 10, 'erkatoy1', 'Erkatoy', NULL, 'Сеть магазинов Erkatoy Group является официальным дистрибьютором всемирно известных брендов игрушек и товаров для детей, таких как: LEGO, Chicco, Mattel (Barbie, Hot Wheels, Fisher Price), Hasbro (Nerf, Play Doh, Transformers), Simba Dickie Toys (Smoby, Simba, Majorette, Steffi), Zapf Creation (Baby Born), Playmobil, Philips Avent, Globber, Rastar и других.\r\n\r\nДействует доставка по всему Узбекистану, каждый день с 10:00 до 22:00.  При заказе на сумму свыше 300 000 сум доставка бесплатная.\r\nОнлайн-заказы можно оформить\r\nна нашем сайте. \r\nВо всех филиалах действует РАССРОЧКА без первого взноса.', 'Сеть магазинов Erkatoy Group является официальным дистрибьютором всемирно известных брендов игрушек и товаров для детей, таких как: LEGO, Chicco, Mattel (Barbie, Hot Wheels, Fisher Price), Hasbro (Nerf, Play Doh, Transformers), Simba Dickie Toys (Smoby, Simba, Majorette, Steffi), Zapf Creation (Baby Born), Playmobil, Philips Avent, Globber, Rastar и других.\r\n\r\nДействует доставка по всему Узбекистану, каждый день с 10:00 до 22:00.  При заказе на сумму свыше 300 000 сум доставка бесплатная.\r\nОнлайн-заказы можно оформить\r\nна нашем сайте. \r\nВо всех филиалах действует РАССРОЧКА без первого взноса.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f33352f64352f31612f333564353161303861323336636463613161326631323961646666323264373633326133653166393430616134643362663638316361376632353938396163322e706e67, 'FFFFFF', '[\"https://files.ox-sys.com/cache/1000x_/image/65/31/cc/6531cc2621e6d2810fbaa2c4c0bc894df9f6c7fd594ca8fbaee53afbeb11858e.jpg\",\"https://files.ox-sys.com/cache/1000x_/image/10/ee/bb/10eebb05a5b3e282f8909720ec56c59fcc6fee7f7080cbe11b6a5ed8193f78c9.JPG\",\"https://files.ox-sys.com/cache/1000x_/image/e8/9a/3e/e89a3e706ad785b4d66faead4430cc243b32fa989e8ccabb7281cb2b9e88b561.jpg\",\"https://files.ox-sys.com/cache/1000x_/image/d3/85/68/d38568d9856e86bf825dc37893a5bbf90803ad0b05d0d20f04ba6b738748fe37.jpg\"]', 2, NULL, 1, '2021-03-04 16:37:00', '2021-04-17 19:58:08'),
(122, 4, 'paeonnis', 'Paeonnis', NULL, 'PAEONNIS - многопрофильный медицинский центр.\r\nНаправления работы:\r\n- Неврология\r\n- Отоларингология\r\n- Эндокринология\r\n- Гинекология\r\n- Урология\r\n- Кардиология\r\n- Физиотерапия\r\n- Лабораторные исследования\r\n- Ультразвуковая диагностика\r\n- ЭЭГ\r\n- Эхо ЭГ\r\n\r\nНАШИ СПЕЦИАЛИСТЫ\r\n- Честные и принципиальные\r\n- Заботливые и искренние\r\n- Открытые, отзывчивые и чуткие\r\n- Доступны и удобны для посещения\r\n- Уважают ваше время\r\n- Квалифицированные и компетентные\r\n- Технически подкованные\r\n\r\nНАШИ ПРЕИМУЩЕСТВА\r\n- Превосходная репутация\r\n- Высочайший профессионализм специалистов\r\n- Исключительные условия для диагностики\r\n- Современные подходы в лечении болезней\r\n- Постоянный контроль и проведение профилактических мероприятий.', 'PAEONNIS - bu ko\'p tarmoqli tibbiyot markazi.\r\nIsh yo\'nalishlari:\r\n- Nevrologiya\r\n- Otolaringologiya\r\n- Endokrinologiya\r\n- Ginekologiya\r\n- urologiya\r\n- kardiologiya\r\n- fizioterapiya\r\n- laboratoriya tadqiqotlari\r\n- ultratovush diagnostikasi\r\n- EEG\r\n- Echo EG\r\n\r\nBizning mutaxassislarimiz\r\n- halol va printsipial\r\n- g\'amxo\'r va samimiy\r\n- Ochiq, sezgir va hamdard\r\n- tashrif buyurish uchun qulay va qulay\r\n- Vaqtingizni hurmat qiling\r\n- malakali va vakolatli\r\n- Texnologiyalar\r\n\r\nBizning afzalliklarimiz\r\n- Zo\'r obro\'-e\'tibor\r\n- mutaxassislarning eng yuqori professionalligi\r\n- tashxis qo\'yish uchun istisno sharoitlar\r\n- kasalliklarni davolashda zamonaviy yondashuvlar\r\n- doimiy monitoring va profilaktika choralari.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f30352f65362f34612f303565363461663761396132356265323863326533373737363135636364663764643535623036306135383936316337303535623539653461323364353763352e706e67, 'FFFFFF', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/16\\/20\\/8f\\/16208ff54cba48645e2821452aa05afc8e31aa267b7c3ec301e53a2b64ec5927.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/1c\\/05\\/b0\\/1c05b0a399e513864f5dad2e118f43d323636b404653545c24fd144c270618bc.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/2f\\/fb\\/a3\\/2ffba3a7d0402ebb80a1e3c9c47e615a3125a0db28936fcd09c9c06ecfdc1116.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/0e\\/c3\\/5b\\/0ec35b0a5aa2e741a19bcde9e0c11940810fd287b7d5b662db0d5ae54d1f71f7.jpg\"]', 2, NULL, 1, '2021-04-16 16:09:11', '2021-04-16 11:16:48'),
(154, 2, 'avva', 'Penti', NULL, 'Penti - известный и хорошо зарекомендовавший себя бренд чулочно-носочного и бельевого трикотажа. Большой ассортимент и цветовая гамма, всегда высокое качество изделий, следование моде, использование современных материалов и технологий отличают этого производителя от многих других.\r\n \r\nКомпания была основана в 1950 году в Турции, где и расположено само производство. Постоянно развиваясь и расширяясь, сейчас Penti входит в число крупнейших мануфактур в Европе, изготавливает продукцию для некоторых известных мировых брендов. На сегодняшний день насчитывается около 575 магазинов по всему миру, и эта цифра с каждым годом продолжает расти. \r\n \r\nВ нашем фирменном магазине Penti можно выбрать и купить колготки, носки, нижнее белье, купальники и другую продукцию, разнообразие моделей приятного порадует каждого. Ассортимент постоянно пополняется - следите за новыми поступлениями!', 'Penti - taniqli va taniqli paypoq va ichki kiyim trikotaj brendi. Katta assortiment va ranglar, har doim yuqori sifatli mahsulotlar, modaga sodiqlik, zamonaviy materiallar va texnologiyalardan foydalanish ushbu ishlab chiqaruvchini boshqalardan ajratib turadi.\r\n \r\nKompaniya 1950 yilda ishlab chiqarishning o\'zi joylashgan Turkiyada tashkil etilgan. Doimiy rivojlanib va ​​kengayib borayotgan Penti hozirgi kunda Evropadagi eng yirik fabrikalardan biri bo\'lib, taniqli jahon brendlari uchun mahsulotlar ishlab chiqaradi. Bugungi kunda dunyo bo\'ylab 575 ga yaqin do\'kon mavjud va bu ko\'rsatkich har yili o\'sishda davom etmoqda.\r\n \r\nBizning Penti savdo do\'konida siz tayt, paypoq, ichki kiyim, suzish va boshqa mahsulotlarni tanlashingiz va sotib olishingiz mumkin, har xil modellar barchani xushnud etadi. Assortiment doimiy ravishda yangilanadi - yangi kelganlarni kuzatib boring!', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f31652f37652f39322f316537653932323434303562323532393263626633383365393166346263323230626466316137313039653461666430373536313330626237323666613365352e706e67, 'D70056', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/03\\/2f\\/ee\\/032fee1e39526f8ee9181935b3cd85f5ec2000848842862596712514a999183e.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/e1\\/7e\\/55\\/e17e550ec4ab32122d9f43643dc9c7bbef23a8d1f7381618ce7963c4ca316232.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/c0\\/fa\\/ec\\/c0faec1e29ba26c116181917a6ca338ce9b2fa4b803c4a0878d339b045c84158.jpg\"]', 2, NULL, 1, '2021-04-16 17:58:53', '2021-04-16 13:14:41'),
(156, 2, 'avva', 'AVVA', NULL, 'Бренд AVVA привнося новшество своими амбициозными взглядами на мир мужской моды с новыми, утонченными, современными и оригинальными линиями одежды, создала совсем другой язык моды, который отражает душу стильных мужчин.\r\n \r\nБренд AVVA заслужил признание в качестве турецкого бренда в мире моды и за короткое время стал одним из наиболее важных брендов в текстильной промышленности в Турции.\r\n \r\nВ Турции функционирует более 100 концептуальных магазинов бренда AVVA, а за рубежом таких магазинов больше 80.\r\n\r\nСегодня AVVA является зарегистрированным товарным знаком в 120 странах с магазинами в Германии, Румынии, Узбекистане, России, Украине, Саудовской Аравии, Марокко, Египте, Сирии и Ливии, с более чем 600 точками продаж в США.', 'AVVA brendi erkaklar kiyimlari dunyosiga bo\'lgan shijoatli qarashlari bilan yangi, zamonaviy, zamonaviy va o\'ziga xos kiyim-kechak liniyalari bilan yangilik qiladi, zamonaviy erkaklarning ruhini aks ettiradigan mutlaqo boshqa moda tilini yaratdi.\r\n \r\nAVVA brendi moda olamida turk brendi sifatida tan olingan va qisqa vaqt ichida Turkiyadagi to\'qimachilik sanoatining eng muhim brendlaridan biriga aylangan.\r\n \r\nTurkiyada AVVA brendining 100 dan ortiq kontseptsiya do\'konlari ishlaydi, chet ellarda esa 80 dan ortiq do\'kon mavjud.\r\n\r\nBugungi kunda AVVA - Germaniyada, Ruminiyada, O\'zbekistonda, Rossiyada, Ukrainada, Saudiya Arabistonida, Marokashda, Misrda, Suriyada va Liviyada do\'konlari bo\'lgan 120 ta mamlakatda ro\'yxatdan o\'tgan savdo belgisidir va AQShda 600 dan ortiq savdo nuqtalari mavjud.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f66312f65312f33332f663165313333323837636564386330383736653337353164646533376462353161393265666233643833343537343832616362346538363761653364393862652e706e67, 'FFFFFF', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/8c\\/66\\/6d\\/8c666dfd20e4bf139aee6e53d6116fa3c5cc6c300a0a8eb0eacab56d1dedf576.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/45\\/0c\\/1b\\/450c1b371d8e5fac8f035afdb5467d837b9bacda4927fe01f54e0e1b57e836cc.jpg\"]', 2, NULL, 1, '2021-04-16 16:40:06', '2021-04-16 12:12:15'),
(160, 1, 'face', 'The Shop', NULL, 'YSK - это узбекский бренд одежды, который был основан в 2006 году. Всё начиналось не просто. Идей было очень много, мы много размышляли, я и моя супруга, Ирода Суюнова, какой бизнес будет выгоднее для нашей семьи. Самым оптимальным было открыть магазин одежды. Набравшись опыта для ведения бизнеса, мы решили воплотить свою мечту - создать свой бренд “Yaskanamu”.\r\n\r\nЭто был долгий путь на самом деле. Изучив все тонкости этого дела, мы приступили к открытию первого магазина. Он не спроста получил такое неординарное название. Нашу дочь зовут Жасмина, но ласкательно называли «Ясканаму», долго не думая, мы пришли к единогласному решению назвать магазин “Yaskanamu”.\r\n\r\nДень за днём мы стараемся изучить все нюансы, касающиеся нашей сферы деятельности, и улучшаем качество проделанной работы. На сегодняшний день, спустя 11 лет с момента открытия первого магазина, наша сеть получает ежедневные поставки одежды разных моделей и размеров, которые придутся по вкусу каждому человеку.\r\n\r\nМогу уверенно сказать, что на сегодняшний день наше призводство одежды не уступает мировым производителям. С нетерпением буду ждать каждого из Вас в сети магазинов YSK!', 'Узб описание', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f34362f30332f63622f343630336362363836396138343764363965333037363332373733643366623235316366393336633032356136366432383137663739363532393062386162622e706e67, 'EDEDED', '[]', 2, NULL, 0, '2021-04-08 18:19:13', '2021-04-08 13:31:10'),
(166, 2, 'avva', 'DERIMOD', NULL, 'Турецкий бренд Derimod пользуется популярностью среди ценителей изделий из натуральной кожи по всему миру.\r\n \r\nТорговая марка предлагает стильные куртки, качественную обувь и авторские аксессуары по доступным ценам, снискавшие призвание как у мужчин, так и женщин.\r\n\r\nОтныне стиль и качество стали доступны по привлекательным ценам в официальных магазинах турецкого бренда Derimod в Ташкенте.', 'Turkiyaning Derimod brendi dunyo bo\'ylab asl charm buyumlarni biluvchilar orasida mashhurdir.\r\n \r\nBrend zamonaviy ko\'ylagi, yuqori sifatli poyabzal va dizaynerlik aksessuarlarini arzon narxlarda taklif etadi, ular erkaklar ham, ayollar ham o\'z kasbiga sazovor bo\'lishdi.\r\n\r\nBundan buyon Toshkentdagi Turkiyaning Derimod brendining rasmiy do\'konlarida uslub va sifat jozibador narxlarda sotila boshlandi.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f65652f31652f37392f656531653739666531303334336235366333653362343661393962346265653466633064643439393735653566356166623030643534666136373737613361622e706e67, 'FFFFFF', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/3b\\/52\\/6c\\/3b526cbc20052c7993d7ae5886e95084af97de2155c5fe149e8c67f3883df02d.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/99\\/91\\/61\\/9991617a63c18476e586a848db258ca7cac94799935b873898179ac24e290fd2.jpg\"]', 2, NULL, 1, '2021-04-16 17:46:25', '2021-04-16 12:54:15'),
(179, 1, 'demoshop', 'Demo', NULL, '', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f62612f66332f34392f626166333439613630376464373738643463303836633361613838313361353065383433333866353037396634623533616461663333633230613730356264652e706e67, '', '[]', 2, NULL, 0, '2021-03-30 18:02:13', '2021-03-30 13:02:13'),
(187, 9, 'elysee', 'Elysee Parfumerie', NULL, 'Концепция деятельности компании состоит в стремлении сделать ближе эффективные и безвредные косметические средства класса люкс для здоровья, красоты и сохранения молодости кожи.\r\nСегодня Dori-Darmon HCP является официальным ритейлером таких Брендов, как: Dior, Guerlain, Kenzo, Lancome, Estee Lauder, Salvador Dali, Givenchy, Glamglow, Tom Ford, Ermenegildo Zegna, YSL, Victor & Rolf, Biotherm, Cacharel, Clinique, Giorgio Armini, Lab Series, Michael Kors, Tommy Hilfiger, Mauboussin, Agatha, Charriol, Kaloo, Kokeshi, Lulu Castagnete, DKNY, Azzaro, Mugler, Baldessarini,  4711, Tobacco, Betty Barclay, Smashbox, Jacady, LA MER, Masque Milano, Dusita, Lesquendieu.\r\n\r\n \r\nМиссия компании – Дарить положительные эмоции и отличное настроение!', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f33382f62312f35352f333862313535393239383764643031653263363365313433343734323161353836343464356466366634306464363337386463646639326661353230396635632e706e67, 'FFFFFF', '[\"https://files.ox-sys.com/cache/1000x_/image/dc/72/8c/dc728ccae26098cea099bdc67b22d8219be538174fcb7dd2e315379fcd70e072.jpg\",\"https://files.ox-sys.com/cache/1000x_/image/90/44/7f/90447fda6393123159c0d5c8997f28b298b2600376226da8469ed27795833837.jpg\",\"https://files.ox-sys.com/cache/1000x_/image/ff/68/9b/ff689b1f66c4cc08730685ba070bc7c1e1df4a2abc87383ac7a8ec449c3376ee.jpg\"]', 2, NULL, 1, '2021-04-07 16:38:32', '2021-04-08 12:16:09'),
(188, 2, 'partlion', 'Part Lion', NULL, 'PartLion – известный в своих кругах и очень хорошо зарекомендовавший себя бренд одежды.  Начиная со своего создания магазин  PartLion следует успешным курсом. Уже более 2 лет наш бренд  демократизирует моду благодаря стабильно доступному уровню цен и высоким требованиям к качеству товаров. В нашем магазине вы всегда найдете лучшую одежду в стиле хип-хоп и кэжуал, сможете подобрать себе удобный образ не только на каждый день, но и для особого случая. Наши бутики вы сможете найти не только в СНГ, но и в Турции. Концепция PartLion –это комфортная одежда по комфортным ценам.', 'PartLion - taniqli va juda yaxshi tanilgan kiyim markasi. PartLion tashkil topganidan beri muvaffaqiyatli kursni davom ettirmoqda. 2 yildan ortiq vaqt davomida bizning tovarimiz izchil arzon narxlar va yuqori sifat talablari tufayli modani demokratlashtirdi. Bizning do\'konda siz har doim eng yaxshi hip-hop va tasodifiy kiyimlarni topasiz, siz nafaqat har bir kun uchun, balki alohida bayram uchun ham o\'zingiz uchun qulay ko\'rinishni tanlashingiz mumkin. Bizning butiklarni nafaqat MDH davlatlarida, balki Turkiyada ham topishingiz mumkin. PartLion tushunchasi - bu qulay narxlarda qulay kiyim.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f65392f38652f62632f653938656263366336636530333334313233656134613935356333656637623534376335336364336263626466613336316136656636633963336331643738332e706e67, '000D1B', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/45\\/68\\/07\\/456807b7dda53e1a10e90e9b05b48719316b9918bd3b4e361aa323e417efe841.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/84\\/4b\\/87\\/844b879427fd208a67a583b38e1d6004b05bb662a16d0869fefa174bacf75f92.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/48\\/83\\/28\\/4883283fb5873befadfb478a88ff1963669b97d46d95561a52bcc47dd826be84.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/10\\/4c\\/35\\/104c35f04d2a27097f97ee8f3d0b346451af67ffb1ebe01e865f015675b221a2.jpg\"]', 2, NULL, 1, '2021-04-08 16:39:48', '2021-04-16 13:56:00'),
(192, 1, 'terrabayt5', 'TerrabaytTest', NULL, '', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f61612f34622f63342f616134626334656532376233363932363531343832616632363933333737663935633332343766313666613132643235393132616361396265306130336138632e6a7067, '', '[]', 2, NULL, 0, '2021-04-08 18:20:49', '2021-04-08 13:20:49'),
(193, 1, 'shakhrizod', 'Brand', NULL, '', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f36652f66312f36652f366566313665396630636432623839363536303432393532646261393037303039636438363930613139646337363262353138356139363061366166636166392e706e67, '', '[]', 2, NULL, 0, '2021-04-09 14:12:57', '2021-04-09 09:12:57'),
(195, 3, 'chenson', 'Chenson', NULL, 'CHENSON — один из известнейших ресторанов Ташкента, о котором более 15 лет существования с теплотой вспоминает не одно поколение гостей. Он не только продолжает радовать знаменитыми на весь Ташкент корейскими блюдами, но и, следуя в ногу со временем, расширяет свои возможности. Стильный зал для поклонников европейской и корейской кухни, банкетный зал для торжеств и семейный ресторан с оборудованной детской площадкой. В ресторане CHENSON CHILANZAR мы постарались сделать акцент на уютной и спокойной атмосфере, где можно посидеть в кругу семьи и близких людей.\r\nНеотъемлемая часть ресторана CHENSON CHILANZAR — это наша кухня, старая и знакомая кухня от CHENSON, где корейские и европейские блюда гармонично дополняют друг друга.', 'CHENSON — один из известнейших ресторанов Ташкента, о котором более 15 лет существования с теплотой вспоминает не одно поколение гостей. Он не только продолжает радовать знаменитыми на весь Ташкент корейскими блюдами, но и, следуя в ногу со временем, расширяет свои возможности. Стильный зал для поклонников европейской и корейской кухни, банкетный зал для торжеств и семейный ресторан с оборудованной детской площадкой. В ресторане CHENSON CHILANZAR мы постарались сделать акцент на уютной и спокойной атмосфере, где можно посидеть в кругу семьи и близких людей.\r\nНеотъемлемая часть ресторана CHENSON CHILANZAR — это наша кухня, старая и знакомая кухня от CHENSON, где корейские и европейские блюда гармонично дополняют друг друга.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f65352f35642f38662f653535643866633962326161336131313035373864643165633666353435636339646161306638653935333866626639623164653464613330383138313434642e706e67, '19522A', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/a9\\/a8\\/a7\\/a9a8a77ca363455007c0c7eab4b592ddc8aa653edc64c13871b74db6abc818c1.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/f7\\/3f\\/7b\\/f73f7b74e190e457047c504a7911af9a6e0001e5f4546f101cb0bc0b90191834.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/50\\/e4\\/fa\\/50e4fa4b8df775ba76915d024d75a3b3e2c2bd27f0f4038f4bbee6651ed52dea.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/97\\/9f\\/be\\/979fbe21cf52124ff0e0d2d186c45640a4a0d55508fd3e53bdc9928c46d6b45f.jpg\"]', 2, NULL, 1, '2021-04-09 17:20:39', '2021-04-12 11:33:05'),
(196, 1, 'shakhrizod', 'Brand', NULL, '', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f36652f66312f36652f366566313665396630636432623839363536303432393532646261393037303039636438363930613139646337363262353138356139363061366166636166392e706e67, '', '[]', 2, NULL, 0, '2021-04-09 17:33:01', '2021-04-09 12:33:01'),
(197, 6, 'epsent', 'Enoc', NULL, '', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f32662f31612f39302f326631613930323332656634313833336134303131386330303065363231653433363536393634346464626539303338663265323162366539623133633933372e6a7067, '000000', '[]', 2, NULL, 0, '2021-04-12 10:36:23', '2021-04-21 20:09:18'),
(198, 6, 'bars', 'Birinchi Rezinotexnika Zavodi', NULL, '', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f35382f62642f62302f353862646230396336353832363231623732663238326462346364653739396235333433666562376534383738343939353836316432333636663963653838352e6a7067, '000000', '[]', 2, NULL, 0, '2021-04-12 19:46:20', '2021-04-21 20:09:18'),
(199, 1, 'br', 'RBB', NULL, '', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f39332f39332f30382f393339333038616661643638626130383061326565666131373435343862623432363232333864623961313231313438633733326662393164666538333864342e706e67, '', '[]', 2, NULL, 0, '2021-04-13 11:42:09', '2021-04-13 06:42:09'),
(200, 2, 'ysk', 'Yaskanamu', NULL, 'YSK - это узбекский бренд одежды, который был основан в 2006 году. Всё начиналось не просто. Идей было очень много, мы много размышляли, я и моя супруга, Ирода Суюнова, какой бизнес будет выгоднее для нашей семьи. Самым оптимальным было открыть магазин одежды. Набравшись опыта для ведения бизнеса, мы решили воплотить свою мечту - создать свой бренд “Yaskanamu”.\r\nЭто был долгий путь на самом деле. Изучив все тонкости этого дела, мы приступили к открытию первого магазина. Он не спроста получил такое неординарное название. Нашу дочь зовут Жасмина, но ласкательно называли «Ясканаму», долго не думая, мы пришли к единогласному решению назвать магазин “Yaskanamu”.\r\n\r\nДень за днём мы стараемся изучить все нюансы, касающиеся нашей сферы деятельности, и улучшаем качество проделанной работы. На сегодняшний день, спустя 11 лет с момента открытия первого магазина, наша сеть получает ежедневные поставки одежды разных моделей и размеров, которые придутся по вкусу каждому человеку.\r\n\r\nМогу уверенно сказать, что на сегодняшний день наше призводство одежды не уступает мировым производителям. С нетерпением буду ждать каждого из Вас в сети магазинов “YSK\"!', 'YSK 2006 yilda tashkil etilgan o\'zbek kiyimlari brendi. Hammasi oson bo\'lmagan. Fikrlar juda ko\'p edi, biz va men turmush o\'rtog\'im Iroda Suyunova, oilamiz uchun qaysi biznes foydali bo\'lishi haqida ko\'p o\'ylardik. Eng maqbul narsa kiyim do\'konini ochish edi. Biznes yuritish bo\'yicha tajriba to\'plab, biz o\'z orzuimizni ro\'yobga chiqarishga qaror qildik - o\'zimizning \"Yaskanamu\" brendimizni yaratishga.\r\nAslida bu uzoq safar edi. Ushbu masalaning barcha nozik tomonlarini o\'rganib chiqib, birinchi do\'konni ochishga kirishdik. U bunday g\'ayrioddiy nomni bejiz qabul qilmagan. Qizimizning ismi Jasmina, ammo ularni mehr bilan \"Yaskanamu\" deb chaqirishgan, uzoq o\'ylamasdan, biz do\'konning nomini \"Yaskanamu\" deb nomlash to\'g\'risida bir ovozdan qaror qildik.\r\n\r\nKundan kunga biz o\'z faoliyatimiz sohasi bilan bog\'liq barcha nuanslarni o\'rganishga va bajarilgan ishlarning sifatini oshirishga harakat qilamiz. Bugun, birinchi do\'kon ochilganidan 11 yil o\'tib, bizning tarmoq har kuni har kimning didiga mos keladigan har xil modeldagi va o\'lchamdagi kiyim-kechaklarni etkazib beradi.\r\n\r\nIshonch bilan aytishim mumkinki, bugungi kunda bizning kiyim-kechak ishlab chiqarishimiz dunyo ishlab chiqaruvchilaridan qolishmaydi. \"YSK\" do\'konlari tarmog\'ida har biringizni kutib qolaman!', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f33352f66652f39382f333566653938363334343865396238333266643734353266366538623866366130346562623337656464326665333236333334616635303033313138366535652e706e67, '041DFF', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/8b\\/5e\\/e3\\/8b5ee38a5aa5d3c48e4b19205bf4d443689e3217ab1f8402a8733003cdbc2b20.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/2e\\/3f\\/ca\\/2e3fca0f44f9a0fac6ebab9bb7bd59fcf4bbab43197f3b4a95144832224d2a76.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/10\\/f9\\/c3\\/10f9c31bb218a7d2ec4b876df14b07045b49bffa58ee7ac9701a5c8977c9555d.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/a9\\/1d\\/0d\\/a91d0d46eb1e53a6822118cce29e9db09c37dd3a6b3f791aa22efae497164fdf.jpg\"]', 0, NULL, 1, '2021-04-14 16:41:49', '2021-04-15 10:03:57'),
(202, 2, 'atlanta', 'Atlanta', NULL, '', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f38372f36622f35652f383736623565316539646130393735643330316531393632393233356263383762353631356464653930373762383836633233626161313066373339633066362e6a7067, '000000', '[]', 2, NULL, 0, '2021-04-15 14:19:22', '2021-04-15 09:52:48'),
(203, 2, 'apple', 'MZ', NULL, '', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f36662f30332f32312f366630333231303038326535383537393165396266373765336237303034323563653839356666303631623666343437393561383534323636613436373037662e6a7067, '000000', '[]', 2, NULL, 0, '2021-04-15 16:26:45', '2021-04-19 04:49:23'),
(205, 3, 'maxway', 'MaxWay', NULL, 'Компания была основана в феврале 2005 года в Ташкенте. В основном меню ресторанов бургеры, хот-доги, сэндвичи, лаваши и донары. Мы анализируем предпочтения гостей филиалов и в каждой точке предлагаем наиболее популярный ассортимент.\r\nНаши приоритеты – свежесть и качество ингредиентов, разнообразие начинок, доступные цены и внимание к просьбам гостей.\r\n\r\nЕжедневно в рестораны MaxWay приходит большое количество самых разных людей. И мы стараемся увеличивать как число посетителей, так и число филиалов. С каждым приготовленным блюдом мы оттачиваем детали фирменных рецептов и ищем идеальный баланс цены и качества, чтобы и дальше оставаться вашим любимым брендом.\r\nПриходите в наши филиалы всей семьей, проведите досуг с комфортом и обязательно расскажите нам, как это было.\r\n\r\nМы планируем расширение сети и создание франшизы MaxWay для регионов. И даже став очень большой компанией, мы навсегда останемся верны основополагающим принципам компании – открытость и качество. И если вдруг вы столкнулись с плохим обслуживанием или низким качеством приготовленной еды в наших филиалах, обязательно напишите нам на info@maxway.uz. Мы с радостью принимаем как положительные, так и отрицательные отзывы. Жалоба гостя – подарок, благодаря которому нам есть куда расти.\r\n\r\nВыбирайте свой путь и достигайте максимальных вершин с MaxWay!', 'Kompaniya 2005 yil fevral oyida Toshkent shahrida tashkil etilgan. Restoranlarning asosiy menyusi burger, sosiskalar, sendvichlar, pita nonlari va donorlarni o\'z ichiga oladi. Biz filial mehmonlarining afzalliklarini tahlil qilamiz va har bir nuqtada eng mashhur assortimentni taklif etamiz.\r\nBizning ustuvor vazifalarimiz ingredientlarning yangiligi va sifati, turli xil plomba moddalari, arzon narxlar va mehmonlarimizning talablariga e\'tibor berishdir.\r\n\r\nMaxWay restoranlariga har kuni turli xil odamlar keladi. Va biz tashrif buyuruvchilar sonini va filiallar sonini ko\'paytirishga harakat qilmoqdamiz. Har bir tayyorlagan taomimiz bilan biz o\'zingizning sevimli brendingiz bo\'lishni davom ettirish uchun imzo retseptlarimizning tafsilotlarini yaxshilaymiz va narx va sifatning mukammal muvozanatini izlaymiz.\r\nButun oila bilan bizning filiallarga keling, bo\'sh vaqtingizni bemalol o\'tkazing va bu qanday bo\'lganligini bizga aytib bering.\r\n\r\nBiz tarmoqni kengaytirishni va mintaqalar uchun MaxWay franchayzasini yaratishni rejalashtirmoqdamiz. Va hatto juda katta kompaniyaga aylanib, biz kompaniyaning asosiy tamoyillari - ochiqlik va sifatga abadiy sodiq qolamiz. Agar siz kutilmaganda bizning filiallarimizda sifatsiz xizmat yoki pishgan ovqatning pastligi bilan duch kelsangiz, bizga info@maxway.uz elektron manziliga yozishni unutmang. Biz ijobiy va salbiy fikrlarni mamnuniyat bilan qabul qilamiz. Mehmonlarning shikoyati - bu bizga o\'sishga imkoniyat beradigan sovg\'adir.\r\n\r\nO\'zingizning yo\'lingizni tanlang va MaxWay yordamida eng yuqori cho\'qqilarga chiqing!', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f33352f34652f38302f333534653830363961353830326364633064333739633263663163643437346639353532643262643862303363323565353430393038313765373038363866652e706e67, 'AB0E9B', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/9b\\/62\\/0e\\/9b620ef9ab514bb046b98df0f947bc6dcc3d9195f916e297f130cc5f3b2035b4.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/36\\/55\\/74\\/365574da77dcdcedd9487cc5d06c2dc8a7e222d4a618cba305fdee4963504885.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/97\\/c4\\/59\\/97c459db00183fd97e5cdf1ba6bb2b543a7ad90f898828d42cf2eeeac74efbad.jpg\"]', 2, NULL, 1, '2021-04-16 11:02:03', '2021-04-16 11:20:28'),
(206, 3, 'maxway', 'MasterFood', NULL, 'В MasterFood трепетно относятся к каждому процессу и конечному результату. Мы искренне верим, что каждый человек, независимо от полноты кошелька, достоин вкусной еды по приемлемым ценам. Мы хотим, чтобы наши гости могли не просто перекусывать на бегу в ритме большого города, а, наоборот, сделать паузу и получить от еды настоящее удовольствие.\r\n\r\nВ 2012 году в мае мы открыли первый ресторан MasterFood. Небольшое помещение на углу улиц Кунаева и Шота Руставели на долгие годы стало нашим символом и ведущим филиалом. В основу концепции были заложены рецепты традиционных турецких блюд, которые пришлись по вкусу всем гостям MasterFood. Со временем ассортимент блюд менялся, пока не пришел к современному виду.\r\n\r\nА тогда, почти 10 лет назад, никто не предполагал, что мы начинаем такую большую историю. Но уже в тот момент мы решили, что будем соблюдать высокие стандарты качества и всегда помнить о предпочтениях гостя.\r\n\r\nОсновной продукт компании – фастфуд - еда быстрого приготовления. Тем не менее, главный акцент при производстве мы делаем на свежести и качестве каждого ингредиента и сохраняем при этом максимально приятный уровень цен.\r\nСейчас сеть насчитывает 3 филиала в Ташкенте. За годы работы удалось отточить и оптимизировать абсолютно все рабочие процессы. Каждый сотрудник чётко знает, что и как делать на рабочем месте. Огромное внимание мы уделяем сбору обратной связи и последующей обработке отзывов.\r\n\r\nПриходите в гости и по достоинству оцените MASTERство поваров и вкус фастFOODа.\r\n\r\nДобро пожаловать в MasterFood!', 'MasterFood har bir jarayon va yakuniy natijaga ishtiyoq bilan qaraydi. Biz chin dildan ishonamizki, hamyonining to\'liqligidan qat\'i nazar, har kim hamyonbop narxlarda mazali taomlarga loyiqdir. Biz mehmonlarimiz nafaqat katta shahar ritmida yugurishda gazak yeyishlarini, balki, aksincha, to\'xtab turishlarini va o\'zlarining taomlaridan haqiqiy zavq olishlarini istaymiz.\r\n\r\n2012 yil may oyida biz birinchi MasterFood restoranimizni ochdik. Kunaev va Shota Rustaveli ko\'chalarining burchagida joylashgan kichik bino ko\'p yillar davomida bizning ramzimiz va etakchi filialimiz bo\'lib kelgan. Ushbu kontseptsiya MasterFood-ning barcha mehmonlarini xursand qilgan an\'anaviy turk taomlari retseptlariga asoslangan edi. Vaqt o\'tishi bilan zamonaviy ko\'rinishga kelgunga qadar idishlar assortimenti o\'zgargan.\r\n\r\nVa keyin, deyarli 10 yil oldin, hech kim bizning bunday katta hikoyani boshlayotganimizni tasavvur qilmagan. Ammo o\'sha paytning o\'zida biz yuqori sifat standartlariga rioya qilishimiz va har doim mehmonning afzalliklarini yodda tutishimizga qaror qildik.\r\n\r\nKompaniyaning asosiy mahsuloti fastfud - tez ovqatlanishdir. Shunga qaramay, biz ishlab chiqarishda asosiy e\'tiborni har bir ingredientning yangiligi va sifatiga, shu bilan birga narxlarning eng yoqimli darajasini saqlab turamiz.\r\nHozirda Toshkentda tarmoqning 3 ta filiali mavjud. O\'tgan yillar davomida biz barcha ish jarayonlarini yaxshilab, optimallashtirishga muvaffaq bo\'ldik. Har bir xodim ish joyida nimani va qanday qilishni aniq biladi. Fikrlarni yig\'ish va fikrlarni qayta ishlashga katta e\'tibor beramiz.\r\n\r\nTashrif buyurib, oshpazlarning MASTER mahoratini va tezkor OZIQ-ovqatlar ta\'mini qadrlang.\r\n\r\nMasterFood-ga xush kelibsiz!', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f39302f31362f64612f393031366461326232356563363061636637363833623562646164613732663630336164333966373864343333613335626230316666383132326363363365632e706e67, 'EF7F1A', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/08\\/22\\/c7\\/0822c775846b1fbb40af71b482362d25e9e24323d0397303a79db3b0a5c19ed8.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/8b\\/58\\/13\\/8b5813e841a9c70f1f6a8d333852e97b7499a5f3ee7af08160ab061e7ce0f32f.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/f7\\/9e\\/da\\/f79edabcc5ebffd273a9e975ed522a1abcecf7d5be35625857b4f6b8f9c9068b.JPG\"]', 2, NULL, 1, '2021-04-16 18:14:31', '2021-04-17 08:57:26'),
(207, 2, 'eurasia1', 'Colins', NULL, 'То, что вам подходит!\r\n\r\nБренд Colin’s был основан в 1983 году в Турции турецким бизнесменом Нуреттином Эроглу и его четырьмя братьями.\r\n\r\nColin’s специализируется как на женской, так и на мужской одежде, и гордится производством джинсов, футболок, рубашек, курток и толстовок. Бренд так же имеет линию кожаных изделий, обуви и аксессуаров. Бренд следит за последними тенденциями в мире моды, внедряет новейшие технологии в производство и стремится подарить потребителю ощущение комфорта и идеальной посадки.', 'Sizga nima mos keladi!\r\n\r\nColin brendi 1983 yilda Turkiyada turkiyalik tadbirkor Nurettin Erog\'li va uning to\'rt ukasi tomonidan tashkil etilgan.\r\n\r\nColin\'s ayollar va erkaklar kiyimlariga ixtisoslashgan va jinsi, futbolka, ko\'ylak, ko\'ylagi va futbolka ishlab chiqarish bilan faxrlanadi. Brendda charm buyumlar, poyabzal va aksessuarlar qatori ham mavjud. Brend moda olamidagi so\'nggi tendentsiyalarni kuzatib boradi, ishlab chiqarishda eng yangi texnologiyalarni tatbiq etadi va iste\'molchiga qulaylik va mukammal moslashuv hissi berishga intiladi.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f38392f62662f30362f383962663036396532343239623038343365353036333932323861393964663136356565633364323862626661663061613166643966626438363235636237362e706e67, '131313', '[]', 2, NULL, 1, '2021-04-16 18:44:11', '2021-04-21 20:10:46'),
(208, 2, 'eurasia1', 'US Polo', NULL, 'Если вы в U.S. Polo – вы в игре!\r\n\r\nU.S. Polo ASSN был основан в 1890 году в США. Компанию вдохновила американская игра в поло. Бренд выпускает разнообразную повседневную одежду с особым элегантным шиком для женщин, мужчин и детей.\r\n\r\nU.S. Polo ASSN специализируется на производстве рубашек поло, спортивных костюмов, курток, свитеров и спортивных платьев. Марка так же выпускает джинсы, кожаные аксессуары и обувь. U.S. Polo ASSN предлагает одежду для всей семьи, которую можно приобрести в более чем 160 странах.', 'Agar siz AQShda bo\'lsangiz Polo - siz o\'yindasiz!\r\n\r\nBIZ. Polo ASSN 1890 yilda AQShda tashkil etilgan. Kompaniya Amerika polosi o\'yinidan ilhomlangan. Brend ayollar, erkaklar va bolalar uchun maxsus zamonaviy shinamlik bilan har xil kundalik kiyimlarni ishlab chiqaradi.\r\n\r\nBIZ. Polo ASSN polo ko\'ylaklari, sport kostyumlari, kurtkalar, sviterlar va sport liboslari ishlab chiqarishga ixtisoslashgan. Brend shuningdek, jinsi shimlar, charm aksessuarlar va poyabzal ishlab chiqaradi. BIZ. Polo ASSN butun dunyo uchun 160 dan ortiq mamlakatda sotib olinadigan kiyim-kechaklarni taklif etadi.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f35362f32622f32642f353632623264383536653735336632323761663430356663666631343735643931666634613064326166306164383237626234353735343039636263303961392e706e67, '13284B', '[]', 2, NULL, 1, '2021-04-17 14:01:29', '2021-04-21 20:10:46'),
(209, 2, 'eurasia1', 'Celio', NULL, 'Celio* была основана в 1985 году во Франции братьями Марком и Лораном Гросманном.\r\n\r\nCelio* специализируется на производстве удобной и элегантной спортивной, повседневной и деловой одежды.  У бренда также есть линия высококачественных аксессуаров и кожгалантереи. Celio* обслуживает континентальный европейский рынок и стремится показать высокое качество своей одежды. Всего за 30 лет Celio* стала неотъемлемым международным брендом мужской одежды.', 'Celio* 1985 yilda Frantsiyada aka-uka Mark va Loran Grosmannlar tomonidan tashkil etilgan.\r\n\r\nCelio* qulay va oqlangan sport kiyimlari, oddiy va ishbilarmon kiyimlar ishlab chiqarishga ixtisoslashgan. Brend shuningdek yuqori sifatli aksessuarlar va charm buyumlar qatoriga ega. Celio * Evropa qit\'asi bozoriga xizmat qiladi va kiyimlarining yuqori sifatini namoyish etishga intiladi. Faqat 30 yil ichida Celio * erkaklar kiyimlarining ajralmas xalqaro brendiga aylandi.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f33312f66642f62342f333166646234636163633532643561643264613734366332366436623138303561346630343435653462393639343330653362313933653935656137363936632e706e67, 'FFFFFF', '[]', 2, NULL, 1, '2021-04-17 14:03:40', '2021-04-21 20:10:46'),
(210, 2, 'eurasia1', 'Pimkie', NULL, 'Не стесняйся быть собой!\r\n\r\nPimkie был основан в 1971 году во Франции. Компания является частью Ассоциации семьи Мулиес, основанной Жераром Мулиесом.\r\n\r\nPimkie специализируется на производстве женской одежды, аксессуаров, обуви и сумок. Pimkie всегда внимательно относился к женщинам, их потребностям и желаниям. Коллекции бренда сосредоточены на создании высококачественных продуктов по разумным ценам.', 'O\'zingiz kabi bo\'lishdan qo\'rqmang!\r\n\r\nPimki 1971 yilda Frantsiyada tashkil etilgan. Kompaniya Jerar Moulies tomonidan tashkil etilgan Moulies Family Association tarkibiga kiradi.\r\n\r\nPimkie ayollar kiyimlari, aksessuarlar, poyabzal va sumkalar ishlab chiqarishga ixtisoslashgan. Pimki har doim ayollarga, ularning ehtiyojlari va istaklariga e\'tiborli bo\'lib kelgan. Brend kollektsiyalari yuqori sifatli mahsulotlarni maqbul narxlarda yaratishga qaratilgan.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f36312f37342f34302f363137343430333331633666383064636162616134306462396166386537316236386632623135336362346636616665326163623664366165666163353463352e706e67, 'FFFFFF', '[]', 2, NULL, 1, '2021-04-17 14:05:16', '2021-04-21 20:10:46'),
(211, 2, 'eurasia1', 'Bata', NULL, 'Упор на комфорт и отличное качество!\r\n \r\nСемейная компания T&A Bata Shoe была основана в небольшом чешском городке Злина в 1894 году. Основателями бренда являются Томаш Батя, его брат Антонин и сестра Анна.\r\n \r\nBata специализируется на производстве удобной и высококачественной обуви. Швейцарский бренд производит обувь как для мужчин, так и для женщин с огромным разнообразием стилей. Bata постоянно старается улучшать качество жизни своих клиентов и превзойти их ожидания. Компания уже на протяжении многих десятилетий является крупнейшим в мире производителем обуви.', 'Qulaylik va mukammal sifatga e\'tibor bering!\r\n \r\nT&A Bata Shoe oilaviy kompaniyasi 1894 yilda Chexiyaning Zlin shahrida joylashgan. Brendning asoschilari Tomasz Bata, uning ukasi Antonin va singlisi Anna.\r\n \r\nBata shinam va sifatli poyabzal ishlab chiqarishga ixtisoslashgan. Shveytsariya markasi erkaklar va ayollar uchun juda ko\'p turli xil uslubdagi poyafzallarni ishlab chiqaradi. Bata doimo o\'z mijozlarining hayot sifatini yaxshilashga va ularning kutganidan yuqori bo\'lishga intiladi. Kompaniya o\'nlab yillar davomida dunyodagi eng katta poyafzal ishlab chiqaruvchisi hisoblanadi.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f65332f30362f36362f653330363636623038653330613164613765303836643937343533333237646464363365623932323861383764383331306566326561643964346361336163332e706e67, 'DC0B15', '[]', 2, NULL, 1, '2021-04-17 14:07:14', '2021-04-21 20:10:46'),
(212, 10, 'eurasia1', 'Okaidi', NULL, 'Французский стиль для ваших детей̆! \r\n  \r\nФранцузский бренд был основан в 1996 году с целью создания высококачественной одежды для младенцев и детей. Одежда Obaïbi предназначена для детей в возрасте от 0 до 3 лет, а Okaïdi - для детей в возрасте от 2 до 14 лет.\r\n  \r\nСтратегия Okaïdi направлена на развитие бренда в соответствии с потребностями и интересами растущего ребенка: действовать для детей!\r\nБренд заботится о каждом этапе развития малыша с большой любовью и вниманием.\r\n\r\nObaïbi понимает все основные потребности ребенка от самого рождения до 3 летнего возраста с помощью современных, практичных и эргономичных продуктов, которые разработаны для младенцев и предназначены для их комфорта и наиболее активного развития.\r\n  \r\nКоллекции и ценности Okaïdi подстраиваются под различные культуры, создавая связи между детьми по всему миру. Команда Okaïdi всегда работает над тем, чтобы идти в ногу с модными тенденциями, делая свою продукцию привлекательной и позволяя каждому ребенку выразить свой вкус и индивидуальность. Okaïdi создает эксклюзивные модели: прочные и функциональные, веселые и высокотехнологичные, экологически чистые и с гарантированным качеством.', 'Farzandlaringiz uchun frantsuzcha uslub̆!\r\n  \r\nFrantsuz brendi 1996 yilda chaqaloqlar va bolalar uchun yuqori sifatli kiyimlarni yaratish maqsadida tashkil etilgan. Obaibi kiyimi 0 yoshdan 3 yoshgacha bo\'lgan bolalar uchun, Okaidiy kiyimlari esa 2 yoshdan 14 yoshgacha bo\'lgan bolalar uchun.\r\n  \r\nOkaydi strategiyasi - o\'sib borayotgan bolaning ehtiyojlari va qiziqishlariga muvofiq brendni rivojlantirish: bolalar uchun harakat qiling!\r\nBrend chaqaloqni rivojlanishining har bir bosqichiga katta mehr va e\'tibor bilan g\'amxo\'rlik qiladi.\r\n\r\nObaibi chaqaloqni tug\'ilishidan 3 yoshigacha bo\'lgan zamonaviy, amaliy va ergonomik mahsulotlar bilan, ularning qulayligi va eng faol rivojlanishi uchun mo\'ljallangan barcha asosiy ehtiyojlarini tushunadi.\r\n  \r\nOkaydi kollektsiyalari va qadriyatlari turli madaniyatlarga moslashib, dunyo bo\'ylab bolalar o\'rtasida aloqalar yaratmoqda. Okaïdi jamoasi har doim moda tendentsiyalaridan xabardor bo\'lib, o\'z mahsulotlarini jozibali qilib, har bir bolaga o\'z didi va o\'ziga xosligini ifoda etishiga imkon yaratadi. Okaïdi eksklyuziv modellarni yaratadi: bardoshli va funktsional, qiziqarli va yuqori texnologiyalar, ekologik toza va kafolatlangan sifat bilan.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f66362f33382f34392f663633383439656139363761336430663735306639303932303532396530366161323539353865653336613837663136303630313861303061313236323234382e706e67, '1D3A7C', '[]', 2, NULL, 1, '2021-04-17 14:08:07', '2021-04-21 20:10:46'),
(213, 9, 'eurasia1', 'Yves Rocher', NULL, 'Действуй красиво!\r\n\r\nYves Rocher, основанная в 1959 году французским предпринимателем господином Ив Роше, является мировым брендом косметики и красоты.\r\n\r\nYves Rocher - французская косметическая компания, специализирующаяся на производстве натуральных средств по уходу за кожей, косметики и парфюмерии.  Предлагает продукцию в среднем ценовом диапазоне, выводя натуральную косметику на новый уровень.  В производственный процесс вовлечено только натуральное сырье.  Ив Роше воссоздает красоту со страстью к женщинам и природе.', 'Chiroyli harakat qiling!\r\n\r\nYves Rocher, 1959 yilda frantsiyalik tadbirkor janob Yves Rocher tomonidan tashkil etilgan bo\'lib, u kosmetika va go\'zallikning global brendidir.\r\n\r\nYves Rocher - bu tabiiy terini parvarish qilish mahsulotlari, kosmetika va parfyumeriya mahsulotlarini ishlab chiqarishga ixtisoslashgan frantsuz kosmetika kompaniyasi. Tabiiy kosmetik vositalarni yangi darajaga ko\'tarib, o\'rtacha narx oralig\'idagi mahsulotlarni taklif etadi. Faqat tabiiy xom ashyo ishlab chiqarish jarayonida ishtirok etadi. Iv Rocher go\'zallikni ayollarga va tabiatga bo\'lgan ehtiros bilan tiklaydi.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f64352f65662f38612f643565663861626539663036653462333730336363333531613037306239636264386131646231336438373035333063343436313832343039386439666163662e706e67, '8A973D', '[]', 2, NULL, 1, '2021-04-17 14:09:06', '2021-04-21 20:10:46'),
(214, 9, 'eurasia1', 'Flormar', NULL, 'Ваш безупречный макияж с профессиональной косметикой Flormar!\r\n\r\nОснованный в Милане, в одной из модных столиц мира, в 1970 году Flormar был приобретен семьей Шенбай и начал производство в Турции. На сегодняшний день, Flormar является косметическим брендом номер 1 в Турции.\r\n	\r\nБлагодаря широкому ассортименту продуктов начиная от тональных основ до уходовой косметики, Flormar стал желанным брендом среди многих женщин. \r\nБренд имеет огромное разнообразие линеек, серий различных продуктов с широкой палитрой оттенков и цветовой гаммой. Одним из основных принципов бренда является совмещение высокого качества и привлекательной цены.', 'Flormar professional kosmetikasi bilan sizning beg\'ubor makiyajingiz!\r\n\r\nDunyoning moda poytaxtlaridan biri bo\'lgan Milanda joylashgan Flormarni 1970 yilda Shenbai oilasi sotib oldi va Turkiyada ishlab chiqarishni boshladi. Bugungi kunda Flormar Turkiyada birinchi raqamli kosmetik brenddir.\r\n\r\nPoydevordan tortib go\'zallik mahsulotlariga qadar bo\'lgan turli xil mahsulotlarga ega bo\'lgan Flormar ko\'plab ayollar orasida taniqli brendga aylandi.\r\nBrend juda xilma-xil ranglarga, ranglarning keng palitrasiga ega turli xil mahsulotlar seriyasiga ega. Brendning asosiy tamoyillaridan biri bu yuqori sifatli va jozibali narxlarni birlashtirishdir.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f61632f32302f66352f616332306635363564393937303736313362646564643465396566353834373230613936346633636563326538323532383637623631366630323231396362342e706e67, 'FFFFFF', '[]', 2, NULL, 1, '2021-04-17 14:09:54', '2021-04-21 20:10:46'),
(215, 2, 'eurasia1', 'The Outlet', NULL, 'The Outlet - мода, стиль, вечные скидки!\r\n\r\nМультибрендовый магазин The Outlet от Eurasia Group смело можно назвать территорией выгодного шопинга потому что именно здесь весь ассортимент одежды, обуви, бижутерии и аксессуаров от 17 мировых брендов продаётся со скидками до -70% КРУГЛЫЙ ГОД.', 'Outlet - moda, uslub, abadiy chegirmalar!\r\n\r\nThe Eurasia Group multibrend do\'konini bemalol foydali savdo hududi deb atash mumkin, chunki aynan shu erda 17 ta jahon brendlarining barcha kiyim-kechak, poyabzal, zargarlik buyumlari va aksessuarlari -70% gacha chegirmalar bilan sotiladi.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f31612f33622f65362f316133626536623765383139343331303437363763356661363962393031663464633831363337633565353037333362636265343737356238633330363166662e706e67, 'FFFFFF', '[]', 2, NULL, 1, '2021-04-17 14:12:00', '2021-04-21 20:10:46');
INSERT INTO `partner` (`id`, `category_id`, `ox_subdomain`, `org_name`, `tin`, `description_ru`, `description_uz`, `logo`, `color`, `photo`, `interest`, `site_url`, `active`, `added_on`, `updated_on`) VALUES
(216, 2, 'eurasia1', 'Etam', NULL, 'Искусство быть желанной! \r\n\r\nБренд Etam был основан в 1916 году Максом Линдерманом в Берлине, Германия.  Первый магазин Etam во Франции открылся в 1928 году, но компания не становилась французской, до тех пор, пока торговые марки Setamile не решили объединиться с Etam в 1963 году.\r\n\r\nEtam специализируется на нижнем белье с широким выбором высококачественных моделей, а также имеет стильный выбор готовой одежды, пижамы и спортивной одежды. Философия одежды Etam заключается в удовлетворении потребностей каждой женщины, которая хочет одеваться стильно и комфортно одновременно.  Женственность, элегантность, мягкость и доступность являются основными составляющими успеха компании.', 'Istalgan san\'at!\r\n\r\nEtam 1916 yilda Germaniyaning Berlin shahrida Maks Lindermann tomonidan tashkil etilgan. Frantsiyadagi birinchi Etam do\'koni 1928 yilda ochilgan, ammo Setamile brendlari 1963 yilda Etam bilan birlashishga qaror qilgunga qadar kompaniya frantsuz tiliga bormadi.\r\n\r\nEtam yuqori sifatli modellarning keng tanlovi bilan, shuningdek, tayyor, pijama va sport kiyimlarining zamonaviy tanlovi bilan ichki kiyimlarga ixtisoslashgan. Etamning kiyim falsafasi bir vaqtning o\'zida zamonaviy va qulay kiyinishni istagan har bir ayolning ehtiyojlarini qondirishdir. Ayollik, nafislik, yumshoqlik va arzonlik - bu kompaniya muvaffaqiyatining asosiy tarkibiy qismlari.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f61352f61392f35612f613561393561386431383136303630373732643238643962353836326538353565363139383264393934313636376534366438346434653762393637376663372e706e67, 'FF6E7B', '[]', 2, NULL, 1, '2021-04-17 14:12:58', '2021-04-21 20:10:46'),
(218, 3, 'mospizza', 'MosPizza', NULL, 'Вкусная пицца в Ташкенте ждёт вас в сети пиццерий \"Московская Пицца\"! Мы готовим для Вас пиццу в Ташкенте с марта 2009 года. За это время мы запустили два заведения и у нас появилось много постоянных клиентов, чему мы очень рады! Надеемся, что Вы по достоинству оцените разнообразный выбор пиццы, качество обслуживания и саму атмосферу пиццерии Московская Пицца. В наших пиццериях мы предлагаем более 30 видов пиццы. Вы сами решаете, какой будет Ваша пицца.\r\n\r\nПиццерия \"Московская Пицца\" - это удобное месторасположение, теплая, гостеприимная атмосфера, оригинальный интерьер и большой ассортимент вкусных пицц. Наша пицца готовится по лучшим рецептам. Каждая пицца имеет свой неповторимый вкус благодаря использованию особого теста и соуса. Пицца \"Московская Пицца\" в Ташкенте - это демократичный сервис, достойная еда, качество продукции и доставка блюд.', 'Toshkentdagi mazali pizza sizni \"Moscow Pizza\" pizza tarmog\'ida kutmoqda! Biz sizlarga 2009 yil martidan beri Toshkentda pitssa tayyorlaymiz. Shu vaqt ichida biz ikkita korxonani ishga tushirdik va ko\'plab doimiy mijozlarga ega bo\'ldik, ular biz uchun juda xursand! Umid qilamizki, siz pitssalarning turli xil tanlovi, xizmat ko\'rsatish sifati va Moskovskaya pizza pitseriyasining atmosferasini qadrlaysiz. Pitsenziyalarimizda biz 30 dan ortiq turdagi pitssani taklif qilamiz. Sizning pitssangiz qanday bo\'lishiga o\'zingiz qaror qilasiz.\r\n\r\n\"Moskva pizza\" pitseriyasi - qulay joy, iliq, mehmondo\'st muhit, o\'ziga xos ichki makon va mazali pitszalarning katta assortimenti. Bizning pitssa eng yaxshi retseptlar bo\'yicha tayyorlanadi. Maxsus xamir va sous yordamida har bir pitssa o\'ziga xos ta\'mga ega. Toshkentdagi \"Moskva pizza\" pizza - bu demokratik xizmat, munosib oziq-ovqat, mahsulot sifati va oziq-ovqat etkazib berish.', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f37662f66342f36652f376666343665316139366637393961663266326630633631386365326565666564313334646331386230303864396537386130623032636635393939306466642e706e67, 'C52727', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/d8\\/d0\\/ed\\/d8d0edac3b0acb2101f21dac2d55cec06d53f0bc36f9f85007513fa71d3f19c8.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/cc\\/4a\\/0b\\/cc4a0bdcc29391a03bea02896424aa1ba91a5198035f84f0c8ea0937b632fd70.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/42\\/46\\/44\\/4246440dbd7c46008838248194293d5637763791026b4422f4e992dddcdc034d.jpg\"]', 2, NULL, 1, '2021-04-19 16:51:54', '2021-04-19 14:40:50'),
(220, 2, 'artcaravan', 'Art Caravan', NULL, 'Магазин Art Caravan вот уже на протяжении нескольких лет предлагает своим покупателям богатый выбор качественных и доступных по цене аксессуаров на любой жизненный случай. В линейке товаров нашего бренда Вы всегда найдете красивые изделия из натуральной кожи (аксессуары премиум класса) или из эко-кожи (аксессуары эконом класса) для женщин и для мужчин. Выбор ограничен исключительно Вашими предпочтениями и возможностями.\r\n\r\nДля клиентов Art Caravan всегда в шаговой доступности: модные женские и мужские сумочки, кожаные аксессуары ручной работы и кожаные бизнес аксессуары. Art Caravan – это всегда образец стиля, изящества и утонченной элегантности. Такие вещи остаются в тренде всегда.\r\n\r\nА еще… у нас Вы всегда сможете найти и купить модные и востребованные аксессуары, не только интересные модели сумочек, но и женские и мужские рюкзаки, разнообразный дорожный багаж, стильные зонтики, платочки, шарфы, ремни и перчатки, а еще многое и многое другое.\r\n\r\nЖдем Вас в Art Caravan за модными и качественными вещами!', 'Bir necha yildan buyon Art Caravan do\'koni o\'z mijozlariga har qanday imkoniyat uchun yuqori sifatli va arzon aksessuarlarning keng turlarini taklif qilmoqda. Bizning brendimiz mahsulot qatorida siz har doim ayollar va erkaklar uchun asl charm (premium aksessuarlar) yoki eko-charm (ekonom-klass aksessuarlar) dan tayyorlangan go\'zal mahsulotlarni topasiz. Tanlov faqat sizning afzalliklaringiz va imkoniyatlaringiz bilan cheklangan.\r\n\r\nArt Caravan mijozlari uchun har doim yurish masofasidan: ayollar va erkaklar uchun moda sumkalar, qo\'lda ishlangan charm buyumlar va charmdan ishbilarmonlik buyumlari. Art Caravan har doim uslub, nafislik va nafis nafislikning namunasidir. Bunday narsalar doimo trendda qoladi.\r\n\r\nVa shuningdek ... bu erda siz har doim zamonaviy va ommabop aksessuarlarni, nafaqat sumkalarning qiziqarli modellarini, balki ayollar va erkaklar sumkalarini, turli xil sayohat yuklari, zamonaviy soyabonlarni, ro\'molchalarni, sharflarni, kamar va qo\'lqoplarni va boshqalarni topishingiz va sotib olishingiz mumkin. va yana ko\'p narsalar ...\r\n\r\nArt Caravan-da sizni zamonaviy va sifatli narsalar uchun kutamiz!', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f39612f64332f36312f396164333631353031363264656366366663633739323239373464316239303435383536353134303630363864333462643461663637373964353262306437312e706e67, '000000', '[\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/c2\\/e1\\/e8\\/c2e1e8c2975377d7788f9418f2e50407113cbb9d46a5e64b3f7411839cdb6cfc.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/94\\/f4\\/97\\/94f497195b898d99dd8e1438ca163c56e779f61bd2e0aa1bfd58bda17d44e1a1.jpg\",\"https:\\/\\/files.ox-sys.com\\/cache\\/1000x_\\/image\\/c4\\/41\\/59\\/c4415985b46a377071111b4a2b348154ed9a596fbdee4a102dbe6b26f5f136dc.jpg\"]', 2, NULL, 1, '2021-04-19 17:45:51', '2021-04-19 14:40:50'),
(221, 1, 'mobilezone', 'Mobilezone', NULL, '', '', 0x68747470733a2f2f66696c65732e6f782d7379732e636f6d2f63616368652f313530785f2f696d6167652f66662f38342f64302f666638346430363566663535316162613637663264646435316563323330656162613739653831346163323836646430376631666235333765323463623036642e6a7067, '', '[]', 2, NULL, 0, '2021-04-21 13:08:52', '2021-04-21 08:08:52');

-- --------------------------------------------------------

--
-- Структура таблицы `partner_cashback_condition`
--

CREATE TABLE `partner_cashback_condition` (
  `id` int UNSIGNED NOT NULL,
  `partner_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED DEFAULT NULL COMMENT 'NULL, если по всем локациям',
  `cashback_percent` tinyint DEFAULT NULL COMMENT 'Размер кешбэка при любой покупке (%)',
  `title` text,
  `description` tinytext COMMENT 'Доход от кешбека',
  `status` tinyint(1) DEFAULT '1' COMMENT 'Кешбек при первой покупке (%)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `partner_cashback_condition`
--

INSERT INTO `partner_cashback_condition` (`id`, `partner_id`, `location_id`, `cashback_percent`, `title`, `description`, `status`) VALUES
(5, 5, NULL, 5, 'Кешбэк 5% на общую сумму чека', 'Акция активна', 1),
(88, 179, NULL, 5, 'Кешбек 5%', NULL, 1),
(104, 187, NULL, 8, 'Кешбэк 8%', 'Кешбэк на общую сумму чека', 1),
(116, 192, NULL, 5, 'test', 'opisaniya', 1),
(118, 160, NULL, 10, 'Кэшбек 10%', NULL, 1),
(123, 193, NULL, 5, 'test1', '222', 1),
(126, 196, NULL, 10, 'test11', 'qweqweqw', 1),
(128, 195, NULL, 10, 'Кешбэк 10%', 'Кешбэк 10% на общий чек', 1),
(192, 200, NULL, 5, 'Кешбэк 5%', 'На общий чек', 1),
(198, 122, NULL, 10, 'Кешбэк 10%', 'Кешбэк на общую сумму', 1),
(207, 166, NULL, 8, 'кешбэк 8%', 'на общую сумму чека', 1),
(208, 156, NULL, 8, 'кешбэк 8%', 'на общую сумму чека', 1),
(209, 154, NULL, 8, 'кешбэк 8%', 'на общую сумму чека', 1),
(210, 106, NULL, 8, 'кешбэк 8%', 'на общую сумму чека', 1),
(213, 205, NULL, 5, 'Кешбэк 5%', 'Кешбэк на общий чек', 1),
(214, 206, NULL, 5, 'Кешбэк 5%', 'Кешбэк на общий чек', 1),
(215, 188, NULL, 5, 'Кешбэк 5%', 'на общую сумму чека', 1),
(216, 107, NULL, 5, 'Кешбэк 5%', '5% кешбэк на игрушки в сети магазинов Erkatoy', 1),
(217, 218, NULL, 5, 'Кешбэк 5%', 'На общую сумму чека', 1),
(218, 220, NULL, 5, 'Кешбэк 5%', 'На общую сумму чека', 1),
(258, 207, NULL, 5, 'Кешбэк 5%', 'На всю сумму чека', 1),
(259, 213, NULL, 5, 'Кешбэк 5%', 'На всю сумму чека', 1),
(260, 210, NULL, 5, 'Кешбэк 5%', 'На всю сумму чека', 1),
(261, 216, NULL, 5, 'Кешбэк 5%', 'На всю сумму чека', 1),
(262, 211, NULL, 5, 'Кешбэк 5%', 'На всю сумму чека', 1),
(263, 208, NULL, 5, 'Кешбэк 5%', 'На всю сумму чека', 1),
(264, 212, NULL, 5, 'Кешбэк 5%', 'На всю сумму чека', 1),
(265, 215, NULL, 5, 'Кешбэк 5%', 'На всю сумму чека', 1),
(266, 209, NULL, 5, 'Кешбэк 5%', 'На всю сумму чека', 1),
(267, 214, NULL, 5, 'Кешбэк 5%', 'На всю сумму чека', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `partner_category`
--

CREATE TABLE `partner_category` (
  `id` int UNSIGNED NOT NULL,
  `name_ru` varchar(100) DEFAULT NULL,
  `name_uz` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `partner_category`
--

INSERT INTO `partner_category` (`id`, `name_ru`, `name_uz`) VALUES
(1, 'Техника', 'Tehnika'),
(2, 'Одежда и обувь', 'Kiyim va oyoq kiyim'),
(3, 'Рестораны, кафе, фастфуд', 'Choyxonalar'),
(4, 'Красота и здоровье', 'Soglik'),
(5, 'Развлечения', 'Enjoy'),
(6, 'Услуги', 'Hizmatlar'),
(7, 'Авиабилеты и туризм', 'Avia chiptalar'),
(8, 'Продовольственные товары', 'Oziq ovqatlar'),
(9, 'Косметика и парфюм', 'Kosmetika va parfyumeriya'),
(10, 'Детские вещи и игрушки', 'Bolalar uchun kiyim va o\'yinchoqlar');

-- --------------------------------------------------------

--
-- Структура таблицы `partner_location`
--

CREATE TABLE `partner_location` (
  `id` int UNSIGNED NOT NULL,
  `ox_location_id` int UNSIGNED DEFAULT NULL,
  `partner_id` int UNSIGNED DEFAULT NULL,
  `city_id` int UNSIGNED DEFAULT '1',
  `address_ru` tinytext,
  `address_uz` tinytext,
  `coordinates` varchar(255) DEFAULT NULL COMMENT 'Координаты на карте',
  `phone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `partner_location`
--

INSERT INTO `partner_location` (`id`, `ox_location_id`, `partner_id`, `city_id`, `address_ru`, `address_uz`, `coordinates`, `phone`) VALUES
(14, NULL, 5, 1, 'Мирзо-Улугбекский район, улица Мунавваркори 9 (ориентир: ТТЗ Диадора)', NULL, '41.359128,69.385305', '998935123455'),
(111, 19, 107, 1, 'Ташкент город, Мирабадский район, ул. Нукус 81А, ,,', 'Ташкент город, Мирабадский район, ул. Нукус 81А, ,,', '41.28716690094396, 69.27226422513122', '998712050065'),
(123, 1, 122, 1, 'Ташкент город, Мирзо-Улугбекский район, 100115, улица Паркентская 131, ,,', 'Ташкент город, Мирзо-Улугбекский район, 100115, улица Паркентская 131, ,,', '41.315276644280274, 69.32654027909848', '998712692775'),
(164, 68, 160, 1, 'Ташкент город, Учтепинский район, Oasis, ,,', 'Ташкент город, Учтепинский район, Oasis, ,,', '41.286824341841545, 69.21603758404338', '+998909969699'),
(171, 263, 166, 1, 'Ташкент город, Алмазарский район, ТРЦ «Riviera», 2-этаж., ,,', 'Ташкент город, Алмазарский район, ТРЦ «Riviera», 2-этаж., ,,', '41.33976668753439, 69.25373278703306', '998712050002'),
(240, 3, 187, 1, 'Ташкент город, Мирабадский район, улица Ш. Рашидова, 40а, ,,', 'Ташкент город, Мирабадский район, улица Ш. Рашидова, 40а, ,,', '41.305983648630445, 69.26559354232785', '998712524200'),
(241, 1, 187, 1, 'Ташкент город, Мирабадский район, улица Тараса Шевченко, 42 А, ,,', 'Ташкент город, Мирабадский район, улица Тараса Шевченко, 42 А, ,,', '41.29556945163093, 69.2821081441802', '998712558900'),
(284, 9, 195, 1, 'Ташкент город, Мирабадский район, ул. Сарбон, дом4, ,,', 'Ташкент город, Мирабадский район, ул. Сарбон, дом4, ,,', '41.251082582734334, 69.32270259607418', '998712905552  998712909391'),
(285, 11, 195, 1, 'Ташкент город, Чиланзарский район, квартал 8, дом 13, ,,', 'Ташкент город, Чиланзарский район, квартал 8, дом 13, ,,', '41.28886022227627, 69.20734167790985', '998712884050  998983675040'),
(294, 11, 198, 1, 'Ташкент город, Мирзо-Улугбекский район, -, -, ,,', 'Ташкент город, Мирзо-Улугбекский район, -, -, ,,', ', ', NULL),
(295, 12, 198, 1, 'Ташкент город, Мирзо-Улугбекский район, -, -, ,,', 'Ташкент город, Мирзо-Улугбекский район, -, -, ,,', ', ', NULL),
(296, 13, 198, 1, 'Ташкент город, Яккасарайский район, -, -, ,,', 'Ташкент город, Яккасарайский район, -, -, ,,', ', ', NULL),
(297, 4, 198, 1, 'Ташкент город, Сергелийский район, -, -, ,,', 'Ташкент город, Сергелийский район, -, -, ,,', ', ', ''),
(298, 16, 198, 1, 'Tashkent, -, -, ,,', 'Tashkent, -, -, ,,', ', ', NULL),
(299, 17, 198, 1, 'Ташкент город, Яшнабадский район, -, -, ,,', 'Ташкент город, Яшнабадский район, -, -, ,,', ', ', NULL),
(300, 19, 198, 1, 'Ташкент город, Чиланзарский район, -, -, ,,', 'Ташкент город, Чиланзарский район, -, -, ,,', ', ', NULL),
(301, 20, 198, 1, 'Ташкент город, Чиланзарский район, -, -, ,,', 'Ташкент город, Чиланзарский район, -, -, ,,', ', ', NULL),
(302, 21, 198, 1, 'Ташкент город, Яккасарайский район, -, -, ,,', 'Ташкент город, Яккасарайский район, -, -, ,,', ', ', NULL),
(303, 22, 198, 1, 'Ташкент город, Шайхантахурский район, -, -, ,,', 'Ташкент город, Шайхантахурский район, -, -, ,,', ', ', NULL),
(304, 23, 198, 1, 'Ташкент город, Шайхантахурский район, -, -, ,,', 'Ташкент город, Шайхантахурский район, -, -, ,,', ', ', NULL),
(305, 24, 198, 1, 'Ташкент город, Юнусабадский район, -, -, ,,', 'Ташкент город, Юнусабадский район, -, -, ,,', ', ', NULL),
(306, 26, 198, 1, 'Ташкент город, Бектемирский район, -, -, ,,', 'Ташкент город, Бектемирский район, -, -, ,,', ', ', NULL),
(307, 27, 198, 1, 'Ташкент город, Мирабадский район, -, -, ,,', 'Ташкент город, Мирабадский район, -, -, ,,', ', ', NULL),
(308, 28, 198, 1, 'Ташкент город, Юнусабадский район, -, -, ,,', 'Ташкент город, Юнусабадский район, -, -, ,,', ', ', NULL),
(309, 29, 198, 1, 'Ташкент город, Сергелийский район, -, -, ,,', 'Ташкент город, Сергелийский район, -, -, ,,', ', ', NULL),
(310, 30, 198, 1, 'Ташкент город, Бектемирский район, -, -, ,,', 'Ташкент город, Бектемирский район, -, -, ,,', ', ', NULL),
(311, 31, 198, 1, 'Ташкент город, Юнусабадский район, -, -, ,,', 'Ташкент город, Юнусабадский район, -, -, ,,', ', ', NULL),
(329, 32, 198, 1, 'Ташкентская область, город Ангрен, -, -, ,,', 'Ташкентская область, город Ангрен, -, -, ,,', ', ', NULL),
(330, 254, 200, 1, 'Ташкент город, Юнусабадский район, -, улица Янги Юнусабад, 53А, ,,', 'Ташкент город, Юнусабадский район, -, улица Янги Юнусабад, 53А, ,,', '41.372146760985835, 69.31911352941258', '998998884551'),
(331, 253, 200, 1, 'Ташкент город, Юнусабадский район, ул. Янгишахар, квартал 13, ,,', 'Ташкент город, Юнусабадский район, ул. Янгишахар, квартал 13, ,,', '41.365646638586206, 69.2947162785971', '998931309737'),
(332, 132, 200, 1, 'Tashkent, Квартал 12, дом 21 а, ,,', 'Tashkent, Квартал 12, дом 21 а, ,,', '41.28557457567319, 69.18650948275022', '998951937110'),
(333, 131, 200, 1, 'Ташкент город, Чиланзарский район, Проспект Бунёдкор, 52, ,,', 'Ташкент город, Чиланзарский район, Проспект Бунёдкор, 52, ,,', '41.27687456488364, 69.20519933068847', '998984757110'),
(334, 129, 200, 1, 'Ташкент город, Чиланзарский район, квартал 9, дом 2, ,,', 'Ташкент город, Чиланзарский район, квартал 9, дом 2, ,,', '41.28499291043682, 69.20374856004528', '998712763017'),
(335, 126, 200, 1, 'Ташкент город, Мирзо-Улугбекский район, ТТЗ-2, ул, Ахиллик, ,,', 'Ташкент город, Мирзо-Улугбекский район, ТТЗ-2, ул, Ахиллик, ,,', '41.35578535234489, 69.38444132310933', '998712647977'),
(336, 125, 200, 1, 'Ташкент город, Шайхантахурский район, массив Хадра, 23, ,,', 'Ташкент город, Шайхантахурский район, массив Хадра, 23, ,,', '41.32737960135047, 69.248389728836', '998712446266'),
(337, 123, 200, 1, 'Ташкент город, Мирзо-Улугбекский район, ул. Буюк Ипак Йули дом 60, ,,', 'Ташкент город, Мирзо-Улугбекский район, ул. Буюк Ипак Йули дом 60, ,,', '41.326145494233664, 69.33107526195701', '998712673403'),
(338, 120, 200, 1, 'Ташкент город, Мирзо-Улугбекский район, Кора-Сув 6 между дом 10, ,,', 'Ташкент город, Мирзо-Улугбекский район, Кора-Сув 6 между дом 10, ,,', '41.32105929896654, 69.35517872701828', '998712657009'),
(339, 119, 200, 1, 'Ташкент город, Яшнабадский район, улица Авиасозлар, дом 115, ,,', 'Ташкент город, Яшнабадский район, улица Авиасозлар, дом 115, ,,', '41.28491851615414, 69.34775476134087', '998712943984'),
(340, 118, 200, 1, 'Ташкент город, Алмазарский район, ул. Г. Гуляма 17/18, ,,', 'Ташкент город, Алмазарский район, ул. Г. Гуляма 17/18, ,,', '41.32745998178603, 69.24808651268265', '998712273007'),
(341, 117, 200, 1, 'Ташкент город, Яккасарайский район, улица Шота Руставели, 11, ,,', 'Ташкент город, Яккасарайский район, улица Шота Руставели, 11, ,,', '41.294811658502006, 69.26762431717064', '998951697110'),
(342, 116, 200, 1, 'Ташкент город, Мирзо-Улугбекский район, ул. Буюк Ипак Йули, 430, ,,', 'Ташкент город, Мирзо-Улугбекский район, ул. Буюк Ипак Йули, 430, ,,', '41.35226987190265, 69.38732236171451', '998951457110'),
(343, 115, 200, 1, 'Ташкент город, Мирзо-Улугбекский район, ул. М.Улугбек 89, ,,', 'Ташкент город, Мирзо-Улугбекский район, ул. М.Улугбек 89, ,,', '41.34533417336899, 69.34569008375476', '998712625170'),
(344, 114, 200, 1, 'Ташкент город, Чиланзарский район, ул чиланзарская дом 55, ,,', 'Ташкент город, Чиланзарский район, ул чиланзарская дом 55, ,,', '41.28301027580717, 69.22312312316728', '998712772554'),
(345, 113, 200, 1, 'Ташкент город, Юнусабадский район, ул. Амир Тимура 70, ,,', 'Ташкент город, Юнусабадский район, ул. Амир Тимура 70, ,,', '41.32903614695414, 69.28399664663765', '998712345245'),
(346, 112, 200, 1, 'Ташкент город, Юнусабадский район, Массив Юнусабад. квартал 2, дом 7б, ,,', 'Ташкент город, Юнусабадский район, Массив Юнусабад. квартал 2, дом 7б, ,,', '41.363058649439225, 69.28796196347298', '998712218402'),
(347, 109, 200, 1, 'Ташкент город, Мирзо-Улугбекский район, Кора-Сув 2, ,,', 'Ташкент город, Мирзо-Улугбекский район, Кора-Сув 2, ,,', '41.334006743406796, 69.36775856422074', '998712652660'),
(348, 110, 200, 1, 'Ташкент город, Шайхантахурский район, ул Беруни дом 5, ,,', 'Ташкент город, Шайхантахурский район, ул Беруни дом 5, ,,', '41.331992696428266, 69.21895395337577', '998712495747'),
(349, 111, 200, 1, 'Ташкент город, Юнусабадский район, ул. Олой базар, берк 7, ,,', 'Ташкент город, Юнусабадский район, ул. Олой базар, берк 7, ,,', '41.32005292621617, 69.28313802233315', '998712094489'),
(350, 2, 202, 1, 'Tashkent, Algoritm, ,,', 'Tashkent, Algoritm, ,,', ', ', NULL),
(352, 2, 203, 1, 'Ташкент город, Мирзо-Улугбекский район, ., ,,', 'Ташкент город, Мирзо-Улугбекский район, ., ,,', ', ', NULL),
(353, 3, 202, 1, 'Бухарская область, Ромитанский район, Romitan deqqon bozori, ,,', 'Бухарская область, Ромитанский район, Romitan deqqon bozori, ,,', ', ', '945455016'),
(354, 1, 205, 1, 'Ташкент город, Шайхантахурский район, улица Заркайнар, 4, ,,', 'Ташкент город, Шайхантахурский район, улица Заркайнар, 4, ,,', '41.32261968533566, 69.24195135152053', '998712005400'),
(355, 7, 205, 1, 'Ташкент город, Мирзо-Улугбекский район, улица Буюк Ипак Йули, дом 4, ,,', 'Ташкент город, Мирзо-Улугбекский район, улица Буюк Ипак Йули, дом 4, ,,', '41.32658783410757, 69.32989822635454', '998712005400'),
(356, 8, 205, 1, 'Ташкент город, Юнусабадский район, улица Осиё, дом 84А, ,,', 'Ташкент город, Юнусабадский район, улица Осиё, дом 84А, ,,', '41.32799251825418, 69.2825486090862', '998712005400'),
(357, 9, 205, 1, 'Ташкент город, Юнусабадский район, массив Юнусабад, 3-й квартал, 21, ,,', 'Ташкент город, Юнусабадский район, массив Юнусабад, 3-й квартал, 21, ,,', '41.362998650983926, 69.2891026901435', '998712005400'),
(358, 11, 205, 1, 'Ташкент город, Юнусабадский район, улица Т. Зохидов, дом 119, ,,', 'Ташкент город, Юнусабадский район, улица Т. Зохидов, дом 119, ,,', '41.36344759046324, 69.28861868347097', '998712005400'),
(359, 12, 205, 1, 'Ташкент город, Юнусабадский район, улица Юнусата, ,,', 'Ташкент город, Юнусабадский район, улица Юнусата, ,,', '41.37117567489757, 69.31107857810387', '998712005400'),
(360, 224, 156, 1, 'Ташкент город, Бектемирский район, ТРЦ «Compass»,1-этаж., ,,', 'Ташкент город, Бектемирский район, ТРЦ «Compass»,1-этаж., ,,', '41.23879968262636, 69.3285922790985', '998712055001'),
(361, 133, 156, 1, 'Ташкент город, Чиланзарский район, ул. Катартал 28, ТРЦ «Atlas», 2-этаж., ,,', 'Ташкент город, Чиланзарский район, ул. Катартал 28, ТРЦ «Atlas», 2-этаж., ,,', '41.28111247529062, 69.20115948265904', '998998903535'),
(362, 8, 156, 1, 'Ташкент город, Юнусабадский район, ТРЦ «MegaPlanet», 3-этаж., ,,', 'Ташкент город, Юнусабадский район, ТРЦ «MegaPlanet», 3-этаж., ,,', '41.367198879853674, 69.29131843130487', '998781505001'),
(363, 7, 156, 1, 'Ташкент город, Яккасарайский район, ул. Бабура 6, ТРК«Next», 2-этаж., ,,', 'Ташкент город, Яккасарайский район, ул. Бабура 6, ТРК«Next», 2-этаж., ,,', '41.2978215602468, 69.2494471197177', '998712310300'),
(364, 6, 156, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ 5А, ТРЦ «Samarqand Darvoza», 3-этаж., ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ 5А, ТРЦ «Samarqand Darvoza», 3-этаж., ,,', '41.316292628669984, 69.23155338227842', '998712050102'),
(365, 259, 156, 1, 'Ташкент город, Мирзо-Улугбекский район, ул. Т.Малик 3А, ТРЦ «Atlas Chimgan»., ,,', 'Ташкент город, Мирзо-Улугбекский район, ул. Т.Малик 3А, ТРЦ «Atlas Chimgan»., ,,', '41.35373743031897, 69.35311532142633', '998711033734'),
(367, 225, 106, 1, 'Ташкент город, Алмазарский район, ул. Нурафшон 5, ТРЦ «Riviera», 2-этаж., ,,', 'Ташкент город, Алмазарский район, ул. Нурафшон 5, ТРЦ «Riviera», 2-этаж., ,,', '41.33962114160168, 69.25463400926205', '998712055002'),
(368, 257, 106, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ 5А, ТРЦ «Samarqand Darvoza», 3-этаж., ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ 5А, ТРЦ «Samarqand Darvoza», 3-этаж., ,,', '41.31627389522869, 69.23136120560203', '998712055003'),
(370, 260, 166, 1, 'Ташкент город, Мирзо-Улугбекский район, ТРЦ «Atlas Chimgan», ,,', 'Ташкент город, Мирзо-Улугбекский район, ТРЦ «Atlas Chimgan», ,,', '41.35381512731573, 69.35317111231257', '998970030103'),
(371, 256, 166, 1, 'Ташкент город, Шайхантахурский район, ТРЦ «Samarqand Darvoza», 2-этаж., ,,', 'Ташкент город, Шайхантахурский район, ТРЦ «Samarqand Darvoza», 2-этаж., ,,', '41.31636542793578, 69.23069507539364', '998712055303'),
(373, 261, 154, 1, 'Ташкент город, Мирзо-Улугбекский район, ТРЦ «Atlas Chimgan», ,,', 'Ташкент город, Мирзо-Улугбекский район, ТРЦ «Atlas Chimgan», ,,', '41.35373320772563, 69.35330844047539', '998970070103'),
(374, 266, 154, 1, 'Ташкент город, Шайхантахурский район, ТРЦ «Samarqand Darvoza», 3-этаж, ,,', 'Ташкент город, Шайхантахурский район, ТРЦ «Samarqand Darvoza», 3-этаж, ,,', '41.31635913537633, 69.2313882209015', '998712055004'),
(375, 13, 206, 1, 'Ташкент город, Яккасарайский район, улица Шота Руставели, 9A, ,,', 'Ташкент город, Яккасарайский район, улица Шота Руставели, 9A, ,,', '41.29508245735738, 69.26799394907374', '998712005600'),
(376, 14, 206, 1, 'Ташкент город, Сергелийский район, улица Янги Сергели, 8, ,,', 'Ташкент город, Сергелийский район, улица Янги Сергели, 8, ,,', '41.21641678464554, 69.22801668650814', '998712005600'),
(377, 15, 206, 1, 'Ташкент город, Шайхантахурский район, массив Хадра, 2, ,,', 'Ташкент город, Шайхантахурский район, массив Хадра, 2, ,,', '41.325109487605324, 69.24528715145108', '998712005600'),
(378, 16, 206, 1, 'Ташкент город, Яккасарайский район, улица бобура, ТРЦ Next, ,,', 'Ташкент город, Яккасарайский район, улица бобура, ТРЦ Next, ,,', '41.29795599883203, 69.24945230662918', '998712005600'),
(379, 17, 205, 1, 'Ташкент город, Чиланзарский район, улица Мукими, дом 2, ,,', 'Ташкент город, Чиланзарский район, улица Мукими, дом 2, ,,', '41.287850606585366, 69.22923806601865', '998712005400'),
(380, 1, 188, 1, 'Ташкент город, Яккасарайский район, ул. Мирабад 12-235, ,,', 'Ташкент город, Яккасарайский район, ул. Мирабад 12-235, ,,', '41.29781848694013, 69.26774926071785', '998901219977'),
(381, 268, 211, 1, 'Ташкент город, Алмазарский район, ул. Нурафшон 5, ТРЦ \"Riviera\", ,,', 'Ташкент город, Алмазарский район, ул. Нурафшон 5, ТРЦ \"Riviera\", ,,', '41.34001026289, 69.25429091534423', '998781290888'),
(382, 262, 215, 1, 'Ташкент город, Алмазарский район, ул. Нурафшан, 7, ТЦ \"Shahar Outlet\", 2-й этаж, ,,', 'Ташкент город, Алмазарский район, ул. Нурафшан, 7, ТЦ \"Shahar Outlet\", 2-й этаж, ,,', '41.33783352751867, 69.2230302331351', '998781291500'),
(383, 261, 212, 1, 'Ташкент город, Шайхантахурский район, ул. Нурафшон 5, ТРЦ «Riviera», ,,', 'Ташкент город, Шайхантахурский район, ул. Нурафшон 5, ТРЦ «Riviera», ,,', '41.33962214113703, 69.25469861111449', '998781293111'),
(384, 260, 213, 1, 'Ташкент город, Алмазарский район, ул. Нурафшон 5, ТРЦ \"Riviera\", ,,', 'Ташкент город, Алмазарский район, ул. Нурафшон 5, ТРЦ \"Riviera\", ,,', '41.33958979755242, 69.25465569577028', '998781298111'),
(385, 258, 207, 1, 'Ташкент город, Алмазарский район, ул. Нурафшон 5, ТРЦ \"Riviera\", 1 этаж, ,,', 'Ташкент город, Алмазарский район, ул. Нурафшон 5, ТРЦ \"Riviera\", 1 этаж, ,,', '41.33950893852008, 69.25444111904908', '998781298777'),
(386, 257, 208, 1, 'Ташкент город, Алмазарский район, ул. Нурафшон 5, ТРЦ \"Riviera\", 1 этаж, ,,', 'Ташкент город, Алмазарский район, ул. Нурафшон 5, ТРЦ \"Riviera\", 1 этаж, ,,', '41.33954128214517, 69.25431237301633', '998781298222'),
(387, 2, 214, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ 5А, ТРЦ \"Samarqand Darvoza\", 2-этаж, ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ 5А, ТРЦ \"Samarqand Darvoza\", 2-этаж, ,,', '41.31661375462386, 69.23110122453686', '998712051011'),
(388, 61, 207, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ 5А, ТРЦ \"Samarqand Darvoza\", 2-этаж, ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ 5А, ТРЦ \"Samarqand Darvoza\", 2-этаж, ,,', '41.31639131301942, 69.23138285648346', '998712050060'),
(389, 256, 107, 1, 'Ташкент город, Алмазарский район, ул. Себзар, ТРЦ Riviera 2 этаж, ,,', 'Ташкент город, Алмазарский район, ул. Себзар, ТРЦ Riviera 2 этаж, ,,', '41.33964216497268, 69.25455890740963', '998997665515'),
(390, 259, 107, 1, 'Ташкент город, Мирзо-Улугбекский район, массив Буюк Ипак Йили, Экопарк (ор-р), ,,', 'Ташкент город, Мирзо-Улугбекский район, массив Буюк Ипак Йили, Экопарк (ор-р), ,,', '41.31231484081975, 69.29417033182968', '998999888686'),
(391, 1, 218, 1, 'Ташкент город, Яккасарайский район, улица Урикзор, 140 (Ракат махаля), ,,', 'Ташкент город, Яккасарайский район, улица Урикзор, 140 (Ракат махаля), ,,', '41.29292803277941, 69.2482620882912', '998712036633'),
(392, 1, 220, 1, 'Ташкент город, Мирабадский район, улица Буюк Турон (книжные ряды), ,,', 'Ташкент город, Мирабадский район, улица Буюк Турон (книжные ряды), ,,', '41.30683037714888, 69.2683293584131', '998951770995'),
(393, 2, 221, 1, 'Ташкент город, улица, ,,', 'Ташкент город, улица, ,,', ', ', NULL),
(395, 58, 208, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ «Samarqand Darvoza», 2 этаж, ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ «Samarqand Darvoza», 2 этаж, ,,', '41.31656071938547, 69.23096540662021', '998712050080'),
(396, 71, 209, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ \"Samarqand Darvoza\", 2-й этаж, ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ \"Samarqand Darvoza\", 2-й этаж, ,,', '41.316419623811576, 69.23143113624576', '998712050110'),
(397, 82, 210, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ \"Samarqand Darvoza\", 2-й этаж, ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ \"Samarqand Darvoza\", 2-й этаж, ,,', '41.31630233616349, 69.23147405158991', '998712050504'),
(398, 65, 216, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ \"Samarqand Darvoza\", 2-й этаж, ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ \"Samarqand Darvoza\", 2-й этаж, ,,', '41.316443890194954, 69.23147405159001', '998712050330'),
(399, 73, 211, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ \"Samarqand Darvoza\", 2 этаж, ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ \"Samarqand Darvoza\", 2 этаж, ,,', '41.316437823599955, 69.2314096785736', '998712050008'),
(400, 62, 213, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ 5А, ТРЦ \"Samarqand Darvoza\", 2-этаж, ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ 5А, ТРЦ \"Samarqand Darvoza\", 2-этаж, ,,', '41.31662790997279, 69.2311816908073', '998712050405'),
(401, 78, 212, 1, 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ «Samarqand Darvoza», 2-й этаж, ,,', 'Ташкент город, Шайхантахурский район, ул. Караташ, 5А, ТРЦ «Samarqand Darvoza», 2-й этаж, ,,', '41.31665015408629, 69.23107172023774', '998712050503');

-- --------------------------------------------------------

--
-- Структура таблицы `partner_terminal`
--

CREATE TABLE `partner_terminal` (
  `id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED DEFAULT NULL,
  `terminal_id` varchar(10) DEFAULT NULL,
  `merchant_id` varchar(20) DEFAULT NULL,
  `merchant_name` varchar(26) DEFAULT NULL,
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `partner_terminal`
--

INSERT INTO `partner_terminal` (`id`, `location_id`, `terminal_id`, `merchant_id`, `merchant_name`, `added_on`) VALUES
(163, 241, '271100QR', NULL, NULL, '2021-04-08 12:34:47'),
(164, 240, '271100QP', NULL, NULL, '2021-04-08 12:35:39'),
(168, 164, '123123', NULL, NULL, '2021-04-08 18:24:33'),
(174, 285, '01111276', NULL, NULL, '2021-04-12 16:38:52'),
(175, 284, '01116377', NULL, NULL, '2021-04-12 16:39:21'),
(200, 330, '04110BTB', NULL, NULL, '2021-04-15 10:34:36'),
(201, 331, 'O111648T', NULL, NULL, '2021-04-15 10:34:43'),
(202, 333, 'О111641В', NULL, NULL, '2021-04-15 10:34:54'),
(203, 334, 'О1112О6Н', NULL, NULL, '2021-04-15 10:34:59'),
(204, 335, 'O111205Z', NULL, NULL, '2021-04-15 10:35:05'),
(205, 336, 'O1112O5R', NULL, NULL, '2021-04-15 10:35:10'),
(206, 337, 'O1112O6G', NULL, NULL, '2021-04-15 10:35:15'),
(207, 338, 'O1112O5Y', NULL, NULL, '2021-04-15 10:35:20'),
(208, 339, 'O1112O5V', NULL, NULL, '2021-04-15 10:35:25'),
(209, 340, 'О1112О5W', NULL, NULL, '2021-04-15 10:35:30'),
(210, 341, 'O211OD90', NULL, NULL, '2021-04-15 10:35:37'),
(211, 342, 'O1112O6C', NULL, NULL, '2021-04-15 10:35:41'),
(212, 343, 'O1112O5S', NULL, NULL, '2021-04-15 10:35:47'),
(213, 344, 'О1112О6В', NULL, NULL, '2021-04-15 10:35:52'),
(214, 345, 'O1112O5T', NULL, NULL, '2021-04-15 10:35:59'),
(215, 346, 'O1112O6E', NULL, NULL, '2021-04-15 10:36:03'),
(216, 347, 'O111644N', NULL, NULL, '2021-04-15 10:36:29'),
(217, 348, 'O1112O6A', NULL, NULL, '2021-04-15 10:36:34'),
(218, 349, 'O1112O5Q', NULL, NULL, '2021-04-15 10:36:39'),
(224, 359, '2511877V', NULL, NULL, '2021-04-16 15:55:35'),
(225, 358, '251187QC', NULL, NULL, '2021-04-16 15:55:38'),
(226, 357, '21111184', NULL, NULL, '2021-04-16 15:55:42'),
(227, 356, '251187EB', NULL, NULL, '2021-04-16 15:55:46'),
(228, 355, '1011132G', NULL, NULL, '2021-04-16 15:55:50'),
(229, 354, '251187F1', NULL, NULL, '2021-04-16 15:55:55'),
(233, 123, '17116273', NULL, NULL, '2021-04-16 16:12:30'),
(241, 360, '2711011T', NULL, NULL, '2021-04-16 17:26:44'),
(242, 367, '271105KG', NULL, NULL, '2021-04-16 17:27:30'),
(243, 368, '2711044H', NULL, NULL, '2021-04-16 17:29:00'),
(244, 361, '271100YU', NULL, NULL, '2021-04-16 17:31:04'),
(245, 362, '271104AL', NULL, NULL, '2021-04-16 17:32:16'),
(246, 363, '18110025', NULL, NULL, '2021-04-16 17:33:20'),
(247, 364, '270011JF', NULL, NULL, '2021-04-16 17:34:21'),
(248, 365, '271105AB', NULL, NULL, '2021-04-16 17:35:38'),
(251, 371, '2711061Z', NULL, NULL, '2021-04-16 17:53:45'),
(252, 370, '271105AD', NULL, NULL, '2021-04-16 17:53:49'),
(253, 171, '271105KH', NULL, NULL, '2021-04-16 17:53:55'),
(255, 374, '271103WY', NULL, NULL, '2021-04-16 18:04:30'),
(256, 373, '271105AC', NULL, NULL, '2021-04-16 18:04:34'),
(257, 375, '0811002N', NULL, NULL, '2021-04-16 18:38:13'),
(258, 376, '08110YKC', NULL, NULL, '2021-04-16 18:38:16'),
(259, 377, '08111BL6', NULL, NULL, '2021-04-16 18:38:19'),
(260, 378, '08110YJR', NULL, NULL, '2021-04-16 18:38:21'),
(261, 379, '251187Z9', NULL, NULL, '2021-04-16 18:44:13'),
(262, 380, '2511168M', NULL, NULL, '2021-04-16 18:49:51'),
(265, 390, '271105H4', NULL, NULL, '2021-04-17 15:28:05'),
(266, 389, '27110573', NULL, NULL, '2021-04-17 15:28:09'),
(267, 111, '2711029Q', NULL, NULL, '2021-04-17 15:28:11'),
(268, 332, 'O211O1BC', NULL, NULL, '2021-04-19 14:59:02'),
(270, 391, '161100PX', NULL, NULL, '2021-04-19 17:13:23'),
(272, 392, '2511166P', NULL, NULL, '2021-04-19 18:02:02'),
(281, 386, '27110585', NULL, NULL, '2021-04-22 00:25:45'),
(282, 395, '27110094', NULL, NULL, '2021-04-22 00:27:37'),
(283, 396, '271104Y2', NULL, NULL, '2021-04-22 00:29:42'),
(290, 397, '2711008Z', NULL, NULL, '2021-04-22 00:43:22'),
(291, 398, '27110098', NULL, NULL, '2021-04-22 00:44:23'),
(292, 388, '27110090', NULL, NULL, '2021-04-22 00:45:49'),
(293, 385, '27110586', NULL, NULL, '2021-04-22 00:46:07'),
(296, 381, '27110093', NULL, NULL, '2021-04-22 00:49:47'),
(297, 399, '2711009B', NULL, NULL, '2021-04-22 00:52:06'),
(298, 382, '271105L7', NULL, NULL, '2021-04-22 00:54:03'),
(302, 400, '27110096', NULL, NULL, '2021-04-22 00:59:15'),
(303, 384, '27110584', NULL, NULL, '2021-04-22 00:59:40'),
(304, 387, '2711009P', NULL, NULL, '2021-04-22 01:02:25'),
(305, 383, '271105BX', NULL, NULL, '2021-04-22 01:04:00'),
(306, 401, '27110097', NULL, NULL, '2021-04-22 01:07:22');

-- --------------------------------------------------------

--
-- Структура таблицы `ref_api_result`
--

CREATE TABLE `ref_api_result` (
  `code` varchar(10) NOT NULL DEFAULT '',
  `lang` enum('ru','uz') DEFAULT 'ru',
  `status` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ref_api_result`
--

INSERT INTO `ref_api_result` (`code`, `lang`, `status`) VALUES
('OK', 'ru', 'Успешно'),
('CARD_404', 'ru', 'Карта не существует. Неверный номер или срок действия'),
('CARD_401', 'ru', 'Карта неактивна. Обратитесь в банк'),
('OK', 'uz', 'Успешно'),
('CARD_402', 'ru', 'Указанная карта не является Multicard. Обратитесь в Ориент-Финанс банк для получения'),
('CARD_402', 'uz', 'Указанная карта не является Multicard. Обратитесь в Ориент-Финанс банк для получения'),
('CARD_401', 'uz', 'Карта неактивна. Обратитесь в банк'),
('CARD_404', 'uz', 'Карта не существует. Неверный номер или срок действия'),
('CARD_201', 'ru', NULL),
('SESSION_1', 'ru', 'Сессия не найдена или истекла. Начните сначала'),
('SESSION_1', 'uz', 'Сессия не найдена или истекла. Начните сначала'),
('SESSION_2', 'ru', 'Неверный SMS-код'),
('SESSION_2', 'uz', 'Неверный SMS-код'),
('SESSION_3', 'ru', 'Превышено количество попыток ввода SMS-код. Сессия заблокирована'),
('SESSION_3', 'uz', 'Превышено количество попыток ввода SMS-код. Сессия заблокирована'),
('CARD_LOCK', 'ru', 'Карта заблокирована по причине ввода неверного SMS-кода. Обратитесь в службу поддержки'),
('CARD_LOCK', 'uz', 'Карта заблокирована по причине ввода неверного SMS-кода. Обратитесь в службу поддержки'),
('LIMIT_2', 'ru', 'Нельзя устанавливать отрицательный кредитный лимит'),
('LIMIT_2', 'uz', 'Нельзя устанавливать отрицательный кредитный лимит'),
('LIMIT_1', 'ru', 'Недостаточно средств на балансе карт для установки указанного лимита'),
('LIMIT_1', 'uz', 'Недостаточно средств на балансе карт для установки указанного лимита'),
('LIMIT_500', 'ru', 'Ошибка при установке лимита. Попробуйте позже'),
('LIMIT_500', 'uz', 'Ошибка при установке лимита. Попробуйте позже'),
('LIMIT_403', 'ru', 'Одна из карт истекла или истекает в следующем месяце. Холдирование средств на такой карте недопустимо'),
('LIMIT_403', 'uz', 'Одна из карт истекла или истекает в следующем месяце. Холдирование средств на такой карте недопустимо'),
('LIMIT_404', 'ru', 'Нет активных установленных лимитов'),
('LIMIT_404', 'uz', 'Нет активных установленных лимитов'),
('LIMIT_501', 'ru', 'Ошибка при сбросе установленного лимита. Попробуйте позже'),
('LIMIT_501', 'uz', 'Ошибка при сбросе установленного лимита. Попробуйте позже'),
('LIMIT_502', 'ru', 'Имеется необработанная заявка на установку лимита. Дождитесь ее завершения '),
('LIMIT_502', 'uz', 'Имеется необработанная заявка на установку лимита. Дождитесь ее завершения '),
('LIMIT_3', 'ru', 'Имеется запрос на установку кредитного лимит. Попробуйте позже'),
('LIMIT_3', 'uz', 'Имеется запрос на установку кредитного лимит. Попробуйте позже'),
('LIMIT_405', 'ru', 'У Вас имеется установленный лимит. Для удаление карты сначала сбросьте лимит. '),
('LIMIT_405', 'uz', 'У Вас имеется установленный лимит. Для удаление карты сначала сбросьте лимит. '),
('SESSION_4', 'uz', 'Не удалось отправить SMS. Возможно вы отправили слишком много сообщений. Попробуйте позже.'),
('SESSION_4', 'ru', 'Не удалось отправить SMS. Возможно вы отправили слишком много сообщений. Попробуйте позже.'),
('LIMIT_4', 'ru', 'Вы недавно совершали оплату с MULTICARD, которая сейчас в обработке. Дождитесь списания с привязанной карты, после чего можно изменить кредитный лимит'),
('LIMIT_4', 'uz', 'Вы недавно совершали оплату с MULTICARD, которая сейчас в обработке. Дождитесь списания с привязанной карты, после чего можно изменить кредитный лимит'),
('CARD_MC', 'ru', 'Нельзя добавлять в привязанные карты MULTICARD. Укажите Вашу основную зарплатную карту или пропустите шаг'),
('CARD_MC', 'uz', 'Нельзя добавлять в привязанные карты MULTICARD. Укажите Вашу основную зарплатную карту или пропустите шаг');

-- --------------------------------------------------------

--
-- Структура таблицы `ref_city`
--

CREATE TABLE `ref_city` (
  `id` int UNSIGNED NOT NULL,
  `name_ru` varchar(30) DEFAULT NULL,
  `name_uz` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ref_city`
--

INSERT INTO `ref_city` (`id`, `name_ru`, `name_uz`) VALUES
(1, 'Ташкент', 'Toshkent');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int UNSIGNED NOT NULL,
  `multicard_id` int DEFAULT NULL,
  `phone` decimal(12,0) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `passport` varchar(9) DEFAULT NULL,
  `client_id` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `active` int DEFAULT '0',
  `lock_api` int DEFAULT '0',
  `added_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `multicard_id`, `phone`, `first_name`, `last_name`, `passport`, `client_id`, `dob`, `active`, `lock_api`, `added_on`) VALUES
(167, 166, '998973333929', 'ILXOM', 'IDIYEV', 'AA1050597', '00053888', '1989-05-11', 1, 0, '2020-07-23 16:51:08'),
(331, 329, '998998911375', 'SHERZOD', 'TUYBOYEV', 'AA3496274', '00000039', '1984-01-23', 0, 0, '2020-12-01 10:56:44'),
(335, 333, '998998185650', 'KAMOLBEK', 'SAYDAMINOV', 'AA6242088', '00000036', '1991-10-31', 1, 0, '2020-12-02 09:10:41'),
(427, 425, '998977619777', 'MUMINBOY', 'SAIDOV', 'AA0070936', '00000164', '1981-09-09', 1, 0, '2021-01-28 11:54:06'),
(428, 426, '998998997543', 'UKTAM', 'NIMATOV', 'AA1257573', '00065066', '1997-04-11', 0, 0, '2021-02-02 14:48:13'),
(436, 434, '998935082228', 'MAXMUDJAN', 'XASANJANOV', 'AA1966781', '00000288', '1992-08-16', 1, 0, '2021-02-03 06:56:17'),
(553, 551, '998935869109', 'ABDURAUF', 'KABIROV', 'AB0797323', '00000180', '1991-08-09', 1, 0, '2021-03-02 13:01:29'),
(574, 572, '998909990363', 'ELENA', 'POLYANSKAYA', 'AA8397934', '00081887', '1976-08-11', 1, 0, '2021-03-03 13:24:34'),
(587, 585, '998998545812', 'OLIMJON', 'ERGASHEV', 'AB2945500', '00082084', '1971-07-27', 1, 0, '2021-03-05 06:59:36'),
(593, 591, '998909969699', 'AZIZXOJA', 'ZOKIRXOJAYEV', 'AA2030069', '00053887', '1988-08-20', 1, 0, '2021-03-05 08:56:47'),
(596, 594, '998911912727', 'NODIRA', 'SHERIYAZDANOVA', 'AA6937738', '00081899', '1990-07-07', 1, 0, '2021-03-05 09:35:14'),
(597, 595, '998998571147', 'FARIDA', 'SARIDJANOVA', 'AA6307894', '00081898', '1992-08-10', 1, 0, '2021-03-05 09:42:58'),
(600, 598, '998977514307', 'ABDUKHOLID', 'ABDUSAMADOV', 'AA3156066', '00048498', '1991-08-11', 1, 0, '2021-03-05 11:51:05'),
(627, 625, '998901784910', 'BAXRIDDIN', 'RUZUMOV', 'AA1628611', '00081805', '1960-10-23', 1, 0, '2021-03-05 17:07:34'),
(663, 657, '998946015447', 'VALERIY', 'SOROKIN', 'AB5832398', '00082655', '2001-01-21', 1, 0, '2021-03-11 07:23:42'),
(669, 663, '998911344448', 'ADHAMJON', 'AXMADOV', 'AA1815122', '00000618', '1995-07-02', 1, 0, '2021-03-11 07:40:27'),
(674, 668, '998909195056', 'ASFER', 'SHAFIKOV', 'AA0656542', '00000676', '1985-07-02', 1, 0, '2021-03-11 07:57:50'),
(681, 675, '998909947987', 'FARRUKH', 'ABDUJABBOROV', 'AA0698450', '00079687', '1997-10-30', 1, 0, '2021-03-11 12:56:56'),
(682, 676, '998903284975', 'GOZAL', 'ROZUMOVA', 'AA1597946', '00081904', '1984-05-12', 1, 0, '2021-03-12 08:01:20'),
(685, 679, '998998282856', 'NILUFAR', 'ISAYEVA', 'AA3085342', '00082567', '1974-09-21', 1, 1, '2021-03-12 12:38:48'),
(686, 680, '998935400080', 'RAVSHAN', 'IRMATOV', 'AA4177339', '00000385', '1991-09-10', 1, 0, '2021-03-12 13:00:45'),
(687, 681, '998993341516', 'LAZIZ', 'KHUDAYBERDIEV', 'AA8348810', '00082651', '1998-11-20', 1, 0, '2021-03-13 16:49:56'),
(688, 682, '998993019796', 'ISMATILLO', 'MAKHMUDJONOV', 'AA9837669', '00081394', '1997-09-10', 1, 0, '2021-03-13 17:16:30'),
(693, 687, '998900083738', 'IKBOLJON', 'UBAYDULLAEV', 'AB8929693', '00082660', '2001-04-12', 0, 0, '2021-03-16 07:36:19'),
(694, 688, '998903096613', 'IKROMJON', 'RUZIEV', 'AB5430324', '00081560', '2000-07-18', 1, 0, '2021-03-16 07:36:59'),
(696, 690, '998935759396', 'ELNARA', 'BEKIROVA', 'AA7346369', '00083169', '1985-10-27', 1, 0, '2021-03-17 09:53:39'),
(698, 692, '998993937073', 'ASADBEK', 'SHERDILOV', 'AC0959274', '00083484', '2002-06-20', 1, 0, '2021-03-18 09:02:34'),
(704, 698, '998998349349', 'DILSHOD', 'VAKKASOV', 'AB3931549', '00083590', '1992-02-04', 1, 0, '2021-03-23 04:14:26'),
(705, 699, '998977299900', 'DMITRIY', 'LI', 'AA1493126', '00083062', '1986-01-18', 1, 0, '2021-03-24 06:35:58'),
(723, 717, '998914599224', 'BEHRUZ', 'MAHMUDOV', 'AC1883009', '00083150', '2002-07-27', 1, 0, '2021-03-25 07:34:25'),
(724, 718, '998998886577', 'ASKAR', 'TURDIKHANOV', 'AA0023943', '00082958', '1996-01-03', 1, 0, '2021-03-26 01:33:11'),
(726, 720, '998970909409', 'KURANBOY', 'OMONOV', 'AC3093925', '00084475', '2003-08-05', 1, 0, '2021-03-27 09:34:30'),
(727, 721, '998900000000', 'OGABEK', 'JUMANAZAROV', 'AA1913731', '00083864', '1997-05-28', 0, 0, '2021-03-27 09:47:30'),
(731, 725, '998936447004', 'ROVSHAN', 'ORYNOV', 'A1186471', '00084902', '2000-11-21', 0, 0, '2021-03-31 14:05:44'),
(734, 728, '998935745828', 'SHOKHJAKHON', 'SHERDILOV', 'AB7862112', '00081335', '1988-12-10', 1, 0, '2021-04-01 15:57:03'),
(736, 730, '998998730003', 'KAMOLIDDIN', 'BEKNAZAROV', 'AA5357876', '00085007', '1983-01-27', 1, 0, '2021-04-06 13:13:34'),
(737, 731, '998906102871', 'SAYERA', 'YAXSHILIKOVA', 'AA6145222', '00082338', '1971-03-02', 1, 0, '2021-04-06 17:03:53'),
(739, 733, '998997025670', 'BEKHRUZ', 'MAKHMUDOV', 'AB6253319', '00084210', '2000-04-03', 1, 0, '2021-04-07 07:38:21'),
(741, 735, '998909822311', 'RUSTAM', 'ZAKIROV', 'AA6757528', '00085748', '1989-07-23', 1, 0, '2021-04-07 09:18:17'),
(745, 739, '998909166017', 'ARTYOM', 'VOLKOV', 'AA0762643', '00085507', '1986-09-27', 1, 0, '2021-04-09 11:26:50'),
(746, 740, '998946041733', 'SHERZOD', 'TURDIEV', 'AA3556688', '00086009', '1978-06-04', 1, 0, '2021-04-09 19:30:15'),
(753, 747, '998901234567', 'KHOSIYATKHON', 'ADILOVA', 'AC2465167', '00086706', '1990-07-18', 0, 0, '2021-04-13 11:04:04'),
(761, 755, '998902485028', 'DILDORA', 'KHUDAYBERDIEVA', 'AB4309660', '00086655', '1991-05-13', 1, 0, '2021-04-14 07:59:45');

-- --------------------------------------------------------

--
-- Структура таблицы `user_notification`
--

CREATE TABLE `user_notification` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `text_ru` text NOT NULL,
  `text_uz` text NOT NULL,
  `text_en` text NOT NULL,
  `is_sent` int NOT NULL DEFAULT '0',
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_session`
--

CREATE TABLE `user_session` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `otp` varchar(32) DEFAULT NULL,
  `attempts` tinyint(1) DEFAULT '0',
  `session_key` varchar(32) DEFAULT NULL,
  `device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `last_login_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fcm` text,
  `state` tinyint(1) DEFAULT '0' COMMENT '0 - создана, 1 - активна, 2 - деактивирована',
  `added_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_session`
--

INSERT INTO `user_session` (`id`, `user_id`, `otp`, `attempts`, `session_key`, `device`, `user_agent`, `ip`, `last_login_on`, `fcm`, `state`, `added_on`, `updated_on`) VALUES
(329, 331, 'ccc81a97c1535f9a631b9db584a264e4', 0, NULL, NULL, NULL, '94.141.82.201', NULL, NULL, 0, '2020-12-01 15:56:44', '2020-12-01 10:56:44'),
(333, 335, '46d3f6029f6170ebccb28945964d09bf', 0, NULL, NULL, NULL, '81.95.227.191', NULL, NULL, 0, '2020-12-02 14:10:41', '2020-12-02 09:10:41'),
(334, 335, '08f90c1a417155361a5c4b8d297e0d78', 0, '22af1bb07f5f0a9fa43fd8209994f532', 'M2003J15SC', 'Xiaomi', '185.163.26.78', '2020-12-02 14:31:51', NULL, 1, '2020-12-02 14:31:35', '2020-12-02 09:31:51'),
(335, 335, '36d5ef2a011f0b3e0e0fa139228bbe18', 0, NULL, NULL, NULL, '81.95.227.191', NULL, NULL, 0, '2020-12-02 14:33:23', '2020-12-02 09:33:23'),
(425, 427, '66cf21351023f60e092be950584699cb', 0, '6fc88040d7b56a40176e7a4ff3384546', 'SM-A217F', 'samsung', '185.163.26.89', '2021-01-28 16:54:19', NULL, 1, '2021-01-28 16:54:06', '2021-01-28 11:54:19'),
(426, 428, 'cd81cfd0a3397761fac44ddbe5ec3349', 0, NULL, NULL, NULL, '185.139.137.180', NULL, NULL, 0, '2021-02-02 19:48:13', '2021-02-02 14:48:13'),
(427, 428, '252a3dbaeb32e7690242ad3b556e626b', 0, NULL, NULL, NULL, '185.139.137.180', NULL, NULL, 0, '2021-02-02 19:49:10', '2021-02-02 14:49:10'),
(428, 428, '9a32ff36c65e8ba30915a21b7bd76506', 0, NULL, NULL, NULL, '185.139.137.180', NULL, NULL, 0, '2021-02-02 19:52:04', '2021-02-02 14:52:04'),
(429, 428, 'c1e39d912d21c91dce811d6da9929ae8', 0, NULL, NULL, NULL, '185.139.137.180', NULL, NULL, 0, '2021-02-02 19:53:32', '2021-02-02 14:53:32'),
(430, 428, 'b7f7ada7d848002260ee5eb7d8835709', 0, NULL, NULL, NULL, '185.139.137.180', NULL, NULL, 0, '2021-02-02 19:57:39', '2021-02-02 14:57:39'),
(431, 428, 'e105b88b3e1ac23ec811a708cd7edebf', 0, NULL, NULL, NULL, '185.139.137.180', NULL, NULL, 0, '2021-02-02 20:01:01', '2021-02-02 15:01:01'),
(434, 436, '621765159ee1ea4299c0df3e1d29034b', 0, '593ef6e5a00b6cecdbcf38e5eb50a92b', 'VOG-L29', 'HUAWEI', '188.113.230.18', '2021-02-03 11:56:24', NULL, 1, '2021-02-03 11:56:17', '2021-02-03 06:56:24'),
(544, 331, '9d068c869fd3e03fc606ec297fcd00be', 0, NULL, NULL, NULL, '94.141.79.9', NULL, NULL, 0, '2021-03-01 11:53:06', '2021-03-01 06:53:06'),
(545, 331, 'a0b83c02d720415dada82e08bc09e9f3', 0, NULL, NULL, NULL, '94.141.79.9', NULL, NULL, 0, '2021-03-01 12:02:04', '2021-03-01 07:02:04'),
(546, 331, '64dcf3c521a00dbb4d2a10a27a95a9d8', 0, NULL, NULL, NULL, '94.141.79.9', NULL, NULL, 0, '2021-03-01 12:40:55', '2021-03-01 07:40:55'),
(551, 553, '54c3d58c5efcf59ddeb7486b7061ea5a', 0, '0f106c90f6a6c26c21793f78f0f85b35', 'Redmi Note 9 Pro', 'OS : 10; app version : 1.0.60; build number : 60', '188.113.199.180', '2021-03-02 18:05:15', 'c-ouEOowROe4rLRanePX5k:APA91bGf182zGgOkEiYg0c25fTXSuCJopvaIh-D1BYzcQQYCkBg098JA_hz9sdWYsEIBcbNjvmkqsYayeOw0VWqXQ8PIYfEOYLl0Jut5xNCY76gh8MRKgB8bJUWYN5IZEu08GrHef2Hj', 1, '2021-03-02 18:01:30', '2021-03-02 13:05:15'),
(568, 574, 'b45f8e4366b41a30994d6b5b3bb2d51b', 0, 'fff6b08e3a12983c31e4c8c915481167', 'Redmi Note 5', 'OS : 9; app version : 1.0.60; build number : 60', '37.110.214.36', '2021-03-03 18:25:38', 'fOwwBcuXSqWIY5-LP_c_3P:APA91bE8YtyN4YNuXqqTI3uwg9MOE3W_cDUbgf7VzFFqK2hQ1QFdEH-HAvOdx8nWz6wuF7t_Fr3AGfLtcYfvAtU2_Obeb-xxoFNCg_n1XmUkbQS10aymg8ULi3CrSf_D7HgHPvxLiwKv', 1, '2021-03-03 18:24:34', '2021-03-03 13:25:38'),
(581, 587, '16c0d78ef6a76b5c247113a4c9514059', 0, '65dd600623a9c8fcfaa019a83776f0a8', 'SM-G973F', 'OS : 11; app version : 1.0.60; build number : 60', '185.139.137.111', '2021-03-05 12:03:06', 'cY5UyjnsTv2MJ79f-5ON6d:APA91bHUgNa6gQGQonmdeBv1VDyHFVS7IT0vINvnek8x5cqtaF3lp9cGAqVy7I2NsH0CFAakQ44GWFS8pbA7wNO9QiHkdbTarz2u92LOvtn4HK4t3bxFdsNlF7ikz21H4F7eUXz3sh3z', 1, '2021-03-05 11:59:36', '2021-03-05 07:03:06'),
(587, 593, 'd35a29602005cb55aa57a5f683c8e0c2', 0, '2a33ae0dc5251e863861ae4141638a91', 'iOS 14.4; app version : 1.0.55; build number : 55', 'iPhone ?', '81.95.227.191', '2021-03-05 13:57:39', 'd4kiaGVQ70jcmHvQhOawWA:APA91bF3s_iqdI1A1PB7WHtjhMydUp9gaquQVbyPxZG59_QmPRCj_R02St1zwFQcfVok0FWKFFwFq4uPSzbgx6IEVfdOrEOU3HX4GA5ynIbO9Ca2Tv-ob-tv3l_Kp2vgfO_P3tR1QTJ-', 2, '2021-03-05 13:56:48', '2021-03-05 08:57:39'),
(590, 596, '7dab099bfda35ad14715763b75487b47', 0, '5b7a3e1c3fa35ed3d2b5395f1019e80c', 'M2003J15SC', 'OS : 10; app version : 1.0.60; build number : 60', '37.110.210.33', '2021-03-05 14:36:59', 'f-PTiB8dQoWnqs3lUO5Pz2:APA91bElRWlNhjm0zuVr0yJSo--TBCdDekCC995ZcdAkHwaOE0lrTrzicxEVhFjCq_px4C8oYnaCe4SuMgCDpzzRM7jbHt0SgO3DjnlMi28_7kopEzliaojHEHVDQ-1PYsOYX1Aljfi0', 1, '2021-03-05 14:35:15', '2021-03-05 09:36:59'),
(591, 597, 'c2f8e6f7f5a740e5b753357c9bb2c664', 0, '275ce92958470c91bf57affb145b4294', 'Redmi Note 9S', 'OS : 10; app version : 1.0.60; build number : 60', '37.110.210.33', '2021-03-05 14:43:40', 'eKTN4yPoS12b8hmcrIQALm:APA91bF41t__PUAF4ARVi5T1VDiel28eZOV2GKPqQjbUl225mSGFoPjp0zs6bzmt3dycxEGqiogCax3rNM2elnZRhchLU3zMm8toW4ezbsAai_IyF2mGGHiSZ_Oc2xTXm74GNUG-fnyr', 1, '2021-03-05 14:42:58', '2021-03-05 09:43:40'),
(594, 600, '967edfdcdfbcc3b2d253fac24326e5b5', 0, '140dcd0d7de279e8648db69e3e89420a', 'SM-J730FM', 'OS : 9; app version : 1.0.60; build number : 60', '81.95.228.206', '2021-03-05 16:52:26', 'e86Dc3HQRSahRehgjaNUsf:APA91bE8bP3z09bjvI2fNAVQLtoDy83Qw0o_N8ZQtkppMTlVdpDKuD93rJFK1gtsCNgLNl79PCjB-LXducFi3PTZFHY7fUIdtKqmTQJnx6XnrCqFbGqvyGbbkxjwCkj_R4soQnkBLdPg', 1, '2021-03-05 16:51:05', '2021-03-05 11:52:26'),
(621, 627, 'ed519c02f134f2cdd836cba387b6a3c8', 0, '5d229c9840f631a07f17bfad17d70ddc', 'Mi 9 Lite', 'OS : 10; app version : 1.0.60; build number : 60', '213.230.85.77', '2021-03-05 22:11:14', 'd58i2UxaQo2CkQGDkvYFK6:APA91bHjPlFY0TKa9FO0gsMEnn3ilpVNdl9nB967JEiFn2oY5P2YfKSNnFXuiYwfJ9NNsJBa-hY2eoGj8Sa3mYQUzQJ-YrlZrdFZEbkYcVCpTJhaiwT2Q8NXaPbr9zvLwNHzxLdkR6sb', 1, '2021-03-05 22:07:35', '2021-03-05 17:11:14'),
(629, 593, '47fd3c87f42f55d4b233417d49c34783', 0, 'e5ee838d2cfd6e55b8dbe46a1e50c6c0', 'SM-G977N', 'OS : 11; app version : 1.0.60; build number : 60', '185.78.138.51', '2021-04-12 07:43:18', 'd4Bj84N5TMW9bOq0bYYksS:APA91bF7wIXJYzmfDJYuih_7Mov4SNF229aNJTjpqIGdHg9LBb_j-wXMDvHwdHTNiJoMdhO1KwgnPA094o-OG7lyuK28NcJF0RZcOgNFLMFanKtON5X_MkykBC1gcxaO2qgCX2zZCZk-', 2, '2021-03-06 21:15:49', '2021-04-12 02:43:18'),
(647, 663, 'b08354f3688c4e4e8c52c207d7d5b8c3', 0, NULL, NULL, NULL, '188.113.206.175', NULL, NULL, 0, '2021-03-11 12:23:43', '2021-03-11 07:23:43'),
(648, 663, '43975bc2dfc84641a2a8c4d3fe653176', 1, NULL, NULL, NULL, '188.113.206.175', '2021-03-11 12:25:06', NULL, 0, '2021-03-11 12:24:14', '2021-03-11 07:25:06'),
(649, 663, '93189dd27c5c3221f5687b74bcba0ab6', 0, NULL, NULL, NULL, '188.113.206.175', NULL, NULL, 0, '2021-03-11 12:28:39', '2021-03-11 07:28:39'),
(650, 663, '33bdf955c5d92555d8977eff1c5815c5', 0, NULL, NULL, NULL, '188.113.206.175', NULL, NULL, 0, '2021-03-11 12:32:01', '2021-03-11 07:32:01'),
(651, 663, '84438b7aae55a0638073ef798e50b4ef', 0, NULL, NULL, NULL, '188.113.206.175', NULL, NULL, 0, '2021-03-11 12:34:16', '2021-03-11 07:34:16'),
(652, 663, '614594c34e0c9dc796cb21d5e806768b', 0, NULL, NULL, NULL, '188.113.197.176', NULL, NULL, 0, '2021-03-11 12:39:01', '2021-03-11 07:39:01'),
(653, 663, 'b9ed18a301c9f3d183938c451fa183df', 0, NULL, NULL, NULL, '188.113.197.176', NULL, NULL, 0, '2021-03-11 12:40:33', '2021-03-11 07:40:33'),
(654, 674, '86b48b560a92d18429bcfca2c70ee733', 0, 'ecd01f824be4f356e34a4a4131aaa4e6', 'Redmi Note 5', 'OS : 9; app version : 1.0.60; build number : 60', '37.110.211.74', '2021-03-11 12:59:39', 'dxIbA3hXT7qmVESjWcs6nD:APA91bHgW-gK754xvWJTWczuiSXJeUTyvlSAX6mf9CrQuwu4jqp5KEN-GDkwTUsRS924GwKShHqh8e2pGMjPiEYTDz_UnfAH_E_H2xoDJkVoDMnI_4ZitzD4Funy8jH1kak3w_R4JLRm', 1, '2021-03-11 12:57:50', '2021-03-11 07:59:39'),
(657, 681, '243f6a5292350cc163601aac9ad3e854', 0, '2c59534a6b0f744164237e902edff702', 'iOS 14.4; app version : 1.0.55; build number : 55', 'Farruh’s iPhone', '81.95.232.52', '2021-03-11 17:58:55', 'ep8eI6oTPUKQhymk_lXao4:APA91bFqE1DXslsQfb5ueyDzQmTuezpSbr4PqH5MS_vC3zSD02dWubdZRGluMwsfS1NK2S5O5h7h7B0T-YHxFqrMbmG_ORUDrf_v6kNOFRzaVcidDyntfdKJzPQPosDRKXRCbBxoj-Xp', 1, '2021-03-11 17:56:56', '2021-03-11 12:58:55'),
(658, 682, '2548a4ac7ad6eddd035bced24ec6d964', 0, '64a49a076f8ec036295fdc53630cacf5', 'SM-A515F', 'OS : 10; app version : 1.0.60; build number : 60', '213.230.113.3', '2021-03-12 13:03:02', 'f22VB6wiSOa6CK3-rIo0bt:APA91bFCV1vuvqRKs1zui9VNF8n7_Pdz9HJ4Et_6SljR9CK4NtEU8z0VkxgucW_ZktlbmcrxAnrtD5Y_uaHQAA8UaBftPr970XA3YOfB8kxmylNE3P8_zMD7HM5T89MhXOI5ZKbeQ5VK', 1, '2021-03-12 13:01:20', '2021-03-12 08:03:02'),
(659, 685, '740a02d0786a4239a62076f650cd26da', 0, 'e2741f33390e8d9fb2972933915e4223', 'SM-A405FN', 'OS : 10; app version : 1.0.60; build number : 60', '185.139.137.32', '2021-03-12 17:43:01', 'dmSVJFP6S523d9TI3DqyOW:APA91bFkIv0act26Bz2v3PGphVXzR3GFeu_re4ctwa3dRgKnB2mNuBoAEpH8bH6_YtMwlEi83F97pSFWKIYM9LvmwKYVwQSf2dMVjemjwGNugnov5UMA9NA9pCiwREesryY4W3lvNJUW', 1, '2021-03-12 17:38:48', '2021-03-12 12:43:01'),
(660, 686, '889fbd1aec443cef389ea10c93b498d8', 0, '2d35893f2c20f862207aeedb65b4ab6b', 'iOS 14.4; app version : 1.0.55; build number : 55', 'iPhone', '188.113.243.184', '2021-03-12 18:03:50', 'emei1BNf10MytuUU_BWng4:APA91bF1QO4jCRfaHeelYf7jbGa4pDlsH6xweo3dpuiNdx4cujqFM2qWyeNz0lH5bZFaC3U4hRDNotreNnsbFi2LW6ZlD_Hwu-wpUdzOOletNT3e2R-G7wXjRLH9EwEuHdLn3_AZuXfY', 1, '2021-03-12 18:00:45', '2021-03-12 13:03:50'),
(661, 687, '9b3a9fb4db30fc6594ec3990cbc09932', 0, '684c1302a548008721374681b09ddfa1', 'SM-A107F', 'OS : 10; app version : 1.0.60; build number : 60', '213.230.81.135', '2021-03-13 21:56:22', 'c4TiO6S3ReyFXSwsS70ql0:APA91bEIB4rMyWVRfadZWj26c3y8qPmrsm6_jMEmWVXmAUlzRxAuX5somhDywlkdvlu4s6MQetonOXxeTnG9ce2X0MuRsSf5VS_J5AlGxbG7cAh6ofmRZkMIT630Rb7XcP5W8MOgPkGh', 1, '2021-03-13 21:49:56', '2021-03-13 16:56:22'),
(662, 688, '1ef03ed0cd5863c550128836b28ec3e9', 0, '41d38d96053dc184fecf2ad9b39439a6', 'Redmi Note 6 Pro', 'OS : 9; app version : 1.0.60; build number : 60', '213.230.81.135', '2021-03-13 22:20:50', 'elvk_vIiQAm2BPYWbIhDZ4:APA91bFDjTwQ7msLJOt0bEeezpHVDmfyDKVek-NtnMhmzewZSbN-cNX_-B7uV2tPssdyi3WQNXmGgY3r7ASiYuMz7d3tFrLrK3BFhQPN0UbgBT0Qhiq0LE9uWoeynJCPyw8B5Mwt1HGG', 1, '2021-03-13 22:16:30', '2021-03-13 17:20:50'),
(664, 663, 'ae78510109d46b0a6eef9820a4ca95d6', 0, NULL, NULL, NULL, '213.230.84.51', NULL, NULL, 0, '2021-03-15 16:36:02', '2021-03-15 11:36:02'),
(665, 663, 'ddc96fb7d590861ce4bbc4579f5fa848', 1, NULL, NULL, NULL, '213.230.84.51', '2021-03-15 16:37:58', NULL, 0, '2021-03-15 16:37:19', '2021-03-15 11:37:58'),
(666, 663, 'd042be1b4b72c110d21287b3dad13867', 0, 'f018dabf863b23dfb93b3f6cc0e8b897', 'Redmi Note 8', 'OS : 10; app version : 1.0.70; build number : 70; android ID : 8c7f679b5364e0c8', '213.230.84.51', '2021-03-16 17:20:25', 'cwHTWJPUSjCpgxFnW2c_mJ:APA91bHPkrhYqVlAPvO4XYZ4Z9bkrqec_MUrcmSrIjC2oFgeh834ud1cYY1DssXCgLX0Izw75sObyX4IlpFyOzVwX0LPk76QKXwnbuFEMEpDzDNok19vEK-mzPOqn8Q2pwqO7_MbV9gg', 2, '2021-03-15 16:38:21', '2021-03-16 12:20:25'),
(667, 693, 'c67ba7c4c5c0cd4cc3e3a7146fe5c015', 0, NULL, NULL, NULL, '37.110.215.149', NULL, NULL, 0, '2021-03-16 12:36:19', '2021-03-16 07:36:19'),
(668, 694, '85ea6fd7a2ca3960d0cf5201933ac998', 0, '483312a8196c9212513a036c8bce40db', 'ATU-L31', 'OS : 8.0.0; app version : 1.0.60; build number : 60', '37.110.215.255', '2021-03-16 12:37:11', NULL, 1, '2021-03-16 12:36:59', '2021-03-16 07:37:11'),
(669, 663, 'dfc69ee4c48a622e2bcda2c3d2a219d0', 0, '30ee00215e9eed36630ce93fcc1bf78b', 'Redmi Note 8', 'OS : 10; app version : 1.0.60; build number : 60', '213.230.103.50', '2021-03-18 11:33:19', 'fDxWXWF8TfC_I9FTjq_kk8:APA91bGV8y70JLyYA-NhbZXPo4RUv2aHAh3Rlb2ONX_Rj5rhQ7iUyGlXJEkFTvCz9X_LYm9tqFnr2YHERviuFQUkikbMtYIjjDvbLU6-Z6-Uc8rncAfeSs2Xr0-stqviJ-kQyMhX2VHb', 2, '2021-03-16 17:20:16', '2021-03-18 06:33:19'),
(670, 696, '6fd6b030c6afec018415662d0db43f9d', 0, '1de3fc580a22cd6d5c7a75e17392ada2', 'SM-G925F', 'OS : 7.0; app version : 1.0.60; build number : 60', '188.113.209.196', '2021-03-17 14:59:20', 'd4Qr6QRwTum_br88wpR8-3:APA91bGQpURs9G-XlalBVpG5zZJ1-0ZLbT9gTHqFXCTFqst8X9JQYrLMRY_0R1eZpBcmwyGZPOqZpur3O19ok8F1PYHujUavw481JVVyKObknyNtbE4heofrBbIMzC6N2KJzwkXw7G7T', 1, '2021-03-17 14:53:39', '2021-03-17 09:59:20'),
(671, 663, '47810f956e3d8fb8a32fb276448b464d', 0, '3f3f64c9b414cdbd2c09458bb8ae875d', 'Redmi Note 8', 'OS : 10; app version : 1.0.60; build number : 60', '213.230.103.26', '2021-04-20 15:04:59', 'cCoCXkm3S52ddSYeQEToNR:APA91bFFJeDOVhAcTCkDdvArnUzUiaFxmHLsTczSV6B6oJXgrp3nssj8v-R33hCawMMghrYz3Xpl_Otckw9nLvJeNIq8wuYK_F6fKfaA1vwk1DdkwJ_amDSFR657B9_FenpfsfzVncl9', 2, '2021-03-18 11:33:11', '2021-04-20 10:04:59'),
(672, 698, '0ef037ce94ff9b7930d095a7e2ffee1f', 0, 'ae5457fc3eb83a34089e84ffc8fccf09', 'iOS 14.4.1; app version : 1.0.55; build number : 55', 'Sherdilov Asadbek', '185.139.137.64', '2021-03-18 14:08:47', 'ey1ynwMKik6ho-7AWuCYAZ:APA91bGbPtxczY1GWAAOIZZ6UjYPUj3vBy8g1eqeh2ZN3MB5AhiFvkZaPKLzB9swbeYV_zMq2Qx-VttRl-bAkoB8DVgCDFXoVbbTcgSEs_QDro-kXY3ZTVc1ZyjS1CC5bQ__Prk0AGgN', 1, '2021-03-18 14:02:34', '2021-03-18 09:08:47'),
(675, 704, '2f4fe03d77724a7217006e5d16728874', 0, '3e4a0db782ff6c40e64854689d193fc9', 'Redmi Note 7', 'OS : 10; app version : 1.0.60; build number : 60', '185.139.137.45', '2021-03-23 09:16:04', 'fyjuV3HBRMK9zThA8r98-P:APA91bGx0qZE-8mFZWez7NgyXdEMsuVOmJhQa-o11UGHoEbmolf7pC_Jcmq-eJDl0XUK6xBde2kR7zVxmQSRQfp4qCipjBBrk3W9AFrLW29rI-0yrnyxcMWFuQaAFa7LUYB1MoaAxBmH', 1, '2021-03-23 09:14:26', '2021-03-23 04:16:04'),
(676, 705, 'de66dbc30377a1f7908db45298324aa3', 0, NULL, NULL, NULL, '185.163.27.159', NULL, NULL, 0, '2021-03-24 11:35:58', '2021-03-24 06:35:58'),
(677, 705, 'db2de541293171af2b0ccdf7c64d72d4', 0, NULL, NULL, NULL, '185.163.27.159', NULL, NULL, 0, '2021-03-24 11:37:22', '2021-03-24 06:37:22'),
(678, 705, '9724412729185d53a2e3e7f889d9f057', 0, NULL, NULL, NULL, '185.163.27.159', NULL, NULL, 0, '2021-03-24 11:38:50', '2021-03-24 06:38:50'),
(679, 705, 'bcb7c13ff9746a60fa8c3e748acd054d', 0, NULL, NULL, NULL, '185.163.27.159', NULL, NULL, 0, '2021-03-24 11:41:41', '2021-03-24 06:41:41'),
(680, 705, 'e3eb4194278df0f91258632682d0ae92', 0, NULL, NULL, NULL, '185.163.27.159', NULL, NULL, 0, '2021-03-24 11:42:34', '2021-03-24 06:42:34'),
(681, 705, '84cb17743002b4cfb81b0153cee648fc', 0, NULL, NULL, NULL, '185.163.27.87', NULL, NULL, 0, '2021-03-24 11:47:00', '2021-03-24 06:47:00'),
(682, 705, 'bf2fe6582ed9ead9161a3d6f6b1d6858', 0, NULL, NULL, NULL, '185.163.27.87', NULL, NULL, 0, '2021-03-24 11:47:58', '2021-03-24 06:47:58'),
(683, 705, '0e4a2c65bdaddd66a53422d93daebe68', 0, NULL, NULL, NULL, '185.163.27.87', NULL, NULL, 0, '2021-03-24 11:49:12', '2021-03-24 06:49:12'),
(684, 705, 'f0467e856f9ee5f05a1815fca47b7787', 0, NULL, NULL, NULL, '185.163.27.87', NULL, NULL, 0, '2021-03-24 11:51:51', '2021-03-24 06:51:51'),
(685, 705, '58ec72df0caca51df569d0b497c33805', 0, NULL, NULL, NULL, '185.163.27.87', NULL, NULL, 0, '2021-03-24 11:53:38', '2021-03-24 06:53:38'),
(686, 705, 'c4c42505a03f2e969b4c0a97ee9b34e7', 0, '25e221e26fdf3becf272e0f1147e385e', 'iOS 14.4.1; app version : 1.0.55; build number : 55', 'iPhone', '185.163.27.87', '2021-03-24 11:59:03', 'fE7Z2cxM4EG-s2dPdAu-1M:APA91bEtc7f_pz1E5TVED5DOC8gcYEJIztWt-u6drNm7ukGeT12q12q4SnzwK0Le38gUgQ5oV6U65ch2BzKonwB3-11CkGoHs4qsFWfNMIq2UIm-0Asl_LN7sCS18v4zaylEUjuay2h7', 1, '2021-03-24 11:58:29', '2021-03-24 06:59:03'),
(688, 723, 'cd4bb35c75ba84b4f39e547b1416fd35', 0, '2d6b276e581745abeaf38b2143f9d52b', 'iOS 14.3; app version : 1.0.55; build number : 55', 'iPhone', '37.110.214.43', '2021-03-25 12:36:39', 'fLlY5KYLvUAJjeGwbyZm7g:APA91bFKEYDtOAXUMLoCWWyl1rXdwumbc13z7sTjLVnptw56Xj2_KAmW6IbBc-6BPckXuk2YZfYZ-_X2ZT4smdJefneOs3Dd_-ObNlE-k34qqdBXhOJBmFgdvxTp_4O2jfvjvi0udPse', 1, '2021-03-25 12:34:25', '2021-03-25 07:36:39'),
(689, 724, 'f845cbb24a82dabdee971c6f7719f89d', 0, 'ed019c905c31bfca67b496571c0bcd64', 'Redmi Note 9 Pro', 'OS : 10; app version : 1.0.60; build number : 60', '109.207.241.12', '2021-03-26 06:36:15', 'dV-wt96QQE2z4kPjEDQTCW:APA91bGhSrzvh3NUNokOTUVF1VgM0nxip-2Z8Utnc2Bc0W86mJixDB4x3UuUZdMmZelH59yPA5NxpIbKdzKKNUE1JFOOfDWCZUdFw6FJK_K9PmoPJl7wphitsN0RHu67eiPZdCDc3s2m', 2, '2021-03-26 06:33:11', '2021-03-26 01:36:15'),
(691, 726, 'edcdaad57f7f4a4d3826728f009bcf24', 0, 'af1c9e80636d0d168f9d1d22be08af0a', 'Redmi Note 8', 'OS : 10; app version : 1.0.60; build number : 60', '185.163.26.70', '2021-03-27 14:36:03', 'd2pL1x4uRJWvpd_bdHKmM9:APA91bG2goIzNDIohMHACQfgT9Bkkm9x3RJjUbqBZmB_Dqn3xNGWd25oRdUAlpVEx5vTK5rh9ar5wtgTjZhVCyZCbfjiCVbWVrMSloUPFkagmXc_9U5lpxSoO8Fn-KYDuXRWkEfsZUC0', 1, '2021-03-27 14:34:30', '2021-03-27 09:36:03'),
(692, 727, '62021a18331216014fee6916d6ee9584', 0, NULL, NULL, NULL, '185.163.26.135', NULL, NULL, 0, '2021-03-27 14:47:30', '2021-03-27 09:47:30'),
(693, 727, '0765933456f074d2c75bbbad63af95e6', 0, NULL, NULL, NULL, '185.163.26.135', NULL, NULL, 0, '2021-03-27 14:48:02', '2021-03-27 09:48:02'),
(694, 727, '77bb14f6132ea06dea456584b7d5581e', 0, NULL, NULL, NULL, '185.163.26.135', NULL, NULL, 0, '2021-03-27 14:48:33', '2021-03-27 09:48:33'),
(695, 727, 'b3b25a26a0828ea5d48d8f8aa0d6f9af', 1, NULL, NULL, NULL, '185.163.26.132', '2021-03-27 14:49:26', NULL, 0, '2021-03-27 14:49:13', '2021-03-27 09:49:26'),
(696, 731, 'af94ed0d6f5acc95f97170e3685f16c0', 2, NULL, NULL, NULL, '213.230.103.68', '2021-03-31 19:07:34', NULL, 0, '2021-03-31 19:05:44', '2021-03-31 14:07:34'),
(697, 731, 'f8037f94e53f17a2cc301033ca86d278', 0, NULL, NULL, NULL, '188.113.231.101', NULL, NULL, 0, '2021-03-31 19:28:18', '2021-03-31 14:28:18'),
(698, 731, '75c58d36157505a600e0695ed0b3a22d', 0, NULL, NULL, NULL, '188.113.231.101', NULL, NULL, 0, '2021-03-31 19:42:46', '2021-03-31 14:42:46'),
(699, 734, 'c3bfbc2fc89bd1dd71ad5fc5ac96ae69', 0, '04de54ef018ef716e7a2ae4ce6f15617', 'SM-N986B', 'OS : 11; app version : 1.0.60; build number : 60', '185.163.26.91', '2021-04-01 20:57:59', 'dNi5aKP0SC62ttfTU9wdrW:APA91bGyIfcsFfT3tDPgfAoKhy9lRKQTIYiHJfQUtgYeG9ytDXZlXvf7VKoKyttvFzHgmTqKoigjgIFFfyzcXakEgA8oqY_7Uqy-eXXEczvnc5i2Npt50gpYcUlGLbUIh1XJOpP1G59y', 1, '2021-04-01 20:57:03', '2021-04-01 15:57:59'),
(700, 669, '43c656628a4a479e108ed86f7a28a010', 0, 'ff312c310e729b953062acc29d1df55c', 'iOS 14.0.1; app version : 1.0.55; build number : 55', 'iPhone', '37.110.211.62', '2021-04-05 12:04:54', 'ebqcGeEb_EpJihazEJpINi:APA91bHH1SWx-ggDt930OHM7XC5a1GuX4aiXrZUCWNHBHxUbhLmMscHd25AdsnvQTQcXKz2FmkLthL47-fcuZQC70XfkD0CFiD_CCoA8B_xHN0MG6jEFMLq67a00wrk10Oe75uQjDHJt', 1, '2021-04-05 12:02:07', '2021-04-05 07:04:54'),
(701, 736, 'bfe6caa90f31d889bd773c2eabe70679', 0, 'dd281fbca528630cf2a687b1ec268e01', 'iOS 14.4.2; app version : 1.0.55; build number : 55', 'iPhone 11 Pro Max KB', '185.139.137.199', '2021-04-06 18:15:48', 'fgGCjLm1OkiRvzDxeWw7eN:APA91bFpW25c9rh9P7HP9-Ndg_5xmGLlPfHwWVoCzS2aCZaLInnamoBwN6ydY2nNQmaC_G9UWatuHfSPntyUdCUn83GLyVunbVRsqpZ95S5xPd0N_mI2FmFY7Sq73vqeKzwnD8h8ZoK1', 1, '2021-04-06 18:13:34', '2021-04-06 13:15:48'),
(702, 737, 'f076073b2082f8741a9cd07b789c77a0', 0, '3a023de344fd88736121b18ddf3375c4', 'Redmi Note 8', 'OS : 10; app version : 1.0.60; build number : 60', '213.230.118.214', '2021-04-06 22:04:29', 'cXXHtykzSCWEwXEdjC_-42:APA91bH5MrewjKlOG4S04SFl8WAbndPENqdWWNU7sA2kIkFFjUbtS0RN0Q9QKAiKnK-HiOXA2OWKbdcnYQaKvRSxFbYYMgC_29U6NfB8yZYAQmZWt9CrtmOUJ-KShZcEsd5UNT8ukOJ7', 1, '2021-04-06 22:03:53', '2021-04-06 17:04:29'),
(704, 739, 'f18a6d1cde4b205199de8729a6637b42', 0, 'e6464da1e6d11765de2ce109bced12d5', 'iOS 14.4.2; app version : 1.0.61; build number : 61; IOS ID : 1E6B2462-B3FD-48B9-A45A-65334A2E95CA', 'Bekhruz’s iPhone', '213.230.96.13', '2021-04-07 12:45:07', 'cw_WbxRG30f8rf67hWPk2E:APA91bGBo3sP7PP5ewNLUotX1TusIr4SsimqBwaKMeXST-MLFVxJrz6SPu4l6M4KwlEag6sGY6EFQfaVNkXChmCydM9gmU6A8R1qWrAMq5BTFwNOIsHH461PI5camauscEvFf72HMllN', 2, '2021-04-07 12:38:21', '2021-04-07 07:45:07'),
(705, 739, '6e0ff6e4617ef3586d31b86bbf141011', 0, '1c50ef1098db88af44103cbe9c8c903f', 'iOS 14.4.2; app version : 1.0.61; build number : 61; IOS ID : 1E6B2462-B3FD-48B9-A45A-65334A2E95CA', 'Bekhruz’s iPhone', '213.230.96.13', '2021-04-14 20:20:01', 'cw_WbxRG30f8rf67hWPk2E:APA91bGBo3sP7PP5ewNLUotX1TusIr4SsimqBwaKMeXST-MLFVxJrz6SPu4l6M4KwlEag6sGY6EFQfaVNkXChmCydM9gmU6A8R1qWrAMq5BTFwNOIsHH461PI5camauscEvFf72HMllN', 2, '2021-04-07 12:45:29', '2021-04-14 15:20:01'),
(706, 741, '936824c0191953647ec609b4f49bc964', 0, '0dde9f02510f3abcd688994989cb66b5', 'Redmi Note 7', 'OS : 10; app version : 1.0.60; build number : 60', '81.95.227.191', '2021-04-15 13:01:06', 'cKwvniTtSUqLYjb6-oWMsy:APA91bFZ1d-5I81CpJK2ZCNv8hvhZaxSCet0YeBFPf-FIuKzPuHSOMWCccQKNtrnCpxye3SyRn9TBkhB6ebsEV0l1hRmo8K6o_DVeV4waWIE_TQAd23wDOy_Ti5rQcTk9BH1ToUifG5-', 2, '2021-04-07 14:18:17', '2021-04-15 08:01:06'),
(707, 167, 'b59c67bf196a4758191e42f76670ceba', 0, NULL, NULL, NULL, '81.95.227.191', NULL, NULL, 0, '2021-04-07 14:40:43', '2021-04-07 09:40:43'),
(708, 167, '3b712de48137572f3849aabd5666a4e3', 0, 'e1e7dca380443ef031ade7e9d7e33759', 'iOS 14.4.1; app version : 1.0.61; build number : 61; IOS ID : E86E0158-7F20-474F-9243-9C240278655E', 'iPhone ?', '81.95.227.191', '2021-04-10 10:21:13', 'eF7i9mHLlk4_sXDJEcQ25t:APA91bEVbwFeUZPddnyype8Q1ntWPERiPb0ZgjZyClfX7Bdz31HJ3o9omYBZD9TMUHR1nd1GH0rgsbt_gH_Ah_BziGhmD5jwT0l83GWdIPBdlM3QbYbJkdeCe4zVWkiL_cmd2XRabeWi', 2, '2021-04-07 14:42:30', '2021-04-10 05:21:13'),
(709, 167, '3b712de48137572f3849aabd5666a4e3', 0, '378d1f6581dbad1e7cd8812bb5e22aad', 'iOS 14.4.2; app version : 1.1.0; build number : 100; IOS ID : E8017E8B-F579-423C-874E-82A7343E2455', 'iOS Device', '17.232.2.140', '2021-04-09 02:53:39', 'cye5HvEuhUvyuub765qYjM:APA91bE1fXnt_PpHEsJCo5EP6bjbYANdhHo4NKXGYpCqqGE4tLXzR-PfL7wGt_s1YrqLWiKJ3Ds-uC_ODuJZ6BU2zE7CPAacGygfaqVgSXNO0GmFtg3nkVFdyW0jTBzrXzv96LxVqgJW', 1, '2021-04-09 02:53:16', '2021-04-08 21:53:39'),
(710, 745, 'df308fd90635b28d82558cf580c73ed9', 0, '97f3df9c449fde35213d13fb12e66392', 'SM-A720F', 'OS : 8.0.0; app version : 1.1.0; build number : 100; android ID : 5c2cf5b8a5dc30ca', '95.46.71.142', '2021-04-09 16:32:03', 'dUtETdr2TQ2zO8yHoADkAt:APA91bHyfqR_5W_Cy4heX8BPFThUkhei6IWJNx1DfUYDmyAOBWvgnll3yy_OPo1PGZIzggV2rhzWwG7PTkD0BFACFCezN71xyHaNqRZJdMdJ1syjXaRqM8ImOu3_BQsEqap5dX4M0Lz8', 1, '2021-04-09 16:26:51', '2021-04-09 11:32:03'),
(711, 746, '412decf7f56202004e18650fb2db5897', 0, 'a21c3ded780fd0e4bc95d53ab1169783', 'SM-N9860', 'OS : 11; app version : 1.1.0; build number : 100; android ID : d2dbacad223ac9b4', '185.163.26.72', '2021-04-10 00:32:22', 'cEKv0NgDQmWyNcOlNnhBBN:APA91bHTjsYjBfw0GumtWLUIPJcQ0Ie_uVheNhF6Yf3Jb6TBj6iO3cuWPI3dr31foDacF5hoUvIgm0gFRMlvp7H1XPNpAMfVpllJ7VaTEDJLX2px6pFY5QO4AlhqVRv1TgkywgvWlBNY', 1, '2021-04-10 00:30:15', '2021-04-09 19:32:22'),
(712, 167, '3b712de48137572f3849aabd5666a4e3', 0, '99c4f30b6c91ff1f0244a81c2e92ab47', 'iOS 14.4.2; app version : 1.1.0; build number : 100; IOS ID : E86E0158-7F20-474F-9243-9C240278655E', 'iPhone ?', '89.146.91.127', '2021-04-13 20:21:32', 'eF7i9mHLlk4_sXDJEcQ25t:APA91bEVbwFeUZPddnyype8Q1ntWPERiPb0ZgjZyClfX7Bdz31HJ3o9omYBZD9TMUHR1nd1GH0rgsbt_gH_Ah_BziGhmD5jwT0l83GWdIPBdlM3QbYbJkdeCe4zVWkiL_cmd2XRabeWi', 2, '2021-04-10 10:22:47', '2021-04-13 15:21:32'),
(713, 739, '79286674060c5b8f6644bfff4ae069a2', 0, '7e752378308b1219ea925e1ac9d4917c', 'iOS 14.4; app version : 1.1.0; build number : 100; IOS ID : 13AA15DC-017F-4598-B65F-77604EE4DDF8', 'iPhone 11 Pro Max', '82.215.98.37', '2021-04-11 20:02:24', 'c4rkt-j1_kkBmp4y6hGMOO:APA91bH3dPuH5FZeX1MLKGJaLT3GgvGTGfVUjphaBZ3UuxGb-mQKJnWzGCvnnPSh4tl4bgamdZG1bzMXJyXmweAsMKy-nLnLUQQ2iBcm_8T53wsxighwEdDnMD5a4gAWSFQnW08HW4Dq', 2, '2021-04-11 17:41:33', '2021-04-11 15:02:24'),
(714, 167, '3b712de48137572f3849aabd5666a4e3', 1, NULL, NULL, NULL, '82.215.98.37', '2021-04-11 20:02:47', NULL, 0, '2021-04-11 20:02:42', '2021-04-11 15:02:47'),
(715, 739, 'd005ce7aeef46bd18515f783fb8e87fa', 0, '68018848a1c6f3b7672007d8946a9771', 'iOS 14.4; app version : 1.1.0; build number : 100; IOS ID : 13AA15DC-017F-4598-B65F-77604EE4DDF8', 'iPhone 11 Pro Max', '82.215.98.37', '2021-04-14 18:35:36', 'c4rkt-j1_kkBmp4y6hGMOO:APA91bH3dPuH5FZeX1MLKGJaLT3GgvGTGfVUjphaBZ3UuxGb-mQKJnWzGCvnnPSh4tl4bgamdZG1bzMXJyXmweAsMKy-nLnLUQQ2iBcm_8T53wsxighwEdDnMD5a4gAWSFQnW08HW4Dq', 2, '2021-04-11 20:03:29', '2021-04-14 13:35:36'),
(716, 593, 'a70dab11c90d06b809d0be230731762a', 0, 'ef97f66f4fc85a97c7c0aad58ae46a5d', 'SM-G977N', 'OS : 11; app version : 1.1.1; build number : 101; android ID : b15963ba55848d2b', '185.78.138.99', '2021-04-12 07:43:23', 'eJlbc23DTQSZbLotd8zG53:APA91bHekNwYzaC0t-sLMB_y4fDYpShxdkXhCqPZsxwC7AGafQjihW1QGwGkmGmjTYsueOoy_LGMts7zHCep_b_wd9_7Nm7ifceFlwoK_pKHBKYO8uAxlP99TkXLZEy86SwiBwcSzYii', 1, '2021-04-12 07:43:06', '2021-04-12 02:43:23'),
(717, 739, '56577889b3c1cd083b6d7b32d32f99d5', 0, 'ea90802df7a9279619f4cc49ed0c1f6b', 'Android SDK built for x86', 'OS : 10; app version : 1.1.2; build number : 102; android ID : 7074dffe00306bfe', '185.139.137.166', '2021-04-12 09:31:37', 'cDqxhsbZTfqlLQp3275z6N:APA91bHoXHH610R983maN2QuG-GT8xXiNr5K7tCKFLzZ7hJ8YGrFLFstdMx30zVb9ZkGgGFbni6iLF1b7VHeZPaeA6MNl4OfS82qg-H7vU4jL7RNVDwM9cNyeMGaTqE1-kryRIqKVa47', 1, '2021-04-12 09:31:19', '2021-04-12 04:31:37'),
(718, 753, '477b02d99dd6c00c5ba852bb9a9e1f6c', 1, NULL, NULL, NULL, '185.139.137.53', '2021-04-13 16:04:40', NULL, 0, '2021-04-13 16:04:04', '2021-04-13 11:04:40'),
(719, 753, 'a3de03cb426b5e36f5c7167b21395323', 1, NULL, NULL, NULL, '185.139.137.53', '2021-04-13 16:05:34', NULL, 0, '2021-04-13 16:04:50', '2021-04-13 11:05:34'),
(720, 753, '995f5e03890b029865f402e83a81c29d', 0, NULL, NULL, NULL, '185.139.137.53', NULL, NULL, 0, '2021-04-13 16:05:47', '2021-04-13 11:05:47'),
(721, 753, '38651c4450f87348fcbe1f992746a954', 1, NULL, NULL, NULL, '185.139.137.53', '2021-04-13 16:13:21', NULL, 0, '2021-04-13 16:11:34', '2021-04-13 11:13:21'),
(722, 753, '141aa4fef48df77f954d60a373a3c322', 2, NULL, NULL, NULL, '185.139.137.76', '2021-04-13 20:36:59', NULL, 0, '2021-04-13 20:35:41', '2021-04-13 15:36:59'),
(723, 753, 'b9acb4ae6121c941324b2b1d3fac5c30', 0, NULL, NULL, NULL, '185.139.137.76', NULL, NULL, 0, '2021-04-13 20:40:38', '2021-04-13 15:40:38'),
(724, 167, '3b712de48137572f3849aabd5666a4e3', 0, '20d8e0301a01fa73aaa3050fb6000449', 'iOS 14.4.2; app version : 1.1.3; build number : 103; IOS ID : E86E0158-7F20-474F-9243-9C240278655E', 'iPhone ?', '185.163.26.80', '2021-04-14 20:43:43', 'eF7i9mHLlk4_sXDJEcQ25t:APA91bEVbwFeUZPddnyype8Q1ntWPERiPb0ZgjZyClfX7Bdz31HJ3o9omYBZD9TMUHR1nd1GH0rgsbt_gH_Ah_BziGhmD5jwT0l83GWdIPBdlM3QbYbJkdeCe4zVWkiL_cmd2XRabeWi', 2, '2021-04-13 21:56:20', '2021-04-14 15:43:43'),
(725, 731, '8804f94e16ba5b680e239a554a08f7d2', 0, NULL, NULL, NULL, '188.113.201.89', NULL, NULL, 0, '2021-04-14 12:20:01', '2021-04-14 07:20:01'),
(726, 761, 'f51dc802382ce2b548bf73ff0726a31d', 0, 'c849db457daba22bd8def3065893d5c2', 'SM-A115F', 'OS : 10; app version : 1.1.0; build number : 100; android ID : afef6e9c5a787229', '37.110.215.107', '2021-04-14 13:00:39', 'cHSfCgkzTj2ikDxMIyyP_K:APA91bFl-78K_7JpFEoAgQ2iQUUpVi-fSlzzqNL45Dsgim5vhXwyYMCkkEJCejBFzXxfVdomsLuQKfQVwgpB2RFqFmxiHvOuuli4LFDxsXnmdQlxLg2x_LAsauOkQ1KJKqKRa5KfgLv3', 1, '2021-04-14 12:59:45', '2021-04-14 08:00:39'),
(727, 753, 'b5b0db7f3a77ca4fcf9eca57aa7181ca', 0, NULL, NULL, NULL, '185.139.137.79', NULL, NULL, 0, '2021-04-14 14:06:42', '2021-04-14 09:06:42'),
(728, 753, '04a1bf2d968f1ce381cf1f9184a807a9', 0, NULL, NULL, NULL, '185.139.137.79', NULL, NULL, 0, '2021-04-14 15:32:27', '2021-04-14 10:32:27'),
(729, 739, 'cc70903297fe1e25537ae50aea186306', 0, '9c1a2dce04bc5e6aface12306702006f', 'iOS 14.4; app version : 1.1.3; build number : 103; IOS ID : 13AA15DC-017F-4598-B65F-77604EE4DDF8', 'iPhone 11 Pro Max', '82.215.98.37', '2021-04-14 20:21:52', 'c4rkt-j1_kkBmp4y6hGMOO:APA91bH3dPuH5FZeX1MLKGJaLT3GgvGTGfVUjphaBZ3UuxGb-mQKJnWzGCvnnPSh4tl4bgamdZG1bzMXJyXmweAsMKy-nLnLUQQ2iBcm_8T53wsxighwEdDnMD5a4gAWSFQnW08HW4Dq', 2, '2021-04-14 18:43:57', '2021-04-14 15:21:52'),
(730, 739, 'd7619beb6eb189509885fbc192d2874b', 1, '510040f898233a9a15f764c43070ad22', 'iOS 14.4; app version : 1.1.5; build number : 105; IOS ID : 13AA15DC-017F-4598-B65F-77604EE4DDF8', 'iPhone 11 Pro Max', '82.215.98.37', '2021-04-18 10:10:50', 'c4rkt-j1_kkBmp4y6hGMOO:APA91bH3dPuH5FZeX1MLKGJaLT3GgvGTGfVUjphaBZ3UuxGb-mQKJnWzGCvnnPSh4tl4bgamdZG1bzMXJyXmweAsMKy-nLnLUQQ2iBcm_8T53wsxighwEdDnMD5a4gAWSFQnW08HW4Dq', 2, '2021-04-14 20:35:28', '2021-04-18 05:10:50'),
(731, 167, '3b712de48137572f3849aabd5666a4e3', 0, '295f859b434a8decebba5a0f29a298a4', 'iOS 14.4.2; app version : 1.1.4; build number : 104; IOS ID : E86E0158-7F20-474F-9243-9C240278655E', 'iPhone ?', '185.163.27.158', '2021-04-15 12:16:39', 'eF7i9mHLlk4_sXDJEcQ25t:APA91bEVbwFeUZPddnyype8Q1ntWPERiPb0ZgjZyClfX7Bdz31HJ3o9omYBZD9TMUHR1nd1GH0rgsbt_gH_Ah_BziGhmD5jwT0l83GWdIPBdlM3QbYbJkdeCe4zVWkiL_cmd2XRabeWi', 2, '2021-04-14 20:54:07', '2021-04-15 07:16:39'),
(732, 167, '3b712de48137572f3849aabd5666a4e3', 0, NULL, NULL, NULL, '81.95.227.191', NULL, NULL, 0, '2021-04-15 12:18:17', '2021-04-15 07:18:17'),
(733, 167, '3b712de48137572f3849aabd5666a4e3', 0, '45cdc67a2add2ab50374089bf038590e', 'iOS 14.4.2; app version : 1.1.5; build number : 105; IOS ID : E86E0158-7F20-474F-9243-9C240278655E', 'iPhone ?', '81.95.227.191', '2021-04-15 15:06:39', 'eF7i9mHLlk4_sXDJEcQ25t:APA91bEVbwFeUZPddnyype8Q1ntWPERiPb0ZgjZyClfX7Bdz31HJ3o9omYBZD9TMUHR1nd1GH0rgsbt_gH_Ah_BziGhmD5jwT0l83GWdIPBdlM3QbYbJkdeCe4zVWkiL_cmd2XRabeWi', 2, '2021-04-15 12:19:46', '2021-04-15 10:06:39'),
(734, 741, '9ef2ed4b7fd2c810847ffa5fa85bce38', 0, 'cb9536cfd9a3e2b0f193f67a4cae7504', 'Redmi Note 7', 'OS : 10; app version : 1.1.0; build number : 100; android ID : 627df126d61e4142', '81.95.227.191', '2021-04-15 13:03:40', 'cKwvniTtSUqLYjb6-oWMsy:APA91bFZ1d-5I81CpJK2ZCNv8hvhZaxSCet0YeBFPf-FIuKzPuHSOMWCccQKNtrnCpxye3SyRn9TBkhB6ebsEV0l1hRmo8K6o_DVeV4waWIE_TQAd23wDOy_Ti5rQcTk9BH1ToUifG5-', 1, '2021-04-15 13:02:26', '2021-04-15 08:03:40'),
(735, 739, 'ef0917ea498b1665ad6c701057155abe', 0, '6fecd5659e635dd4cbcd89b55d2310e0', 'iOS 14.4.2; app version : 1.1.5; build number : 105; IOS ID : 1E6B2462-B3FD-48B9-A45A-65334A2E95CA', 'Bekhruz’s iPhone', '185.139.137.200', '2021-04-15 15:10:24', 'cw_WbxRG30f8rf67hWPk2E:APA91bGBo3sP7PP5ewNLUotX1TusIr4SsimqBwaKMeXST-MLFVxJrz6SPu4l6M4KwlEag6sGY6EFQfaVNkXChmCydM9gmU6A8R1qWrAMq5BTFwNOIsHH461PI5camauscEvFf72HMllN', 1, '2021-04-15 15:06:45', '2021-04-15 10:10:24'),
(736, 167, '3b712de48137572f3849aabd5666a4e3', 0, 'bb4ddcaf2298af653d71e344db0469b0', 'iOS 14.4.2; app version : 1.1.5; build number : 105; IOS ID : E86E0158-7F20-474F-9243-9C240278655E', 'iPhone ?', '81.95.227.191', '2021-04-19 01:21:01', 'ea-APbnao0QQiAwEFc_GA1:APA91bHIJUp_I0jldHJKoLOVTSbdU0F4hI8maHOxbqitmgoT91af4ck8hEq6EPSak88b14QClmAUFKyTN5CcqGqGdJoW3l0Bg-Pj8g2NjPd8uKolUO2bf0CQtvs0oCrIC3dN_SY845qv', 2, '2021-04-15 17:17:16', '2021-04-18 20:21:01'),
(737, 739, 'a422e60213322845b85ae122de53269f', 0, '2b250ae0dbb49c9c92a0f4ff80fed9f2', 'iOS 14.4; app version : 1.1.5; build number : 105; IOS ID : 13AA15DC-017F-4598-B65F-77604EE4DDF8', 'iPhone 11 Pro Max', '82.215.98.37', '2021-04-18 10:19:22', 'c4rkt-j1_kkBmp4y6hGMOO:APA91bH3dPuH5FZeX1MLKGJaLT3GgvGTGfVUjphaBZ3UuxGb-mQKJnWzGCvnnPSh4tl4bgamdZG1bzMXJyXmweAsMKy-nLnLUQQ2iBcm_8T53wsxighwEdDnMD5a4gAWSFQnW08HW4Dq', 2, '2021-04-18 10:10:28', '2021-04-18 05:19:22'),
(738, 167, '3b712de48137572f3849aabd5666a4e3', 0, '09d7ee7188b5dbcdf6c696ea388dd4c6', 'iOS 14.4; app version : 1.1.5; build number : 105; IOS ID : 13AA15DC-017F-4598-B65F-77604EE4DDF8', 'iPhone 11 Pro Max', '82.215.98.37', '2021-04-19 09:03:41', 'c4rkt-j1_kkBmp4y6hGMOO:APA91bH3dPuH5FZeX1MLKGJaLT3GgvGTGfVUjphaBZ3UuxGb-mQKJnWzGCvnnPSh4tl4bgamdZG1bzMXJyXmweAsMKy-nLnLUQQ2iBcm_8T53wsxighwEdDnMD5a4gAWSFQnW08HW4Dq', 2, '2021-04-18 11:49:58', '2021-04-19 04:03:41'),
(739, 167, '3b712de48137572f3849aabd5666a4e3', 0, '691e3c6b5c4fee88f5f308689321822e', 'iOS 14.4.2; app version : 1.3.0; build number : 300; IOS ID : 5A3DC0EF-619D-4D57-9BFF-C323265BA674', 'iPad', '17.232.4.32', '2021-04-18 17:21:20', 'ecsllW8mR0oplPWHN-Q9wf:APA91bHDuB0ERFaQY4u43LVLBDFuwOoP3hR1eXGeSNZT0_d1bF8M3JnTbFMJh5WBjcv09S5GBeLVV6tG56ldEQZRwLUFDFv45Y0zL_RY6Yx657Uyis2KiLVzir3fVRtKviTDPSY9YbwN', 1, '2021-04-18 17:20:58', '2021-04-18 12:21:20'),
(740, 167, '3b712de48137572f3849aabd5666a4e3', 0, '780324469fbe6bd3edf7f88699becb0f', 'iOS 14.4.2; app version : 1.3.0; build number : 300; IOS ID : 59E1CC03-428B-4758-B3A3-54C6FF2C2E4A', 'iPhone ?', '82.215.73.252', '2021-04-19 02:21:45', 'ea-APbnao0QQiAwEFc_GA1:APA91bHIJUp_I0jldHJKoLOVTSbdU0F4hI8maHOxbqitmgoT91af4ck8hEq6EPSak88b14QClmAUFKyTN5CcqGqGdJoW3l0Bg-Pj8g2NjPd8uKolUO2bf0CQtvs0oCrIC3dN_SY845qv', 2, '2021-04-19 01:22:47', '2021-04-18 21:21:45'),
(741, 167, '3b712de48137572f3849aabd5666a4e3', 0, '24ca93a3c9ba9e1b8db5c3ac2add39bf', 'Redmi Note 8T', 'OS : 9; app version : 1.3.0; build number : 300; android ID : 62b2d260fe699746', '82.215.73.252', '2021-04-19 01:56:43', 'eqAezeoCRcqgcwZBm9SLoJ:APA91bGtC53YWgZBB1z3LbjBTEQOcY9Nn07MPv9BOnM9frx9FvlYFXqBxzPTF0zewQYifknA7IMqCP_o7X8v2LNrXBVlt-jIhDx2PxJs06qkjwXqLT8rzssG91qv3EC4mrGO5AIeO19T', 1, '2021-04-19 01:55:47', '2021-04-18 20:56:43'),
(742, 167, '3b712de48137572f3849aabd5666a4e3', 0, 'b72154d32d7c619b100c7d350e41cd9a', 'iOS 14.4.2; app version : 1.3.0; build number : 300; IOS ID : 59E1CC03-428B-4758-B3A3-54C6FF2C2E4A', 'iPhone ?', '82.215.73.252', '2021-04-19 02:35:42', 'ea-APbnao0QQiAwEFc_GA1:APA91bHIJUp_I0jldHJKoLOVTSbdU0F4hI8maHOxbqitmgoT91af4ck8hEq6EPSak88b14QClmAUFKyTN5CcqGqGdJoW3l0Bg-Pj8g2NjPd8uKolUO2bf0CQtvs0oCrIC3dN_SY845qv', 2, '2021-04-19 02:35:20', '2021-04-18 21:35:42'),
(743, 167, '3b712de48137572f3849aabd5666a4e3', 0, '8f5cb02f8e7c87dbaffa32e1930ad667', 'iOS 14.4.2; app version : 1.3.0; build number : 300; IOS ID : 59E1CC03-428B-4758-B3A3-54C6FF2C2E4A', 'iPhone ?', '185.163.26.67', '2021-04-19 10:55:41', 'ea-APbnao0QQiAwEFc_GA1:APA91bHIJUp_I0jldHJKoLOVTSbdU0F4hI8maHOxbqitmgoT91af4ck8hEq6EPSak88b14QClmAUFKyTN5CcqGqGdJoW3l0Bg-Pj8g2NjPd8uKolUO2bf0CQtvs0oCrIC3dN_SY845qv', 1, '2021-04-19 10:55:28', '2021-04-19 05:55:41'),
(744, 663, 'af5baf594e9197b43c9f26f17b205e5b', 0, '63d748c83b083ee88d4b82c7de631b7f', 'Redmi Note 8', 'OS : 10; app version : 1.3.0; build number : 300; android ID : d8a60cd96fbb9ef0', '188.113.238.78', '2021-04-20 15:05:38', 'dpOqWyoBR6OfZ_7W8wzahy:APA91bHlHntUO85uff5JqslXgkNFHiJvRJdl8eOMUsZtbASjeBlxNtgV0ZM_RsDyGzwIWkZo2H5mSSLXFFb6E0jAu5-dghh8umOYL2qzDX-_JH7gNwHjzOnZUS3rf5ugTTvjmCtj8A70', 1, '2021-04-20 15:04:49', '2021-04-20 10:05:38'),
(745, 739, '48cb136b65a69e8c2aa22913a0d91b2f', 0, '1cf44b803ab121be52bfc35521f8ff8c', 'iOS 14.4; app version : 1.3.0; build number : 300; IOS ID : 13AA15DC-017F-4598-B65F-77604EE4DDF8', 'iPhone 11 Pro Max', '82.215.98.37', '2021-04-20 15:31:28', 'c4rkt-j1_kkBmp4y6hGMOO:APA91bH3dPuH5FZeX1MLKGJaLT3GgvGTGfVUjphaBZ3UuxGb-mQKJnWzGCvnnPSh4tl4bgamdZG1bzMXJyXmweAsMKy-nLnLUQQ2iBcm_8T53wsxighwEdDnMD5a4gAWSFQnW08HW4Dq', 1, '2021-04-20 15:30:36', '2021-04-20 10:31:28');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_user_id_pan_expiry_idx` (`user_id`,`pan`,`expiry`) USING BTREE,
  ADD UNIQUE KEY `card_token_idx` (`token`) USING BTREE,
  ADD KEY `deleted` (`deleted`);

--
-- Индексы таблицы `card_debit`
--
ALTER TABLE `card_debit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `multicard_id` (`multicard_id`),
  ADD KEY `card_debit_sync_finished_idx` (`sync_finished`) USING BTREE,
  ADD KEY `card_debit_status_idx` (`status`) USING BTREE,
  ADD KEY `card_debit_cl_history_id_idx` (`cl_history_id`) USING BTREE,
  ADD KEY `card_id` (`card_id`),
  ADD KEY `card_hold_id` (`card_hold_id`);

--
-- Индексы таблицы `card_hold`
--
ALTER TABLE `card_hold`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Индексы таблицы `cashback_history`
--
ALTER TABLE `cashback_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `multicard_id` (`multicard_id`),
  ADD KEY `partner_id` (`partner_id`,`location_id`,`terminal_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Индексы таблицы `cashback_monthly_funding`
--
ALTER TABLE `cashback_monthly_funding`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `multicard_id` (`multicard_id`),
  ADD KEY `month` (`month`);

--
-- Индексы таблицы `credit_limit_history`
--
ALTER TABLE `credit_limit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `multicard_id` (`multicard_id`),
  ADD KEY `credit_limit_history_init_idx` (`init`) USING BTREE;

--
-- Индексы таблицы `multicard`
--
ALTER TABLE `multicard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pan` (`pan`,`expiry`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `multicard_callback`
--
ALTER TABLE `multicard_callback`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `multicard_transaction`
--
ALTER TABLE `multicard_transaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `multicard_transaction_multicard_id_pc_uniq_id_idx` (`multicard_id`,`pc_uniq_id`) USING BTREE,
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `time` (`time`),
  ADD KEY `multicard_id` (`multicard_id`,`type`);

--
-- Индексы таблицы `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `partner_active_idx` (`active`) USING BTREE;

--
-- Индексы таблицы `partner_cashback_condition`
--
ALTER TABLE `partner_cashback_condition`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `partner_id` (`partner_id`,`location_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Индексы таблицы `partner_category`
--
ALTER TABLE `partner_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partner_location`
--
ALTER TABLE `partner_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Индексы таблицы `partner_terminal`
--
ALTER TABLE `partner_terminal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `terminal_id` (`terminal_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Индексы таблицы `ref_api_result`
--
ALTER TABLE `ref_api_result`
  ADD UNIQUE KEY `code` (`code`,`lang`);

--
-- Индексы таблицы `ref_city`
--
ALTER TABLE `ref_city`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `multicard_id` (`multicard_id`),
  ADD UNIQUE KEY `client_id` (`client_id`),
  ADD KEY `added_on` (`added_on`);

--
-- Индексы таблицы `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `user_session`
--
ALTER TABLE `user_session`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_key` (`session_key`,`state`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `card`
--
ALTER TABLE `card`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

--
-- AUTO_INCREMENT для таблицы `card_debit`
--
ALTER TABLE `card_debit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `card_hold`
--
ALTER TABLE `card_hold`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT для таблицы `cashback_history`
--
ALTER TABLE `cashback_history`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `cashback_monthly_funding`
--
ALTER TABLE `cashback_monthly_funding`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `credit_limit_history`
--
ALTER TABLE `credit_limit_history`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- AUTO_INCREMENT для таблицы `multicard`
--
ALTER TABLE `multicard`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=766;

--
-- AUTO_INCREMENT для таблицы `multicard_callback`
--
ALTER TABLE `multicard_callback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT для таблицы `multicard_transaction`
--
ALTER TABLE `multicard_transaction`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81844;

--
-- AUTO_INCREMENT для таблицы `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT для таблицы `partner_cashback_condition`
--
ALTER TABLE `partner_cashback_condition`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT для таблицы `partner_category`
--
ALTER TABLE `partner_category`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `partner_location`
--
ALTER TABLE `partner_location`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT для таблицы `partner_terminal`
--
ALTER TABLE `partner_terminal`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT для таблицы `ref_city`
--
ALTER TABLE `ref_city`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=782;

--
-- AUTO_INCREMENT для таблицы `user_notification`
--
ALTER TABLE `user_notification`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user_session`
--
ALTER TABLE `user_session`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=746;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `card_debit`
--
ALTER TABLE `card_debit`
  ADD CONSTRAINT `card_debit_ibfk_1` FOREIGN KEY (`multicard_id`) REFERENCES `multicard` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `card_debit_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `card_debit_ibfk_3` FOREIGN KEY (`card_hold_id`) REFERENCES `card_hold` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `card_hold`
--
ALTER TABLE `card_hold`
  ADD CONSTRAINT `card_hold_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `cashback_history`
--
ALTER TABLE `cashback_history`
  ADD CONSTRAINT `cashback_history_ibfk_1` FOREIGN KEY (`multicard_id`) REFERENCES `multicard` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cashback_history_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `multicard_transaction` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cashback_history_ibfk_3` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cashback_history_ibfk_4` FOREIGN KEY (`location_id`) REFERENCES `partner_location` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `cashback_monthly_funding`
--
ALTER TABLE `cashback_monthly_funding`
  ADD CONSTRAINT `cashback_monthly_funding_ibfk_1` FOREIGN KEY (`multicard_id`) REFERENCES `multicard` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cashback_monthly_funding_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `multicard_transaction` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `credit_limit_history`
--
ALTER TABLE `credit_limit_history`
  ADD CONSTRAINT `credit_limit_history_ibfk_1` FOREIGN KEY (`multicard_id`) REFERENCES `multicard` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `multicard`
--
ALTER TABLE `multicard`
  ADD CONSTRAINT `multicard_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `multicard_transaction`
--
ALTER TABLE `multicard_transaction`
  ADD CONSTRAINT `multicard_transaction_ibfk_1` FOREIGN KEY (`multicard_id`) REFERENCES `multicard` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `multicard_transaction_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `partner`
--
ALTER TABLE `partner`
  ADD CONSTRAINT `partner_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `partner_category` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `partner_cashback_condition`
--
ALTER TABLE `partner_cashback_condition`
  ADD CONSTRAINT `partner_cashback_condition_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `partner_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partner_cashback_condition_ibfk_3` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `partner_location`
--
ALTER TABLE `partner_location`
  ADD CONSTRAINT `partner_location_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partner_location_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `ref_city` (`id`);

--
-- Ограничения внешнего ключа таблицы `partner_terminal`
--
ALTER TABLE `partner_terminal`
  ADD CONSTRAINT `partner_terminal_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `partner_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_session`
--
ALTER TABLE `user_session`
  ADD CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
