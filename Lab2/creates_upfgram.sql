DROP SCHEMA IF EXISTS upfgram;
CREATE DATABASE IF NOT EXISTS upfgram;
USE upfgram;

CREATE TABLE `user` (
`id` INT NOT NULL AUTO_INCREMENT,
`user_name` varchar(50) NOT NULL,
`name` varchar(50) NOT NULL,
`surname` varchar(50) NOT NULL,
`birthday_date` DATE NOT NULL,
`gender` ENUM('M','F','NB') DEFAULT NULL,
PRIMARY KEY (`id`,`user_name`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `group` (
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` varchar(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `post` (
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`user_id` INT NOT NULL,
`parent_post_id` INT DEFAULT NULL,
`text` TEXT NOT NULL,
`post_date_time` DATETIME NOT NULL,
FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
FOREIGN KEY (`parent_post_id`) REFERENCES `post`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `follow` (
`follower_user_id` INT NOT NULL,
`followed_user_id` INT NOT NULL,
`follow_datetime` DATETIME,
PRIMARY KEY (`follower_user_id`,`followed_user_id`),
FOREIGN KEY (`follower_user_id`) REFERENCES `user`(`id`),
FOREIGN KEY (`followed_user_id`) REFERENCES `user`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `feedback` (
`user_id` INT NOT NULL,
`post_id` INT NOT NULL,
`type` ENUM('L','D'),
PRIMARY KEY (`user_id`, `post_id`),
FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
FOREIGN KEY (`post_id`) REFERENCES `post`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `belong` (
`user_id` INT NOT NULL,
`group_id` INT NOT NULL,
PRIMARY KEY (`user_id`, `group_id`),
FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
FOREIGN KEY (`group_id`) REFERENCES `group`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;