USE upfgram;

/* 
#1
(2,5 punts) Llistar tots els usuaris (user) de cada grup (group), ordenats per
primer nom del grup i després per el nom d’usuari (user_name). Mostrant
el nom del grup i dels usuaris el seu nom d’usuari, nom i cognom.
*/
SELECT g.name, u.user_name, u.name, u.surname
FROM `group` g
JOIN belong b ON b.group_id = g.id
JOIN `user` u ON u.id = b.user_id
ORDER BY g.name ASC, u.name ASC;

/*
#2
(2,5 punts) Crear una vista amb el nom mutualFollowing amb un llistat dels
usuaris (user) que segueixen a altres usuaris i que alhora són seguits per
aquests, és a dir, que la relació de seguiment (follow) sigui mútua com si
fos un match.
La vista resultant només ha de tenir els identificadors i nom d’usuari
(user_name) dels usuaris. Ordeneu el resultat pels identificadors.
*/

DROP VIEW IF EXISTS mutualFollowing;
CREATE VIEW mutualFollowing AS
SELECT f.follower_user_id, u.user_name AS follower_user_name, f.followed_user_id, u2.user_name AS followed_user_name
FROM follow f
JOIN follow f2 ON f.followed_user_id = f2.follower_user_id
JOIN user u ON u.id = f.follower_user_id
JOIN user u2 ON u2.id = f2.follower_user_id
WHERE f.follower_user_id = f2.followed_user_id
ORDER BY follower_user_id ASC, followed_user_id ASC
;

/*
#3
(2,5 punts) Mostra el nom per cada usuari (user) i quants missatges (post)
té a la xarxa. Llista tots els usuaris, tinguin o no missatges. Si no tenen
missatge, el recompte de posts es mostrarà com un 0. Ordena el resultat
mostrant primer aquells usuaris que tinguin més missatges i després pel
nom d’usuari.
*/
SELECT user.user_name, COUNT(post.id) AS Number_Of_Posts FROM post
RIGHT JOIN user ON user.id = post.user_id
GROUP BY user.user_name
ORDER BY Number_Of_Posts DESC, user_name ASC
;

/*
#4
(5 punts) Llistar el seguidor més antic de l’Anna Donoso. Mostreu el nom
d’usuari, nom i cognom del seguidor i la data en que va començar a ser
seguidor.
*/

SELECT u_follower.user_name,u_follower.name, u_follower.surname,f.follow_datetime 
FROM user u 
JOIN follow AS f ON f.followed_user_id = u.id
JOIN user AS u_follower ON f.follower_user_id = u_follower.id
WHERE u.name LIKE ('Anna') AND u.surname LIKE ('Donoso')
ORDER BY follow_datetime ASC LIMIT 1
;
/*
#5
(5 punts) Quins seguidors de l’Angel Gallardo SÓN MAJORS que ell?
Llistar nom, cognom i data de naixement, ordenant per data de naixement
de forma que, els primers resultats siguin els de major edat i els darrers els
més joves.
*/
SELECT u_follower.name, u_follower.surname,u_follower.birthday_date
FROM user u 
JOIN follow AS f ON f.followed_user_id = u.id
JOIN user AS u_follower ON f.follower_user_id = u_follower.id
WHERE u.name LIKE ('Angel') AND u.surname LIKE ('Gallardo') AND u_follower.birthday_date < u.birthday_date
ORDER BY birthday_date ASC 
;
/*
#6
(5 punts) Per a cada usuari a la xarxa, es desitja saber la quantitat de
seguidors que té, separant-los per gènere. El llistat ha de contenir 5
columnes: identificador de l’usuari, nom d’usuari (user_name), quantitat de
seguidors de gènere no binari, quantitat de seguidors de gènere femení i
quantitat de seguidors de gènere masculí. Ordeneu el resultat per nom
d’usuari.
Nota: Investigueu com emprar la funció IF() combinada amb COUNT() de
MySQL sobre atributs per ajudar a resoldre aquesta consulta.
*/
SELECT user.id, user.user_name, 
COUNT(IF(u_follower.gender = 'NB',1,NULL)) 'No_Binary',
COUNT(IF(u_follower.gender = 'F',1,NULL)) 'Females',
COUNT(IF(u_follower.gender = 'M',1,NULL)) 'Males'

FROM follow
RIGHT JOIN user ON user.id = follow.followed_user_id
LEFT JOIN user u_follower ON u_follower.id = follow.follower_user_id
GROUP BY user.id, user.user_name
ORDER BY user_name ASC
;


/*
#7
(10 punts) L’Anna Puigvert vol conèixer les dates d’aniversari dels seus
seguidors per tal de poder-los felicitar arribat el moment. Per això cal
implementar una consulta que donada la data d’avui del sistema (sigui la
que sigui), llisti el nom, cognom i data de naixement dels seus seguidors,
l’aniversari més proper a la data d’avui especificada ha de ser el primer de
la llista i el darrer el més proper a final de l’any. Per tant, només s’han de
mostrar els aniversaris que queden per davant de l’any en curs.
El llistat també ha d’incloure l’edat actual del seguidor.
*/

SELECT u_follower.name, u_follower.surname,u_follower.birthday_date, FLOOR(DATEDIFF(CURDATE(),u_follower.birthday_date)/365) AS Age 
FROM user u 
JOIN follow AS f ON f.followed_user_id = u.id
JOIN user AS u_follower ON f.follower_user_id = u_follower.id
WHERE u.name LIKE ('Anna') AND u.surname LIKE ('Puigvert') AND DAYOFYEAR(u_follower.birthday_date) >= DAYOFYEAR(CURDATE())
ORDER BY follow_datetime ASC
;

/*
#8
(10 punts) Crear una vista que contingui, per a cada missatge, quants
likes i dislikes té. És a dir, una vista amb tres columnes: missatge
(identificador), quantitat de likes i quantitat de dislikes. Si un missatge no té
likes o dislikes, s'ha de mostrar un zero. Ordeneu el resultat per
l’identificador del missatge.
*/

DROP VIEW IF EXISTS postFeedback;
CREATE VIEW postFeedback AS
SELECT p.id, 
COUNT(IF(f.type = 'L',1,NULL)) 'Likes',
COUNT(IF(f.type = 'D',1,NULL)) 'Dislikes' 
FROM post p
LEFT JOIN feedback f ON f.post_id = p.id
GROUP BY p.id
ORDER BY p.id ASC
;

/*
#9
(10 punts) Quins seguidors del Pere Garriga estan als grups als que ell hi
pertany? Doneu el nom i cognom del seguidor sense repetir. Ordeneu els
resultats per nom i després per cognom.
*/

SELECT DISTINCT u.name, u.surname
FROM user u
JOIN belong AS b_follower ON b_follower.user_id = u.id
JOIN `group` AS g ON g.id = b_follower.group_id
RIGHT JOIN follow AS f ON f.follower_user_id = u.id  
RIGHT JOIN user AS u_followed ON u_followed.id = f.followed_user_id
WHERE u_followed.name LIKE ('Pere') AND u_followed.surname LIKE ('Garriga')
ORDER BY u.name ASC, u.surname ASC
;