<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/css/material-bootstrap-wizard.css">
    <link rel="stylesheet" href="cricstyle.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Critic</title>
  </head>
  <body>
       <div class="container">
    <form action="logingui.html" method="post">
<div class="float-right">
      <button class="btn btn-success" type="submit" role="button">Home</button></div></form></div>
    <div class="row py-3 justify-content-center">
      <h3 ><pre>              Welcome Journalist</pre></h3></div>
    <!-- 
    <div class="row py-3 justify-content-center">
      <h3>Welcome Critic</h3></div>
 -->
    <div class="row justify-content-center">
    <p>
  <a class="btn btn-success" data-toggle="collapse" href="#e1" role="button" aria-expanded="false" aria-controls="e1">GRANT Award</a>
  <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#e2" aria-expanded="false" aria-controls="e2">GIVE RATING</button>
  <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#e3" aria-expanded="false" aria-controls="e3">View Tables</button>
  <button class="btn btn-success" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="e1 e2 e3">Toggle Content</button>
  </div>
</p>
<div class="row">
  <div class="col">
    <div class="collapse multi-collapse" id="e1">
      <!-- <div class="card card-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
      </div> -->
      <form action="critaction.php" method = "post">
          <div class="card px-2" style="width: 22rem; height: 16rem">
            <div class="card-body">
              <h5 class="card-title">GRANT</h5>
              <h6 class="card-subtitle mb-2 text-muted">Please fill in this form to grant an award</h6>
              <p class="card-text">
                <label for="song"><b>Movie_Id</b></label>
            <input type="number" placeholder="Enter Movie id" name="Movie_id" required>
            <br>
            <label for="Movie_id"><b>Award_id</b></label>
            <input type="number" placeholder="Enter Award id" name="Award_id" required>
            <br>
            <hr>
           
            

            <button type="submit" class="btn btn-success" name = "submit">GRANT</button></p>
             
            </div>
          </div>

      </form>

  
    </div>
  </div>
  <div class="col">
    <div class="collapse multi-collapse" id="e2">
      <!-- <div class="card card-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
      </div> -->
      <form action="critaction.php" method = "post">
        <div class="card px-2" style="width: 22rem;height: 21rem">
            <div class="card-body">
              <h5 class="card-title">REVIEWS</h5>
              <h6 class="card-subtitle mb-2 text-muted">Please fill in this form to post a review</h6>
              <p class="card-text">
                <label for="song"><b>Movie_Id</b></label>
            <input type="number" placeholder="Enter Movie id" name="Rmovie_id" required>
            <br>
            <label for="Movie_id"><b>Critic_id</b></label>
            <input type="number" placeholder="Enter Critic id" name="Critic_id" required>
            <label for="song"><b>Review</b></label>
            <input type="text" placeholder="Enter Review" name="Review" required>
            <br>
            <label for="Movie_id"><b>Rating</b></label>
            <input type="number" step = "any" placeholder="Enter Rating" name="Rating" required>
            <br>
            <hr>
           
            

            <button type="submit" class="btn btn-success" name = "submit">GRANT</button></p>
             
            </div>
          </div>
        <!-- <div class="container">
          <h1 style="color:red;">Update</h1>
          <h5 style="color:red;">Please fill in this form to update</h5>
          
          <div class="input-group">             
                          <div class="form-group label-floating">
                               <label style="color:red;" class="control-label"><h5>Cast Crew Id</h5></label>
                                   <input name="id" type="number" class="form-control">
                          </div>
           </div>
           <div class="input-group">             
                          <div class="form-group label-floating">
                               <label style="color:red;" class="control-label"><h5>Role</h5></label>
                                   <input name="Role" type="text" class="form-control">
                          </div>
           </div>
           <div class="input-group">             
                          <div class="form-group label-floating">
                               <label style="color:red;" class="control-label"><h5>Remuneration</h5></label>
                                   <input name="News" type="number" class="form-control">
                          </div>
           </div>

         

          <hr>
          
          <button class="btn btn-danger" type="button">Update</button>

          <button type="submit" class="registerbtn" name = "submit">DELETE</button>
        </div> -->
        
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
 $sql1 = "SELECT * FROM SeeAwards";
  $sql2 = "SELECT t1.Title as Movie,t3.Name as Critic,t2.Ratings as Rating,t2.Review as Review FROM Movie as t1 NATURAL JOIN Reviews_Ratings as t2 NATURAL JOIN Critic as t3";

  $sql3 = "SELECT * FROM Critic";
  $sql4 = "SELECT * FROM Movie";
  $sql5 = "SELECT * FROM Awards";
  $res1 = $conn->query($sql1);
  $res2 = $conn->query($sql2);
  $res3 = $conn->query($sql3);
  $res4 = $conn->query($sql4);
  $res5 = $conn->query($sql5);


?>
  <h4 style="color:green;" >Awards Table</h4>

  <table id="Awards" class="blueTable" style="width:325px"  >
  <tr>
  <th style="background:#1D8348;">Movie</th>
  <th style="background:#1D8348;">Award</th>
  </tr>

  
  
  <?php

  while ($row = $res1->fetch_assoc() ) {?>
  <tr >
  <td ><?php echo $row["Movie"] ?></td>
  <td><?php echo $row["Award"]?></td>  
  </tr>

  
  <?php
  }
  ?>

  <table id="Movie" class="blueTable" style="width:325px"  >
  <h4 style="color:green;" >Review Table</h4>
  
  <tr>
  <th style="background:#1D8348;">Movie</th>
  <th style="background:#1D8348;">Critic</th>
  <th style="background:#1D8348;">Review</th>
  <th style="background:#1D8348;">Rating</th>

  </tr>

  
  
  <?php

  while ($row = $res2->fetch_assoc() ) {?>
  <tr >
  <td><?php echo $row["Movie"] ?></td>
  <td><?php echo $row["Critic"]?></td>
  <td><?php echo $row["Review"]?></td>  
  <td><?php echo $row["Rating"]?></td>  

  </tr>

  
  <?php
  }
  ?>


  <table id="Singers"  class="blueTable" style="width:325px"   >
  <h4 style="color:green;" >Critic Table</h4>

  <tr>
  <th style="background:#1D8348;">Id</th>
  <th style="background:#1D8348;">Critic Name</th>
  </tr>

  
  
  <?php

  while ($row = $res3->fetch_assoc() ) {?>
  <tr >
  <td><?php echo $row["Critic_id"] ?></td>
  <td><?php echo $row["Name"]?></td>  
  </tr>

  <?php } ?>


  <table id="Singers"  class="blueTable" style="width:325px"   >
  <h4 style="color:green;" >Movie Table</h4>

  <tr>
  <th style="background:#1D8348;">Id</th>
  <th style="background:#1D8348;">Movie Name</th>
  <th style="background:#1D8348;">Rating</th>

  </tr>

  
  
  <?php

  while ($row = $res4->fetch_assoc() ) {?>
  <tr >
  <td><?php echo $row["Movie_id"] ?></td>
  <td><?php echo $row["Title"]?></td>  
  <td><?php echo $row["Rating"]?></td>  

  </tr>

  <?php } ?>


  <table id="Singers"  class="blueTable" style="width:325px"   >
  <h4 style="color:green;" >Award Table</h4>

  <tr>
  <th style="background:#1D8348;">Id</th>
  <th style="background:#1D8348;">Award Name</th>
  </tr>

  
  
  <?php

  while ($row = $res5->fetch_assoc() ) {?>
  <tr >
  <td><?php echo $row["Award_id"] ?></td>
  <td><?php echo $row["Award_name"]?></td>  
  </tr>

  <?php } ?>
  
  
 

  
  
  

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