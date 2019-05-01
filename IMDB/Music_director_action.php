<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="./assets/css/material-bootstrap-wizard.css"> -->
    <link rel="stylesheet" href="mdstyle.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Music Director</title>
</head>
<body>
<?php 


if ($_SERVER["REQUEST_METHOD"]=="POST"){
    $song = $_POST['song'];
    $Movie_id = $_POST['Movie_id'];
    $Person_id= $_POST['Person_id'];
    $submit =  $_POST['submit'];


    $dsong =  $_POST['dsong'];
    $dsubmit =  $_POST['dsubmit'];
    echo $song;
    echo $Movie_id;
    echo $Person_id;
    echo $submit;

    echo $dsong;
    echo $dsubmit;

  if($song <> null){   
  require("./dbconnection.php");
  
  $sql = "SELECT * FROM Songs WHERE Song_Name = '$song'";
  $res = $conn->query($sql); 
  
  if($row = $res->fetch_assoc() )
  {
    ?>

    <div class="container">
      <div class="row justify-content-center">
        <h3><?php echo " Song Already exists in Database, Try Inserting a New one";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="vis.php" method="post">
        <button type="submit" class="btn btn-danger" name = "submit">Go Back</button>
        </form>
      </div>  


    </div>


    
     
    <?php 
  }
  else
  {
     $sql1 = "INSERT INTO Songs(Song_Name) VALUES ('$song')"; 
     $sql2 = "SELECT Song_id FROM Songs WHERE Song_Name = '$song'";
     
     $res1 = $conn->query($sql1);
     $res2 = $conn->query($sql2);

     $row = $res2->fetch_assoc();

     $song_id = $row["Song_id"];

     $sql3 = "INSERT INTO Movie_songs(Movie_id,Song_id) VALUES ('$Movie_id','$song_id')";
     $sql4 = "INSERT INTO Sung_by(Person_id,Song_id) VALUES ('$Person_id','$song_id')";
     
     $res3 = $conn->query($sql3);
     $res4 = $conn->query($sql4);

     
     echo $song_id;

     ?>
     <div class="container">
      <div class="row justify-content-center">
        <h3><?php echo " Song INSERTED Successfully";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="vis.php" method="post">
        <button type="submit" class="btn btn-danger" name = "submit">Go Back</button>
        </form>
      </div>  


    </div> <?php
     
  }
  


  $conn->close();
  // echo "harsha";
?>
  
    
  
<?php
  }


  else if($dsong <> null){   
  require("./dbconnection.php");
  
  $sql = "SELECT Song_id FROM Songs WHERE Song_Name = '$dsong'";
  $res = $conn->query($sql); 
  
  if($row = $res->fetch_assoc())
  {
     $song_id = $row["Song_id"];
     $sql2 = "DELETE FROM Songs WHERE Song_id = '$song_id'";
     $res2 = $conn->query($sql2);
     // $row = $res2->fetch_assoc();

    ?>
     <div class="container">
        <div class="row justify-content-center">
          <h3><?php echo "Song DELETED Successfully";?></h3>
        </div>

        <div class="row justify-content-center">
          <form action="vis.php" method="post">
          <button type="submit" class="btn btn-danger" name ="submit">Go Back</button>
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
        <h3><?php echo "Song Does not exist in the Database";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="vis.php" method="post">
        <button type="submit" class="btn btn-danger" name = "submit">Go Back</button>
        </form>
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