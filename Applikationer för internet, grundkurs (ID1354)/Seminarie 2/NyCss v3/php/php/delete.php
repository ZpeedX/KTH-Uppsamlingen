<?php
 session_start();

 //include code (connecting to database).
  include '../../php/php/databaseConnection.php';
  
  //The variable 'deleteid' takes the id from hyperlink and inserts it into MySQL database with a statement to delete the comment
  // with the correct id.
     $deleteid= $_GET['id'];
      $sql = "DELETE FROM comments WHERE id= '$deleteid'";
        mysql_query($sql, $connection); 
        
        // Includes a saved page which is the previous page.
      include $_SESSION['currentPage'];
 
?>