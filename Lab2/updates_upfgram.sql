USE upfgram;

# 1. 
ALTER TABLE post 
ADD first_reply_datetime datetime,
ADD last_reply_datetime datetime,
ADD nb_replies int NOT NULL,
ADD nb_likes int NOT NULL,
ADD nb_dislikes int NOT NULL;

#2. 2. (9 punts) Crear un procediment anomenat postUpdateRepliesInfo que actualitzi tots 
# els camps acabats d’afegir ( first_reply_datetime, last_reply_datetime, nb_replies ), 
# tenint en compte els registres existents a la base de dades, és a dir, que per a cada missatge (post) 
# actualitzi la data del primer missatge que es va escriure com a resposta, la data del darrer missatge 
# que es va escriure com a resposta i el número de respostes que ha tingut el missatge en total.
# Comproveu el resultat de l’execució del procediment.

DROP procedure IF EXISTS postUpdateRepliesInfo;
DELIMITER //
CREATE PROCEDURE postUpdateRepliesInfo()
BEGIN
	UPDATE post,
    (
    SELECT p.id, p.text, 
	MAX(p2.post_date_time) AS oldest_post, 
	MIN(p2.post_date_time) AS newest_post,
	COUNT(IF(p.id = p2.parent_post_id,1,NULL)) 'Replies' 
	from post p 
	JOIN post p2 ON p.id = p2.parent_post_id
	GROUP BY p.id
    ) AS rep
    SET
    post.first_reply_datetime = rep.oldest_post,
    post.last_reply_datetime = rep.newest_post,
    post.nb_replies = rep.replies
    WHERE post.id = rep.id
    ;
END //
DELIMITER ;
CALL postUpdateRepliesInfo(); #Call the procedure
SELECT * FROM post; #Check if it worked

DROP TRIGGER IF EXISTS updatePostFeedbackInfo;
DELIMITER //;
CREATE TRIGGER updatePostFeedbackInfo AFTER UPDATE ON feedback
	FOR EACH ROW
    
		IF (SELECT COUNT(IF(type='L',1,NULL)) FROM feedback) = 0 OR (SELECT COUNT(IF(type='D',1,NULL)) FROM feedback) = 0 THEN 
			IF (SELECT type FROM feedback) = 'L' THEN
				INSERT INTO post(anb_likes) VALUES (1); 
			ELSE 
				INSERT INTO post(nb_likes) VALUES (1);
			END IF;

        ELSE 
			IF (SELECT type FROM feebback) = 'L' THEN
				UPDATE post SET nb_likes = nb_likes + 1;
			ELSE 
				UPDATE post SET anb_likes = anb_likes + 1;
			END IF;
		END IF;
// DELIMITER;

INSERT INTO feedback(user_id, post_id, type) VALUES (2,15,'L');