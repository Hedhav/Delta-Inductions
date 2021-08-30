<?php
session_start();


$dateM = $_POST['dateM'];

if($_POST['MoM_taker']){
$MoM_taker = $_POST['MoM_taker'];
}else{$MoM_taker = $_SESSION['user_name'];}

$MoM = $_POST['MoM'];



$servername = "database";
$username = "webadmin";
$password = "rulingdaweb";
$dbname = "alphaq";
$port = "3306";



try {

    $conn = new PDO("mysql:host=$servername;port=$port;dbname=$dbname",$username,$password);

// set the PDO error mode to exception

$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$sql = "INSERT INTO MoMs (date, MoMtaker, MoM)

VALUES ('$dateM', '$MoM_taker', '$MoM')";
// echo " Inserted $dateM, MoM_taker, $MoM";

// use exec() because no results are returned

$conn->exec($sql);

// echo "New record created successfully       $dateM, $MoM_taker, $MoM";

header("Location: dashboard.php?successfully created MoM");

} catch(PDOException $e) {

    echo $sql . "<br>" . $e->getMessage();

}



$conn = null;


?>