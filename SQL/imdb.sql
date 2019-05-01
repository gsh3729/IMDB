CREATE TABLE  Movie (
    Movie_id INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(20) NOT NULL,
    Language VARCHAR(15) ,
    Genre VARCHAR(10),
    Film_Series VARCHAR(15) DEFAULT NULL,
    Collection INT,
    Rating DECIMAL(2,1),
    Release_Date date,
    RunTime time,
    PRIMARY KEY (Movie_id)
);


CREATE TABLE Person(
    Person_id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(20) NOT NULL,
    PRIMARY KEY (Person_id)
);


CREATE TABLE Critic(
    Critic_id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(20) NOT NULL,
    Company VARCHAR(20),
    PRIMARY KEY (Critic_id)
);

CREATE TABLE People(
    People_id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(20) NOT NULL,
    Account_type VARCHAR(20),
    Purchase_type VARCHAR(20),
    PRIMARY KEY (People_id)
);

CREATE TABLE Comments(
    Comment_id INT NOT NULL AUTO_INCREMENT,
    Comment VARCHAR(100),
    Upvotes  INT,
    Downvotes INT,
    PRIMARY KEY (Comment_id)
);

CREATE TABLE Awards(
    Award_id INT NOT NULL AUTO_INCREMENT,
    Award_name VARCHAR(20),
    PRIMARY KEY (Award_id)
);

CREATE TABLE Cast_crew(
    Cast_crew_id INT NOT NULL,
    Role VARCHAR(20),
    Renumeration INT,
    PRIMARY KEY (Cast_crew_id,Role)
);


CREATE TABLE Songs(
    Song_id INT NOT NULL AUTO_INCREMENT,
    Song_Name VARCHAR(20),
    PRIMARY KEY (Song_id)
);

CREATE TABLE News(
    
    News_id INT NOT NULL AUTO_INCREMENT,
    News VARCHAR(100),
    PRIMARY KEY (News_id)
);


CREATE TABLE Purchased_by (
    People_id INT NOT NULL,
    Movie_id INT  NOT NULL,
    PRIMARY KEY (People_id,Movie_id),
    FOREIGN KEY (People_id) REFERENCES People (People_id) ON DELETE CASCADE,
    FOREIGN KEY (Movie_id) REFERENCES Movie (Movie_id) ON DELETE CASCADE
);

CREATE TABLE Commented_by(
    People_id INT NOT NULL,
    Comment_id INT NOT NULL,
    Movie_id INT NOT NULL,
    PRIMARY KEY (People_id,Movie_id),
    FOREIGN KEY (People_id,Movie_id) REFERENCES Purchased_by(People_id,Movie_id) ON DELETE CASCADE
);

CREATE TABLE Awards_received(
    Award_id INT NOT NULL,
    Movie_id INT NOT NULL,
    PRIMARY KEY (Movie_id,Award_id),
    FOREIGN KEY (Movie_id) REFERENCES Movie (Movie_id) ON DELETE CASCADE,
    FOREIGN KEY (Award_id) REFERENCES Awards (Award_id) ON DELETE CASCADE
);

CREATE TABLE Movie_songs(
    Movie_id INT NOT NULL,
    Song_id INT NOT NULL,
    PRIMARY KEY (Movie_id,Song_id),
    FOREIGN KEY (Song_id) REFERENCES Songs (Song_id) ON DELETE CASCADE,
    FOREIGN KEY (Movie_id) REFERENCES Movie (Movie_id) ON DELETE CASCADE
);

CREATE TABLE Sung_by(
    Song_id INT NOT NULL,
    Person_id INT NOT NULL DEFAULT 0,
    PRIMARY KEY (Song_id),
    FOREIGN KEY (Song_id) REFERENCES Songs (Song_id) ON DELETE CASCADE,
    FOREIGN KEY (Person_id) REFERENCES Person (Person_id) ON DELETE CASCADE
);

CREATE TABLE Role_Playedby(
    Cast_crew_id INT NOT NULL,
    Role VARCHAR(20) NOT NULL,
    Person_id INT NOT NULL DEFAULT 0,
    PRIMARY KEY (Cast_crew_id,Person_id,Role) ,
    FOREIGN KEY (Person_id) REFERENCES Person (Person_id) ON DELETE CASCADE,
    FOREIGN KEY (Cast_crew_id,Role) REFERENCES Cast_crew(Cast_crew_id,Role) ON DELETE CASCADE
);

CREATE TABLE Posted_by(
    News_id INT NOT NULL,
    Person_id INT NOT NULL DEFAULT 0,
    PRIMARY KEY (News_id,Person_id),
    FOREIGN KEY (Person_id) REFERENCES Person(Person_id) ON DELETE CASCADE,
    FOREIGN KEY (News_id) REFERENCES News(News_id) ON DELETE CASCADE
); 

CREATE TABLE NewsonMovie(
    News_id INT NOT NULL,
    Movie_id INT NOT NULL,
    PRIMARY KEY (News_id,Movie_id),
    FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id) ON DELETE CASCADE,
    FOREIGN KEY (News_id) REFERENCES News(News_id) ON DELETE CASCADE
);

CREATE TABLE Reviews_Ratings(
    Review VARCHAR(100) NOT NULL,
    Rating DECIMAL(2,1) NOT NULL,
    Critic_id INT NOT NULL DEFAULT 0,
    Movie_id INT NOT NULL,
    PRIMARY KEY (Critic_id,Movie_id),
    FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id) ON DELETE CASCADE,
    FOREIGN KEY (Critic_id) REFERENCES Critic(Critic_id) ON DELETE CASCADE
);

CREATE TABLE Roles(
    Cast_crew_id INT NOT NULL DEFAULT 0,
    Movie_id INT NOT NULL,
    PRIMARY KEY (Cast_crew_id,Movie_id), 
    FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id) ON DELETE CASCADE,
    FOREIGN KEY (Cast_crew_id) REFERENCES Cast_crew(Cast_crew_id) ON DELETE CASCADE
);


INSERT INTO Movie
    (Movie_id,Title,Language,Genre,Film_series,Collection,Rating,Release_Date,RunTime)
    VALUES
    (1,'Baahubali-1','Telugu','Drama','Baahubali',700,9.4,'2015-07-10','02:35:06'),
    (2,'Baahubali-2','Telugu','Drama','Baahubali',2000,9.7,'2017-04-28','02:42:36'),
    (3,'3-Idiots','Hindi','Comedy','as',400,8.5,'2009-12-25','02:15:25'),
    (4,'Basha','Tamil','Action','',40,7.9,'1995-01-15','03:04:06'),
    (5,'Simhadri','Telugu','Drama','',20,6.5,'2003-07-11','02:49:06'),
    (6,'Magadheera','Telugu','Fantasy','',30,8.2,'2007-05-11','02:24:06')
    
    

INSERT INTO Person
    (Name)
    VALUES
    ('Prabhas'),
    ('Anushka'),
    ('Rajamouli'),
    ('Keeravani'),
    ('NTR'),
    ('deepu'),
    ('kaala bhairava');
    

INSERT INTO Critic
    (Name,Company)
    VALUES
    ('RajeevMasand','RMreviews'),
    ('BARaju','SuperHit'),
    ('RameshBala','Entertainment'),
    ('TaranAdarsh','BollywoodHungama');

INSERT INTO People
    (Name,Account_type)
    VALUES
    ('Sriharsha','Premium'),
    ('VamsiPramod','Premium'),
    ('Sudheer','Gold'),
    ('Patrick','Gold'),
    ('Vinay','Silver');

INSERT INTO Awards
    (Award_name)
    VALUES
    ('FilmFare'),
    ('National'),
    ('Ascar'),
    ('Siima'),
    ('Nandi');

INSERT INTO Songs
    (Song_name)
    VALUES
    ('Deevara'),
    ('SivuniAna'),
    ('Dandalayya');
    
    

INSERT INTO Cast_crew
    (Cast_crew_id,Role)
    VALUES
    (1,'Actor'),
    (1,'Actress'),
    (1,'Director'),
    (1,'Music Director');

INSERT INTO News
    (News_id,News)
    VALUES
    (1,'Our movie has been nominated for oscars'),
    (2,'In the coming summer, We will be releasing Baahubali in Japan');


INSERT INTO Awards_received
    (Movie_id,Award_id)
    VALUES
    (1,1),
    (1,2),
    (2,2);
    
INSERT INTO Movie_songs
    (Movie_id,Song_id)
    VALUES
    (1,1),
    (1,2),
    (2,3);

INSERT INTO Sung_by
    (Song_id,Person_id)
    VALUES
    (1,6),
    (2,4),
    (3,7);

INSERT INTO Role_Playedby
    (Cast_crew_id,Role,Person_id)
    VALUES
    (1,'Actor',1),
    (1,'Actress',2),
    (1,'Director',3),
    (1,'Music Director',4);
    

INSERT INTO Posted_by
    (News_id,Person_id)
    VALUES
    (1,1),
    (2,3);


INSERT INTO NewsonMovie
    (News_id,Movie_id)
    VALUES
    (1,1),
    (2,2);

INSERT INTO Roles
    (Cast_crew_id,Movie_id)
    VALUES
    (1,1),
    (1,2);
    
INSERT INTO Reviews_Ratings
    (Movie_id,Critic_id,Rating,Review)
    VALUES
    (1,1,5,'SS Rajamouli delivered a mindblowing movie to the Indian cinema'),
    (2,1,5,'SS Rajamouli has taken Indian cinema to International level with his movie Baahubali-2. Trade analysts predict that this movie is going to be the first movie to collect 2000crores');


INSERT INTO Purchased_by
    (People_id,Movie_id)
    VALUES
    (1,1),
    (4,2);

INSERT INTO Commented_by
    (People_id,Comment_id,Movie_id)
    VALUES
    (1,1,1),
    (4,2,2);

INSERT INTO Comments
    (Comment_id,Comment,Upvotes,Downvotes)
    VALUES
    (1,'Interesting Movie',3,2),
    (2,'Fascinating Movie',1,1);

SELECT m.Title,p.Name,c.Role 
FROM Movie as m NATURAL JOIN Roles as r NATURAL JOIN Cast_crew as c NATURAL JOIN Role_Playedby as rp
       NATURAL JOIN Person as p
WHERE m.Movie_id = 1;

SELECT  m.Title,cm.Comment,cm.Upvotes
FROM Movie as m NATURAL JOIN Commented_by as c NATURAL JOIN Comments as cm
WHERE cm.Upvotes > 0;

SELECT  

CREATE USER jerry@localhost IDENTIFIED BY 'iamjerry';
GRANT SELECT ON Movie TO tom IDENTIFIED BY 'iamtom';
















