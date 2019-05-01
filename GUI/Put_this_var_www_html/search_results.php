<!DOCTYPE html>
<html>
<!-- <style>
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
 -->



<?php 
require("./dbconnection.php");

if ($_SERVER["REQUEST_METHOD"]=="POST"){
   	$movie = $_POST['movie'];
    $actor = $_POST['actor'];
    $actress = $_POST['actress'];
    $director = $_POST['director'];
    $genre = $_POST['genre'];
    echo "<br>";
    echo $movie;
    echo "<br>";
    echo $actor;
    echo "<br>";
    echo $actress;
    echo "<br>";
    echo $director;
    echo "<br>";
    echo $genre;
    echo "<br>";
    
    if($actor == null)
    {
        $actor = '';
    }

    if($movie == null)
    {
        $movie = '';
    }

    if($actress == null)
    {
        $actress = '';
    }

    if($director == null)
    {
        $director = '';
    }

    if($genre == null)
    {
        $genre = '';
    }


	if($_POST['submit']<>null ){   
	$sql1 = "CALL movie_search('$movie','$genre','$actor','$actress','$director')";
  
  $result = $conn->query($sql1);

  ?>
	<table  >
	<tr>
	<th>Title</th>
	<th>Language</th>
	<th>Genre</th>
	<th>Rating</th>
	</tr>

	
	
	<?php

	while ($row = $result->fetch_assoc() ) {?>
	<tr >
	<td><?php echo $row["Title"]?></td>
	<td><?php echo $row["Language"] ?></td>
	<td><?php echo $row["Genre"] ?></td>
	<td><?php echo $row["Rating"] ?></td>
	
	</tr>
	<?php
	}
	//while end?> 
	
	
<?php
	}  //if movie end



  

	

} //if post end
 ?> 



<?php

$conn->close();
?>
