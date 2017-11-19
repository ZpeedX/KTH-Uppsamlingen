            <?php
           
        if(isset($_SESSION['CurrentUser']))
        {
        include '../../php/php/commentBoxForm.php';
        }
        $connection = mysql_connect("localhost","root","","happytilapia") or die(mysql_error());
        mysql_select_db("happytilapia", $connection);
     
         $result= mysql_query('SELECT * FROM comments', $connection); 
      
         while($rows = mysql_fetch_array($result))
        {
          $id = $rows['id'];
          $name =$rows['name'];
          $comment = $rows['comment'];
          
          
         
           if(isset($_SESSION['CurrentUser']) && $_SESSION['CurrentUser'] == $name )
          {
          $delink ='<li><a href="../../php/php/delete.php?id='. $id .'">Delete</a></li>';

          $EditLink ='<li><a href="../../php/php/EditForm.php?id='. $id .'">Edit</a></li>';
        
          if(isset($_GET['id']) && $_GET['id']== $id)
        {
           $editComment = $comment; 
         
        }
        
          }
          else{
            $delink = '';
            $EditLink = '';
          }
          
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