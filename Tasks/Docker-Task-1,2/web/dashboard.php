<?php
session_start();

if (!isset($_SESSION['user_name'])){

//     header("Location: abcd.php?please login");
//   header("Location: loginpage.php?please login");
  header("Location: index.php");
  exit();

}
?>


<!DOCTYPE html>

<html>
    <head>
        <title>Dashboard</title>

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

            input[type=text], input[type=date] {
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

        <h1 style="color: white;">AlphaQ- Dashboard</h1>

        <br><br><br><br>



        <form action="/viewMoMfiltered.php" method="post">
            <div class="container">
            <h3>Filter and View MoMs:</h3>

            <p>
                <label for="dateMS">Date (optional):&nbsp;</label>
                <input type="date" name="dateMS" id="dateMS" >
            </p>

            <p>
                <label for="MoM_takerS">MoM-Taker (optional):&nbsp;</label>
                <input type="text" name="MoM_takerS" id="MoM_takerS">
            </p>

            <input type="submit" value="View MoM">
            </div>
        </form>

        <br style="margin-top: 50px" />

        <form action="/createMoM.php" method="post">
        
            <div class="container">
                <h3>Create MoM:</h3>

            <p>
                <label for="dateM">Date:&nbsp;</label>
                <input type="date" name="dateM" id="dateM">
            </p>

            <p>
                <label for="MoM_taker">MoM-Taker (optional-defaults to username):&nbsp;</label>
                <input type="text" name="MoM_taker" id="MoM_taker">
            </p>

            <p>
                <label for="MoM">MoM:&nbsp;</label>
                <textarea rows = "3" cols = "40" style="color: red;" placeholder="Enter MoM here" name = "MoM" style="color: red;">
                </textarea><br>
            </p>

            <input type="submit" value="Create MoM">
            </div>
        </form>
            <br>

        <form action="logout.php" method="post">
            <input type="submit" value="Log Out">
        </form> 

    </body>

</html>
