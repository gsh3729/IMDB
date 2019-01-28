CREATE TABLE  Movie (
	Movie_id VARCHAR(10) NOT NULL, 
	Title VARCHAR(50) NOT NULL,
	Language VARCHAR(20) NOT NULL,
	Genre VARCHAR(20),
	Rating DECIMAL(2,1),
	Film_Series VARCHAR(30) DEFAULT NULL,
	Collection INT,
	RunTime time,
	Release_Date date,
	PRIMARY KEY (Movie_id)
);


CREATE TABLE Person(
	Person_id VARCHAR(10) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	PRIMARY KEY (Person_id)
);


CREATE TABLE Critic(
	Critic_id VARCHAR(10) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Company VARCHAR(50),
	PRIMARY KEY (Critic_id)
);

CREATE TABLE People(
	People_id VARCHAR(10) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Account_type VARCHAR(30),
	Purchase_type VARCHAR(30),
	PRIMARY KEY (People_id)
);

CREATE TABLE Comments(
 	Comment_id VARCHAR(10),
	Comment VARCHAR(200),
	Upvotes  INT,
	Downvotes INT,
	PRIMARY KEY (Comment_id)
);

CREATE TABLE Awards(
	Award_id VARCHAR(10),
	Award_name VARCHAR(50),
	PRIMARY KEY (Award_id)
);

CREATE TABLE Cast_crew(
	Cast_crew_id VARCHAR(10),
	Role VARCHAR(30),
	Renumeration VARCHAR(10),
	PRIMARY KEY (Cast_crew_id,Role)
);


CREATE TABLE Songs(
	Song_id VARCHAR(10),
	Song_Name VARCHAR(50),
	PRIMARY KEY (Song_id)
);

CREATE TABLE News(
	News_id VARCHAR(10),
	News VARCHAR(100),
	PRIMARY KEY (News_id)
);

-----------------------------------------------------------------------------

CREATE TABLE Commented_by(
	Movie_id VARCHAR(10) NOT NULL,
	People_id VARCHAR(10) NOT NULL,
	Comment_id VARCHAR(10),
	PRIMARY KEY (People_id,Movie_id),
	FOREIGN KEY (People_id,Movie_id) REFERENCES Purchased_by(People_id,Movie_id)
);

CREATE TABLE Purchased_by (
	Movie_id VARCHAR(10) NOT NULL,
	People_id VARCHAR(10) NOT NULL,
	PRIMARY KEY (People_id,Movie_id),
	FOREIGN KEY (People_id) REFERENCES People(People_id),
	FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id)
);

CREATE TABLE Awards_received(
	Movie_id VARCHAR(10) NOT NULL,
	Award_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id),
	FOREIGN KEY (Award_id) REFERENCES Awards(Award_id)
);

CREATE TABLE Movie_songs(
	Movie_id VARCHAR(10) NOT NULL,
	Song_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (Song_id) REFERENCES Songs(Song_id),
	FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id)
);

CREATE TABLE Sung_by(
    Person_id VARCHAR(10) NOT NULL,
    Song_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (Song_id) REFERENCES Songs(Song_id),
	FOREIGN KEY (Person_id) REFERENCES Person(Person_id)
);

CREATE TABLE Role_Playedby(
	Person_id VARCHAR(10),
	Cast_crew_id VARCHAR(10),
	Role VARCHAR(30),
	FOREIGN KEY (Person_id) REFERENCES Person(Person_id),
	FOREIGN KEY (Cast_crew_id,Role) REFERENCES Cast_crew(Cast_crew_id,Role)
);

CREATE TABLE Posted_by(
	Person_id VARCHAR(10),
	News_id VARCHAR(10),
	FOREIGN KEY (Person_id) REFERENCES Person(Person_id),
	FOREIGN KEY (News_id) REFERENCES News(News_id)
);

CREATE TABLE NewsonMovie(
	Movie_id VARCHAR(10) NOT NULL,
	News_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id),
	FOREIGN KEY (News_id) REFERENCES News(News_id)
);

CREATE TABLE Reviews_Ratings(
	Movie_id VARCHAR(10) NOT NULL,
	Critic_id VARCHAR(10) NOT NULL,
	Rating DECIMAL(2,1) NOT NULL,
	Review VARCHAR(200) NOT NULL,
	FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id),
	FOREIGN KEY (Critic_id) REFERENCES Critic(Critic_id)
);

CREATE TABLE Roles(
	Movie_id VARCHAR(10) NOT NULL,
	Cast_crew_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id),
	FOREIGN KEY (Cast_crew_id) REFERENCES Cast_crew(Cast_crew_id)
);


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

INSERT INTO Movie
	(Title,Language,Genre,Movie_id,Film_series,Collection,Release_Date)
	VALUES
	('Baahubali-1','Telugu','Periodic','0001','Baahubali',700,'2015-07-10'),
	('Baahubali-2','Telugu','Periodic','0002','Baahubali',2000,'2017-04-28'),
	('3-Idiots','Hindi','Comedy','0003','',400,'2009-12-25'),
	('Petta','Tamil','Action','0004','',40,'2019-01-10'),
	('Simhadri','Telugu','Drama','0005','',20,'2003-07-11'),
	('Magadheera','Telugu','Fantasy','0006','',30,'2007-05-11'),
	('Mankatha','Tamil','Crime','0007','',7,'2007-08-31'),
	('DilwaleDulhaniaLeJayenge','Hindi','Love','0008','',40,'1995-11-19'),
	('Viswasam','Tamil','Drama','0009','',40,'2019-01-10'),
	('Yamadonga','Telugu','Fantasy','0010','',30,'2007-08-15'),
	('Rangastalam','Telugu','Drama','0011','',30,'2018-03-30'),
	('Arya','Telugu','Love','0012','',7,'2004-01-04'),
	('Chatrapathi','Telugu','Drama','0013','',5,'2005-09-30')
	

INSERT INTO Person
	(Person_id,Name)
	VALUES
	('001','Prabhas'),
	('002','Anushka'),
	('003','Rajamouli'),
	('004','Shobhu'),
	('005','Sathyaraj'),
	('006','RamyaKrishna'),
	('007','Keeravani'),
	('008','NTR'),
	('009','Sethupathi'),
	('010','Rajinikanth'),
	('011','Samantha'),
	('012','AlluArjun'),
	('013','Mohanlal'),
	('014','AjithKumar'),
	('015','Vijay'),
	('016','RamCharan'),
	('017','Trisha'),
	('018','AmirKhan'),
	('019','ShahrukhKhan'),
	('020','Simran'),
	('021','Anirudh'),
	('022','RamCharan'),
	('023','Ilayaraja'),
	('024','SalmanKhan'),
	('025','RajkumarHirani'),
	('021','VidhuVinodChopra'),
	('022','KareenaKapoor'),
	('023','KajalAgarwal'),
	('024','DeviSriPrasad'),
	('025','Thaman'),
	('026','Sukumar'),
	('027','BalaChander'),
	('028','ManiRatnam'),
	('029','DilRaju'),
	('030','AlluAravind'),
	('031','SureshBabu'),
	('032','KatrinaKaif')


INSERT INTO Critic
	(Critic_id,Name,Company)
	VALUES
	('001','RajeevMasand','RMreviews'),
	('002','BARaju','SuperHit'),
	('003','RameshBala','Entertainment'),
	('004','TaranAdarsh','BollywoodHungama')

INSERT INTO People
	(People_id,Name)
	VALUES
	('001','Sriharsha'),
	('002','VamsiPramod'),
	('003','Sudheer'),
	('004','Patrick'),
	('005','Vinay')

INSERT INTO Awards
	(Award_id,Award_name)
	VALUES
	('001','FilmFareAward'),
	('002','NationalAward'),
	('003','OscarAward'),
	('004','SiimaAward'),
	('005','NandiAward')

INSERT INTO Songs
	(Song_id,Song_name)
	VALUES
	('001','MamatalaTalli'),
	('002','Dhivara'),
	('003','SivuniAana'),
	('004','SaahoreBaahubali'),
	('005','Dandalayya'),
	('006','OkaPranam'),
	('007','AalIzzWell'),
	('008','ZoobiZoobi'),
	('009','BehtiHawaSa'),
	('010','PettaParak'),
	('011','MassuMaranam'),
	('012','Ullala'),
	('013','Singamalai'),
	('014','NuvvuWhistlesthe'),
	('015','AmmainaNannaina'),
	('016','PanchadhaaraBomma'),
	('017','DheeraDheera'),
	('018','BangaruKodiPitta'),
	('019','MankathaTheme'),
	('020','InkemInkemKavale'),
	('021','RowdyBaby'),
	('022','TujheDekhaTo'),
	('023','RukJaODhil'),
	('024','GharAaja'),
	('025','Malare'),
	('026','Vachinde'),
	('027','ChusiChudangane'),
	('028','Nachore'),
	('029','PakkaLocal'),
	('030','FollowFollow'),
	('031','EnthaSakkagunnave'),
	('032','RangammaMangamma'),
	('033','PareshanuRa'),
	('034','Uppenantha'),
	('035','FeelMyLove'),
	('036','KarigeLoga'),
	('037','NuvvuVastanante'),
	('038','Pandagala'),
	('039','PanchadhaaraBomma')

INSERT INTO Cast_crew
	(Cast_crew_id,Role)
	VALUES
	('001','Actor'),
	('002','Actress'),
	('003','Director'),
	('004','Producer'),
	('005','MusicDirector')

INSERT INTO News
	(News_id,News)
	VALUES
	('001','Our movie has been nominated for oscars'),
	('002','In the coming summer, We will be releasing Baahubali in Japan')

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

INSERT INTO Awards_received
	(Movie_id,Award_id)
	VALUES
	('0001','001'),
	('0002','003'),
	('0003','001')
	
INSERT INTO Movie_songs
	(Movie_id,Song_id)
	VALUES
	('0001','001'),
	('0001','002'),
	('0002','003')

INSERT INTO Sung_by
	(Song_id,Person_id)
	VALUES
	('001','001'),
	('001','001'),
	('002','003')

INSERT INTO Role_Playedby
	(Cast_crew_id,Role,Person_id)
	VALUES
	('001','Actor','001'),
	('003','Director','003')

INSERT INTO Posted_by
	(News_id,Person_id)
	VALUES
	('001','001'),
	('002','003')


INSERT INTO NewsonMovie
	(News_id,Movie_id)
	VALUES
	('001','0001'),
	('002','0003')

INSERT INTO Roles
	(Cast_crew_id,Movie_id)
	VALUES
	('001','0001'),
	('002','0003')
	
INSERT INTO Reviews_Ratings
	(Movie_id,Critic_id,Rating,Review)
	VALUES
	('0001','002',5,'SS Rajamouli delivered a mindblowing movie to the Indian cinema'),
	('0002','004',5,'SS Rajamouli has taken Indian cinema to International level with his movie Baahubali-2. Trade analysts predict that this movie is going to be the first movie to collect 2000crores')


INSERT INTO Purchased_by
	(People_id,Movie_id)
	VALUES
	('001','0001'),
	('002','0003')

INSERT INTO Commented_by
	(People_id,Comment_id,Movie_id)
	VALUES
	('001','001','0001'),
	('002','002','0003')

INSERT INTO Comments
	(Comment_id,Comment,Upvotes,Downvotes)
	VALUES
	('001','Interesting Movie',3,2),
	('002','Boring Movie',1,1);

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
CREATE TABLE Role_Playedby(
	Cast_crew_id VARCHAR(10),
	Person_id VARCHAR(10),
	FOREIGN KEY (Person_id) REFERENCES Person (Person_id),
	FOREIGN KEY (Cast_crew_id) REFERENCES Cast_crew(Cast_crew_id)
);

CREATE TABLE Posted_by(
	News_id VARCHAR(10),
	Person_id VARCHAR(10),
	FOREIGN KEY (Person_id) REFERENCES Person(Person_id),
	FOREIGN KEY (News_id) REFERENCES News(News_id)
);

CREATE TABLE NewsonMovie(
	News_id VARCHAR(10) NOT NULL,
	Movie_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id),
	FOREIGN KEY (News_id) REFERENCES News(News_id)
);
CREATE TABLE Sung_by(
    	Song_id VARCHAR(10) NOT NULL,
    	Person_id VARCHAR(10) NOT NULL,
    	FOREIGN KEY Song_id REFERENCES Songs (Song_id),
	FOREIGN KEY Person_id REFERENCES Person (Person_id)
);


CREATE TABLE Awards_received(
	Award_id VARCHAR(10) NOT NULL,
	Movie_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (Movie_id) REFERENCES Movie (Movie_id),
	FOREIGN KEY (Award_id) REFERENCES Awards (Award_id)
);
CREATE TABLE Movie_songs(
	Movie_id VARCHAR(10) NOT NULL,
	Song_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (Song_id) REFERENCES Songs (Song_id),
	FOREIGN KEY (Movie_id) REFERENCES Movie (Movie_id)
);	

CREATE TABLE News(
	News VARCHAR(100),
	News_id VARCHAR(10),
	PRIMARY KEY (News_id)
);
CREATE TABLE Cast_crew(
	Cast_crew_id VARCHAR(10),
	Role VARCHAR(20),
	Renumeration VARCHAR(10),
	PRIMARY KEY (Cast_crew_id)
);
	

CREATE TABLE Songs(
	Song_id VARCHAR(10),
	Song_Name VARCHAR(20),
	PRIMARY KEY (Song_id)
);

CREATE TABLE Awards(
	Award_name VARCHAR(20),
	Award_id VARCHAR(10),
	PRIMARY KEY (Award_id)
);
	
INSERT INTO Critic
	()
	VALUES
	(),
CREATE TABLE People(
	People_id VARCHAR(10) NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Account_type VARCHAR(20),
	Purchase_type VARCHAR(20),
	PRIMARY KEY (People_id)
);

CREATE TABLE Critic(
	Critic_id VARCHAR(10) NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Company VARCHAR(20),
	PRIMARY KEY (Critic_id)
);
CREATE TABLE Person(
	Person_id VARCHAR(10) NOT NULL,
	Name VARCHAR(20) NOT NULL,
	PRIMARY KEY (Person_id)
);
CREATE TABLE  Movie (
	Title VARCHAR(20) NOT NULL,
	Language VARCHAR(15) NOT NULL,
	Genre VARCHAR(10),
	Movie_id VARCHAR(10) NOT NULL,
	Film_Series VARCHAR(15) DEFAULT NULL,
	Collection INT,
	Rating DECIMAL(2,1),
	Release_Date date,
	RunTime time,
	PRIMARY KEY (Movie_id)
);








##same person multiple roles in a movie
##and diff roles in diff movies











