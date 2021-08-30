<html>
 <head>
  <title>MoMs.local</title>

  <style>
 table { text-align: center;
  border-collapse: collapse;
  width: 100%;
}

 td, th {
  border: 1px solid #ddd;
  padding: 8px;
}


 tr:nth-child(even){background-color: #f2f2f2;}

 tr:hover {background-color: #ddd;}

 th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #e60000;
  color: white;
}

</style>

 </head>
 <body>
 <?php  
    $servername = "database";
    $username = "webadmin";
    $password = "rulingdaweb";
    $dbname = "alphaq";
    $port = "3306";


      $conn = new mysqli($servername, $username, $password, $dbname, $port);
      // Check connection
      if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
      }

      $sql = "SELECT * FROM MoMs";
      $result = $conn->query($sql);

      if ($result->num_rows > 0) {

      echo "All MoMs: <br>";
      echo "<table><tr><th>Date</th><th>MoM taker</th><th>MoM</th></tr>";

      // output data of each row
      while($row = $result->fetch_assoc()) {
         echo "<tr><td>".$row["date"]."</td><td>".$row["MoMtaker"]."</td><td>".$row["MoM"]."</td></tr>";
      }
      
      echo "</table>";
      } else {
      echo "0 results";
      }
      $conn->close();
 ?> 
 </body>
</html>

