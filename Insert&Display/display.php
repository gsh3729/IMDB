<!DOCTYPE html>
<html>

<?php
//php starts
require("./dbconnection.php");

$sql = "select * from Movie";
$result = $conn -> query($sql);


if($result->num_rows > 0){
//php ends
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
</table>




</html>
