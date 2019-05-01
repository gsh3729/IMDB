<!doctype html>
<html lang="en">
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
    <div class="container">
    <form action="logingui.html" method="post">
<div class="float-right">
      <button class="btn btn-danger" type="submit" role="button">Home</button></div></form></div>
    <div class="row py-3 justify-content-center">
      <h3><pre>              Welcome MusicDirector</pre></h3></div>

    <div class="row justify-content-center">
    <p>
  <a class="btn btn-danger" data-toggle="collapse" href="#e1" role="button" aria-expanded="false" aria-controls="e1">Insert Songs</a>
  <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#e2" aria-expanded="false" aria-controls="e2">Delete Songs</button>
  <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#e3" aria-expanded="false" aria-controls="e3">View Tables</button>
  <button class="btn btn-danger" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="e1 e2 e3">Toggle Content</button>
  </div>
</p>

<div class="container">
<div class="row">
  <div class="col">
      <div class="collapse multi-collapse" id="e1">
     
          <form action="Music_director_action.php" method = "post">
              <div class="card px-2" style="width: 20rem;">
                <div class="card-body">
                  <h5 class="card-title">INSERT</h5>
                  <h6 class="card-subtitle mb-2 text-muted">Please fill in this form to insert a song</h6>
                  <p class="card-text">
                    <label for="song"><b>Song</b></label>
                    <input type="text" placeholder="Insert Song" name="song" required>

                    <label for="Movie_id"><b>Movie</b></label>
                    <input type="number" placeholder="Enter Movie id" name="Movie_id" required>

                    <label for="Person_id"><b>Singer</b></label>
                    <input type="number" placeholder="Enter Singer id " name="Person_id" required>
                    <hr>
                    

                    <button type="submit" class="registerbtn" name = "submit">INSERT</button>
                </div>
              </div>
          </form>

  
      </div>
  </div>      <!--  COLUMN END -->



  <div class="col">
    <div class="collapse multi-collapse" id="e2">
      
      <form action="Music_director_action.php" method = "post">
          <div class="card px-2" style="width: 20rem;">
            <div class="card-body">
              <h5 class="card-title">DELETE</h5>
              <h6 class="card-subtitle mb-2 text-muted">Please fill in this form to delete a song</h6>
              <p class="card-text">
              <label for="dsong"><b>Song</b></label>
              <input type="text" placeholder="Song" name="dsong" required>
              <button type="submit" class="registerbtn" name = "dsubmit">DELETE</button>
            </div>
          </div>
      </form>
    </div>
  </div>


  <div class="col">
    <div class="collapse multi-collapse" id="e3">
     
          <div id = "container">

          <?php 


            require("./dbconnection.php");
            $sql1 = "SELECT * FROM Movie";
            $sql2 = "SELECT * FROM MovieSongs ";
            $sql3 = "SELECT * FROM Person";

            $res1 = $conn->query($sql1);
            $res2 = $conn->query($sql2);
            $res3 = $conn->query($sql3);


          ?>
            <h4 style="color:red;" >Movie Table</h4>

            <table id="Movie" class="blueTable" style="width:275px"  >
            <tr>
            <th style="background:#F73D3D;">Id</th>
            <th style="background:#F73D3D;">Title</th>
            </tr>

            
            
            <?php

            while ($row = $res1->fetch_assoc() ) {?>
            <tr >
            <td ><?php echo $row["Movie_id"] ?></td>
            <td><?php echo $row["Title"]?></td> 

            </tr>

            
            <?php
            }
            ?>

            <table id="Songs" class="blueTable" style="width:275px"  >
            <h4 style="color:red;" >Song Table</h4>
            
            <tr>
            <th style="background:#F73D3D;">Movie</th>
            <th style="background:#F73D3D;">Song </th>
            <th style="background:#F73D3D;">Singer </th>

            </tr>

            
            
            <?php

            while ($row = $res2->fetch_assoc() ) {?>
            <tr >
            <td><?php echo $row["Movie"] ?></td>
            <td><?php echo $row["Song"] ?></td>

            <td><?php echo $row["Singer"]?></td>  
            </tr>

            
            <?php
            }
            ?>


            <table id="Singers"  class="blueTable" style="width:275px"   >
            <h4 style="color:red;" >Singers Table</h4>

            <tr>
            <th style="background:#F73D3D;">Id</th>
            <th style="background:#F73D3D;">Singer Name</th>
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

            <!-- CONTAINEER DIV ENDS -->
          </div>
      <!--E3 ENDS  -->
      </div>
      <!-- CLASS COL ENDS -->
    </div>
    <!-- CLASS ROW -->
</div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>