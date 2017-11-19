<?php


if ($_POST['submit']){
    
    if (!$_POST['email']) $error.="Please enter your email";
        else   if (!(filter_var ($_POST['email'], FILTER_VALIDATE_EMAIL)))
                $error.="Please enter a valid email adress";
        
     if (!$_POST['password']) $error.="Please enter your password";
     
     else{
         if(strlen($_POST['password'])<5) $error.="<br />Please enter a password with at least 5 characters";
         if(preg_match(' ´[A-Z]´', $_POST['password'])) $error.= "<br />Please include at least one capital letter in your password";
     }
     
     if ($error) echo "There were error(s) in your signup details: ".$error;
    
     else{
         
         $link = mysqli_connect("localhost","root","","happytilapia");
         
         //Protection against sql injection. check code again!!
         
      //   $query="SELECT *  FROM users WHERE email=" '.mysqli_real_escape_string ( $link, $_POST['email ' ])." ' ";
         
     }
    
}










?>