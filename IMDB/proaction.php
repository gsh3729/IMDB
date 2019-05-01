<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="./assets/css/material-bootstrap-wizard.css"> -->
    <link rel="stylesheet" href="prostyle.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Producer</title>
</head>
<body>
<?php 


if ($_SERVER["REQUEST_METHOD"]=="POST"){
    $role = $_POST['Role'];
    $id = $_POST['id']; 
    $Movie_id = $_POST['Movie_id'];
    $Person_id= $_POST['Person_id'];
    $submit =  $_POST['submit'];
    $Renumeration = $_POST['Renumeration'];


    $uid =  $_POST['uid'];
    $uRole =  $_POST['uRole'];
    $uRen =  $_POST['uRen'];
    
    $dsubmit =  $_POST['usubmit'];

    // echo "Ren : ";
    echo $uRen;
    
  if($role <> null){   
  require("./dbconnection.php");
  
     $sql = "SELECT * FROM Cast_crew WHERE Cast_crew_id = '$id' AND Role = '$role'";
     $res = $conn->query($sql);
     
      if($row = $res->fetch_assoc())
     {

     }
     
     else
     {
        $sql1 = "INSERT INTO Cast_crew(Cast_crew_id,Role,Renumeration) VALUES ('$id','$role','$Renumeration')";     
        $res1 = $conn->query($sql1);
     }
     
     $sql3 = "INSERT INTO Role_Playedby(Cast_crew_id,Role,Person_id) VALUES ('$id','$role','$Person_id')";
     $sql4 = "SELECT * FROM Roles WHERE Cast_crew_id = '$id' AND Movie_id = '$Movie_id'";
     $res3 = $conn->query($sql3);
     $res4 = $conn->query($sql4);     

     if($row = $res4->fetch_assoc())
     {

     }

     else
     {
         $sql5 = "INSERT INTO Roles(Cast_crew_id,Movie_id) VALUES ('$id','$Movie_id')";
         $res5 = $conn->query($sql5); 
     } 
     ?>

    <div class="container">
      <div class="row justify-content-center">
        <h3 style="color: red"><?php echo "Crew Inserted Successfully";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="p.php" method="post">
        <button type="submit" class="btn btn-danger" name = "submit">Go Back</button>
        </form>
      </div>  


    </div>
    <?php
     
     
   


  $conn->close();
  // echo "harsha";
?>
  
    
  
<?php
  }


  else if($uid <> null){   
  require("./dbconnection.php");
  
  $sql = "SELECT * FROM Cast_crew WHERE Cast_crew_id = '$uid' AND Role = '$uRole'";
  $res = $conn->query($sql);

  if($row = $res->fetch_assoc())
  {
     $News_id = $row["News_id"];
     $sql2 = "UPDATE Cast_crew SET Renumeration = '$uRen' WHERE Cast_crew_id = '$uid' AND Role = '$uRole'";
     $res2 = $conn->query($sql2);
     ?>

    <div class="container">
      <div class="row justify-content-center">
        <h3 style="color: red"><?php echo "Updated Successfully";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="p.php" method="post">
        <button type="submit" class="btn btn-danger" name = "submit">Go Back</button>
        </form>
      </div>  


    </div>
    <?php  
        
  }

  else
  {
    ?>

    <div class="container">
      <div class="row justify-content-center">
        <h3 style="color: red"><?php echo "Invalid Id, Please Try again";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="p.php" method="post">
        <button type="submit" class="btn btn-danger" name = "submit">Go Back</button>
        </form>
      </div>  


    </div>
    <?php 
     
  }
  


  $conn->close();
  // echo "harsha";
?> 
<?php
  }



  

}?>
</body>
</html>