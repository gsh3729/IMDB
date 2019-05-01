<!doctype html>
<html lang="en">
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
    <div class="container">
    <form action="logingui.html" method="post">
<div class="float-right">
      <button class="btn btn-dark" type="submit" role="button">Home</button></div></form></div>
    <div class="row py-3 justify-content-center">
      <h3 style="color: white"><pre>              Welcome Journalist</pre></h3></div>
    

    <div class="row justify-content-center">
    <p>
  <a class="btn btn-dark" data-toggle="collapse" href="#e1" role="button" aria-expanded="false" aria-controls="e1">Post News</a>
  <button class="btn btn-dark" type="button" data-toggle="collapse" data-target="#e2" aria-expanded="false" aria-controls="e2">Delete News</button>
  <button class="btn btn-dark" type="button" data-toggle="collapse" data-target="#e3" aria-expanded="false" aria-controls="e3">View Tables</button>
  <button class="btn btn-dark" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="e1 e2 e3">Toggle Content</button>
  </div>
</p>
<div class="row">
  <div class="col">
    <div class="collapse multi-collapse" id="e1">
      <!-- <div class="card card-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
      </div> -->
      <form action="jouraction.php" method = "post">
          <div class="card px-2" style="width: 20rem;height: 18rem;">
            <div class="card-body">
              <h5 class="card-title">POST</h5>
              <h6 class="card-subtitle mb-2 text-muted">Please fill in this form to insert a news</h6>
              <p class="card-text">
                <label for="News"><b>News</b></label>
                <input type="text" placeholder="Enter News" name="News" required>

                <label for="Movie_id"><b>Movie</b></label>
                <input type="number" placeholder="Enter Movie id" name="Movie_id" required>

                <label for="Person_id"><b>Person</b></label>
                <input type="number" placeholder="Enter Person id " name="Person_id" required>
            <hr>
           
            

            <button type="submit" class="btn btn-dark" name = "submit">POST</button></p>
             
            </div>
          </div>

          <!-- <div  class="container">
            <h1 style="color:red;">Insert</h1>
            <h5 style="color:red;">Please fill in this form to insert news</h5>
           

            <label for="song"><b>Song</b></label>
            <input type="text" placeholder="Insert Song" name="song" required>
            <br>
            <label for="Movie_id"><b>Movie</b></label>
            <input type="number" placeholder="Enter Movie id" name="Movie_id" required>
            <br>
            <label for="Person_id"><b>Singer</b></label>
            <input type="number" placeholder="Enter Singer id " name="Person_id" required>
            <hr>
           
            <div class="input-group">             
                          <div class="form-group label-floating">
                               <label style="color:red;" class="control-label"><h5>News</h5></label>
                                   <input name="News" type="text" class="form-control">
                          </div>
           </div>
           <div "class="input-group">             
                          <div class="form-group label-floating">
                               <label style="color:red;" class="control-label"><h5>Movie</h4></label>
                                   <input name="Movie_id" type="number" class="form-control">
                          </div>
           </div>
           <div class="input-group">             
                          <div class="form-group label-floating">
                               <label style="color:red;" class="control-label"><h5>Person</h5></label>
                                   <input name="Person_id" type="number" class="form-control">
                          </div>
           </div>
            

            <input type="submit" class="button" name = "submit" value="INSERT"></input>
            <button class="btn btn-danger" type="button">INSERT</button>
          </div> -->
      </form>

  
    </div>
  </div>
  <div class="col">
    <div class="collapse multi-collapse" id="e2">
      <!-- <div class="card card-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
      </div> -->
      <form action="jouraction.php" method = "post">
        <div class="card px-2" style="width: 20rem; height: 12rem;">
            <div class="card-body">
              <h5 class="card-title">DELETE</h5>
              <h6 class="card-subtitle mb-2 text-muted">Please fill in this form to delete</h6>
              <p class="card-text">
                <label for="News"><b>News</b></label>
                <input type="number" placeholder="News_id" name="dnews" required>
            <hr>
            <button type="submit" class="btn btn-dark" name = "dsubmit">DELETE</button></p>
            </div>
          </div>
        <!-- <div class="container">
          <h1 style="color:red;">Delete</h1>
          <h5 style="color:red;">Please fill in this form to delete news</h5>
          
          <div class="input-group">             
                          <div class="form-group label-floating">
                               <label style="color:red;" class="control-label"><h5>News</h5></label>
                                   <input name="News" type="text" class="form-control">
                          </div>
           </div>

         

          <hr>
          
          <button class="btn btn-danger" type="button">DELETE</button>

          <button type="submit" class="registerbtn" name = "submit">DELETE</button>
        </div>
         -->
      </form>
    </div>
  </div>
  <div class="col">
    <div class="collapse multi-collapse" id="e3">
      <!-- <div class="card card-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
      </div> -->
      <div id = "container">

<?php 


  require("./dbconnection.php");
  $sql1 = "SELECT * FROM MovieNews";
  $sql2 = "SELECT * FROM Movie";
  $sql3 = "SELECT * FROM Person";
  $sql4 = "SELECT * FROM News";
  $res1 = $conn->query($sql1);
  
  $res2 = $conn->query($sql2);
  $res3 = $conn->query($sql3);
  $res4 = $conn->query($sql4);


?>
  <h4 style="color:white;" ><b>News Table</b></h4>

  <table id="News" class="blueTable" style="width:350px"  >
  <tr>
  <th style="background:#323232; color:white">Movie</th>
  <th style="background:#323232; color:white">News</th>
  <th style="background:#323232; color:white">Posted_by</th>

  </tr>

  
  
  <?php

  while ($row = $res1->fetch_assoc() ) {?>
  <tr >
  <td ><?php echo $row["movie"] ?></td>
  <td><?php echo $row["news"]?></td>  
  <td><?php echo $row["name"]?></td>  

  </tr>

  
  <?php
  }
  ?>

  <table id="Movie" class="blueTable" style="width:350px"  >
  <h4 style="color:white;" ><b>Movie Table</b></h4>
  
  <tr>
  <th style="background:#323232; color:white">Id</th>
  <th style="background:#323232; color:white">Movie</th>
  </tr>

  
  
  <?php

  while ($row = $res2->fetch_assoc() ) {?>
  <tr >
  <td><?php echo $row["Movie_id"] ?></td>
  <td><?php echo $row["Title"]?></td>  
  </tr>

  
  <?php
  }
  ?>


  <table id="News"  class="blueTable" style="width:350px"   >
  <h4 style="color:white;" ><b>News Table</b></h4>

  <tr>
  <th style="background:#323232; color:white">Id</th>
  <th style="background:#323232; color:white">News</th>
  </tr>

  
  
  <?php

  while ($row = $res4->fetch_assoc() ) {?>
  <tr >
  <td><?php echo $row["News_id"] ?></td>
  <td><?php echo $row["News"]?></td>  
  </tr>

  
  <?php
  }
  ?>

  <table id="Person"  class="blueTable" style="width:350px"   >
  <h4 style="color:white;" ></b>Person Table</b></h4>

  <tr>
  <th style="background:#323232; color:white">Id</th>
  <th style="background:#323232; color:white">Name</th>
  </tr>

  
  
  <?php

  while ($row = $res3->fetch_assoc() ) {?>
  <tr >
  <td><?php echo $row["Person_id"] ?></td>
  <td><?php echo $row["Name"]?></td>  
  </tr>

  
  <?php
  }
  ?>

</div>

    </div>
  </div>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>