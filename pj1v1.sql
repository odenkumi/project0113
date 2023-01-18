-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023 年 01 月 18 日 08:23
-- 伺服器版本： 10.4.27-MariaDB
-- PHP 版本： 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `pj1`
--

-- --------------------------------------------------------

--
-- 資料表結構 `categories`
--

CREATE TABLE `categories` (
  `categoriesID` int(5) NOT NULL COMMENT '商品類別編號',
  `categoriesname` varchar(50) NOT NULL COMMENT '商品類別名稱',
  `description` varchar(50) NOT NULL COMMENT '敘述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL COMMENT '客戶編碼',
  `name` varchar(45) NOT NULL COMMENT '姓名',
  `gender` varchar(2) NOT NULL COMMENT '性別',
  `city` varchar(20) NOT NULL COMMENT '城市',
  `birthday` varchar(45) NOT NULL COMMENT '生日',
  `address` varchar(80) NOT NULL COMMENT '地址',
  `phone` varchar(20) NOT NULL COMMENT '電話',
  `email` varchar(80) NOT NULL COMMENT '信箱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `rentid` int(11) NOT NULL COMMENT '訂單編號',
  `customerID` int(5) NOT NULL COMMENT '客戶編號',
  `orderdate` date NOT NULL COMMENT '下單日期',
  `requireddate` date NOT NULL COMMENT '預計發送日',
  `deliverydate` date NOT NULL COMMENT '發送日',
  `deliveryaddress` varchar(80) NOT NULL COMMENT '送達地址',
  `categoriesID` int(3) NOT NULL COMMENT '商品種類代碼',
  `delivery` varchar(10) NOT NULL COMMENT '運送選項',
  `payment` varchar(10) NOT NULL COMMENT '付款選項'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `order_details`
--

CREATE TABLE `order_details` (
  `rentID` int(11) NOT NULL COMMENT '租賃契約編碼',
  `productID` varchar(5) NOT NULL COMMENT '產品編碼',
  `unitprice` int(8) NOT NULL COMMENT '單價',
  `quantity` int(3) NOT NULL COMMENT '數量',
  `discount` double NOT NULL COMMENT '折價'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

CREATE TABLE `products` (
  `productID` int(11) NOT NULL COMMENT '商品編號',
  `categoriesID` int(5) NOT NULL COMMENT '商品類別編號',
  `productname` varchar(50) NOT NULL COMMENT '商品名稱',
  `sizeperunit` varchar(30) NOT NULL COMMENT '大小',
  `unitprice` int(11) NOT NULL COMMENT '價格',
  `picture` longblob NOT NULL COMMENT '照片',
  `status` text NOT NULL COMMENT '折舊狀態'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoriesID`);

--
-- 資料表索引 `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`rentid`),
  ADD UNIQUE KEY `FOREIGN` (`categoriesID`);

--
-- 資料表索引 `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`rentID`),
  ADD UNIQUE KEY `FOREIGN` (`productID`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `FOREIGN` (`categoriesID`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
