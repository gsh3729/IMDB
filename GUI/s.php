<!DOCTYPE html>
<html>
<style>
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
<body>

<br/>
<div id= "container">
	<div id ="left" style="float:left;width:50%;">
	<form action="s.php" method="post">
	    Movie_Name: <br><input type="text" name = "field1" /><br/>   
	    Submit    : <br><input type="submit" name = "submit" value = "submit" />
	</form>
	</div>
	<div id="right" style="float:right;width:25%;">
	<a href="display.php" class="button">Show Movies</a>
	</div>
</div>

<div id= "container">
	<div id ="left" style="float:left;width:50%;">
	<form action="s.php" method="post">
	    Hero: <br><input type="text" name = "hero" /><br/>
      	    Heroine: <br><input type="text" name = "heroine" /><br/>   
	    Director: <br><input type="text" name = "director" /><br/>
	    Heroine: <br><input type="submit" name = "submit" value = "submit" />
	</form>

</div>



<div id = "container">

<?php 
require("./dbconnection.php");

if ($_SERVER["REQUEST_METHOD"]=="POST"){
   	$field1 = $_POST['field1'];

	if($field1 <> null && $_POST['submit']<>null ){   
	$sql1 = "SELECT * FROM Movie WHERE Title= '$field1'";
   	$result = $conn->query($sql1);?>
	<table id="customers" >
	<tr>
	<th>Title</th>
	<th>Language</th>
	<th>Genre</th>
	<th>Movie_id</th>
	<th>Film_series</th>
	<th>Collection</th>
	<th>Release_Date</th>
	</tr>

	
	
	<?php

	while ($row = $result->fetch_assoc() ) {?>
	<tr >
	<td><?php echo $row["Title"]?></td>
	<td><?php echo $row["Language"] ?></td>
	<td><?php echo $row["Genre"] ?></td>
	<td><?php echo $row["Movie_id"] ?></td>
	<td><?php echo $row["Film_series"] ?></td>
	<td><?php echo $row["Collection"] ?></td>
	<td><?php echo $row["Release_Date"] ?></td>
	</tr>
	<?php
	}
	?>
	
	
<?php
	}

	

}?>



<?php

$conn->close();
?>







</div>
</body>
</html>
