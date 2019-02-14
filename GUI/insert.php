<!DOCTYPE html>
<html>
<body>

<br/>
<form action="insert.php" method="post">
    Title: <input type="text" name = "field1" /><br/>
    Language: <input type="text" name = "field2" /><br/>
    Genre: <input type="text" name = "field3" /><br/>
    Movie_id: <input type="text" name = "field4" /><br/>
    Film_series: <input type="text" name = "field5" /><br/>
    Collection: <input type="number" name = "field6" /><br/>
 
    submit : <input type="submit" name = "submit" value = "submit" />
</form>


<?php 
require("./dbconnection.php");
if ($_SERVER["REQUEST_METHOD"]=="POST"){
   $field1 = $_POST['field1'];
   $field2 = $_POST['field2'];
	$field3 = $_POST['field3'];
	$field4 = $_POST['field4'];
	$field5 = $_POST['field5'];
	$field6 = $_POST['field6'];
} 
if($field4 <> null){   
$sql1 = "INSERT INTO Movie (Title,Language,Genre,Movie_id,Film_series,Collection)
           VALUES ('$field1','$field2','$field3','$field4','$field5','$field6')";
  
   $conn->query($sql1);
}
   $conn->close();

?>

</body>
</html>
