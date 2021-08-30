<?php

session_start();

?>

<!DOCTYPE html>
<html>
<head>
  <title>Loginpage</title>
  <style>

    body {
    background-image: url('https://coolbackgrounds.io/images/backgrounds/index/compute-ea4c57a4.png');
    }


    .container {
    background-color: rgba(255, 0, 0, 0.5);
      padding: 7px;
        margin: 4px 450px;
    }

    * {text-align: center;
        color: white;
      }


    input[type=button], input[type=submit], input[type=reset] {
      background-color: #000099;
      border: none;
      color: white;
      padding: 6px 12px;
      text-decoration: none;
      margin: 4px 2px;
      cursor: pointer;
    }


    input[type=text], input[type=password]{
      color: red;
    }

      br {
                display: block; /* makes it have a width */
                content: ""; /* clears default height */
                margin-top: 10px; /* change this to whatever height you want it */
    }
  </style>
</head>
<body>

  <h1 style="color: white;">AlphaQ- Home</h1>
      <br><br><br><br>

      <form action="Backend.php" method="post">

        <div class="container">
        <h3>Login</h3>

            <label for="uname"><b>Username:&nbsp;</b></label>
            <input type="text" placeholder="Enter Username" name="uname" required>
        <br><br>

            <label for="pass"><b>Password:&nbsp;</b></label>
            <input type="password" placeholder="Enter password" name="pass" required>
        <br><br>

        <label for="captchain"><b>captcha:&nbsp;</b></label>
            <input type="text" placeholder="Enter captcha" name="captchain" required>
        <br><br>

        <input type="submit" value="Login">

        </div>

      </form> 

      <div style='margin:15px' width="500" height="300">
        <img src="captcha.php">
      </div>


</body>
</html>
