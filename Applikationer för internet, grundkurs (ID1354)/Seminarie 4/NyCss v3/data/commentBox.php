
<?php
//Requires Config.php which contains a global url.
require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
//Requires init.php which contains every relatvie function.
require_once URL . '/data/core/init.php';

    use Util\Token;
    use Util\Input;
    use Model\User;
    use Util\Validate;
    use Integration\DB;
    
     $user = new User;
     //When submit button is clicked insert the  given username and comment into MySQL database.
   if(Input::exists()){
       $validate = new Validate();
       $validation = $validate->check($_POST, array(
           'comment' => array('required' => true)
       ));
       
       if($validation->passed()){
      
      $name = $user->data()->username;
      $user_id = $user->data()->id;
      $comment = Input::get('comment'); 
    
       if($name && $comment)
       {
       DB::getInstance()->insert('comments', array(
           'name' => $name,
           'user_id' => $user_id,
           'comment' => $comment
            
       ));
       include $_SESSION['currentPage'];
   }
   //Shows a message if comment box is empty.     
   }
   else{
         foreach($validation->errors() as $error){
                     include $_SESSION['currentPage'];
               echo $error, '<br>';   
           }
   }
   }
   
   else
  include $_SESSION['currentPage'];

    
    ?>

