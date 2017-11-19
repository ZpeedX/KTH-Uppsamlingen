<?php
    //Requires Config.php which contains a global url.
    require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
    //Requires init.php which contains every relatvie function.
    require_once URL . '/data/core/init.php';
          
    use Model\User;
    use Integration\DB;
            

    $user = new User();
    // Checks if a user has logged in and includes comment box form if the statment is true.
    if($user->isLoggedIn())
    include URL . '/data/View/commentBoxForm.php';

    //Takes information from MySQL database and assign it to a variable.
    $result= DB::getInstance()->gets('comments');
          
    //Creates a array out of the database variable and divides it into three unique variables.
    foreach($result as $results){      
    $id = $results['id'];
    $user_id = $results['user_id'];
    $name =$results['name'];
    $comment = $results['comment'];
           
    if($user->isLoggedIn() && $user->data()->id == $user_id)
    {
        $delink ='<li><a href="/data/delete.php?id='. $id .'">Delete</a></li>';
        $EditLink ='<li><a href="/data/View/EditForm.php?id='. $id .'">Edit</a></li>';

        //The variable 'edtiCommment' is used in the Edit form  to save the current comment use it in the edit box.
        if(isset($_GET['id']) && $_GET['id']== $id)
        $editComment = $comment; 
    }
          //When user is not logged in edit and delete button won't show up in comment section.
          else{
            $delink = '';
            $EditLink = '';
          }
          
        echo '<div id="comments"><div id="user">' .escape($name) . ':</div><br />' . '<br />' . escape($comment) . '<br />'
        . ' <div id="DELbutton">          
        <nav>
        <ul>' . $delink . '  ' . $EditLink . 
        '</ul>'
        . '</nav>'
        . '</div>'
        . '<br />' . '<hr width = "auto" /></div>';
             
  } 
 
 ?>