-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th12 13, 2023 lúc 06:10 PM
-- Phiên bản máy phục vụ: 10.7.3-MariaDB-log
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `zero`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `alive_ip`
--

CREATE TABLE `alive_ip` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `commission`
--

CREATE TABLE `commission` (
  `id` int(11) NOT NULL,
  `order_amount` decimal(12,2) NOT NULL COMMENT '订单金额',
  `userid` int(11) NOT NULL,
  `invite_userid` int(11) NOT NULL,
  `order_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `get_amount` decimal(12,2) NOT NULL COMMENT '获得佣金',
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL COMMENT '主键',
  `item` text NOT NULL COMMENT '项',
  `value` text NOT NULL COMMENT '值',
  `class` varchar(128) NOT NULL DEFAULT 'default' COMMENT '配置分类',
  `is_public` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为公共参数',
  `type` text NOT NULL COMMENT '值类型',
  `default` text NOT NULL COMMENT '默认值',
  `mark` text NOT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon`
--

CREATE TABLE `coupon` (
  `id` int(11) NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠码',
  `per_use_count` int(11) DEFAULT NULL COMMENT '每个用户使用次数',
  `expired_at` int(11) NOT NULL COMMENT '到期时间',
  `limited_product` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '限定产品使用',
  `limited_product_period` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '限制产品周期',
  `discount` int(11) NOT NULL COMMENT '折扣比例',
  `total_use_count` int(11) DEFAULT NULL COMMENT '总使用次数',
  `total_used_count` int(11) NOT NULL DEFAULT 0 COMMENT '被使用的次数',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detect_ban_log`
--

CREATE TABLE `detect_ban_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户 ID',
  `email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户邮箱',
  `detect_number` int(11) NOT NULL COMMENT '本次违规次数',
  `ban_time` int(11) NOT NULL COMMENT '本次封禁时长',
  `start_time` int(11) NOT NULL COMMENT '统计开始时间',
  `end_time` int(11) NOT NULL COMMENT '统计结束时间',
  `all_detect_number` int(11) NOT NULL COMMENT '累计违规次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='审计封禁日志';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detect_list`
--

CREATE TABLE `detect_list` (
  `id` int(11) NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `regex` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detect_log`
--

CREATE TABLE `detect_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_queue`
--

CREATE TABLE `email_queue` (
  `id` int(11) NOT NULL,
  `to_email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `array` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Email Queue 發件列表';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `knowledge`
--

CREATE TABLE `knowledge` (
  `id` int(11) NOT NULL,
  `platform` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台',
  `client` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类',
  `title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `node`
--

CREATE TABLE `node` (
  `id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '是否显示1显示0不显示',
  `server` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '节点地址',
  `custom_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '节点配置',
  `node_flag` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '节点旗帜',
  `node_type` int(11) NOT NULL COMMENT '节点类型:1SS,2VMESS,3VLESS,4TROJAN,5SS-PLUGINS',
  `traffic_rate` float NOT NULL DEFAULT 1 COMMENT '流量倍率',
  `node_class` int(11) NOT NULL DEFAULT 0 COMMENT '节点等级',
  `node_speedlimit` int(11) NOT NULL DEFAULT 0 COMMENT '速度0为不限制',
  `node_sort` int(11) NOT NULL DEFAULT 0 COMMENT '节点排序',
  `node_iplimit` int(11) NOT NULL DEFAULT 0 COMMENT 'IP限制',
  `node_traffic` bigint(20) NOT NULL DEFAULT 0 COMMENT '节点流量',
  `node_traffic_limit` bigint(20) NOT NULL DEFAULT 0 COMMENT '流量限制',
  `node_traffic_limit_reset_date` int(11) NOT NULL DEFAULT 0 COMMENT '节点流量限制重置日期',
  `node_heartbeat` bigint(20) NOT NULL DEFAULT 0,
  `node_ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '节点IP',
  `node_group` int(11) NOT NULL DEFAULT 0 COMMENT '节点群组',
  `online` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `node_info`
--

CREATE TABLE `node_info` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `uptime` float NOT NULL,
  `load` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `node_online_log`
--

CREATE TABLE `node_online_log` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `online_user` int(11) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL COMMENT 'AUTO_INCREMENT',
  `order_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `order_type` int(11) NOT NULL COMMENT '订单类型:1购买产品2账户充值3续费产品4升级产品',
  `user_id` int(11) NOT NULL COMMENT '提交用户',
  `product_id` int(11) DEFAULT NULL COMMENT '订单商品',
  `product_price` decimal(12,2) DEFAULT NULL COMMENT '商品售价',
  `product_period` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL COMMENT '订单优惠码',
  `order_total` decimal(12,2) NOT NULL COMMENT '订单金额',
  `credit_paid` decimal(12,2) DEFAULT NULL COMMENT '订单余额支付部分',
  `discount_amount` decimal(12,2) DEFAULT NULL COMMENT '折扣金额',
  `order_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态,1-等待支付,2-完成支付,0-订单失效',
  `created_at` int(11) NOT NULL COMMENT '订单创建时间',
  `updated_at` int(11) NOT NULL COMMENT '订单更新时间',
  `expired_at` int(11) DEFAULT NULL COMMENT '订单失效时间',
  `paid_at` int(11) DEFAULT NULL COMMENT '订单支付时间',
  `payment_id` int(11) DEFAULT NULL COMMENT '订单支付方式',
  `handling_fee` decimal(12,2) DEFAULT NULL,
  `bonus_amount` decimal(12,2) DEFAULT NULL COMMENT '充值返利',
  `execute_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '执行状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '显示名称',
  `gateway` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付网关',
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '网关配置文件',
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标url',
  `percent_fee` int(11) DEFAULT NULL COMMENT '百分比手续费',
  `fixed_fee` int(11) DEFAULT NULL COMMENT '固定手续费',
  `recharge_bonus` int(11) DEFAULT NULL COMMENT '充值返利百分比',
  `notify_domain` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '通知域名',
  `enable` int(1) NOT NULL DEFAULT 0 COMMENT '开启',
  `sort` int(11) NOT NULL DEFAULT 0,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `month_price` decimal(12,2) DEFAULT NULL COMMENT '产品价格',
  `quarter_price` decimal(12,2) DEFAULT NULL,
  `half_year_price` decimal(12,2) DEFAULT NULL,
  `year_price` decimal(12,2) DEFAULT NULL,
  `two_year_price` decimal(12,2) DEFAULT NULL,
  `onetime_price` decimal(12,2) DEFAULT NULL,
  `traffic` int(11) NOT NULL DEFAULT 0 COMMENT '产品包含的流量',
  `user_group` int(11) NOT NULL DEFAULT 0 COMMENT '用户群组',
  `class` int(11) NOT NULL DEFAULT 0 COMMENT '产品等级',
  `reset_traffic_cycle` int(11) NOT NULL DEFAULT 1 COMMENT '流量重置周期[0-一次性, 1-订单日重置, 2-每月一号重置]',
  `speed_limit` int(11) NOT NULL COMMENT '速度0为不限制',
  `ip_limit` int(11) NOT NULL DEFAULT 0 COMMENT 'IP0为不限制',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '产品类型, 1-周期,2-按流量,3-其他商品',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '产品排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '产品状态 1上架0下架',
  `renew` tinyint(4) NOT NULL DEFAULT 1 COMMENT '开启续费',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存0为不限制',
  `sales` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `custom_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自定义商品介绍内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `signin_ip`
--

CREATE TABLE `signin_ip` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '工单主题',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '工单类型',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '‘’' COMMENT '工单内容',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '最后更新时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态0关闭1活跃'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注册邮箱',
  `password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录密码',
  `passwd` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SS 密码',
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'VMESS/TROJAN UUID',
  `t` int(11) NOT NULL DEFAULT 0,
  `u` bigint(20) NOT NULL DEFAULT 0,
  `d` bigint(20) NOT NULL DEFAULT 0,
  `product_id` int(11) DEFAULT NULL COMMENT '用户当前产品ID',
  `reset_traffic_value` int(11) DEFAULT NULL COMMENT '重置流量的值',
  `reset_traffic_date` int(11) DEFAULT NULL COMMENT '重置流量日期',
  `transfer_enable` bigint(20) NOT NULL COMMENT '总流量',
  `enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `detect_ban` int(11) NOT NULL DEFAULT 0 COMMENT '是否被封禁',
  `last_detect_ban_time` datetime DEFAULT '1989-06-04 00:05:00' COMMENT '最后封禁时间',
  `all_detect_number` int(11) NOT NULL DEFAULT 0 COMMENT '累计违规次数',
  `last_signin_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `signup_date` datetime NOT NULL COMMENT '注册日期',
  `money` decimal(12,2) NOT NULL COMMENT '金钱',
  `notify_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接收通知的的方式',
  `ref_by` int(11) NOT NULL DEFAULT 0 COMMENT '推荐人',
  `signup_ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `node_speedlimit` int(11) NOT NULL DEFAULT 0 COMMENT '端口速度',
  `node_iplimit` int(11) NOT NULL DEFAULT 0 COMMENT 'IP限制',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是管理员1是0不是',
  `last_day_t` bigint(20) NOT NULL DEFAULT 0,
  `class` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `class_expire` datetime NOT NULL DEFAULT '1989-06-04 00:05:00' COMMENT '等级到期时间',
  `theme` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `node_group` int(11) NOT NULL DEFAULT 0 COMMENT '分组',
  `telegram_id` bigint(20) DEFAULT NULL,
  `traffic_notified` tinyint(1) DEFAULT 0,
  `rebate` int(11) NOT NULL DEFAULT -1 COMMENT '返利百分比',
  `commission` decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '返利金额',
  `withdraw_account` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0 COMMENT '账户是否被验证',
  `subscription_token` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订阅token'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_access`
--

CREATE TABLE `user_access` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `type` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_invite_code`
--

CREATE TABLE `user_invite_code` (
  `id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '2016-06-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_subscribe_log`
--

CREATE TABLE `user_subscribe_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户邮箱',
  `request_ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求 IP',
  `created_at` int(11) NOT NULL COMMENT '请求时间',
  `request_user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求 UA 信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户订阅日志';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `token` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `expired_at` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1-tg token,2-重置密码token,3-邮箱验证token'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_traffic_log`
--

CREATE TABLE `user_traffic_log` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `node_id` int(11) NOT NULL,
  `rate` float NOT NULL,
  `traffic` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL COMMENT '记录时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `withdraw_log`
--

CREATE TABLE `withdraw_log` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT 0,
  `userid` int(11) DEFAULT 0,
  `total` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `alive_ip`
--
ALTER TABLE `alive_ip`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `detect_ban_log`
--
ALTER TABLE `detect_ban_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `detect_list`
--
ALTER TABLE `detect_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `detect_log`
--
ALTER TABLE `detect_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detect_log_ibfk_5` (`node_id`);

--
-- Chỉ mục cho bảng `email_queue`
--
ALTER TABLE `email_queue`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `knowledge`
--
ALTER TABLE `knowledge`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `node`
--
ALTER TABLE `node`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `node_info`
--
ALTER TABLE `node_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `node_info_ibfk_2` (`node_id`);

--
-- Chỉ mục cho bảng `node_online_log`
--
ALTER TABLE `node_online_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `node_online_log_ibfk_3` (`node_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `signin_ip`
--
ALTER TABLE `signin_ip`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE,
  ADD UNIQUE KEY `uuid` (`uuid`) USING BTREE;

--
-- Chỉ mục cho bảng `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_invite_code`
--
ALTER TABLE `user_invite_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `user_subscribe_log`
--
ALTER TABLE `user_subscribe_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `withdraw_log`
--
ALTER TABLE `withdraw_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `alive_ip`
--
ALTER TABLE `alive_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- AUTO_INCREMENT cho bảng `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `detect_ban_log`
--
ALTER TABLE `detect_ban_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `detect_list`
--
ALTER TABLE `detect_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `detect_log`
--
ALTER TABLE `detect_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `email_queue`
--
ALTER TABLE `email_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `knowledge`
--
ALTER TABLE `knowledge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `node`
--
ALTER TABLE `node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `node_info`
--
ALTER TABLE `node_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `node_online_log`
--
ALTER TABLE `node_online_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AUTO_INCREMENT';

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `signin_ip`
--
ALTER TABLE `signin_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_access`
--
ALTER TABLE `user_access`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_invite_code`
--
ALTER TABLE `user_invite_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_subscribe_log`
--
ALTER TABLE `user_subscribe_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `withdraw_log`
--
ALTER TABLE `withdraw_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `detect_log`
--
ALTER TABLE `detect_log`
  ADD CONSTRAINT `detect_log_ibfk_5` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `node_info`
--
ALTER TABLE `node_info`
  ADD CONSTRAINT `node_info_ibfk_2` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `node_online_log`
--
ALTER TABLE `node_online_log`
  ADD CONSTRAINT `node_online_log_ibfk_3` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user_invite_code`
--
ALTER TABLE `user_invite_code`
  ADD CONSTRAINT `user_invite_code_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
