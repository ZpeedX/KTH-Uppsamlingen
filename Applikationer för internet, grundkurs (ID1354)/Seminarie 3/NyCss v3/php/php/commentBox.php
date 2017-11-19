
<?php

    session_start();
    //include code (connecting to database).
     include '../../php/php/databaseConnection.php';
     
     //When submit button is clicked insert the  given username and comment into MySQL database.
   if(isset($_POST['submit'])){
      
      $name =  $_SESSION['CurrentUser'];
      $comment = mysql_escape_string($_POST['comment']);  
    
       if($name && $comment)
       {
       $sql= "INSERT INTO comments (name, comment) VALUES ('$name', '$comment')";
        mysql_query($sql, $connection); // security
       include $_SESSION['currentPage'];
   }
   //Shows a message if comment box is empty.
    else
       {
      include $_SESSION['currentPage'];
        echo "Comment box is empty, please write a comment before submiting!";   
       }
         
   }

    
    ?>

