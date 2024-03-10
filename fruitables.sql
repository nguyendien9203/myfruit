CREATE TABLE `user` (
  `id` bigint PRIMARY KEY,
  `full_name` varchar(50),
  `email` varchar(100),
  `password` varchar(100),
  `phone` varchar(20),
  `dob` date,
  `gender` varchar(20),
  `status` varchar(30),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `role` (
  `id` bigint PRIMARY KEY,
  `role_name` varchar(50),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `user_role` (
  `id` bigint PRIMARY KEY,
  `user_id` bigint,
  `role_id` bigint,
  `is_default` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `address` (
  `id` bigint PRIMARY KEY,
  `full_name` varchar(50),
  `email` varchar(50),
  `phone` varchar(20),
  `address` varchar(500),
  `note_address` text,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `user_address` (
  `id` bigint PRIMARY KEY,
  `user_id` bigint,
  `address_id` bigint,
  `is_default` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `category` (
  `id` bigint PRIMARY KEY,
  `name` varchar(50),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `unit` (
  `id` bigint PRIMARY KEY,
  `value` varchar(20),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `product` (
  `id` bigint PRIMARY KEY,
  `category_id` bigint,
  `name` varchar(255),
  `brand` varchar(100),
  `product_image` varchar(500),
  `desc` text,
  `status` varchar(30),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `product_category` (
  `id` bigint PRIMARY KEY,
  `product_id` bigint,
  `category_id` bigint
);

CREATE TABLE `product_item` (
  `id` bigint PRIMARY KEY,
  `product_id` bigint,
  `unit_id` bigint,
  `SKU` varchar(100),
  `qty_in_stock` float,
  `price` decimal(10,2),
  `discount` decimal(10,2),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `variation` (
  `id` bigint PRIMARY KEY,
  `category_id` bigint,
  `name` varchar(100),
  `status` varchar(30),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `variation_option` (
  `id` bigint,
  `variation_id` bigint,
  `name` varchar(100),
  `type` varchar(100),
  `status` varchar(30),
  `created_at` datetime,
  `updated_at` datetime,
  PRIMARY KEY (`id`, `variation_id`)
);

CREATE TABLE `product_configuration` (
  `id` bigint PRIMARY KEY,
  `variation_option_id` bigint,
  `product_item_id` bigint,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `payment_type` (
  `id` bigint PRIMARY KEY,
  `value` varchar(255),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `user_payment_method` (
  `id` bigint PRIMARY KEY,
  `user_id` bigint,
  `payment_type_id` bigint,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `shipping_method` (
  `id` bigint PRIMARY KEY,
  `name` varchar(255),
  `price` decimal(10,2),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `shop_order` (
  `id` bigint PRIMARY KEY,
  `user_id` bigint,
  `shipping_address_id` bigint,
  `payment_method_id` bigint,
  `shipping_method_id` bigint,
  `created_by` varchar(255),
  `updated_by` varchar(255),
  `order_date` datetime,
  `order_total` decimal(10,2),
  `status` varchar(30),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `order_line` (
  `id` bigint PRIMARY KEY,
  `order_id` bigint,
  `product_item_id` bigint,
  `qty` float,
  `price` decimal(10,2),
  `created_at` datetime,
  `updated_at` datetime
);

ALTER TABLE `user_role` ADD FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

ALTER TABLE `user_role` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `user_address` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `user_address` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

ALTER TABLE `variation_option` ADD FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`);

ALTER TABLE `product_configuration` ADD FOREIGN KEY (`variation_option_id`) REFERENCES `variation_option` (`id`);

ALTER TABLE `product_configuration` ADD FOREIGN KEY (`product_item_id`) REFERENCES `product_item` (`id`);

ALTER TABLE `product_item` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `variation` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

ALTER TABLE `shop_order` ADD FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`);

ALTER TABLE `shop_order` ADD FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`);

ALTER TABLE `order_line` ADD FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`);

ALTER TABLE `order_line` ADD FOREIGN KEY (`product_item_id`) REFERENCES `product_item` (`id`);

ALTER TABLE `user_payment_method` ADD FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`);

ALTER TABLE `shop_order` ADD FOREIGN KEY (`payment_method_id`) REFERENCES `user_payment_method` (`id`);

ALTER TABLE `user_payment_method` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `product_item` ADD FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`);

ALTER TABLE `product_category` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

ALTER TABLE `product_category` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
