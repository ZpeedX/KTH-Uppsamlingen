<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
require_once URL . '/data/core/init.php';

use Util\Token; 
use Util\Input; 
use Model\User;
use Util\Redirect;
use Util\Validate;
$user = new User();

if(Input::exists()){
   if(Token::check(Input::get('token'))){
       
       $validate = new Validate();
       $validation = $validate->check($_POST, array(
           'username' => array('required' => true),
           'password' => array('required' => true)
       ));
       
       if($validation->passed()){
           $user = new User();
           
           $remember = (Input::get('remember') === 'on') ? true : false;
           $login = $user->login(Input::get('username'), Input::get('password'), $remember);
           if($login){
               include $_SESSION['currentPage'];
           } else{
               
               echo '<p>Sorry, login failed!</p>';
               include $DIR .'/data/View/loginPage.php';
                   
           }
       } else{
           
           foreach($validation->errors() as $error){
               echo $error, '<br>';
           }
           
           
       }
   }     
}
else 
    Redirect::to(404);

?>


