<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="./assets/css/material-bootstrap-wizard.css"> -->
    <link rel="stylesheet" href="cricstyle.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Critic</title>
</head>
<body>
<?php 


if ($_SERVER["REQUEST_METHOD"]=="POST"){

    require("./dbconnection.php");
    $Movie_id = $_POST['Movie_id'];
    $Award_id= $_POST['Award_id'];
    $submit =  $_POST['submit'];


    $Rmovie_id = $_POST['Rmovie_id'];
    $Critic_id= $_POST['Critic_id'];
    $Rating =  $_POST['Rating'];
    $Review =  $_POST['Review'];

    $rsubmit =  $_POST['rsubmit'];
 
  if($Movie_id <> null){   
  
  
  $sql = "SELECT * FROM Awards WHERE Award_id = '$Award_id'";
  $res = $conn->query($sql); 
  
  if($row = $res->fetch_assoc() )
  {
     $sql1 = "INSERT INTO Awards_received(Award_id,Movie_id) VALUES ('$Award_id','$Movie_id')"; 
     $res1 = $conn->query($sql1);  
     ?>

    <div class="container">
      <div class="row justify-content-center">
        <h3 style="color: red"><?php echo "Award Granted Successfully";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="critic.php" method="post">
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
        <h3 style="color: red"><?php echo "Invalid Award id, Please Try again";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="critic.php" method="post">
        <button type="submit" class="btn btn-danger" name = "submit">Go Back</button>
        </form>
      </div>  


    </div>
    <?php
     
  }

  }


  
  else if($Rmovie_id <> null)
  {
     $sql1 = "INSERT INTO Reviews_Ratings(Movie_id,Critic_id,Review,Ratings) VALUES ('$Rmovie_id','$Critic_id','$Review','$Rating')";    
    
     $res1 = $conn->query($sql1);

        
     echo $song_id;
     ?>

    <div class="container">
      <div class="row justify-content-center">
        <h3 style="color: red"><?php echo "Review Rating Inserted Successfully";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="critic.php" method="post">
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
  }?>
</body>
</html>