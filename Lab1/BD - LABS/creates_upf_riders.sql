DROP SCHEMA IF EXISTS upf_riders;
CREATE DATABASE IF NOT EXISTS upf_riders;
USE upf_riders;

CREATE TABLE `headquarters` (
  `code` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `postal_address` varchar(200) DEFAULT NULL
  )ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
  
CREATE TABLE `rider` (
  `rider_id` int NOT NULL,
  `name` varchar(50) COLLATE latin1_general_cs DEFAULT NULL,
  `headquarters_code` int DEFAULT NULL,
  PRIMARY KEY (`rider_id`),
  FOREIGN KEY (`headquarters_code`) REFERENCES `headquarters`(`code`)) 
  ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `vehicle_type` (
  `type_id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `description` varchar(50) COLLATE latin1_general_cs DEFAULT NULL,
  `number_of_wheels` int
  ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
  
  CREATE TABLE `vehicle` (
  `ref_number` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `brand` varchar(50) COLLATE latin1_general_cs DEFAULT NULL,
  `model` varchar(50) COLLATE latin1_general_cs DEFAULT NULL,
  `liter_capacity` float DEFAULT NULL,
  `vehicle_type_id` int ,
  FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_type`(`type_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
  
   CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `description` varchar(50) COLLATE latin1_general_cs DEFAULT NULL,
  `parent_category_id` int,
  PRIMARY KEY (`category_id`),
  FOREIGN KEY (`parent_category_id`) REFERENCES `category`(`category_id`)
  )ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
  
   CREATE TABLE `business` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE latin1_general_cs DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `address` int,
  `category_id` int,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`)
  )ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
  
  CREATE TABLE `serve` (
  `business_id` int NOT NULL,
  `headquarters_code` int NOT NULL, 
  `distance` float,
  PRIMARY KEY (`business_id`, `headquarters_code`),
  FOREIGN KEY (`business_id`) REFERENCES `business`(`id`),
  FOREIGN KEY (`headquarters_code`) REFERENCES `headquarters`(`code`)
  )ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
  CREATE TABLE `licensed` (
  `rider_id` int NOT NULL,
  `vehicle_type_id` int NOT NULL, 
  `years_experience` int,
  PRIMARY KEY (`rider_id`, `vehicle_type_id`),
  FOREIGN KEY (`rider_id`) REFERENCES `rider`(`rider_id`),
  FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_type`(`type_id`)
  )ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
  CREATE TABLE `uses` (
  `vehicle_ref_number` int NOT NULL,
  `headquarters_code` int NOT NULL, 
  PRIMARY KEY (`vehicle_ref_number`, `headquarters_code`),
  FOREIGN KEY (`vehicle_ref_number`) REFERENCES `vehicle`(`ref_number`),
  FOREIGN KEY (`headquarters_code`) REFERENCES `headquarters`(`code`)
  )ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  