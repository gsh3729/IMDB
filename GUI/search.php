<!DOCTYPE html>
<html>
<body>

<br/>
<form action="insert.php" method="post">
    Movie_Name: <input type="text" name = "field1" /><br/>   
    submit : <input type="submit" name = "submit" value = "submit" />
</form>


<?php 
require("./dbconnection.php");

if ($_SERVER["REQUEST_METHOD"]=="POST"){
   $field1 = $_POST['field1'];
} 
if($field1 <> null){   
	$sql1 = "SELECT * FROM Movie WHERE Title = '$field1'";
   	$result = $conn->query($sql1);
}

?>

<table >
<tr>
<th>Title</th>
<th>Language</th>
<th>Genre</th>
<th>Movie_id</th>
<th>Film_series</th>
<th>Collection</th>
<th>Release_Date</th>
</tr>

<?php $row = $result->fetch_assoc() ; ?>
	<tr>
	<td><?php echo $row["Title"]?></td>
	<td><?php echo $row["Language"] ?></td>
	<td><?php echo $row["Genre"] ?></td>
	<td><?php echo $row["Movie_id"] ?></td>
	<td><?php echo $row["Film_series"] ?></td>
	<td><?php echo $row["Collection"] ?></td>
	<td><?php echo $row["Release_Date"] ?></td>
	</tr>

<?php
//php start
    while ($row = $result->fetch_assoc()) {?>
        <tr>
        <td><?php echo $row["Title"]?></td>
        <td><?php echo $row["Language"] ?></td>
        <td><?php echo $row["Genre"] ?></td>
        <td><?php echo $row["wallet"] ?></td>
        <td><?php echo $row["Movie_id"] ?></td>
        <td><?php echo $row["Film_series"] ?></td>
        <td><?php echo $row["Collection"] ?></td>
        <td><?php echo $row["Release_Date"] ?></td>
        </tr>
	<?php
    }
} else{
    echo "<h3>Table is empty</h3>";
}


   $conn->close();

?>

</body>
</html>
