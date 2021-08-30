<html>
 <head>
  <title>users.local</title>
  <style>
table, td, th {
  border: 1px solid black;
}

table {
  width: 100%;
  border-collapse: collapse;
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

      $sql = "SELECT * FROM users";
      $result = $conn->query($sql);
      # (user_name, password, domain)
      if ($result->num_rows > 0) {
      echo "<table><tr><th>user_name</th><th>password</th><th>domain</th></tr>";
      // output data of each row
      while($row = $result->fetch_assoc()) {
         echo "<tr><td>".$row["user_name"]."</td><td>".$row["password"]."</td><td>".$row["domain"]."</td></tr>";
      }
      echo "</table>";
      } else {
      echo "0 results";
      }
      $conn->close();
 ?> 
 </body>
</html>

