    
<?php
//Start a session if a session is not currently active.
if(!isset($_SESSION)){
    session_start();
}
   //include code (connecting to database).
    include '../../php/php/databaseConnection.php';
    
    //If the submit button is clicked validate the given username and password from the login form
    //with all usernames and passwords from MySQL database. Return either 1 or 0 where 1 is true and 0 is false.
    if(isset($_POST['submit'])){
    
    $username= mysql_escape_string($_POST['username']);
    $password= mysql_escape_string($_POST['password']);
   
    //Decrypts md5 password taken from the database. 
    $password= md5($password);
    //default username = root with no password
    $sql="SELECT * FROM `users` WHERE `username` = '$username' AND `password` = '$password'";
    $result= mysql_query($sql, $connection);
    
    if(mysql_num_rows($result) > 0){
        $_SESSION['CurrentUser'] = $username;
        include $_SESSION['currentPage'];
    }
    //If the validation failed restart login page with a given error.
    else {
      
      include 'loginPage.php';
      echo'<div id="textecho"> Wrong username or password, try again!</div>';
    
    }
}

                   
 ?>
     