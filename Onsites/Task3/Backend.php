<?php 
session_start();
  


    $uname = $_POST['uname'];

    $pass = $_POST['pass'];

    $captchain = $_POST['captchain'];

    $corrcaptcha = $_SESSION["captcha"];

    if ($corrcaptcha != $captchain)
        {exit("Invalid captcha code $corrcaptcha ,not  $captchain");}

    // $str = "106120201";
    $pattern = "/1[0-1][0-9]1(1[789]|20)([0-1][0-9][0-9]|200)/";
    if (!(preg_match($pattern, $uname)))
        {exit("Invalid username");}
    
    // $string = "H1i$";
    if (!((preg_match('/[A-Z]+/', $pass)) && (preg_match('/[a-z]+/', $pass)) && (preg_match('/[\d]+/', $pass)) && (preg_match('/[-+_!@$%^&*., ?]+/', $pass))))
        {exit("Invalid password - The password must have uppercase and lowercase letters, numbers, and special characters.");}

    echo "Everything seems right. Welcome to the server!";


?>