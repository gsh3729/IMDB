<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/css/material-bootstrap-wizard.css">
    <link rel="stylesheet" href="logactionstyle.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Login Successful</title>
  </head>
  <body>


<?php 


if ($_SERVER["REQUEST_METHOD"]=="POST"){
    $email = $_POST['uname'];
    $psw = $_POST['psw'];

    // echo "harsha";
    // echo $email;
    // echo "sri";
    // echo $psw;
    // echo "gsh";

  if($email <> null){   
  $conn = new mysqli("localhost", $email, $psw, "imdb");
  if($conn->connect_error){
  die("Database Connection failed:".$conn->connect_error);
  }
  // else{
  //   echo "IMDB database connected successfully";
  // }
?>

<div class="container">

<form action="searchgui.html" method="post">
<div class="float-right">
      <button class="btn btn-warning" type="submit" role="button">Search</button></div></form>

<div class="row py-3 justify-content-center">
      <h3><b><pre>        Welcome to IMDB</pre></b></h3>

</div>
  <div class="row py-3 justify-content-center">
      <h6><b>Please select one of the role listed below</h6></b></div>
      
      <div class="row justify-content-center">
  

        <form action="vis.php" method="post">
        <button class="btn btn-warning" type="submit" data-toggle="collapse" href="#e1" role="button" aria-expanded="false" aria-controls="e1">Music Director</button>
        </form>

       </div> 
  <br>
      <div class="row justify-content-center">
        <form action="jour.php" method="post">
        <button class="btn btn-warning" type="submit" data-toggle="collapse" data-target="#e2" aria-expanded="false" aria-controls="e2">Journalist </button> </form>
        
      </div>
  <br>
      <div class="row justify-content-center">
        <form action="p.php" method="post">
        <button class="btn btn-warning" type="submit" data-toggle="collapse" data-target="#e3" aria-expanded="false" aria-controls="e3">Producer</button></form>
        
      </div>

  <br>
      <div class="row justify-content-center">
        <form action="critic.php" method="post">
        <button  class="btn btn-warning" type="submit" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="e1 e2 e3">Critic</button></form>
      </div>  
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