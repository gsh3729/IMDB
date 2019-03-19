<!DOCTYPE html>
<html>

<!-- <style>
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
 -->

<?php 


if ($_SERVER["REQUEST_METHOD"]=="POST"){
    $email = $_POST['uname'];
    $psw = $_POST['psw'];

    // echo "harsha";
    echo $email;
    // echo "sri";
    echo $psw;
    // echo "gsh";

  if($email <> null){   
  $conn = new mysqli("localhost", $email, $psw, "imdb");
  if($conn->connect_error){
  die("Database Connection failed:".$conn->connect_error);
  }else{
    echo "IMDB database connected successfully";
  }
  $sql1 = "SELECT * FROM Movie";
  $result = $conn->query($sql1);
?>

  <select name="select role">
  <option value="mowner">Movie Owner</option>
  <option value="mdir">Music Director</option>
  <option value="jour">Journalist</option>
  <option value="pro">Producer</option>
  </select>


  <form action="role.php" method="post">
  <input list="roles" name="role" placeholder="select role">
  <datalist id="roles">
    <option value="Movie Owner">
    <option value="Music Director">
    <option value="Journalist">
    <option value="Producer">
    <option value="Grant Award">
  </datalist>
  <input type="submit">
</form>

<?php
  }

  

} //if post end ?>  



