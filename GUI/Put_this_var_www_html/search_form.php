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
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
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
  height: 210px;
}
</style>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
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
<body>

<form action="/login_form.php" method="post" id="form1">
  
  <button type="submit" value="Submit">Login</button> 

</form>

<br/>
<div id="container" >
	<div id ="left" style="float:left;width:50%;">
	<form action="search_results.php" method="post">
	    Movie_Name: <br><input type="text" name = "movie" /><br/>
      Actor: <br><input type="text" name = "actor" /><br/>
      Actress: <br><input type="text" name = "actress" /><br/>
      Director: <br><input type="text" name = "director" /><br/>
      Genre: <br><input type="text" name = "genre" /><br/>   
	    Submit    : <br><input type="submit" name = "submit" value = "submit" />
	</form>
	</div>
	<div id="right" style="float:right;width:25%;">
	<a href="display.php" class="button">Show Movies</a>
	</div>
</div>


<!-- <div id="container">
	<div id ="left" style="float:left;width:50%;">
	<h3> Search for songs of a Movie </h3>
	<form action="songs_results.php" method="post">
	    Movie_Name: <br><input type="text" name = "field2" /><br/>   
	    Submit    : <br><input type="submit" name = "search" value = "submit" />
	</form>
	</div>
	
</div> -->



</body>
</html>
