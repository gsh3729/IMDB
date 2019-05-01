<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="./assets/css/material-bootstrap-wizard.css"> -->
    <link rel="stylesheet" href="jourstyle.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Journalist</title>
</head>
<body>
<?php 


if ($_SERVER["REQUEST_METHOD"]=="POST"){
    $news = $_POST['News'];
    $Movie_id = $_POST['Movie_id'];
    $Person_id= $_POST['Person_id'];
    $submit =  $_POST['submit'];


    $dnews =  $_POST['dnews'];
    $dsubmit =  $_POST['dsubmit'];

    
  if($news <> null){   
  require("./dbconnection.php");
  

     $sql1 = "INSERT INTO News(News) VALUES ('$news')"; 
     $sql2 = "SELECT News_id FROM News WHERE News = '$news'";
     
     $res1 = $conn->query($sql1);
     $res2 = $conn->query($sql2);

     $row = $res2->fetch_assoc();

     $news_id = $row["News_id"];

     $sql3 = "INSERT INTO NewsonMovie(Movie_id,News_id) VALUES ('$Movie_id','$news_id')";
     $sql4 = "INSERT INTO Posted_by(Person_id,News_id) VALUES ('$Person_id','$news_id')";
     
     $res3 = $conn->query($sql3);
     $res4 = $conn->query($sql4);

?>

    <div class="container">
      <div class="row justify-content-center">
        <h3 style="color: red"><?php echo "News POSTED Successfully";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="jour.php" method="post">
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


  else if($dnews <> null){   
  require("./dbconnection.php");
  
  $sql = "SELECT News_id FROM News WHERE News_id = '$dnews'";
  $res = $conn->query($sql); 

  if($row = $res->fetch_assoc())
  {
     $News_id = $row["News_id"];
     $sql2 = "DELETE FROM News WHERE News_id = '$News_id'";
     $res2 = $conn->query($sql2);  


?>

    <div class="container">
      <div class="row justify-content-center">
        <h3 style="color: red"><?php echo "News DELETED Successfully";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="jour.php" method="post">
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
        <h3 style="color: red"><?php echo "Invalid News Id, Please Try again";?></h3>
      </div>

      <div class="row justify-content-center">
        <form action="jour.php" method="post">
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