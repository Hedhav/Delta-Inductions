<?php
   
// We start a session to access
// the captcha externally!
session_start();
   


function generateRandomString($length = 7) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}




// Generate a random number
// from 1000-9999
// $captcha = rand(10000000, 99999999);
$captcha = generateRandomString();
// echo generateRandomString();
   
// The capcha will be stored
// for the session
$_SESSION["captcha"] = $captcha;  
   
// // // // Generate a 50x24 standard captcha image
// $im = imagecreatetruecolor(70, 40);  
  
// // // // Blue color
// $bg = imagecolorallocate($im, 22, 86, 165);
  
// // // // White color
// $fg = imagecolorallocate($im, 255, 255, 255);
   
// // // Give the image a blue background
// // imagefill($im, 0, 0, $bg); 
   
// // // Print the captcha text in the image
// // // with random position & size
// // imagestring($im, rand(4, 7), rand(1, 7),
// //             rand(1, 7),  $captcha, $fg);


   
// // // VERY IMPORTANT: Prevent any Browser Cache!!
// // header("Cache-Control: no-store,
// //             no-cache, must-revalidate"); 
   
// // // The PHP-file will be rendered as image
// // header('Content-type: image/png');
   
// // // Finally output the captcha as
// // // PNG image the browser
// // imagepng($im); 
  
// // // Free memory
// // imagedestroy($im);


$image = imagecreatetruecolor(200, 50);

$bg = imagecolorallocate($image, 22, 86, 165);
  

$fg = imagecolorallocate($image, 255, 255, 255);


imageantialias($image, true);
 
imagefill($image, 0, 0, $bg);
 
for($i = 0; $i < 5; $i++) {
  imagesetthickness($image, 2);
//   $rect_color = $colors[rand(1, 4)];
  $rect_color = imagecolorallocate($image, 200, 200, 200);

  imagerectangle($image, rand(-10, 190), rand(-10, 10), rand(-10, 190), rand(40, 60), $rect_color);
}

// imagesetthickness($image, rand(2, 10));
// //   $rect_color = $colors[rand(1, 4)];
//   $rect_color = imagecolorallocate($im, 22, 86, 165);

//   imagerectangle($image, rand(-10, 190), rand(-10, 10), rand(-10, 190), rand(40, 60), $rect_color);

$font = './arial.ttf';
// imagefilledrectangle($image, 0, 0, 399, 29, $bg);
imagettftext($image, 20, rand(-5, 5), rand(30, 40), rand(30, 40), $fg, $font, $captcha);
// imagettftext($image, 10, 0, 0, 0, $fg, $font, $captcha);
// imagestring($image, rand(4, 7), rand(1, 7), rand(1, 7),  $captcha, $fg);
header('Content-type: image/png');
imagepng($image);
imagedestroy($image);



?>
