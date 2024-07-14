DROP DATABASE IF EXISTS `cxblog-cloud`;
CREATE DATABASE  `cxblog-cloud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
USE `cxblog-cloud`;

DROP DATABASE IF EXISTS `cxblog-nacos`;
CREATE DATABASE  `cxblog-nacos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
USE `cxblog-nacos`;

DROP DATABASE IF EXISTS `cxblog-seata`;
CREATE DATABASE  `cxblog-seata` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
USE `cxblog-seata`;