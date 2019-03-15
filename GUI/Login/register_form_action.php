<!DOCTYPE html>
<html>
<style>
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<style>
input[type=text], select {
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 30%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 30%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>




<?php 
require("./dbconnection.php");

// if ($_SERVER["REQUEST_METHOD"]=="POST")
// {
    echo "You are in register form";
    $email = $_POST['email'];
    $psw = $_POST['psw'];
    $psw_repeat = $_POST['psw-repeat'];
  
  if($email <> null)
  {
     $sql = "SELECT user FROM mysql.user WHERE user = '$email'";
     $res = $conn->query($sql);
     if($res == null)
     {
        die("Username already exist");
     }
  }
  else
  {
     die("Invalid Username");
  }

  if($psw != $psw_repeat)
  {
     die("Passwords Do not match");
  }

  else if($email <> null && $_POST['submit']<>null )
  {   
      $sql1 = "CREATE USER $email@localhost IDENTIFIED BY $psw";
      echo $sql1;
      $result = $conn->query($sql2);

      ?>
      <!-- <table id="customers" >
      <tr>
      <th>Song</th>
      </tr> -->

  
  
      
  
  
<?php
  }

  

// }
?>



<?php

$conn->close();
?>
