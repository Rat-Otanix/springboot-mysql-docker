CREATE TABLE `employess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
 `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_users_username` (`id`),
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
