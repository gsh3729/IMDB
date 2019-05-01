<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/css/material-bootstrap-wizard.css">
    <link rel="stylesheet" href="regactionstyle.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Register Successful</title>
  </head>
  <body>


<?php 


if ($_SERVER["REQUEST_METHOD"]=="POST"){
    $email = $_POST['email'];
    $psw = $_POST['psw'];

    // echo "harsha";
    // echo $email;
    // echo "sri";
    // echo $psw;
    // echo "gsh";

  if($email <> null){   
  require("./dbconnection.php");
  $sql = "CREATE user '$email'@localhost IDENTIFIED BY '$psw' "; 
  $grant1 = "GRANT SELECT ON * TO '$email'@'localhost'";
  $grant = "GRANT '$role' to '$email'@'localhost' ";
  $conn->query($sql);
  $conn->query($grant1);
  $conn->query($grant);
  $conn->close();

?>

<div class="container">

        <div class="row py-3 justify-content-center">
            <h3 style="color: red">Registered Successfully</h3>
        </div>
        <!-- <div class="row py-3 justify-content-center">
            <h6>Please select one of the role listed below</h6>
        </div> -->
      
        <div class="row justify-content-center">
          <form action="logingui.html" method="post">
          <button class="btn btn-danger" type="submit" data-toggle="collapse" href="#e1" role="button" aria-expanded="false" aria-controls="e1">Login</button>
          </form>
       </div> 

       <div class="row justify-content-center">
          <form action="searchgui.html" method="post">
          <button class="btn btn-danger" type="submit" data-toggle="collapse" href="#e1" role="button" aria-expanded="false" aria-controls="e1">Home Page</button>
          </form>
       </div> 
</div>
 

<?php
  }

  

} //if post end ?>  




 

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>