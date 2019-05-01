
DELIMITER $$
 
CREATE FUNCTION No_of_HighRatedMovies(rating decimal(2,1)) RETURNS INT RETURN 
    (SELECT COUNT(*) FROM (SELECT Rating FROM Movie WHERE Movie.Rating >= rating) as t);



CREATE FUNCTION No_of_Awards(Movie_id INT) RETURNS INT RETURN 
    (SELECT COUNT(*) FROM Awards_received WHERE Awards_received.Movie_id = Movie_id GROUP BY Movie_id);


CREATE FUNCTION No_of_People_Purchased_a_Movie(Movie_id INT) RETURNS INT RETURN 
    (SELECT COUNT(*) FROM Purchased_by WHERE Purchased_by.Movie_id = Movie_id GROUP BY Movie_id);


CREATE PROCEDURE SelectAllCustomers (in type VARCHAR(20))
BEGIN 
   SELECT name,Account_type FROM People WHERE People.Account_type = type;
END


CREATE PROCEDURE SelectAllCustomers (in type VARCHAR(20))
BEGIN 
   SELECT name,Account_type FROM People WHERE People.Account_type = type;
END

CREATE PROCEDURE Checkvotes ( ) modifies sql data
BEGIN 
   UPDATE Comments 
   SET Downvotes = 0 WHERE Downvotes < 0;
END

CREATE PROCEDURE updateCollections( ) modifies sql data
BEGIN 
   UPDATE Movie 
   SET Collection = Collection + (Collection/10) WHERE Rating >= 9;
END




CREATE FUNCTION Movie_Search
 (
     @movie AS VARCHAR(20)
 )
RETURNS TABLE
AS
RETURN
        SELECT * FROM Movie
        
CREATE PROCEDURE display_movie_details(in movie VARCHAR(20))
BEGIN
   SELECT t1.Title,t3.Role,t5.Name FROM Movie as t1 NATURAL JOIN Roles as t2 NATURAL JOIN Cast_crew as t3 NATURAL JOIN Role_Playedby as t4 NATURAL JOIN Person as t5 WHERE t1.Title = Movie;
END

CREATE PROCEDURE movie_search(in movie VARCHAR(20),in genre VARCHAR(10),in actor VARCHAR(20),in actress VARCHAR(20),in director VARCHAR(20))
BEGIN
   SELECT DISTINCT T as Title,L as Language,G as Genre,R as Rating
   FROM 
         (SELECT * 
          FROM (SELECT t11.Title as T,t11.Language as L,t11.Genre as G,t11.Rating as R,t13.Role as r1,t15.Name as n1 FROM Movie as t11 NATURAL JOIN Roles as t12 NATURAL JOIN Cast_crew as t13 NATURAL JOIN Role_Playedby as t14 NATURAL JOIN Person as t15) as z1
          CROSS JOIN (SELECT t23.Role as r2,t25.Name as n2 FROM Movie as t21 NATURAL JOIN Roles as t22 NATURAL JOIN Cast_crew as t23 NATURAL JOIN Role_Playedby as t24 NATURAL JOIN Person as t25) as z2
          CROSS JOIN (SELECT t33.Role as r3 ,t35.Name as n3 FROM Movie as t31 NATURAL JOIN Roles as t32 NATURAL JOIN Cast_crew as t33 NATURAL JOIN Role_Playedby as t34 NATURAL JOIN Person as t35) as z3) as z
   WHERE (T = movie OR movie = '') AND
         (G = genre OR genre = '') AND
         ((r1 = 'Actor' AND n1 = actor) OR actor = '') AND
         ((r2 = 'Actress' AND n2 = actress) OR actress = '') AND
         ((r3 = 'Director' AND n3 = director) OR director = '');
END

