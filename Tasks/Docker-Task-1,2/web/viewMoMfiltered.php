<html>
<head>
  <title>Filtered MoMs</title>

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



        $dateMS = $_POST['dateMS'];
        $MoM_takerS = $_POST['MoM_takerS'];

        $servername = "database";
        $username = "webadmin";
        $password = "rulingdaweb";
        $dbname = "alphaq";
        $port = "3306";


        // Create connection

        $conn = new mysqli($servername, $username, $password, $dbname, $port);

        // Check connection

        if ($conn->connect_error) {

        die("Connection failed: " . $conn->connect_error);

        }




        if ("$dateMS" && "$MoM_takerS") {

            $sql = "SELECT * FROM MoMs where MoMtaker='$MoM_takerS' AND date='$dateMS'";
            // echo "1 <br>";

        } elseif ("$MoM_takerS") {

            $sql = "SELECT * FROM MoMs where MoMtaker='$MoM_takerS'";
            // echo "2 <br>";

        } elseif ("$dateMS") {

            $sql = "SELECT * FROM MoMs where date='$dateMS'";
            // echo "3 <br>";

        } else {

            $sql = "SELECT * FROM MoMs";
            // echo "4 <br>";

        } 





        $result = $conn->query($sql);



        if ($result->num_rows > 0) {

        echo "The Filtered MoMs: <br>";

        echo "<table><tr><th>Date</th><th>MoM taker</th><th>MoM</th></tr>";

        // output data of each row

        while($row = $result->fetch_assoc()) {

            echo "<tr><td>".$row["date"]."</td><td>".$row["MoMtaker"]."</td><td>".$row["MoM"]."</td></tr>";

        }

        echo "</table>";

        } else {

        echo "<br>0 results";

        }

        $conn->close();

        ?>



    </body>

</html>
