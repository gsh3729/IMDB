<!DOCTYPE html>
<html>
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
<?php
//php starts
require("./dbconnection.php");

$sql = "select * from Movie";
$result = $conn -> query($sql);


if($result->num_rows > 0){
//php ends
?>



<table id="customers">
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
//php start
    while ($row = $result->fetch_assoc()) {?>
        <tr>
        <td><?php echo $row["Title"]?></td>
        <td><?php echo $row["Language"] ?></td>
        <td><?php echo $row["Genre"] ?></td>
        <td><?php echo $row["Movie_id"] ?></td>
        <td><?php echo $row["Film_Series"] ?></td>
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
</table>




</html>
