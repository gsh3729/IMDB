<?php
$servermame = "localhost";
$username = "root";
$password = "8757";
$dbname = 'imdb';



//create connection
$conn = new mysqli($servername, $username, $password, $dbname);

if($conn->connect_error){
	die("connection failed:".$conn->connect_error);
}else{
	echo "IMDB database connected successfully";
}

/*
$sql2 ="SELECT * FROM Movie";

$sql1 = "INSERT INTO Movie
	(Title,Language,Genre,Movie_id,Film_series,Collection,Release_Date)
	VALUES
	('Robo','Tamil','Fiction','0014','Robo',240,'2010-10-01')";

if($conn->query($sql2)== TRUE){
	echo "New Movie record created successfully";
} else{
	echo "Error:".$sql."<br>".$conn->error;
}*/



?>
