<?php 
session_start();
if (isset($_SESSION['user_name'])) {
    unset($_SESSION['user_name']);
    // session_unset();
    // session_destroy();
}
if (isset($_COOKIE['cookie_username'])) {
    unset($_COOKIE['cookie_username']);
    setcookie('cookie_username', '', time() - 3600, '/'); // empty value and old timestamp
}

if (isset($_COOKIE['cookie_password'])) {
    unset($_COOKIE['cookie_password']);
    setcookie('cookie_password', '', time() - 3600, '/'); // empty value and old timestamp
}

// $_SESSION['user_name'];



//    delete all the cookies 

header("Location: loginpage.php?successfully logged out");

exit();
