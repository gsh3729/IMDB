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