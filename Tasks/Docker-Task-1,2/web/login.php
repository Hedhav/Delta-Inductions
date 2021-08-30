<?php 

$servername = "database:3306";
$usernamedb = "webadmin";
$passworddb = "rulingdaweb";
$dbname = "alphaq";
$port = "3306";

$conn = mysqli_connect($servername, $usernamedb, $passworddb, $dbname);

// if (!$conn) {

//     echo "Connection failed!";

// }else {echo "fine";}


session_start(); 



    // function validate($data){

    //    $data = trim($data);

    //    $data = stripslashes($data);

    //    $data = htmlspecialchars($data);

    //    return $data;

    // }

    $uname = $_POST['uname'];

    $pass = $_POST['pass'];



        $sql = "SELECT * FROM users WHERE user_name='$uname' AND password='$pass'";

        $result = mysqli_query($conn, $sql);
        #   echo "$uname $pass";


            $row = mysqli_fetch_assoc($result);

            if ($row['user_name'] == $uname && $row['password'] == $pass) {

                // echo "Logged in!";

                $_SESSION['user_name'] = $row['user_name'];

                    if (isset($_POST['rememberme'])){

                        setcookie('cookie_username', $uname); // default = 30 days
                        setcookie('cookie_password', $pass); // default = 30 days
                        header("Location: dashboard.php?Remembering you");

                        exit();

                    } 


    

                // $_SESSION['password'] = $row['password'];

                // $_SESSION['name'] = $row['name'];

                // $_SESSION['id'] = $row['id'];

                header("Location: dashboard.php");

                exit();

            }else{

                header("Location: loginpage.php?error=Incorect Username or password");

                exit();

            }