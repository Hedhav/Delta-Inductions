<?php


        $unamenew = $_POST['unamenew'];

        $pass1 = $_POST['pass1'];
 
        $pass2 = $_POST['pass2'];

    // check if passes equal, then add to db
    if ($pass1 == $pass2) {


        $servername = "database";
        $username = "webadmin";
        $password = "rulingdaweb";
        $dbname = "alphaq";
        $port = "3306";



        try {

            $conn = new PDO("mysql:host=$servername;port=$port;dbname=$dbname",$username,$password);
            
        // set the PDO error mode to exception

        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $sql = "INSERT INTO users (user_name, password) VALUES ('$unamenew', '$pass1')";

        // use exec() because no results are returned

        $conn->exec($sql);

        header("Location: loginpage.php?successfully created account   login with new account");

        exit();
        } catch(PDOException $e) {
        echo $sql . "<br>" . $e->getMessage();
        }

        $conn = null;

    }
    else {
        header("Location: loginpage.php?error=passwords dont match");
        exit();
    }


?>
