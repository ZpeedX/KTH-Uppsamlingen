<?php
 session_start();
 
 /*When the submit button is clicked the variable 'updateid' takes the id from the hyperlink and 
  * inserts it into MySQL database with a statement to update the comment
  * with the correct id. The comment is updated with the edited comment from the user.
  */
   
 if(isset($_POST['submit']))
 {
      //include code (connecting to database).
        include '../../php/php/databaseConnection.php';
     $updateid= $_GET['id'];
    $update = $_POST['edit'];
     
      $sql = "UPDATE comments SET comment = '$update' WHERE id= '$updateid'";
        mysql_query($sql, $connection); 
        
         // Includes a saved page which is the previous page.
      include $_SESSION['currentPage'];
 }
 
?>