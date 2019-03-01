CREATE ROLE 'Movie_Owner';
CREATE ROLE 'Producer';
CREATE ROLE 'Music_Director';
CREATE ROLE 'Journalist';
CREATE ROLE 'Grant_Award';

GRANT SELECT ON SeePurchasers TO 'Movie_Owner';

GRANT SELECT,INSERT,DELETE ON Songs,Sung_by TO 'Music_Director';

GRANT SELECT,INSERT,DELETE,UPDATE ON News,Posted_by,NewsonMovie TO 'Journalist';

GRANT SELECT,INSERT,DELETE ON Awards_received TO 'Grant_Award';

GRANT SELECT,INSERT,DELETE ON Cast_crew TO 'Producer';

CREATE VIEW SeePurchasers as
SELECT t1.Title, COUNT(*) as No_of_Purchases
FROM Movie as t1 NATURAL JOIN Purchased_by as t2 NATURAL JOIN People as t3
GROUP BY t1.Movie_id;

CREATE VIEW MovieSongs as
SELECT t1.Title,t3.Song_name
FROM Movie as t1 NATURAL JOIN Movie_songs as t2 NATURAL JOIN Songs as t3;


CREATE VIEW MovieActors as
SELECT t1.Title,t5.Name
FROM Movie as t1 NATURAL JOIN Roles as t2 NATURAL JOIN Cast_crew as t3 
     NATURAL JOIN Role_Playedby as t4 NATURAL JOIN Person as t5
WHERE t3.Role ='Actor';


DELIMITER $$
CREATE TRIGGER SongTrigger
AFTER INSERT ON Movie
FOR EACH ROW 
BEGIN
     SELECT CONCAT(NEW.Title,"Bgm") as 'Bgm';
     SELECT CONCAT(NEW.Title,"Theme") as 'Theme'; 
     INSERT INTO Songs(Song_id,Song_name) VALUES
         ('101','Bgm');
END$$
DELIMITER $$


DELIMITER $$
CREATE TRIGGER RatingTrigger
AFTER INSERT ON Reviews_Ratings
FOR EACH ROW 
BEGIN
     UPDATE Movie
     SET Rating = (SELECT AVG(Rating) FROM Reviews_Ratings 
                    WHERE Movie_id = NEW.Movie_id
                    GROUP BY Movie_id)
     WHERE Movie_id = NEW.Movie_id;
END$$
DELIMITER $$

INSERT INTO Reviews_Ratings (Movie_id,Critic_id,Rating) VALUES
('0001','001',4.0)

CREATE USER 'tom'@'localhost' IDENTIFIED BY '1231';
GRANT 'Movie_Owner' to 'tom'@'localhost';
GRANT 'Music_Director','Producer','Journalist','Grant_Award' to 'tom'@'localhost';


