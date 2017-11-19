            <?php
          // Checks if a user has logged in and includes comment box form if the statment is true.
        if(isset($_SESSION['CurrentUser']))
        {
        include '../../php/php/commentBoxForm.php';
        }
        
         //include code (connecting to database).
        include '../../php/php/databaseConnection.php';
     
        //Takes information from MySQL database and assign it to a variable.
         $result= mysql_query('SELECT * FROM comments', $connection); 
      
        //Creates a array out of the database variable and divides it into three unique variables.
         while($rows = mysql_fetch_array($result))
        {
          $id = $rows['id'];
          $name =$rows['name'];
          $comment = $rows['comment'];
          
          
         //Checks if current user (logged in user) is active and if current user matches the username
         // taken from the database.
          // If the statement is true assign two unique links to their own variables. 
           if(isset($_SESSION['CurrentUser']) && $_SESSION['CurrentUser'] == $name )
          {
          $delink ='<li><a href="../../php/php/delete.php?id='. $id .'">Delete</a></li>';

          $EditLink ='<li><a href="../../php/php/EditForm.php?id='. $id .'">Edit</a></li>';
        
          //The variable 'edtiCommment' is used in the Edit form  to save the current comment use it in the edit box.
          if(isset($_GET['id']) && $_GET['id']== $id)
        {
           $editComment = $comment; 
         
        }
        
          }
          // User is not logged in edit and delete button wonät show up in comment section.
          else{
            $delink = '';
            $EditLink = '';
          }
          
          //Prints out comments taken from the database and also show edit and delete button. 
       echo '<div id="comments"><div id="user">' .$name . ':</div><br />' . '<br />' . $comment . '<br />'
               . ' <div id="DELbutton">          
        <nav>
  <ul>' . $delink . '  ' . $EditLink . 
               '</ul>'
               . '</nav>'
               . '</div>'
               . '<br />' . '<hr width = "auto" /></div>';
        
       }
          
          
            ?>