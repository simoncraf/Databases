USE upfgram;

INSERT IGNORE INTO `user`(id,user_name,`name`,surname,birthday_date,gender)
VALUES (1, 'anna_97','Anna','Puigvert','1997-1-1','F'),
(2, 'm4c0s','Marcos','Cegarra','1950-3-30','M'),
(3,'kathypaty','Kathy','Pedreros','1997-1-1','F'),
(4,'marcel1997','Marcel','Buto','1971-2-25','NB'),
(5, 'pepitalove','Pepa','Aldana','1986-12-25','F'),
(6, 'joa_na','Joana','García','1999-1-19','NB'),
(7, 'xe91ma', 'Xema','Poblete', '1991-10-3',NULL),
(8, 'pedro_pere', 'Pere','Garriga','1985-8-30','M'),
(9, 'tonino','Antoni','Soto','1969-7-25','M'),
(10, 'anna_donoso', 'Anna','Donoso','1998-3-28',NULL),
(11, 'maririra', 'Maria','García','1984-9-8','F'),
(12,'j_garcia_','Josep','Caride','1991-5-14','M'),
(13, 'pepafer', 'Pepa','Fernandez','1990-9-2','F'),
(14, 'marcosse', 'Marcos','Seca','1984-4-17',NULL),
(15, 'ngl_gllrd', 'Angel','Gallardo','1994-5-8', 'M')
;

INSERT IGNORE INTO `group`(id,`name`)
VALUES (1,'Esports'),
(2,'Cinema'),
(3,'Informàtica'),
(4,'Cuina'),
(5,'Hip-Hop'),
(6,'Videojocs'),
(7,'Memes')
;

INSERT IGNORE INTO `post`(id,user_id,post_date_time,parent_post_id,`text`)
VALUES (1,1,'2021-11-28 18:43:33',NULL,'La bretxa salarial a Espanya és del 14,2%. Això vol dir que des d’avui fins a final d’any, les dones espanyoles treballaran de franc'),
(11,15,'2021-11-29 11:03:12',1,'Quina vergonya!!!'),
(2,1,'2021-10-25 21:58:45',NULL,"Si heu d'agafar el cotxe, la bici, la moto, o fins i tot si aneu a peu, fareu bé de posar-vos les ulleres..."),
(12,14,'2021-10-26 18:43:33',2,'però sobretot, obriu els ulls!'),
(3,1,'2021-11-10 11:03:12',NULL,'Rècord de corredores a la Cursa de la Dona amb 34.000 inscrites. Aquest diumenge ompliran Barcelona per una bona causa.'),
(13,13,'2021-11-11 11:03:12',3,'Oleeee! Enhorabona!!'),
(4,7,'2021-09-10 18:43:33',NULL,'Veig el Puigmal des de Barcelona.'),
(14,12,'2021-09-11 21:58:45',4,'Molt bé noi... lol'),
(5,8,'2021-11-01 18:43:33',NULL,"Per mi, la Rambla té un encant que em costa d'explicar. Quan estic fora i torno dic: 'Ja soc a casa'"),
(6,7,'2021-10-03 21:58:45',NULL,'Avui anem al cinema, a saber què veiem'),
(15,11,'2021-10-04 11:03:12',6,'Duneeeeee!!!'),
(16,9,'2021-10-05 21:58:45',6,"no t'adormis!"),
(7,7,'2021-11-19 18:43:33',NULL,'Tercer dia de cinema consecutiu, provaré a no dormir-me en aquesta'),
(17,3,'2021-11-20 21:58:45',NULL,'lol'),
(18,8,'2021-11-21 11:03:12',NULL,'jajaja ànims!'),
(8,8,'2021-11-30 21:58:45',NULL,'Pujant i baixant, quin enrenou!'),
(9,2,'2021-11-09 21:58:45',NULL,'Bon any nou!'),
(19,9,'2021-11-10 11:03:',9,'Bon any!'),
(20,10,'2021-11-11 18:43:33',9,'Bon any a tothom!'),
(10,2,'2021-10-12 21:58:45',NULL,'Quant queda pel nadal?'),
(21,15,'2021-10-13 18:43:33',10,'no saps comptar???'),
(22,10,'2021-10-14 11:03:12',10,'quines ganes...')
;

INSERT IGNORE INTO `follow`()
VALUES (1,2,'2021-11-10 20:30:0'),
(1,3,'2021-11-1 18:43:33'),
(1,5,'2021-11-12 6:51:4'),
(1,8,'2021-11-28 19:15:45'),
(1,10,'2021-9-27 0:21:4'),
(1,12,'2021-12-10 20:30:0'),
(1,15,'2021-10-27 23:41:14'),
(2,1,'2021-12-11 12:21:15'),
(2,3,'2021-11-18 21:18:0'),
(2,6,'2021-11-19 19:15:45'),
(2,7,'2021-10-25 0:21:4'),
(2,8,'2021-12-5 12:21:15'),
(4,1,'2021-10-21 23:41:14'),
(4,12,'2021-11-13 21:18:0'),
(4,13,'2021-11-15 18:43:33'),
(4,15,'2021-11-25 21:18:0'),
(4,5,'2021-11-26 20:30:0'),
(5,1,'2021-10-14 16:54:4'),
(5,6,'2021-10-14 6:51:4'),
(6,1,'2021-11-29 12:21:15'),
(6,9,'2021-11-30 21:18:0'),
(7,1,'2021-12-21 19:15:45'),
(7,2,'2021-12-2 18:43:33'),
(8,6,'2021-12-31 12:21:15'),
(8,11,'2021-12-4 6:51:4'),
(9,1,'2021-12-31 19:15:45'),
(9,11,'2021-12-2 0:21:4'),
(10,1,'2021-12-7 12:21:15'),
(10,4,'2021-12-2 6:51:4'),
(11,6,'2021-12-9 20:30:0'),
(11,7,'2021-10-14 19:15:45'),
(11,9,'2021-12-11 21:18:0'),
(12,10,'2021-12-12 0:21:4'),
(12,11,'2021-12-2 6:51:4'),
(12,13,'2021-12-14 23:41:14'),
(13,12,'2021-11-9 18:43:33'),
(13,2,'2021-12-16 23:41:14'),
(13,7,'2021-12-29 19:15:45'),
(14,7,'2021-12-18 0:21:4'),
(15,9,'2021-12-19 20:30:0'),
(15,8,'2021-12-28 21:18:0'),
(15,10,'2021-12-29 0:21:4')
;

INSERT IGNORE INTO `feedback`(user_id,post_id,`type`)
VALUES (3,1,'L'),
(3,2,'D'),
(3,5,'D'),
(4,1,'D'),
(4,6,'L'),
(5,22,'L'),
(5,12,'L'),
(6,1,'L'),
(6,4,'D'),
(6,7,'L'),
(7,5,'L'),
(7,10,'L'),
(7,11,'L'),
(7,21,'L'),
(8,21,'L'),
(8,4,'L'),
(8,7,'L'),
(9,7,'D'),
(9,5,'D'),
(9,12,'D'),
(10,12,'L'),
(11,13,'L'),
(1,2,'L'),
(1,20,'L'),
(2,5,'L'),
(2,7,'L'),
(15,1,'L'),
(15,12,'L'),
(15,15,'D'),
(15,20,'L'),
(15,19,'L')
;

INSERT IGNORE INTO `belong`(user_id,group_id)
VALUES (1,2),
(1,4),
(1,5),
(2,1),
(3,7),
(3,1),
(4,1),
(4,3),
(4,6),
(4,7),
(5,5),
(6,2),
(6,7),
(7,7),
(7,6),
(7,3),
(8,1),
(8,2),
(8,3),
(8,6),
(8,7),
(9,7),
(9,6),
(10,1),
(10,3),
(10,5),
(11,6),
(12,6),
(12,1),
(13,3),
(13,4),
(14,4),
(15,1),
(15,4)
;