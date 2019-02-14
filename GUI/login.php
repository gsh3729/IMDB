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
	<th>Film_series</th>
	<th>Collection</th>
	<th>Rating</th>
	<th>Release_Date</th>
	<th>Run Time</th>
	</tr>

	
	
	<?php

	while ($row = $result->fetch_assoc() ) {?>
	<tr >
	<td><?php echo $row["Title"]?></td>
	<td><?php echo $row["Language"] ?></td>
	<td><?php echo $row["Genre"] ?></td>
	<td><?php echo $row["Film_series"] ?></td>
	<td><?php echo $row["Collection"] ?></td>
	<td><?php echo $row["Rating"] ?></td>
	<td><?php echo $row["Release_Date"] ?></td>
	<td><?php echo $row["RunTime"] ?></td>
	
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
