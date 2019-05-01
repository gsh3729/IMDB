<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="cardstyle.css">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>


<?php 
require("./dbconnection.php");

if ($_SERVER["REQUEST_METHOD"]=="POST"){
    $movie = $_POST['movie'];
    $actor = $_POST['actor'];
    $actress = $_POST['actress'];
    $director = $_POST['director'];
    $genre = $_POST['genre'];

    $smovie =  $_POST['smovie'];
    $singer = $_POST['singer'];

    // echo "<br>";
    // echo $movie;
    // echo "<br>";
    // echo $actor;
    // echo "<br>";
    // echo $actress;
    // echo "<br>";
    // echo $director;
    // echo "<br>";
    // echo $genre;
    // echo "<br>";
    // echo $smovie;
    // echo "<br>";
    // echo $singer;
    // echo "<br>";
    
    if($actor == null)
    {
        $actor = '';
    }

    if($movie == null)
    {
        $movie = '';
    }

    if($actress == null)
    {
        $actress = '';
    }

    if($director == null)
    {
        $director = '';
    }

    if($genre == null)
    {
        $genre = '';
    }

     if($smovie == null)
    {
        $genre = '';
    }

    if($singer == null)
    {
        $genre = '';
    }



  if($_POST['submit']<>null ){   
  $sql1 = "CALL movie_search('$movie','$genre','$actor','$actress','$director')";
  
  $result = $conn->query($sql1);

  ?>
 <!--  <table class="blueTable" >
  <tr>
  <th>Title</th>
  <th>Language</th>
  <th>Genre</th>
  <th>Rating</th>
  </tr> -->
<h4 class="text-warning"><p class="text-center" >Search Movie Results</p></h4>
  <div class="row mt-5">
  <!-- <h4><p class="text-center">Search Results</p></h4> -->
  <?php

  while ($row = $result->fetch_assoc() ) {?>

<div class="col-md-4 mb-3 px-5" >
  <div class="card" style="width: 18rem;">
    <img class="card-img-top" src="./assets/img/avatar.jpg" alt="Card image cap" width="250" height="160">
    <div class="card-body py-2">
      <b><p class="card-text"><?php echo $row["Title"]?></p></b>
    </div>
    <ul class="list-group list-group-flush">
    <li class="list-group-item py-1">Language:<?php echo $row["Language"] ?></li>
    <li class="list-group-item py-1">Genre:<?php echo $row["Genre"] ?></li>
    <li class="list-group-item py-1">Rating:<?php echo $row["Rating"] ?></li>
    </ul>
  </div>

</div>





<!-- 
  <tr >
  <td><?php echo $row["Title"]?></td>
  <td><?php echo $row["Language"] ?></td>
  <td><?php echo $row["Genre"] ?></td>
  <td><?php echo $row["Rating"] ?></td>
  
  </tr> -->
  <?php
  }
  //while end?> 
  </div>
  
<?php
  }  //if movie end

  else if($_POST['ssubmit']<>null ){   
  
  $sql2 = "CALL song_search('$smovie','$singer')";
  
  $result = $conn->query($sql2);

  ?>
  <!-- <table  >
  <tr>
  <th>Song Name</th>
  <th>Singer</th>
 
  </tr> -->

<h4><p class="text-center">Songs list</p></h4>
  <div class="row mt-5">
  
  <?php

  while ($row = $result->fetch_assoc() ) {?>

<div class="col-md-4 mb-3 px-5" >
  <div class="card" style="width: 18rem;">
    <img class="card-img-top" src="./assets/img/avatar.jpg" alt="Card image cap" width="286" height="180">
    <div class="card-body py-2">
      <h6><p class="card-text "><?php echo $row["Movie"]?></p></h6>
    </div>
    <ul class="list-group list-group-flush">
    <li class="list-group-item py-1">Song:<?php echo $row["Song"] ?></li>
    <li class="list-group-item py-1">Singer:<?php echo $row["Singer"] ?></li>

    
  </ul>
  </div>

</div>

 <!--  <tr >
  <td><?php echo $row["Song"]?></td>
  <td><?php echo $row["Singer"] ?></td>
 
  </tr> -->
  <?php
  }
  //while end?> 
  </div>
  
<?php
  }  //if movie 



  

  

} //if post end
 ?> 



<?php

$conn->close();
?>
