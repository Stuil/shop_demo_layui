/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : localhost:3306
 Source Schema         : shop_xcx

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 22/08/2023 16:35:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `goods_brand`;
CREATE TABLE `goods_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `brand_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌描述',
  `brand_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌网站',
  `is_delete` int(1) NULL DEFAULT NULL COMMENT '是否删除 0未删除 1已删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `goods_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品图片',
  `goods_stock` int(11) NULL DEFAULT NULL COMMENT '商品库存',
  `goods_price` int(11) NULL DEFAULT NULL COMMENT '商品价格：单位，分',
  `goods_ninimum` int(11) NULL DEFAULT NULL COMMENT '起购数量',
  `status` int(1) NULL DEFAULT NULL COMMENT '是否上架  0下架 1上架',
  `brand_id` int(11) NULL DEFAULT NULL COMMENT '品牌ID',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '类型ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_info_brand`(`brand_id`) USING BTREE,
  INDEX `goods_info_type`(`type_id`) USING BTREE,
  CONSTRAINT `goods_info_brand` FOREIGN KEY (`brand_id`) REFERENCES `goods_brand` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `goods_info_type` FOREIGN KEY (`type_id`) REFERENCES `goods_type` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `order_amount` bigint(20) NULL DEFAULT NULL COMMENT '订单总金额： 分',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '总商品数量',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '订单时间',
  `order_status` int(1) NULL DEFAULT NULL COMMENT '订单状态： 0待支付 1已支付  2 代发货 3 已发货 4 待收货 5已收货 6 已完成 7 退款',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '购买人ID',
  `recipient_name` int(11) NULL DEFAULT NULL COMMENT '收件人名称',
  `recipient_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人电话',
  `recipient_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_member`(`member_id`) USING BTREE,
  CONSTRAINT `order_member` FOREIGN KEY (`member_id`) REFERENCES `member_user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_order_items
-- ----------------------------
DROP TABLE IF EXISTS `goods_order_items`;
CREATE TABLE `goods_order_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单code',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `goods_amount` bigint(20) NULL DEFAULT NULL COMMENT '商品金额',
  `goods_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品图片',
  `member_id` int(11) NOT NULL COMMENT '购买人ID',
  `recipient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `recipient_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人电话',
  `recipient_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_item_id`(`order_id`) USING BTREE,
  INDEX `item_member_id`(`member_id`) USING BTREE,
  CONSTRAINT `order_item_id` FOREIGN KEY (`order_id`) REFERENCES `goods_order` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `item_member_id` FOREIGN KEY (`member_id`) REFERENCES `member_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `type_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别备注',
  `is_delete` int(1) NULL DEFAULT NULL COMMENT '0:删除 1 未删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_cart
-- ----------------------------
DROP TABLE IF EXISTS `member_cart`;
CREATE TABLE `member_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `goods_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品图片',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_goods_id`(`goods_id`) USING BTREE,
  INDEX `cart_member_id`(`member_id`) USING BTREE,
  CONSTRAINT `cart_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cart_member_id` FOREIGN KEY (`member_id`) REFERENCES `member_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_recipient
-- ----------------------------
DROP TABLE IF EXISTS `member_recipient`;
CREATE TABLE `member_recipient`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `recipient_member_id`(`member_id`) USING BTREE,
  CONSTRAINT `recipient_member_id` FOREIGN KEY (`member_id`) REFERENCES `member_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_user
-- ----------------------------
DROP TABLE IF EXISTS `member_user`;
CREATE TABLE `member_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员姓名',
  `member_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员密码',
  `member_sex` int(1) NULL DEFAULT NULL COMMENT '会员性别0 男 1女',
  `member_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员头像',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态：0禁用 1 启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `update_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理员表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
